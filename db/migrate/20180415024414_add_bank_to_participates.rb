class AddBankToParticipates < ActiveRecord::Migration[5.1]
  def change
    add_column :participates, :bank, :string
    add_column :participates, :atm, :string
    add_column :participates, :quantity, :integer
    add_column :participates, :total, :integer
  end
end
