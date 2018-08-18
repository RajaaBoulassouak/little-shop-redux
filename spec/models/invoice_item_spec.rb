RSpec.describe InvoiceItem do
  describe 'validations' do
    it 'is invalid without an item_id' do
    invoice_item = InvoiceItem.create(invoice_id: 1,
                                      quantity: 1,
                                      unit_price: 1)
    expect(invoice_item).to_not be_valid
    end
    it 'is invalid without an invoice_id' do
      invoice_item = InvoiceItem.create(item_id: 1,
                                        quantity: 1,
                                        unit_price: 1)
    expect(invoice_item).to_not be_valid
  end
  it 'is invalid without a quanity' do
  invoice_item = InvoiceItem.create(item_id: 1,
                                    invoice_id: 1,
                                    unit_price: 1)

    expect(invoice_item).to_not be_valid
  end
  it 'is invalid without a unit_price' do
  invoice_item = InvoiceItem.create(item_id: 1,
                                    invoice_id: 1,
                                    quantity: 1)
    expect(invoice_item).to_not be_valid
  end
  it 'has one invoice' do
  association = described_class.reflect_on_association(:invoice)
   expect(association.macro).to eq :belongs_to
 end
 it 'has one item' do
   association = described_class.reflect_on_association(:item)
    expect(association.macro).to eq :belongs_to
  end
  end
end
