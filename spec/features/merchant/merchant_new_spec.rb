RSpec.describe 'Merchant Create Page' do
  it 'Should create a new merchant' do
    visit '/merchants/new'

    fill_in 'merchant[name]', with: 'Ned Flanders'
    click_button('Submit')

    expect(page).to have_content('Ned Flanders')
  end
end
