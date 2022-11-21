# require_relative "board.rb"

class Player
    def get_move
        print 'enter a position with coordinates separated with a space like `4 7`'
        pos = gets.chomp
        [pos.split(' ')[0].to_i,pos.split(' ')[1].to_i]
    end
end
