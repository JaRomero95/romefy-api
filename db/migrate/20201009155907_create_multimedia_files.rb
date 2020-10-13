class CreateMultimediaFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :multimedia_files do |t|
      t.string :name

      t.timestamps
    end
  end
end
