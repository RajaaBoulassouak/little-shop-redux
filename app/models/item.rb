class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many   :invoice_items
  has_many   :invoices, through: :invoice_items
  validates :name,        presence: true
  validates :description, presence: true
  validates :unit_price,       presence: true
  validates :merchant_id,       presence: true

  def self.average_price
    average(:unit_price)
  end

  def self.oldest_item_created
    order(:created_at).limit(1)
  end

  def self.newest_item_created
    order(created_at: :desc).limit(1)
  end

end

