require_relative "game.rb"

class HumanPlayer
    attr_accessor :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        begin
            p "#{mark_value} Player, enter a position. Type two numbers separated by a space, the first representing the row, and the second representing the column."
            input = gets.chomp
            if input.split(' ').length != 2
                raise StandardError.new "position input uses invalid format"
            end
            digits = '0123456789'
            row = input.split(' ')[0]
            col = input.split(' ')[1]
            (row + col).each_char do |char|
                if !digits.include?(char)
                    raise StandardError.new "row and column must be numbers"
                end
            end
            
        rescue => e 
            p e.message
            retry
        end
        row = row.to_i
        col = col.to_i

        [row, col]
    end
end

p1 = HumanPlayer.new(":)")

# p p1.get_position
