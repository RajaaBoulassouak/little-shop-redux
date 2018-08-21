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
  
  def self.highest_price_item
    joins(:items).order("items.unit_price").first.name
  end 
  
end



