# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Stock.create!(symbol: 'MNKD', name: 'Mannkind Corporation')
Stock.create!(symbol: 'NVDA', name: 'NVIDIA Corporation')
Stock.create!(symbol: 'AMZN', name: 'Amazon.com Inc.')
Stock.create!(symbol: 'AMD', name: 'Advanced Micro Devices Inc.')
Stock.create!(symbol: 'INTC', name: 'Intel Corporation')
