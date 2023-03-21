class Board
    def self.build_stacks(num_stacks)
        Array.new(num_stacks) {Array.new}
    end

    def initialize(num_stacks, max_height)
        if num_stacks < 4 || max_height < 4
            raise ArgumentError.new 'rows and cols must be >= 4'
        end
        @max_height = max_height
        @stacks = Board.build_stacks(num_stacks)
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

    def vertical_winner?(token)
        @stacks.any? do |stack| 
            stack.length >= @max_height && stack.all? {|el| el == token}
        end
    end

    def horizontal_winner?(token)
        (0..max_height).each do |idx|
            if @stacks.all? {|row| row[idx] == token}
                return true
            end
        end
        return false
    end
           
    def winner?(token)
        horizontal_winner?(token) || vertical_winner?(token)
    end


    # This Board #print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

end    