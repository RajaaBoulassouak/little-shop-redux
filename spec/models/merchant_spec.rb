RSpec.describe Merchant do
  describe 'validations' do
    it 'is invalide without a name' do
      merchant = Merchant.create( id: 1,
                                  created_at: '2017-01-01',
                                  updated_at: '2017-02-02')

      expect(merchant).to_not be_valid
    end
    
    it 'has many invoices' do
      association = described_class.reflect_on_association(:invoices)
      expect(association.macro).to eq :has_many
    end
    
    it 'has many items' do
      association = described_class.reflect_on_association(:items)
      expect(association.macro).to eq :has_many
    end
  end
  
  describe 'Class Methods' do 
    it "calculates average item price per merchant" do
      merchant_1 = Merchant.create( name: 'Patrick' )
      item_1 = merchant_1.items.create( id:          1,
                                        name:        "item_1",
                                        description: "i'm an item!",
                                        unit_price:  200,
                                        image:       'path/to/image.jpg')
      item_2 = merchant_1.items.create( id:          2,
                                        name:        "item_1",
                                        description: "i'm an item!",
                                        unit_price:  300,
                                        image:       'path/to/image.jpg')
      item_3 = merchant_1.items.create( id:          3,
                                        name:        "item_1",
                                        description: "i'm an item!",
                                        unit_price:  400,
                                        image:       'path/to/image.jpg')

      expected = 300
      actual = merchant_1.average_item_price
      expect(expected).to eq(actual)
    end
    
    it "calculates total cost of items per merchant" do
      merchant_1 = Merchant.create( name: 'Patrick' )
      item_1 = merchant_1.items.create( id:          1,
                                        name:        "item_1",
                                        description: "i'm an item!",
                                        unit_price:  200,
                                        image:       'path/to/image.jpg')
      item_2 = merchant_1.items.create( id:          2,
                                        name:        "item_1",
                                        description: "i'm an item!",
                                        unit_price:  300,
                                        image:       'path/to/image.jpg')
      item_3 = merchant_1.items.create( id:          3,
                                        name:        "item_1",
                                        description: "i'm an item!",
                                        unit_price:  400,
                                        image:       'path/to/image.jpg')

      expected = 900
      actual = merchant_1.total_cost_of_items
      expect(expected).to eq(actual)
    end
    
    it "returns merchant with highest price item" do
      merchant_1 = Merchant.create( name: 'Patrick' )
      item_1 = merchant_1.items.create( id:          1,
                                        name:        "item_1",
                                        description: "i'm an item!",
                                        unit_price:  200,
                                        image:       'path/to/image.jpg')
      merchant_2 = Merchant.create( name: 'Kevin' )
      item_2 = merchant_2.items.create( id:          2,
                                        name:        "item_1",
                                        description: "i'm an item!",
                                        unit_price:  500,
                                        image:       'path/to/image.jpg')
      expected = merchant_2.name
      actual = Merchant.highest_price_item
      expect(expected).to eq(actual)
    end
    
    it "returns merchant with most items" do
      merchant_1 = Merchant.create( name: 'Patrick' )
      item_1 = merchant_1.items.create( id:          1234,
                                        name:        "item_1",
                                        description: "i'm an item!",
                                        unit_price:  300,
                                        image:       'path/to/image.jpg')
      merchant_2 = Merchant.create( name: 'Kevin' )
      item_2 = merchant_2.items.create( id:          7890,
                                        name:        "item_2",
                                        description: "i'm an item!",
                                        unit_price:  300,
                                        image:       'path/to/image.jpg')
      item_3 = merchant_2.items.create( id:          2345,
                                        name:        "item_3",
                                        description: "i'm an item!",
                                        unit_price:  500,
                                        image:       'path/to/image.jpg')
                                        
      expected = merchant_2.name
      actual = Merchant.merchant_with_most_items
      expect(expected).to eq(actual)
    end
  end
end
