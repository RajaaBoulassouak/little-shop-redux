RSpec.describe Invoice do
  describe 'Contains' do
    before(:each) do
      invoice = Invoice.create( id: 4,
                                customer_id: 1,
                                merchant_id: 1,
                                status: 'shipped')
      invoice.invoice_items.create( id: 1,
                                    item_id: 1,
                                    invoice_id: 4,
                                    quantity: 5,
                                    unit_price: 100)
      invoice_2 = Invoice.create(id: 6,
                                 customer_id: 1,
                                 merchant_id: 1,
                                 status: "pending" )
      invoice_2.invoice_items.create( id: 2,
                                      item_id: 2,
                                      invoice_id: 6,
                                      quantity: 10,
                                      unit_price: 200)
    end
    it 'should shoud percent by status' do
      visit '/invoices/invoice_dashboard'

      expect(page).to have_content("pending 50.00%")
    end
    it 'should show max by unit price' do
      visit '/invoices/invoice_dashboard'

      expect(page).to have_content("Max by Unit Price: 6")
    end
    it 'should show min by unit price' do
      visit '/invoices/invoice_dashboard'
      expect(page).to have_content("Min by Unit Price: 4")
    end
    it 'should show max by quantity' do
      visit '/invoices/invoice_dashboard'

      expect(page).to have_content("Max by Quantity: 6")
    end
    it 'should show min by quantity' do
      visit '/invoices/invoice_dashboard'
      expect(page).to have_content("Min by Quantity: 4")
    end
  end
end
