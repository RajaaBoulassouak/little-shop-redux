RSpec.describe 'Invoices Index Page' do 
  before(:each) do 
    @invoice_1 = Invoice.create( customer_id: 8, merchant_id: 4, status: 'pending')
    @invoice_2 = Invoice.create( customer_id: 5, merchant_id: 9, status: 'pending')
  end 
  
  context 'Show Invoices' do 
    it 'It should show all invoices' do 
      
      visit '/invoices'
      
      expect(page).to have_content(@invoice_1.merchant_id)
      expect(page).to have_content(@invoice_2.merchant_id)
    end 
    
    it 'It should show a single invoice' do
      visit '/invoices'
      
      first(:link).click
    
      expect(current_path).to eq('/invoices/1')
      expect(page).to have_content(@invoice_1.merchant_id)
      expect(page).to have_content(@invoice_1.status)
    end
  end 
  
  context 'Invoice Actions' do
    it 'It should delete an invoice' do
      visit '/invoices'
     
      first(:button, 'delete').click
    
      expect(page).to_not have_content(@invoice_1.merchant_id)
      expect(page).to_not have_content(@invoice_1.status)
    end
    
    it 'It should edit an invoice' do
      visit '/invoices'
    
      first(:button, 'Edit').click
    
      fill_in "invoice[status]", :with => "shipped"
      click_button('Submit')
    
      expect(current_path).to eq('/invoices/1')
      expect(page).to have_content("shipped")
    end
  end
end 