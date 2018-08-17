require './app/models/merchant.rb'
require './app/models/item.rb'
require 'csv'

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |merchant|
  Merchant.create(id: merchant[:id],
                  name: merchant[:name],
                  created_at: merchant[:created_at])
end

CSV.foreach('./data/items.csv', headers: true, header_converters: :symbol) do |item|
  Item.create(id: item[:id],
              title: item[:title],
              description: item[:description],
              price: item[:price],
              image: item[:image],
              created_at: item[:created_at],
              updated_at: item[:updated_at])
end
