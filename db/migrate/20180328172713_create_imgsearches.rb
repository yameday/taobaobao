class CreateImgsearches < ActiveRecord::Migration[5.1]
  def change
    create_table :imgsearches do |t|

      t.string "photo" 
      t.text "description" 
      t.string "status" 
      t.text "result" 
      t.timestamps
    end
  end
end
