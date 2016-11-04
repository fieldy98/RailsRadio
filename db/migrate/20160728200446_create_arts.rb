class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.string :art
      t.string :artist
      t.string :album

      t.timestamps null: false
    end
  end
end
