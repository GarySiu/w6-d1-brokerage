class Brokerage < ActiveRecord::Base
  has_many :holdings
  has_many :clients, through: :holdings

  def sell(holding,quantity)
    sale = self.holdings.find(holding)
    sale.client.update(cash_balance: (sale.client.cash_balance += (sale.stock.price * quantity)))
    sale.update(shares: (sale.shares -= quantity))
    self.holdings.destroy sale if sale.shares == 0
  end

end
