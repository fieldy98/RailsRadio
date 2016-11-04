class ChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column_default(:musics, :playcount, 0)
  end
end
