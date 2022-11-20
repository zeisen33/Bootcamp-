require_relative "human_player.rb"
require_relative "board.rb"

class Game
    attr_accessor :p1, :p2, :current_player, :board
    def initialize(player_1_mark, player_2_mark)
        @p1 = HumanPlayer.new(player_1_mark)
        @p2 = HumanPlayer.new(player_2_mark)
        @current_player = @p1
        @board = Board.new
    end

    def switch_turn
        if @current_player == @p1
            @current_player = @p2
        else
            @current_player = @p1
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark_value)
            if @board.win?(@current_player.mark_value)
                p "#{@current_player.mark_value} Wins!"
                return nil
            else
                self.switch_turn
            end
        end
        p "Draw!"
        return nil
    end
end