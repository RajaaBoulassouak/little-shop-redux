RSpec.describe 'Merchants Edit Page' do
  before(:each) do
    @merchant_1 = Merchant.create(id: 1, name: 'Homer Simpson')
  end
  context 'Edit Render' do
    it 'should render the merchant title' do
      visit '/merchants/1/edit'

      expect(page).to have_content('Homer Simpson')
    end
    it 'should edit the name' do
      visit '/merchants/1/edit'

      fill_in 'merchant[name]', with: 'Ned Flanders'
      click_on('Submit')

      expect(page).to have_content('Ned Flanders')
      expect(Merchant.find(1).name).to eq('Ned Flanders')
    end
  end
end
