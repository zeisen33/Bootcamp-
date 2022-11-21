class Item

    def self.valid_date?(str)
        digits = '0123456789-'
        str.each_char do |char|
            return false if !digits.include?(char)
        end
        sections = str.split('-')
        return false if sections.length != 3
        return false if sections[0].length != 4
        return false if sections[1].length != 2 || sections[2].length != 2
        return false if sections[1].to_i > 12
        return false if sections[2].to_i > 31
        true
    end

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
        if !Item.valid_date?(deadline)
            raise StandardError.new "Deadline invalid format. Please use 'YYYY-MM-DD"
        end
    end

    attr_accessor :title, :description
    attr_reader :deadline

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise StandardError.new "New deadline invalid format. Please use 'YYYY-MM-DD"
        end
    end
        
end
# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false

# a = Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

# p Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# p Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) # raises error due to invalid date
# p a.title
# p a.description
# p a
# p a.deadline
# a.deadline=('7432-12-31')
# p a.deadline



