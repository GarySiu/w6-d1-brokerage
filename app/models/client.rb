class Client < ActiveRecord::Base
  has_many :holdings
  has_many :stocks, through: :holdings

  def total
    total = []
    self.holdings.all.each do |holding|
      total << (holding.shares * holding.stock.price)
    end
    total.inject(:+)
  end

end
