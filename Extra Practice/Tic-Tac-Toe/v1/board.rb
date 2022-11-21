class Board
    def initialize
        @grid = Array.new(3) {Array.new(3, '_')}
    end

    def valid_position?(position)
        if position[0] < 0 || position[0] > 2
            return false
        elsif position[1] < 0 || position[1] > 2
            return false
        end
        true
    end

    def empty?(position)
        @grid[position[0]][position[1]] == '_'
    end

    def place_mark(position, mark)
        if !valid_position?(position)
            raise ArgumentError.new "Invalid position"
        elsif !empty?(position)
            raise ArgumentError.new "Position already taken"
        else
            @grid[position[0]][position[1]] = mark
        end
    end

    def print
        @grid.each do |row|
            p row
        end
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
        transpose = @grid.transpose
        transpose.each do |row|
            if row.all? {|el| el == mark}
                return true
            end
        end
        false
    end

    def win_diagonal?(mark)
        forward = true
        i = 0
        while i < @grid.length
            if @grid[i][i] != mark
                forward = false
                break
            else
                i += 1
            end
        end

        backward = true
        i = 0
        while i < @grid.length
            j = @grid.length - i - 1
            if @grid[i][j] != mark
                backward = false
                break
            else
                i += 1
            end
        end

        forward || backward
    end

    def win?(mark)
        win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
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