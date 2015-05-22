# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Stock.delete_all

# Stock.create!(symbol: 'MNKD', name: 'Mannkind Corporation')
# Stock.create!(symbol: 'NVDA', name: 'NVIDIA Corporation')
# Stock.create!(symbol: 'AMZN', name: 'Amazon.com Inc.')
# Stock.create!(symbol: 'AMD', name: 'Advanced Micro Devices Inc.')
# Stock.create!(symbol: 'INTC', name: 'Intel Corporation')

# Derivative.delete_all

# response = HTTParty.get('http://query.yahooapis.com/v1/public/yql?q=select%20%2A%20from%20yahoo.finance.industry%20where%20id%20in%20(select%20industry.id%20from%20yahoo.finance.sectors)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys')
# response['query']['results']['industry'].each do |industry|
#   if industry.has_key?('company') && industry['company'].is_a?(Array)
#     industry['company'].each do |company|
#       Derivative.create!(name: company['name'], symbol: company['symbol'])
#     end
#   end
# end

Derivative.delete_all



# Derivative.create!(symbol: 'AAPL', name: 'Apple')
# Derivative.create!(symbol: 'MSFT', name: 'Microsoft')
# Derivative.create!(symbol: 'GOOG', name: 'Google')
# Derivative.create!(symbol: "BARC.L", name: 'Barclays')
# Derivative.create!(symbol: 'TWTR', name: 'Twitter')
# Derivative.create!(symbol: 'FB', name: 'Facebook')
# Derivative.create!(symbol: "SIE.DE", name: "Siemens")
