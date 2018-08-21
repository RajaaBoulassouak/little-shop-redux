RSpec.describe 'Item Dashboard' do
before(:each) do
  @item_1 = Item.create(name: 'a',
                        description: 'b',
                        unit_price: 5,
                        merchant_id: 1,
                        created_at: '1978-02-09 20:42:46 UTC')
  @item_2 = Item.create(name: 'b',
                        description: 'c',
                        unit_price: 5,
                        merchant_id: 2,
                        created_at: '1978-03-09 20:42:46 UTC')
  @item_3 = Item.create(name: 'c',
                        description: 'd',
                        unit_price: 5,
                        merchant_id: 3,
                        created_at: '2016-01-11 09:34:06 UTC')
    end

    context 'Show Item Data' do
      it 'It shows first and last created' do
      visit '/items-dashboard'

      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_3.name)
  end

  it 'shows average item price' do
    visit '/items-dashboard'

    expect(page).to have_content('average price for an item: 5')
  end

  it 'it shows total number of items' do
    visit '/items-dashboard'
    expect(page).to have_content('total number of items: 3')
  end

end
end
