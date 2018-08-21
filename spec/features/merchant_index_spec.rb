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
    
    it "should count each merchant's items" do
      item_1 = @merchant_1.items.create( id:          1,
                                         name:        "item_1",
                                         description: "i'm an item!",
                                         unit_price:       200,
                                         image:       'path/to/image.jpg')
      item_2 = @merchant_1.items.create( id:          2,
                                         name:        "item_1",
                                         description: "i'm an item!",
                                         unit_price:       200,
                                         image:       'path/to/image.jpg')
      item_3 = @merchant_1.items.create( id:          3,
                                         name:        "item_1",
                                         description: "i'm an item!",
                                         unit_price:       200,
                                         image:       'path/to/image.jpg')   
    
      visit 'merchants/dashboard'
      
      save_and_open_page
    
      expect(page).to have_content("Item Count: 3")
    end
    
    it "should calculate merchants item average price" do
      item_1 = @merchant_1.items.create( id:          1,
                                         name:        "item_1",
                                         description: "i'm an item!",
                                         unit_price:  100,
                                         image:       'path/to/image.jpg')
      item_2 = @merchant_1.items.create( id:          2,
                                         name:        "item_1",
                                         description: "i'm an item!",
                                         unit_price:  300,
                                         image:       'path/to/image.jpg')
      item_3 = @merchant_1.items.create( id:          3,
                                         name:        "item_1",
                                         description: "i'm an item!",
                                         unit_price:  400,
                                         image:       'path/to/image.jpg')  
    
      visit 'merchants/dashboard'
    
      expect(page).to have_content("Average Item Price: #{@merchant_1.average_item_price}")
    end
    
    it "should calculate merchants total items price" do
      item_1 = @merchant_1.items.create( id:          1,
                                         name:        "item_1",
                                         description: "i'm an item!",
                                         unit_price:  100,
                                         image:       'path/to/image.jpg')
      item_2 = @merchant_1.items.create( id:          2,
                                         name:        "item_1",
                                         description: "i'm an item!",
                                         unit_price:  300,
                                         image:       'path/to/image.jpg')
      item_3 = @merchant_1.items.create( id:          3,
                                         name:        "item_1",
                                         description: "i'm an item!",
                                         unit_price:   400,
                                         image:       'path/to/image.jpg')  
    
      visit 'merchants/dashboard'
    
      expect(page).to have_content("Total Cost of Items: #{@merchant_1.total_cost_of_items}")
    end
    
    it "should return merchant with highest price item" do
      item_1 = @merchant_1.items.create( id:          1234,
                                         name:        "item_1",
                                         description: "i'm an item!",
                                         unit_price:  300,
                                         image:       'path/to/image.jpg')
      item_2 = @merchant_2.items.create( id:          2345,
                                         name:        "item_2",
                                         description: "i'm an item!",
                                         unit_price:  500,
                                         image:       'path/to/image.jpg')
    
      visit 'merchants/dashboard'
    
      expect(page).to have_content("Merchant With Highest Price Item: #{Merchant.highest_price_item}")
    end
    
    it "should return merchant with most items" do
      item_1 = @merchant_1.items.create( id:          1234,
                                         name:        "item_1",
                                         description: "i'm an item!",
                                         unit_price:  300,
                                         image:       'path/to/image.jpg')
      item_2 = @merchant_1.items.create( id:          7890,
                                         name:        "item_2",
                                         description: "i'm an item!",
                                         unit_price:  300,
                                         image:       'path/to/image.jpg')                                
      item_2 = @merchant_2.items.create( id:          2345,
                                         name:        "item_3",
                                         description: "i'm an item!",
                                         unit_price:  500,
                                         image:       'path/to/image.jpg')
    
      visit 'merchants/dashboard'
    
      expect(page).to have_content("Merchant With Most Items: #{Item.merchant_with_most_items}")
    end
    
  end
end
