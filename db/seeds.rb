# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Brokerage.delete_all
Client.delete_all
Holding.delete_all
Stock.delete_all

b1 = Brokerage.create(name: 'Adam')
b2 = Brokerage.create(name: 'Bob')
b3 = Brokerage.create(name: 'Charlie')
b4 = Brokerage.create(name: 'Dylan')
b5 = Brokerage.create(name: 'Edward')

c1 = Client.create(name: 'Alice', cash_balance: 10000)
c2 = Client.create(name: 'Betty', cash_balance: 20000)
c3 = Client.create(name: 'Cynthia', cash_balance: 30000)
c4 = Client.create(name: 'Debbie', cash_balance: 12345)
c5 = Client.create(name: 'Enid', cash_balance: 50000.32)

s1 = Stock.create(name: 'AAPL', price: 116.28)
s2 = Stock.create(name: 'GOOG', price: 635.14)
s3 = Stock.create(name: 'AMZN', price: 522.37)
s4 = Stock.create(name: 'USB', price: 40.86)
s5 = Stock.create(name: 'TSE', price: 24.11)
s6 = Stock.create(name: 'BAC', price: 16.31)

h1 = c1.holdings.create(brokerage_id: b1.id, stock_id: s1.id, shares: 50)
h2 = c1.holdings.create(brokerage_id: b1.id, stock_id: s2.id, shares: 10)
h3 = c1.holdings.create(brokerage_id: b1.id, stock_id: s3.id, shares: 12)
h4 = c1.holdings.create(brokerage_id: b1.id, stock_id: s4.id, shares: 3)

h5 = c2.holdings.create(brokerage_id: b1.id, stock_id: s5.id, shares: 501)
h6 = c2.holdings.create(brokerage_id: b1.id, stock_id: s1.id, shares: 5)
h7 = c2.holdings.create(brokerage_id: b3.id, stock_id: s3.id, shares: 20)

h8 = c3.holdings.create(brokerage_id: b1.id, stock_id: s1.id, shares: 210)
h9 = c3.holdings.create(brokerage_id: b1.id, stock_id: s2.id, shares: 220)
h10 = c3.holdings.create(brokerage_id: b2.id, stock_id: s4.id, shares: 20)

h10 = c4.holdings.create(brokerage_id: b1.id, stock_id: s5.id, shares: 2000)
h10 = c4.holdings.create(brokerage_id: b1.id, stock_id: s6.id, shares: 12)

puts 'Seeded'