class HumanPlayer
    def initialize(mark_value)
        @mark_value = mark_value
    end

    attr_reader :mark_value

    def get_position
        begin
            p "#{@mark_value} Player, enter a position, row and column with a space in between"
            pos = gets.chomp
            digits = '0123456789 '
            pos.each_char do |char|
                if !digits.include?(char)
                    raise StandardError.new "invalid position formatting"
                end
            end

            pos = pos.split(' ')
            row = pos[0].to_i
            col = pos[1].to_i
            return [row, col]

        rescue => e
            p e
            retry
        end
    end
    




end