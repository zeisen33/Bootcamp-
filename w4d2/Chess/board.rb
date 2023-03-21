require "./pieces/piece.rb"

class Board

    def initialize
        @grid = Array.new(8) {Array.new(8)}
        # self.reset
    end

    # def reset
    # end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []= (pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def move_piece(start_pos, end_pos)
        if self.[](start_pos) == nil
            raise StandardError.new "no piece at start position"
        elsif end_pos[0] > 7 || end_pos[0] < 0 || end_pos[1] > 7 || end_pos[1] < 0 
            raise StandardError.new "position not on board"
        else
            piece = self.[](start_pos)
            self.[]=(end_pos, piece)
            self.[]=(start_pos, nil)
        end
    end
            



end