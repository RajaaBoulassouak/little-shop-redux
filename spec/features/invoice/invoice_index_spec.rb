RSpec.describe 'Invoices Index Page' do
  before(:each) do
    @invoice_1 = Invoice.create(id: 12345, customer_id: 8, merchant_id: 1, status: 'pending')
    @invoice_2 = Invoice.create( customer_id: 5, merchant_id: 1, status: 'pending')
    Merchant.create(name: 'Homer Simpson')
  end

  context 'Show Invoices' do
    it 'It should show all invoices' do

      visit '/invoices'

      expect(page).to have_content(@invoice_1.merchant_id)
      expect(page).to have_content(@invoice_2.merchant_id)
    end

    it 'It should show a single invoice' do
      visit '/invoices'

      click_link('12345')

      expect(current_path).to eq('/invoices/12345')
      expect(page).to have_content(@invoice_1.merchant_id)
      expect(page).to have_content(@invoice_1.status)
    end
    it 'should show quantity for each item' do
    Item.create( name: 'a',
                        description: 'b',
                        unit_price: 1,
                        merchant_id: 1,
                        created_at: '2016-01-11 09:34:06 UTC')


    invoice_item = InvoiceItem.create(item_id: 1,
                                      invoice_id: 1,
                                      quantity: 1,
                                      unit_price: 1)
    visit '/invoices/1'
    expect(page).to have_content(invoice_item.quantity)
    expect(page).to have_content(invoice_item.unit_price)
  end
end
end
