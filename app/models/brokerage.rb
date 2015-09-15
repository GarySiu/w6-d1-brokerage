class Brokerage < ActiveRecord::Base
  has_many :holdings
  has_many :clients, through: :holdings
end
