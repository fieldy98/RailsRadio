class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :artist
      t.string :title
      t.string :album
      t.integer :track_no
      t.integer :year
      t.string :genre
      t.string :filename
      t.string :file_location
      t.integer :playcount

      t.timestamps null: false
    end
  end
end
