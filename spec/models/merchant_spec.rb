RSpec.describe Merchant do
  describe 'validations' do
    it 'is invalide without a name' do
      require 'pry'; binding.pry
      merchant = Merchant.create( id: 1,
                                  created_at: Date.new('2017-01-01'),
                                  updated_at: Date.new('2017-02-02'))

      expect(merchant).to_not be_valid
    end
  end
end
