RSpec.describe "Item Create Page" do
  before(:each) do
    @merchant = Merchant.create(name: "Homer Simpson")
    @merchant22 = Merchant.create(name: "Marge Simpson")
 end
  it 'should have a form to fill out' do
    visit '/items/new'

    expect(page).to have_content("Merchants")
    expect(page).to have_content("Name")
  end

  it 'should fill out a form' do
    visit '/items/new'

    select "Marge Simpson", from: "item[merchant]"
    fill_in 'item[name]', with: 'Pearls'
    fill_in 'item[description]', with: 'The inconic necklace'
    fill_in 'item[unit_price]', with: 1000
    fill_in 'item[image]', with: 'path/to/image'

    click_button('Submit')

    expect(current_path).to eq('/items/1')
  end
end
