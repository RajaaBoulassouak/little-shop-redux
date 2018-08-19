class Invoice < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  validates :customer_id, presence: true
  validates :merchant_id, presence: true
  validates :status,      presence: true
end
