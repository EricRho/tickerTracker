Stock.delete_all

# Derivative.delete_all

# response = HTTParty.get('http://query.yahooapis.com/v1/public/yql?q=select%20%2A%20from%20yahoo.finance.industry%20where%20id%20in%20(select%20industry.id%20from%20yahoo.finance.sectors)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys')
# response['query']['results']['industry'].each do |industry|
#   if industry.has_key?('company') && industry['company'].is_a?(Array)
#     industry['company'].each do |company|
#       Derivative.create!(name: company['name'], symbol: company['symbol'])
#     end
#   end
# end

# Derivative.delete_all

# Derivative.create!(symbol: 'AAPL', name: 'Apple')
# Derivative.create!(symbol: 'MSFT', name: 'Microsoft')
# Derivative.create!(symbol: 'GOOG', name: 'Google')
# Derivative.create!(symbol: "BARC.L", name: 'Barclays')
# Derivative.create!(symbol: 'TWTR', name: 'Twitter')
# Derivative.create!(symbol: 'FB', name: 'Facebook')
# Derivative.create!(symbol: "SIE.DE", name: "Siemens")
# Derivative.create!(symbol: 'MNKD', name: 'MannKind Corporation')

Derivative.delete_all

require 'csv'

csv_text = File.read('companylist.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Derivative.create!(row.to_hash)
end
