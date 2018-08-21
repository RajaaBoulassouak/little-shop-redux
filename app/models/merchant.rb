class Merchant < ActiveRecord::Base
  has_many  :items
  has_many  :invoices
  validates :name, presence: true
  
  def average_item_price
    items.average(:unit_price)
  end
  
  def total_cost_of_items
    items.sum(:unit_price)
  end
  
  def self.merchant_with_highest_price_item
    select("merchants.*, items.*").joins(:items)
  end 
  
end



