require_relative "board"
require_relative "player"

class Battleship
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = n * n / 2
    end

    attr_reader :board, :player

    def start_game
        @board.place_random_ships
        print @board.num_ships
    end

    def lose?
        if @remaining_misses <= 0
            puts 'you lose'
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships <= 0
            puts 'you win'
            return true
        else 
            return false
        end
    end

    def game_over?
        self.win? || self.lose?
    end

    def turn
        pos = @player.get_move
        if !@board.attack(pos)
            @remaining_misses -= 1
        end
        puts @remaining_misses
    end






end
