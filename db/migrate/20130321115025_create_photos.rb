class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image, :title, :description, :url
      t.references :album
      t.timestamps
    end
  end
end
