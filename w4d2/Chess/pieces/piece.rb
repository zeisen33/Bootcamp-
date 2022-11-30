class Piece

    attr_reader :color, :pos, :board, :symbol

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
        @symbol = color
    end

    def empty?
        @board.[](@pos) == nil 
    end




    



end