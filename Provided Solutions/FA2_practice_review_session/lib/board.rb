class Board


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    def self.build_stacks(num_stacks)
        stacks = Array.new(num_stacks) { Array.new }
        
        return stacks
    end
    
    attr_reader :max_height

    def initialize(num_stacks, max_height)
        raise "rows and cols must be >= 4" if max_height < 4 || num_stacks < 4
        @max_height = max_height
        # @stacks = self.build_stacks(num_stacks)
        @stacks = Board.build_stacks(num_stacks)
        # p self
    end

    def add(token, stack_idx)
        # p @stacks[stack_idx]
       if @stacks[stack_idx].length < max_height
            @stacks[stack_idx] << token
            return true
       else
            return false
       end
    end

    def vertical_winner?(token)
        @stacks.any? do |stack|
            if stack.length == max_height && stack.all? { |ele| ele == token }
                return true
            end
        end
        false
    end

    def horizontal_winner?(token)
        # (0...max_height).any? do |idx|
        #     return true if (0...@stacks.length).all? { |jdx| @stacks[jdx][idx] == token}
        # end

        (0...max_height).each do |i|
            horizontal = []
            (0...@stacks.length).each do |j|
                if @stacks[j][i]
                    horizontal << @stacks[j][i]
                end
            end
            # p horizontal
            if horizontal.length == @stacks.length
                return true if horizontal.all? {|ele| ele == token}
            end
        end

        false
    end

    def winner?(token)
        # vertical_winner? = ture
        self.vertical_winner?(token) || self.horizontal_winner?(token)

    end

end
