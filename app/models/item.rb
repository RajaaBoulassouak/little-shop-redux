class Item < ActiveRecord::Base
  has_many :invoice_items
  validates :name,       presence: true
  validates :description, presence: true
  validates :unit_price,       presence: true
  validates :merchant_id,       presence: true
  validates :created_at,          presence: true

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
