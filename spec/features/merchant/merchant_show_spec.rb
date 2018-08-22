RSpec.describe 'Merchant Show Page' do

  before(:each) do
    @merchant_1 = Merchant.create( name: 'Homer Simpson' )
    @merchant_2 = Merchant.create( name: 'Marge Simpson' )
    @merchant_1.items.create( name: "Duff Beer",
                              description: "Delicious yet watery beer",
                              unit_price: 500,
                              merchant_id: 1,
                              image: '/path/to/file')

  end

  context 'Render Show' do
    it 'has an edit button ' do
      visit '/merchants/1'

      click_on('Edit')

      expect(page).to have_content('Edit in New Window')
    end

    it 'has a delete button' do
      visit '/merchants/1'

      click_on('Delete')

      expect(page).to have_content('WARNING')
    end
    it 'renders items' do
      visit '/merchants/1'

      expect(page).to have_content('Duff Beer')
      expect(page).to have_content('$5.00')
    end
    it 'clicks through to an item' do
      visit '/merchants/1'

      click_on("Duff Beer")

      expect(current_path).to eq('/items/1')
    end
  end
end
