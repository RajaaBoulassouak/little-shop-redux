RSpec.describe "Item Show Page" do
  before(:each) do
    Merchant.create( name: 'Homer Simpson')
    Item.create( name: "Duff Beer",
                description: "Duff Beer is a brand of beer that originated as a fictional beverage on the animated series The Simpsons. Beers using the Duff branding have been brewed in a number of countries, resulting in legal battles with varying results",
               unit_price: 500,
               merchant_id: 1)
  end

  it 'should display the item' do
    visit '/items/1'
    expect(page).to have_content('Homer Simpson')
    expect(page).to have_content('Duff Beer')
  end
  it 'should have a delete modal' do
    visit '/items/1'

    click_button('Delete')

    expect(page).to have_content("WARNING")
  end
end
