class CreateBrokerages < ActiveRecord::Migration
  def change
    create_table :brokerages do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
