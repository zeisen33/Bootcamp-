class Board
    attr_reader :size
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](arr) #arr is of form [row, column]
        @grid[arr[0]][arr[1]]
    end

    def []=(pos, val) #pos of form [row, column]
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        @grid.flatten.count {|el| el == :S}
    end

    def attack(pos)
        if self.[](pos) == :S 
            self.[]=(pos, :H)
            p "you sunk my battleship!"
            return true
        else
            self.[]=(pos, :X)
            return false
        end 
    end

    def place_random_ships
        num_starting_ships = @size / 4
        num_ships_placed = 0
        while num_starting_ships > num_ships_placed
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            if self.[]([row, col]) != :S
                self.[]=([row, col], :S)
                num_ships_placed += 1
            end
        end
    end

    def hidden_ships_grid
        hidden = []
        @grid.each do |gridSubArr|
            hiddenSubArr = []
            gridSubArr.each do |status|
                if status == :S 
                    hiddenSubArr << :N 
                else
                    hiddenSubArr << status 
                end
            end
            hidden << hiddenSubArr
        end
        hidden 
    end

    def self.print_grid(grid)
        # grid.each {|row| puts row.join(' ')}      #works
        # arr2d.each do |row|            #doesn't work bc of extra space at end
        #     row.each do |el|
        #         print "#{el} "
        #     end
        #     p "\n"
        # end

        grid.each do |row|
            row.each.with_index do |el, idx|
                if idx != row.length - 1
                    print "#{el} "
                else
                    print "#{el}\n"        #works, but \n needs to be inline for some reason
                end
            end
        end
    end
    
    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end