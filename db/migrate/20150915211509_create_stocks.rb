class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :stock_name
      t.float :share_price

      t.timestamps null: false
    end
  end
end
