Stock.delete_all

Derivative.delete_all

require 'csv'

csv_text = File.read('companylist.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Derivative.create!(row.to_hash)
end
