RSpec.describe Item do
  describe 'validations' do
    it 'is invalid without a name' do
    item = Item.create( id:          1,
                        description: "i'm an item!",
                        unit_price:       200,
                        image:       'path/to/image.jpg')

    expect(item).to_not be_valid
    end
    it 'is invalid without a description' do
      item = Item.create( id:    2,
                          name: 'Pineapple',
                          unit_price: 200,
                          image: 'path/to/image.jpg')

      expect(item).to_not be_valid
    end
    it 'is invalid without a price' do
      item = Item.create( id:          3,
                          name:       'Thing',
                          description: 'definitely still a thing',
                          image:       '/path/to/image.jpg')

      expect(item).to_not be_valid
    end
    it 'is invalid without an image' do
      item = Item.create(id: 4,
                        name: 'Another thing',
                         description: 'and another thing',
                         unit_price: 200)
      expect(item).to_not be_valid
    end
  end
end
