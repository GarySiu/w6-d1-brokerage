class Client < ActiveRecord::Base
  has_many :holdings
  has_many :stocks, through: :holdings

  def total
    self.holdings.all.inject(0) { |result, holding| result + (holding.shares * holding.stock.price) }
  end

end
