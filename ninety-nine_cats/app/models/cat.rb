require "date"

class Cat < ApplicationRecord
  @@CAT_COLORS = %w[orange tuxedo black gray white calico]

  def self.get_cat_colors
    @@CAT_COLORS
  end

  validates :birth_date, :color, :name, :sex, presence: :true
  validates :color, inclusion: { in: Cat.get_cat_colors }
  validates :sex, inclusion: { in: %w[M F] }

#   def birth_date_cannot_be_future(birth_date)
#     #return true if a past date, false if future date
#     return false if !birth_date.valid?
#     #date > date.now 
#     birth_date < Date.today
#   end

#   validates :birth_date_cannot_be_future
end
