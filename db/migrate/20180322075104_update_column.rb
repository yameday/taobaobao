class UpdateColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :title, :string
    add_column :posts, :photo, :string
    add_column :posts, :url, :string
    add_column :posts, :description, :text
    add_column :posts, :delivery, :string
    add_column :posts, :price, :integer
    add_column :posts, :user_id, :integer
    add_column :posts, :participants_count, :string
    add_column :posts, :goal, :integer
    add_column :posts, :due_time, :datetime
    add_column :posts, :status, :string
  end
end
