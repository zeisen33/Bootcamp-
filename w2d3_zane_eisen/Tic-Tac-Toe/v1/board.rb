class Board
    attr_reader :grid
    def initialize
        @grid = Array.new(3) {Array.new(3, '_')}
    end

    def valid?(position)
        position[0] >= 0 && position[0] <= 2 && 
        position[1] >= 0 && position[1] <= 2
    end

    def empty?(position)
        @grid[position[0]][position[1]] == '_'
    end 

    def place_mark(position, mark)
        if !valid?(position)
            raise ArgumentError.new "invalid position"
            return false
        elsif !empty?(position)
            raise ArgumentError.new "position already taken"
            return false
        else
            @grid[position[0]][position[1]] = mark
        end
        true
    end

    def print
        one = @grid[0]
        two = @grid[1]
        three = @grid[2]
        p one
        p two
        p three
        return true
    end

    def win_row?(mark)
        @grid.each do |row|
            if row.all? {|el| el == mark}
                return true
            end
        end
        false
    end

    def win_col?(mark)
        @grid.transpose.each do |col|
            if col.all? {|el| el == mark}
                return true
            end
        end
        false
    end
    
    def win_diagonal?(mark)
        forward = true
        i = 0
        while i < @grid.length
            j = 0
            while j < @grid[0].length
                if i !=j
                    j += 1
                    next
                else
                    if @grid[i][j] != mark
                        forward = false 
                    end
                    j += 1
                end
            end
            i += 1
        end

        backward = true
        i = 0
        while i < @grid.length
            j = 0
            while j < @grid[0].length
                if i !=j
                    j += 1
                    next
                else
                    if @grid[j][i] != mark
                        backward = false
                    end
                    j += 1
                end
            end
            i += 1
        end

        forward || backward
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.each do |row|
            row.each do |el|
                if el == '_'
                    return true
                end
            end
        end
        false 
    end


end

# b = Board.new
# b.place_mark([0, 0], :X)
# b.place_mark([1, 1], :X)
# b.place_mark([2, 2], :X)
# p b.win?(:X)