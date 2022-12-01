# require_relative "rook.rb"
# require_relative "queen.rb"
# require_relative "bishop.rb"
# require_relative "knight.rb"
# require_relative "king.rb"
# require_relative "pawn.rb"
# require_relative "null_piece.rb"

class Piece

    attr_reader :color, :pos, :board, :symbol

    def initialize(color, board, pos, symbol)
        @color = color
        @board = board
        @pos = pos
        @symbol = symbol
    end

    def empty?
        @board.[](@pos) == nil 
    end

    def valid_moves
        # new_arr = []
        # self.moves.each do |move|
        #     new_arr << move if !move_into_check(move.end_pos)
        # end
        # new_arr
    end

    def pos=(val)
        @board.[]=(@pos, val)
    end

    private
    def move_into_check?(end_pos)

    end

    



end