class Bench < ApplicationRecord
    validates :title, :description, :price, :seating, :lat, :lng, presence: true
    validates :price, numericality: { in: 10..1000 }

    has_many :reviews, dependent: destroy
    has_many :reviewers, through: :reviews, source: :reviews, dependent: :destroy
end
