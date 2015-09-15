class RenameColumnInHoldingsBrokerIdToBrokerageId < ActiveRecord::Migration
  def change
    rename_column :holdings, :broker_id, :brokerage_id
  end
end
