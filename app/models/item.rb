class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many   :invoice_items
  has_many   :invoices, through: :invoice_items

  validates :name,       presence: true
  validates :description, presence: true
  validates :unit_price,       presence: true
  validates :merchant_id,       presence: true

  def self.paginate(page)
    offset = (page.to_i - 1) * 20
    Item.all.limit(20).offset(offset)
  end

  def self.maxpage
    max = (Item.count / 20)
    if (Item.count % 20).zero?
      max
    else
      max + 1
    end
  end

  def self.shard(page)
    items = Item.paginate(page)
    items.each_slice(4)
  end

  def formatted_price
      ('$%.2f' % (self.unit_price / 100)).to_s
  end

end
