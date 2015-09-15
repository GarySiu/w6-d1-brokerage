class AddColumnStockIdToHoldings < ActiveRecord::Migration
  def change
    add_column :holdings, :stock_id, :integer
  end
end
