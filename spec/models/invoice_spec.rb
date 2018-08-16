RSpec.describe Invoice do
  describe 'validations' do
    it 'is invalid without a customer id' do
      invoice = Invoice.create( id:          1,
                                merchant_id: 8,
                                status: "pending")

      expect(invoice).to_not be_valid
    end
    it 'is invalid without a merchant id' do
      invoice = Invoice.create( id:          1,
                                customer_id: 4,
                                status: "pending")

      expect(invoice).to_not be_valid
    end
    it 'is invalid without a status' do
      invoice = Invoice.create( id:          1,
                                customer_id: 4,
                                merchant_id: 8)

      expect(invoice).to_not be_valid
    end
  end
end
