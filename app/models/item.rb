class Item < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :comments
  validates :name, presence: true, length:{ minimum: 6, maximum: 100 }
  validates :description, presence: true, length:{ minimum: 10, maximum: 300 }
  validates_uniqueness_of :name
  #validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }
end
