RSpec.describe Merchant do
  describe 'validations' do
    it 'is invalide without a name' do
      merchant = Merchant.create( id: 1,
                                  created_at: '2017-01-01',
                                  updated_at: '2017-02-02')

      expect(merchant).to_not be_valid
    end
  end
end