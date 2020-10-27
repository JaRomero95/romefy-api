class AddColumnsToMultimediaFile < ActiveRecord::Migration[6.0]
  def change
    add_column :multimedia_files, :title, :string
    add_column :multimedia_files, :thumbnail_url, :string
    add_column :multimedia_files, :duration, :integer

    remove_column :multimedia_files, :name, :string
  end
end
