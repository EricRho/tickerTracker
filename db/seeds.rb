# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Stock.delete_all

Stock.create!(symbol: 'MNKD', name: 'Mannkind Corporation')
Stock.create!(symbol: 'NVDA', name: 'NVIDIA Corporation')
Stock.create!(symbol: 'AMZN', name: 'Amazon.com Inc.')
Stock.create!(symbol: 'AMD', name: 'Advanced Micro Devices Inc.')
Stock.create!(symbol: 'INTC', name: 'Intel Corporation')

Derivative.delete_all

Derivative.create!(symbol: 'SNY', name: 'Sanofi')
Derivative.create!(symbol: 'LLY', name: 'Eli Lilly and Company')
Derivative.create!(symbol: 'MRK', name: 'Merck & Co. Inc.')
Derivative.create!(symbol: 'CG', name: 'The Carlyle Group')
