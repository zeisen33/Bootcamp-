require "byebug"

class Room
    def initialize(capacity)
        # debugger
        @capacity = capacity
        @occupants = Array.new
    end

    attr_reader :capacity, :occupants


    def full?
        @occupants.length >= capacity
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(name)
        if self.full?
            return false
        else
            @occupants << name
            return true
        end
    end

end

# bedroom = Room.new(1)