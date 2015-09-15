class Client < ActiveRecord::Base
  has_many :holdings
  has_many :stocks, through: :holdings
end
