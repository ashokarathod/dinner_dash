class OrderItem < ApplicationRecord
  validates :quantity, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
  belongs_to :order
  belongs_to :item
end
