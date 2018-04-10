class ChangeDataTypeForResult < ActiveRecord::Migration[5.1]
  def change
   change_column :imgsearches, :result, :binary
  end
end
