require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = n * n / 2
    end

    def start_game
        @board.place_random_ships
        p @board.size / 4
        p @board.print
    end

    def lose?
        if @remaining_misses <= 0 
            p 'you lose'
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships > 0
            return false
        else
            p "you win"
            return true
        end
    end

    def game_over?
        self.win? || self.lose?
    end

    def turn
        try = @board.attack(@player.get_move)
        if !try
            @remaining_misses -= 1
            @board.print
            p @remaining_misses
        end
    end
end
