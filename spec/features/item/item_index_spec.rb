RSpec.describe "Item Index Page" do
  before(:each) do
    Item.create( name: "Left Handed Pen",
                description: "A Pen for lefties!",
               unit_price: 1200,
               merchant_id: 1)
    Item.create( name: "Duff Beer",
               description: "Cold Beer",
               unit_price: "500",
               merchant_id: 2)
    Merchant.create( name: "Homer Simpson")
    Merchant.create( name: "Ned Flanders")
  end
  it 'Should have a create button' do
    visit '/items'

    expect(page).to have_content('Create a New Item')
  end
  it 'should have a create modal' do
    visit '/items'

    click_button('Create a New Item')

    expect(page).to have_content('Create in New Window')
  end
  it 'should create an item in the modal' do
    visit '/items'

    click_button('Create a New Item')

    select "Ned Flanders", :from => "item[merchant]"
    fill_in "item[name]", with: "Left handed Cork Screw"
    fill_in "item[description]", with: "Turns bacwards for your comfort"
    fill_in "item[unit_price]", with: 500
    fill_in "item[image]", with: '/path/to/image'

    click_button('Save changes')
    expect(page).to have_content("Left handed Cork Screw")
  end
  it 'should show many items' do
    visit '/items'

    expect(page).to have_content('Left Handed Pen')
    expect(page).to have_content('$12.00')
    expect(page).to have_content('Duff Beer')
    expect(page).to have_content('$5.00')
  end
  it 'should link to items' do
    visit '/items'

    click_link('Left Handed Pen')

    expect(current_path).to eq('/items/1')
  end
end

# before(:each) do
#   @item_1 = Item.create( name: 'Homer Simpson Autograph',
#                        description:  'Signed Beer',
#                        unit_price:  500,
#                        merchant_id:  1)
#   @item_2 = Item.create( name: 'Marge Simpson Autograph' ,
#                        description:  'Signed Pearls',
#                        unit_price:  1000,
#                        merchant_id:  1)
#   @item_3 = Item.create( name: 'Bart Simpson Autograph' ,
#                        description:  "Signed Skateboard",
#                        unit_price:  10000,
#                        merchant_id:  1)
#   @item_4 = Item.create( name: 'Lisa Simpson Autograph' ,
#                        description:  "Signed Saxaphone",
#                        unit_price:  1500,
#                        merchant_id:  2)
#   @item_5 = Item.create( name: 'Maggie Simpson Autograph' ,
#                        description:  "Signed Pacifier",
#                        unit_price:  890900,
#                        merchant_id:  2)
#   @item_6 = Item.create( name: 'Kent Brockman Autograph' ,
#                        description:  'Signed Microphone',
#                        unit_price:  100,
#                        merchant_id:  2)
#   @item_7 = Item.create( name: 'Selma Bouvier Autograph' ,
#                        description:  "Signed Ash Tray",
#                        unit_price:  8000,
#                        merchant_id:  1)
#   @item_8 = Item.create( name: 'Carl Carlson Autograph' ,
#                        description:  "Signed Budha",
#                        unit_price:  6700,
#                        merchant_id:  3)
#   @item_9 = Item.create( name: 'Montgomery Burns Autograph' ,
#                        description:  "Signed Dog Collar",
#                        unit_price:  24980,
#                        merchant_id:  1)
#   @item_10 = Item.create( name: 'Gary Chalmers Autograph' ,
#                        description:  "Signed Yearbook",
#                        unit_price:  100,
#                        merchant_id:  1)
#   @item_11 = Item.create( name: 'Comic Book Guy Autograph' ,
#                        description:  "Signed Autograph",
#                        unit_price:  10000000,
#                        merchant_id:  1)
#   @item_12 = Item.create( name: 'Disco Stu Autograph' ,
#                        description:  "Signed Disco Shoes",
#                        unit_price:  1000,
#                        merchant_id:  1)
#   @item_13 = Item.create( name: 'Duffman Autograph' ,
#                        description:  "Signed Beer",
#                        unit_price:  400,
#                        merchant_id:  3)
#   @item_14 = Item.create( name: 'Maude Flanders Autograph' ,
#                        description:  "Signed Headstone",
#                        unit_price:  500,
#                        merchant_id:  2)
#   @item_15 = Item.create( name: 'Ned Flanders Autograph' ,
#                        description:  "Signed Left Hand Shirt",
#                        unit_price:  1001,
#                        merchant_id:  2)
#   @item_16 = Item.create( name: 'Rod Flanders Autograph' ,
#                        description:  "Signed Picture of Tod",
#                        unit_price:  10,
#                        merchant_id:  1)
#   @item_17 = Item.create( name: 'Tod Flanders Autograph' ,
#                        description:  "Signed Picture of Rod",
#                        unit_price:  10,
#                        merchant_id:  1)
#   @item_18 = Item.create( name: 'Barney Grumble Autograph' ,
#                          description:  "Signed Mr.Plow Shirt",
#                        unit_price:  2000,
#                        merchant_id:  1)
#   @item_19 = Item.create( name: 'Itchy Autograph' ,
#                        description:  "Signed Axe",
#                        unit_price:  1005,
#                        merchant_id:  1)
#   @item_20 = Item.create( name: 'Scratchy Autograph' ,
#                        description:  "Signed Casket",
#                        unit_price:  50005,
#                        merchant_id:  1)
#   @item_21 = Item.create( name: 'Edna Krabappel Autograph' ,
#                        description:  "Signed Report Card",
#                        unit_price:  600,
#                        merchant_id:  4)
#   @item_22 = Item.create( name: 'Krusty the Clown Autograph' ,
#                        description:  "Signed Autograph",
#                        unit_price:  3000,
#                        merchant_id:  1)
#   @item_23 = Item.create( name: 'Helen Lovejoy Autograph' ,
#                        description:  "Signed Prayer Card",
#                        unit_price:  28901,
#                        merchant_id:  1)
#   @item_24 = Item.create( name: 'Troy McClure Autograph' ,
#                        description:  "Signed premier ticket",
#                        unit_price:  8765,
#                        merchant_id:  1)
#   @item_25 = Item.create( name: 'Martin Prince Autograph' ,
#                        description:  "Signed A report card",
#                        unit_price:  148763,
#                        merchant_id:  1)
#   @item_26 = Item.create( name: 'Seymour Skinner Autograph' ,
#                        description:  "Signed Letter to his mom",
#                        unit_price:  10008234,
#                        merchant_id:  1)
#   @item_27 = Item.create( name: 'Waylon Smithers Autograph' ,
#                          description:  "Signed photo of Mr. Burns",
#                        unit_price:  18234,
#                        merchant_id:  2)
#   @item_28 = Item.create( name: 'Moe Syslak Autograph' ,
#                        description:  "Signed pickled egg",
#                        unit_price:  147422,
#                        merchant_id:  1)
#   @item_29 = Item.create( name: 'Ralph Wiggum Autograph' ,
#                        description:  "Embroidered Underwear",
#                        unit_price:  13234,
#                        merchant_id:  1)
#   @item_30 = Item.create( name: 'Clancy Wiggum Autograph' ,
#                        description:  "Signed Donut",
#                        unit_price:  1238,
#                        merchant_id:  5)
# end
# it 'should render many items on the screen' do
#   visit '/items'
#
#   expect(page).to have_content('Itchy Autograph')
#   expect(page).to_not have_content('Clancy Wiggum')
# end
