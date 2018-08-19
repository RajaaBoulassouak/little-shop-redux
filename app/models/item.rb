class Item < ActiveRecord::Base
  has_many :invoice_items
  validates :name,       presence: true
  validates :description, presence: true
  validates :unit_price,       presence: true
  validates :merchant_id,       presence: true
end
