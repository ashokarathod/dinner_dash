class Item < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :comments, dependent: :destroy
  validates :name, presence: true, length:{ minimum: 6, maximum: 100 }
  validates :description, presence: true, length:{ minimum: 10, maximum: 300 }
  validates_uniqueness_of :name
  #validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }

  scope :low_price, lambda { |min|
       where(" items.price >= ?", "#{min.to_i}")}

  scope :high_price, lambda { |max|
      where("items.price <= ?", "#{max.to_i}")}
end
