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

end
