require_relative "slideable"
require_relative "piece"

class Rook < Piece
    include Slideable

    def symbol
        'R'.colorize(@color)
    end

    
    protected
    def move_dirs
        [@horizontal_dirs, @vertical_dirs]
    end




end