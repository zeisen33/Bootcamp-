class HumanPlayer
    attr_accessor :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        begin
            p "#{mark_value} Player, enter a position. Type two numbers separated by a space, the first representing the row, and the second representing the column."
            input = gets.chomp
            if input.split(' ').length > 2
                rescue 
                    raise StandardError.new "position input uses invalid format"
                retry
        
            end
            row = input.split(' ')[0].to_i
            col = input.split(' ')[1].to_i
        # rescue
        #     raise StandardError.new "row and column must be numbers"
        #     retry
         end

        [row, col]
    end



        




end