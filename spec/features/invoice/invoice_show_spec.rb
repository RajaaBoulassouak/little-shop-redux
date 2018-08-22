RSpec.describe 'Invoice Show Page' do
  before(:each) do
    @invoice = Invoice.create( customer_id: 1,
                                merchant_id: 1,
                             status: 'pending')
    @invoice.invoice_items.create( id: 1,
                                invoice_id: 1,
                                item_id: 1,
                                 quantity: 1,
                                 unit_price: 5)
    Item.create( name: 'Duff Beer',
                  description: "Cold Beer",
                  unit_price: 500,
                  merchant_id: 1)
    Merchant.create( id: 1, name: 'Homer Simpson')
  end
  it 'should show the invoice id and status' do
    visit '/invoices/1'

    expect(page).to have_content('Invoice: 1')
    expect(page).to have_content('Pending')
  end
  it 'should open the edit modal when you click edit' do
    visit '/invoices/1'

    click_button('Edit')

    expect(page).to have_content('Edit in New Window')
  end
  it 'should open the delete modal when you click delete' do
    visit '/invoices/1'

    click_button('Delete')

    expect(page).to have_content('WARNING')
  end
  it 'should edit the status' do
    visit '/invoices/1'

    click_button('Edit')

    select "shipped", :from => "invoice[status]"
    click_button('Save changes')

    expect(page).to have_content('shipped')
  end
  it 'should link to the merchant' do
    visit '/invoices/1'

    click_link('invoice-merchant-link')

    expect(current_path).to eq('/merchants/1')
  end
  it 'should render invoice items' do
    visit '/invoices/1'

    expect(page).to have_content('Duff Beer')
  end
end
