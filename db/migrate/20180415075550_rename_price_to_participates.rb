class RenamePriceToParticipates < ActiveRecord::Migration[5.1]
  def change
    rename_column :participates, :total, :price
  end
end
