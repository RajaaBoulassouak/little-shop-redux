class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many   :invoice_items
  has_many   :invoices, through: :invoice_items
  validates :name,        presence: true
  validates :description, presence: true
  validates :unit_price,  presence: true
  validates :merchant_id, presence: true
  
  
  def self.merchant_with_highest_price_item
    joins(:merchants)
    order(:unit_price).limit(1).last.merchant_id
  end
  
end

