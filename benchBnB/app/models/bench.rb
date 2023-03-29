class Bench < ApplicationRecord
    validates :title, :description, :price, :seating, :lat, :lng, presence: true
    validates :price, numericality: { in: 10..1000 }
end
