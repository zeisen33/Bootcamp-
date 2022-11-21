class Board
    def self.build_stacks(num_stacks)
        arr = Array.new(num_stacks) {Array.new}
        arr
    end
    #     arr = []
    #     num_stacks.times do 
    #         arr << Array.new
    #     end
    #     arr
    # end

    def initialize(num_stacks, max_height)
        @max_height = max_height
        @stacks = Board.build_stacks(num_stacks)
        if max_height < 4 || num_stacks < 4        # why does this work but not same variables with @?
            raise StandardError.new 'rows and cols must be >= 4' 
        end        
    end

    attr_reader :max_height

    def add(token, stack_index)
        if @stacks[stack_index].length < @max_height
            @stacks[stack_index] << token
            return true
        else
            return false
        end
    end 


    # This Board #print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    def vertical_winner?(token)
        @stacks.each do |stack|
            if stack.all? {|el| el == token} && stack.length >= @max_height
                return true
            end
        end
        return false
    end

    def horizontal_winner?(token)
        (0..@max_height).each do |idx|
            if @stacks.all? {|stack| stack[idx] == token}
                return true 
            end 
        end
        false
    end

    def winner?(token)
        horizontal_winner?(token) || vertical_winner?(token)
    end
    
end



small_board = Board.new(7, 6)
p small_board