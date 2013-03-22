class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, :description, :url
      t.references :user
      t.timestamps
    end
  end
end
