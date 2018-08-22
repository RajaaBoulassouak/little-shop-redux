RSpec.describe Merchant do
  describe 'Contains' do
    before(:each) do 
      @merchant_1 = Merchant.create( name: 'Patrick' )
      item_1 = @merchant_1.items.create( id:          1234,
                                          name:        "item_1",
                                          description: "i'm an item!",
                                          unit_price:  300,
                                          image:       'path/to/image.jpg')
      @merchant_2 = Merchant.create( name: 'Kevin' )
      item_2 = @merchant_2.items.create( id:          7890,
                                          name:        "item_2",
                                          description: "i'm an item!",
                                          unit_price:  300,
                                          image:       'path/to/image.jpg')
      item_3 = @merchant_2.items.create( id:          2345,
                                          name:        "item_3",
                                          description: "i'm an item!",
                                          unit_price:  500,
                                          image:       'path/to/image.jpg')
    end
      
    it "should show each merchant's items" do
      visit '/merchants/dashboard'

      expect(page).to have_content("Item Count:\n1")
      expect(page).to have_content("Item Count:\n2")
    end

    it "should show item average price per merchant" do
      visit '/merchants/dashboard'
      
      expect(page).to have_content("Avg Item Price:\n#{@merchant_1.average_item_price}")
      expect(page).to have_content("Avg Item Price:\n#{@merchant_2.average_item_price}")
    end

    it "should show total items price per merchant" do
      visit '/merchants/dashboard'

      expect(page).to have_content("Total Cost of Items:\n#{@merchant_1.total_cost_of_items}")
      expect(page).to have_content("Total Cost of Items:\n#{@merchant_2.total_cost_of_items}")
    end

    it "should show merchant with highest price item" do
      visit '/merchants/dashboard'

      expect(page).to have_content("Merchant With Highest Price Item:\n#{@merchant_2.name}")
      expect(page).to_not have_content("Merchant With Highest Price Item:\n#{@merchant_1.name}")
    end

    it "should show merchant with most items" do
      visit '/merchants/dashboard'

      expect(page).to have_content("Merchant With Most Items:\n#{@merchant_2.name}")
      expect(page).to_not have_content("Merchant With Most Items:\n#{@merchant_1.name}")
    end
  end 
end