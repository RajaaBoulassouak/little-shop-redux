RSpec.describe 'Merchants Index Page' do
  before(:each) do
    @merchant_1 = Merchant.create( name: 'Patrick' )
    @merchant_2 = Merchant.create( name: 'Kevin' )
  end
  context 'Show Merchants' do
    it 'It should show all merchants' do
    
      visit '/merchants'

      expect(page).to have_content(@merchant_1.name)
      expect(page).to have_content(@merchant_2.name)
    end
    it 'It should show a single merchant' do
      visit '/merchants'
      first(:link).click
      
      expect(current_path).to eq('/merchants/1')
      expect(page).to have_content(@merchant_1.name )
    end
  end
  context 'Merchant Actions' do
    it 'It should delete a merchant' do
     visit '/merchants'
      first(:button, 'delete').click

      expect(page).to_not have_content(@merchant_1.name)
    end
    it 'It should edit a merchant' do
      visit '/merchants'

      first(:button, 'Edit').click

      fill_in "merchant[name]", :with => "Paul"
      click_button('Submit')

      expect(current_path).to eq('/merchants/1')
      expect(page).to have_content("Paul")
    end
    it 'It should create a merchant' do
      visit '/merchants'
      click_button('Create a New Merchant')
      fill_in "merchant[name]", :with => "Joanne or whatever"
      click_button('Submit')
      expect(page).to have_content("Joanne or whatever")

    end
  end
end
