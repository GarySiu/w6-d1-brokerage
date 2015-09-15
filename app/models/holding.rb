class Holding < ActiveRecord::Base
  belongs_to :brokerage
  belongs_to :client
  belongs_to :stock
end
