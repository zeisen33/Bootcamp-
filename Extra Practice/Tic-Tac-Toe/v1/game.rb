require_relative "board.rb"
require_relative "human_player.rb"

class Game 
    attr_reader :currentPlayer
    def initialize(player_1_mark, player_2_mark)
        @p1 = HumanPlayer.new(player_1_mark)
        @p2 = HumanPlayer.new(player_2_mark)
        @currentPlayer = @p1
        @board = Board.new
    end

    def switch_turn
        if @currentPlayer == @p1
            @currentPlayer = @p2
        else
            @currentPlayer = @p1
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @currentPlayer.get_position
            @board.place_mark(pos, @currentPlayer.mark_value)
            if @board.win?(@currentPlayer.mark_value)
                puts "#{@currentPlayer.mark_value} Wins!"
                return nil
            else
                self.switch_turn
            end
        end
        puts "Draw!"
        return nil
    end
end

# g = Game.new(:X, :O)
# g.play