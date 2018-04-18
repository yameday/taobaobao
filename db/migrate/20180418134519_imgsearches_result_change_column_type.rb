class ImgsearchesResultChangeColumnType < ActiveRecord::Migration[5.1]
  def change
    change_column :imgsearches, :result, :text, :limit => 20.megabyte
   end
end
