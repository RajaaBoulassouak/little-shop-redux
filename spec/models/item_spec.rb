RSpec.describe Item do
  describe 'validations' do
    it 'is invalid without a title' do
    item = Item.create( id:          1,
                        description: "i'm an item!",
                        price:       200,
                        image:       'path/to/image.jpg')

    expect(item).to_not be_valid
    end
    it 'is invalid without a description' do
      item = Item.create( id:    2,
                          title: 'Pineapple',
                          price: 200,
                          image: 'path/to/image.jpg')

      expect(item).to_not be_valid
    end
    it 'is invalid without a price' do
      item = Item.create( id:          3,
                          title:       'Thing',
                          description: 'definitely still a thing',
                          image:       '/path/to/image.jpg')

      expect(item).to_not be_valid
    end
    it 'is invalid without an image' do
      item = Item.create(id: 4,
                        title: 'Another thing',
                         description: 'and another thing',
                         price: 200)
      expect(item).to_not be_valid
    end
  end
end
