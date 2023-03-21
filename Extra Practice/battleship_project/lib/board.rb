class Board
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n 
    end

    attr_reader :size 

    def [](position)
        @grid[position[0]][position[1]]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def num_ships
        count = 0
        @grid.each do |row|
            row.each do |col|
                count += 1 if col == :S
            end
        end
        count 
    end

    def attack(position)
        if self.[](position) == :S
            self.[]=(position, :H)
            puts 'you sunk my battleship'
            return true
        else
            self.[]=(position, :X)
            return false
        end
    end

    def place_random_ships
        ships_to_set = @size / 4
        while ships_to_set > 0
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            if self.[]([row, col]) == :N 
                self.[]=([row, col], :S)
                ships_to_set -= 1
            end
        end
    end

    def hidden_ships_grid
        hidden_grid = []
        a = @grid
        a.each.with_index do |row, rowIdx|
            hidden_subArr = []
            row.each.with_index do |status, colIdx|
                if status == :S
                    hidden_subArr << :N
                else
                    hidden_subArr << status
                end
            end
            hidden_grid << hidden_subArr
        end
        hidden_grid
    end

    def Board.print_grid(arr2d)
        arr2d.each do |row|
            puts row.join(' ')
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
