class Review < ApplicationRecord
    validates :rating, :body, :text, presence: true
    validates :bench_id, uniqueness: scope: { user_id, message: 'You can only submit 1 review per bench'}

    belongs_to :bench
    belongs_to :user
end
