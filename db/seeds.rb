require './app/models/merchant.rb'
require 'csv'

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |merchant|
  Merchant.create(id: merchant[:id],
                  name: merchant[:name],
                  created_at: merchant[:created_at],
                  updated_at: merchant[:updated_at])
end

CSV.foreach('./data/invoices.csv', headers: true, header_converters: :symbol) do |invoice|
  Invoice.create(id: invoice[:id],
                 customer_id: invoice[:customer_id],
                 merchant_id: invoice[:merchant_id],
                 status: invoice[:status],     
                 created_at: invoice[:created_at],
                 updated_at: invoice[:updated_at])
end
