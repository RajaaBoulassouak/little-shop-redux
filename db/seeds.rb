require './app/models/merchant.rb'
require './app/models/item.rb'
require './app/models/invoice.rb'
require './app/models/invoice_item.rb'
require 'csv'

images = Dir.entries("app/public/img")

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |merchant|
  Merchant.create(id: merchant[:id],
                  name: merchant[:name],
                  created_at: merchant[:created_at])
end

CSV.foreach('./data/items.csv', headers: true, header_converters: :symbol) do |item|
  Item.create(id: item[:id],
              name: item[:name],
              description: item[:description],
              unit_price: item[:unit_price],
              image: images.sample,
              merchant_id: item[:merchant_id],
              created_at: item[:created_at],
              updated_at: item[:updated_at])
end

CSV.foreach('./data/invoices.csv', headers: true, header_converters: :symbol) do |invoice|
  Invoice.create(id: invoice[:id],
                 customer_id: invoice[:customer_id],
                 merchant_id: invoice[:merchant_id],
                 status: invoice[:status],
                 created_at: invoice[:created_at],
                 updated_at: invoice[:updated_at])
end

CSV.foreach('./data/invoice_items.csv', headers: true, header_converters: :symbol) do |invoice_item|
  InvoiceItem.create(id: invoice_item[:id],
                 item_id: invoice_item[:item_id],
                 invoice_id: invoice_item[:invoice_id],
                 quantity: invoice_item[:quantity],
                 unit_price: invoice_item[:unit_price],
                 created_at: invoice_item[:created_at],
                 updated_at: invoice_item[:updated_at])
end
