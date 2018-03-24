class AddParticipatesCountOnPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :participates_count, :integer, default: 0
  end
end
