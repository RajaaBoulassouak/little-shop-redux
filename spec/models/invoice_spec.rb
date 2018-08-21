RSpec.describe Invoice do
  describe 'validations' do
    it 'is invalid without a customer id' do
      invoice = Invoice.create( id:          1,
                                merchant_id: 8,
                                status: "pending")

      expect(invoice).to_not be_valid
    end

    it 'is invalid without a merchant id' do
      invoice = Invoice.create( id:          1,
                                customer_id: 4,
                                status: "pending")

      expect(invoice).to_not be_valid
    end

    it 'is invalid without a status' do
      invoice = Invoice.create( id:          1,
                                customer_id: 4,
                                merchant_id: 8)

      expect(invoice).to_not be_valid
    end

    it 'has a merchant' do
      association = described_class.reflect_on_association(:merchant)
      expect(association.macro).to eq :belongs_to
    end
  end
  describe 'Class Methods' do
    it 'calculates the percent of total by status' do
      Invoice.create( id: 1,
                      customer_id: 1,
                      merchant_id: 1,
                      status: "pending")
      Invoice.create( id: 2,
                      customer_id: 1,
                      merchant_id: 1,
                      status: "pending")
      Invoice.create( id: 3,
                      customer_id: 1,
                      merchant_id: 1,
                      status: "shipped")
      Invoice.create( id: 4,
                      customer_id: 1,
                      merchant_id: 1,
                      status: "returned")

      expected = "50.00%"

      actual = Invoice.percent_by_status.first.percentage
      expect(expected).to eq(actual)
    end
    it 'finds the invoice with the highest unit_price' do
      invoice = Invoice.create( id: 4,
                                customer_id: 1,
                                merchant_id: 1,
                                status: "shipped")
      invoice.invoice_items.create( id: 1,
                                    item_id: 1,
                                    invoice_id: 4,
                                    quantity: 5,
                                    unit_price: 100)
      invoice_2 = Invoice.create( id: 6,
                                customer_id: 1,
                                merchant_id: 1,
                                status: "shipped")
      invoice_2.invoice_items.create( id: 2,
                                    item_id: 2,
                                    invoice_id: 6,
                                    quantity: 10,
                                    unit_price: 200)

      expected = 6
      actual = Invoice.max_by_unit_price
      expect(expected).to eq(actual)
    end
    it 'finds the invoice with the lowest unit_price' do
      invoice = Invoice.create( id: 4,
                                customer_id: 1,
                                merchant_id: 1,
                                status: "shipped")
      invoice.invoice_items.create( id: 1,
                                    item_id: 1,
                                    invoice_id: 4,
                                    quantity: 5,
                                    unit_price: 100)
      invoice_2 = Invoice.create( id: 6,
                                customer_id: 1,
                                merchant_id: 1,
                                status: "shipped")
      invoice_2.invoice_items.create( id: 2,
                                    item_id: 2,
                                    invoice_id: 6,
                                    quantity: 10,
                                    unit_price: 200)

      expected = 4
      actual = Invoice.min_by_unit_price
      expect(expected).to eq(actual)
    end
     it 'finds the invoice with the highest quantity' do
      invoice = Invoice.create( id: 4,
                                customer_id: 1,
                                merchant_id: 1,
                                status: "shipped")
      invoice.invoice_items.create( id: 1,
                                    item_id: 1,
                                    invoice_id: 4,
                                    quantity: 5,
                                    unit_price: 100)
      invoice_2 = Invoice.create( id: 6,
                                customer_id: 1,
                                merchant_id: 1,
                                status: "shipped")
      invoice_2.invoice_items.create( id: 2,
                                    item_id: 2,
                                    invoice_id: 6,
                                    quantity: 10,
                                    unit_price: 200)

      expected = 6
      actual = Invoice.max_by_quantity
      expect(expected).to eq(actual)
    end
    it 'finds the invoice with the lowest quantity' do
      invoice = Invoice.create( id: 4,
                                customer_id: 1,
                                merchant_id: 1,
                                status: "shipped")
      invoice.invoice_items.create( id: 1,
                                    item_id: 1,
                                    invoice_id: 4,
                                    quantity: 5,
                                    unit_price: 100)
      invoice_2 = Invoice.create( id: 6,
                                customer_id: 1,
                                merchant_id: 1,
                                status: "shipped")
      invoice_2.invoice_items.create( id: 2,
                                    item_id: 2,
                                    invoice_id: 6,
                                    quantity: 10,
                                    unit_price: 200)

      expected = 4
      actual = Invoice.min_by_quantity
      expect(expected).to eq(actual)
    end
   end
  end
