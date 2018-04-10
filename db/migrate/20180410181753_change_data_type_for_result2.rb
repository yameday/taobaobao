class ChangeDataTypeForResult2 < ActiveRecord::Migration[5.1]
   def change
    change_column :imgsearches, :result, :binary, :limit => 10.megabyte
   end
end
