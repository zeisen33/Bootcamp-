class Player
    def get_move
        p "enter a position with coordinates separated with a space like '`4 7`'"
        position = gets.chomp
        nums = position.split(' ')
        nums.map! {|num| num.to_i}
        nums
    end

end
