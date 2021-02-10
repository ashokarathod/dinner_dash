class RemoveCostAndTotalFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :cost, :integer
    remove_column :orders, :total, :integer
  end
end
