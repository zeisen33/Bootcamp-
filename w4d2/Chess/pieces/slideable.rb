module Slideable
    HORIZONTAL_DIRS = [[1, 0], [-1, 0]].freeze
    VERTICAL_DIRS = [[0, 1], [0, -1]].freeze
    DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, 1], [-1, -1]].freeze

    def horizontal_dirs
        @horizontal_dirs = HORIZONTAL_DIRS
    end

    def vertical_dirs 
        @vertical_dirs = VERTICAL_DIRS
    end

    def diagonal_dirs 
        @diagonal_dirs = DIAGONAL_DIRS
    end

    def moves
        
        # create array to collect moves
        # iterate over dirs to 
    end

    
    private 
    def move_dirs
        raise StandardError.new "Move Not Implemented"
    end
    
    def grow_unblocked_moves_in_dir(dx, dy)




    end    




end