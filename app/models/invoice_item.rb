class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :item
  validates :item_id,    presence: true
  validates :invoice_id, presence: true
  validates :quantity,       presence: true
  validates :unit_price,       presence: true

  def self.max_by_quantity
    InvoiceItem.select("invoice_id, sum(quantity) as quantity_sum").group(:invoice_id).order("quantity_sum desc").first.invoice_id
  end

  def self.min_by_quantity
    InvoiceItem.select("invoice_id, sum(quantity) as quantity_sum").group(:invoice_id).order("quantity_sum asc").first.invoice_id
  end

  def formatted_price
    ('$%.2f' % (self.unit_price / 100)).to_s
  end
end
