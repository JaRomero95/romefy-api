class MediaDownloader
  class << self
    def download(file_url)
      download_file(file_url)

      file_info = read_file_info

      return puts 'Error, file not downloaded' if file_info['_filename'].nil?

      multimedia_file = build_multimedia_file

      multimedia_file.save!

      clean_files
    end

    private

    def build_multimedia_file
      file_info = read_file_info

      MultimediaFile.new.tap do |multimedia_file|
        filename = file_info['_filename']

        multimedia_file.title = file_info['title']
        multimedia_file.thumbnail_url = file_info['thumbnail_url']
        multimedia_file.duration = file_info['duration']
        multimedia_file.file.attach(io: File.open(filename), filename: filename)
      end
    end

    def clean_files
      File.delete(output_options_file_path)
      File.delete(read_file_info['_filename'])
    end

    def read_file_info
      return @read_file_info if @read_file_info

      content = File.read(output_options_file_path)
      @read_file_info = JSON.parse(content)
    end

    def download_file(file_url)
      execute_command(
        [
          '--no-playlist',
          '-x',
          '--audio-format mp3',
          "-o '#{downloaded_file_name}.%(ext)s'",
          '--write-info-json',
          '--no-cache-dir'
        ],
        file_url
      )
    end

    def execute_command(options, file_url)
      puts "youtube-dl #{options.join(' ')} '#{file_url}'"
      `youtube-dl #{options.join(' ')} '#{file_url}'`
    end

    def output_options_file_path
      "#{downloaded_file_name}.info.json"
    end

    def downloaded_file_name
      'downloaded_file'
    end
  end
end
