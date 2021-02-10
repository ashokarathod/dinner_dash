class Category < ApplicationRecord
    validates :title, presence: true, length:{ minimum: 3, maximum: 100 }
    validates :description, presence: true, length:{ minimum: 6, maximum: 300 }
    validates_uniqueness_of :title
    has_many :items
end
