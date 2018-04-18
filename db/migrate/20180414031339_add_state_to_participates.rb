class AddStateToParticipates < ActiveRecord::Migration[5.1]
  def change
    add_column :participates, :state, :string
  end
end
