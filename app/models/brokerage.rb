class Brokerage < ActiveRecord::Base
  has_many :holdings
  has_many :clients, through: :holdings

  def sell(holding,quantity)
    sale = self.holdings.find(holding)
    sale.client.update(cash_balance: (sale.client.cash_balance += (sale.stock.price * quantity)))
    sale.update(shares: (sale.shares -= quantity))
    self.holdings.destroy sale if sale.shares == 0
  end

  def buy(stock_id, client_id, quantity)
    buyer = Client.find(client_id)
    stock = Stock.find(stock_id)
    balance = buyer.cash_balance
    # Check to see if the client already has some of that stock
    if buyer.holdings.where(stock_id: stock_id).first
      holding = buyer.holdings.where(stock_id: stock_id)
      buyer.update(cash_balance: balance -= (stock.price * quantity))
      holding.update(shares: (holding.first.shares += quantity))
    else
      buyer.update(cash_balance: balance -= (stock.price * quantity))
      buyer.holdings.create(brokerage_id: self.id, shares: quantity, stock_id: stock_id)
    end
  end

end
