class Item < ActiveRecord::Base
  has_many :invoice_items
  validates :title,       presence: true
  validates :description, presence: true
  validates :price,       presence: true
  validates :image,       presence: true
end
