class MultimediaFilesController < ApplicationController
  before_action :set_multimedia_file, only: %i[show update destroy]

  # GET /multimedia_files
  def index
    @multimedia_files = MultimediaFile.with_attached_file.all

    render json: @multimedia_files.as_json(
      methods: %i[file_url]
    )
  end

  # GET /multimedia_files/1
  def show
    render json: @multimedia_file
  end

  # POST /multimedia_files
  def create
    @multimedia_file = MultimediaFile.new(multimedia_file_params)

    if @multimedia_file.save
      render json: @multimedia_file, status: :created, location: @multimedia_file
    else
      render json: @multimedia_file.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /multimedia_files/1
  def update
    if @multimedia_file.update(multimedia_file_params)
      render json: @multimedia_file
    else
      render json: @multimedia_file.errors, status: :unprocessable_entity
    end
  end

  # DELETE /multimedia_files/1
  def destroy
    @multimedia_file.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_multimedia_file
    @multimedia_file = MultimediaFile.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def multimedia_file_params
    params.require(:multimedia_file).permit(:name, :file)
  end
end
