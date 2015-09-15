class CreateHoldings < ActiveRecord::Migration
  def change
    create_table :holdings do |t|
      t.integer :broker_id
      t.integer :client_id
      t.integer :shares

      t.timestamps null: false
    end
  end
end
