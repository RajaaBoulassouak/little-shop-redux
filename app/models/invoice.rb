class Invoice < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  validates :customer_id, presence: true
  validates :merchant_id, presence: true
  validates :status,      presence: true


  def self.percent_by_status
    select("status, concat(ROUND(count(id)::decimal/(select count(id) from invoices)*100, 2)::text, '%') as percentage").group(:status).order(:status)
  end

  def self.max_by_unit_price
    joins(:invoice_items).order("invoice_items.unit_price desc").first.id
  end

  def self.min_by_unit_price
    joins(:invoice_items).order("invoice_items.unit_price asc").first.id
  end

  def self.max_by_quantity
    joins(:invoice_items).order("invoice_items.quantity desc").first.id
  end

  def self.min_by_quantity
    joins(:invoice_items).order("invoice_items.quantity asc").first.id
  end
end
