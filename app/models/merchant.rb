class Merchant < ActiveRecord::Base
  has_many :invoices
  validates :name, presence: true
end
