class Order < ApplicationRecord
  validates :transaction_id, :uniqueness => true
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
end
