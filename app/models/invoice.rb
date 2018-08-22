class Invoice < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :customer
  has_many   :invoice_items
  validates :customer_id, presence: true
  validates :merchant_id, presence: true
  validates :status,      presence: true

  def self.paginate(page)
    offset = (page.to_i - 1) * 25
    Invoice.all.limit(25).offset(offset)
  end

  def self.maxpage
    max = (Invoice.count / 25)
    if (Invoice.count % 25).zero?
      max
    else
      max + 1
    end
  end

  def self.statuses
    ["pending", "returned", "shipped"]
  end

  def self.percent_by_status
    select("status, concat(ROUND(count(id)::decimal/(select count(id) from invoices)*100, 2)::text, '%') as percentage").group(:status).order(:status)
  end

  def self.max_by_unit_price
    joins(:invoice_items).order("invoice_items.unit_price desc").first.id
  end

  def self.min_by_unit_price
    joins(:invoice_items).order("invoice_items.unit_price asc").first.id
  end
end
