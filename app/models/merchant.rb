class Merchant < ActiveRecord::Base
  has_many  :items
  has_many  :invoices
  validates :name, presence: true

  def self.paginate(page)
    offset = (page.to_i - 1) * 25
    Merchant.all.order(:name).limit(25).offset(offset)
  end

  def self.max_page
    max = (Merchant.count / 25)
    if (Merchant.count % 25).zero?
      max
    else
      max + 1
    end
  end

  def average_item_price
    items.average(:unit_price)
  end

  def total_cost_of_items
    items.sum(:unit_price)
  end

  def self.highest_price_item
    joins(:items).order("items.unit_price desc").first.name
  end

  def self.merchant_with_most_items
    find(Item.group(:merchant_id).order("count_all").count.keys.last).name
  end
end
