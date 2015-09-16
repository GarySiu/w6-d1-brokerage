class FixStockColumnNames < ActiveRecord::Migration
  def change
    rename_column :stocks, :stock_name, :name
    rename_column :stocks, :share_price, :price
  end
end
