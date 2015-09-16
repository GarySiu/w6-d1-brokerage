class Brokerage < ActiveRecord::Base
  has_many :holdings
  has_many :clients, through: :holdings

  def sell(holding,quantity)
    sale = self.holdings.find(holding)
    sale.client.update(cash_balance: (sale.client.cash_balance += (sale.stock.price * quantity)))
    sale.update(shares: (sale.shares -= quantity))
    self.holdings.destroy sale if sale.shares == 0
  end

  def buy(stock, client, quantity)
    # Check to see if the client already has some of that stock
    buyer = Client.find(client)
    if buyer.holdings.where(stock_id: stock).first
      holding = buyer.holdings.where(stock_id: stock)
      buyer.update(cash_balance: buyer.cash_balance -= (Stock.find(stock).price * quantity))
      holding.update(shares: (holding.first.shares += quantity))
    else
      buyer.update(cash_balance: buyer.cash_balance -= (Stock.find(stock).price * quantity))
      buyer.holdings.create(brokerage_id: self.id, shares: quantity, stock_id: stock)
    end
  end

end
