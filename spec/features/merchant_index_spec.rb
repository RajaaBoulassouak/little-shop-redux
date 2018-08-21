RSpec.describe 'Merchants Index Page' do

  before(:each) do
    @merchant_1 = Merchant.create( name: 'Homer Simpson' )
    @merchant_2 = Merchant.create( name: 'Marge Simpson' )
    @merchant_3 = Merchant.create( name: 'Bart Simpson' )
    @merchant_4 = Merchant.create( name: 'Lisa Simpson' )
    @merchant_5 = Merchant.create( name: 'Maggie Simpson' )
    @merchant_6 = Merchant.create( name: 'Kent Brockman' )
    @merchant_7 = Merchant.create( name: 'Selma Bouvier' )
    @merchant_8 = Merchant.create( name: 'Carl Carlson' )
    @merchant_9 = Merchant.create( name: 'Montgomery Burns' )
    @merchant_10 = Merchant.create( name: 'Gary Chalmers' )
    @merchant_11 = Merchant.create( name: 'Comic Book Guy' )
    @merchant_12 = Merchant.create( name: 'Disco Stu' )
    @merchant_13 = Merchant.create( name: 'Duffman' )
    @merchant_14 = Merchant.create( name: 'Maude Flanders' )
    @merchant_15 = Merchant.create( name: 'Ned Flanders' )
    @merchant_16 = Merchant.create( name: 'Rod Flanders' )
    @merchant_17 = Merchant.create( name: 'Tod Flanders' )
    @merchant_18 = Merchant.create( name: 'Barney Grumble' )
    @merchant_19 = Merchant.create( name: 'Itchy' )
    @merchant_20 = Merchant.create( name: 'Scratchy' )
    @merchant_21 = Merchant.create( name: 'Edna Krabappel' )
    @merchant_22 = Merchant.create( name: 'Krusty the Clown' )
    @merchant_23 = Merchant.create( name: 'Helen Lovejoy' )
    @merchant_24 = Merchant.create( name: 'Troy McClure' )
    @merchant_25 = Merchant.create( name: 'Martin Prince' )
    @merchant_26 = Merchant.create( name: 'Seymour Skinner' )
    @merchant_27 = Merchant.create( name: 'Waylon Smithers' )
    @merchant_28 = Merchant.create( name: 'Moe Syslak' )
    @merchant_29 = Merchant.create( name: 'Ralph Wiggum' )
    @merchant_30 = Merchant.create( name: 'Clancy Wiggum' )
  end

  context 'Render Index' do
    it 'Should have a create button in the jumbotron' do

      visit '/merchants'

      click_on("jumbotron-create-button")
      expect(page).to have_content("Create in New Window")
    end

    it 'should create in the jumbo modal' do
      visit '/merchants'

      click_on("jumbotron-create-button")
      fill_in 'create-merchant-name-field', with: "Erico"
      click_button("Save Changes")

      actual = Merchant.find_by(name: "Erico").name
      expected = 'Erico'

      expect(actual).to eq(expected)
    end
    it 'should open a new create window from the modal' do
      visit '/merchants'

      click_on("jumbotron-create-button")
      click_on("Create in New Window")

      expect(current_path).to eq('/merchants/new')

    end
    it 'should close the create modal' do
      visit '/merchants'

      click_on("jumbotron-create-button")
      click_on("create-modal-cancel")

      expect(page).to_not have_content('create-merchant-name-field')
    end
    it 'should calculate the total number of pages' do
      visit '/merchants'

      expect(page).to have_content("...2")
    end
    it 'should take you to a merchant page when you click their name' do
      visit '/merchants'

      click_on('Homer Simpson')

      expect(current_path).to eq('/merchants/1')
    end
    it 'should open an edit modal when you click edit on a merchant row' do
      visit '/merchants'

      within '#merchant-row-1' do
        click_on('Edit')
      end

      expect(page).to have_content("Edit in New Window")
    end
    it 'should edit a merchant in the modal' do
      visit '/merchants'

      within '#merchant-row-14' do
        click_on('Edit')
      end

      within '#merchant-row-14' do
        fill_in 'merchant[name]', with: "Edna Krabappel"
      end
      click_on('Save Changes')

      expect(page).to have_content("Edna Krabappel")
    end
    it 'should edit in a new tab' do
      visit '/merchants'

      within '#merchant-row-1' do
        click_on('Edit')
        click_on('Edit in New Window')
      end

      expect(current_path).to eq('/merchants/1/edit')
    end
    it 'should open a delete dialog' do
      visit '/merchants'

      within '#merchant-row-1' do
        click_on('Delete')
      end

      expect(page).to have_content('WARNING')
     end
    it 'should delete a record from the modal' do

       within '#merchant-row-2' do
          click_on('Delete')
       end

       within '#delete-merchant-1' do
         click_on('DELETE')
       end

       expect(current_path).to eq('/merchants')
    end
  end
end
