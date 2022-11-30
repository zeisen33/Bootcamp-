require "piece"

class Board
    def initialize
        @grid = Array.new(8) {Array.new(8)}
        @null_piece = #NullPiece
    end

    def [](pos)
        @grid[pos]
    end

    def []= (pos, val)
        @grid[pos] = val
    end

    def move_piece(start_pos, end_pos)
        if self.[](pos) == NullPiece
            raise StandardError.new "no piece at start position"
        elsif !self.[](pos).moves.include?(end_pos)
            raise StandardError.new "piece cannot move there"
        else
            self.[]= (end_pos, self.[](start_pos))
            self.[]= (start_pos, #NullPiece)
        end
            



end