RSpec.describe 'Merchant Show Page' do

  before(:each) do
    @merchant_1 = Merchant.create( name: 'Homer Simpson' )
    @merchant_2 = Merchant.create( name: 'Marge Simpson' )
    @merchant_1.items.create( name: "Duff Beer",
                              description: "Delicious yet watery beer",
                              unit_price: 500,
                              merchant_id: 1,
                              image: '/')

  end

  context 'Render Show' do
    it 'has an edit button ' do
      visit '/merchants/1'

      click_on('Edit')

      expect(page).to have_content('Edit in New Window')
    end

    it 'has a delete button' do
      visit 'merchants/1'

      click_on('Delete')

      expect(page).to have_content('Warning')
    end
  end
end
