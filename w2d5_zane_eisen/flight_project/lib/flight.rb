require_relative "passenger.rb"

class Flight
    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = Array.new
    end

    def full?
        @passengers.length >= @capacity
    end

    def board_passenger(passenger)
        if passenger.has_flight?(@flight_number) && !self.full?
            @passengers << passenger
        end
    end
    
    def list_passengers
        arr = @passengers.map {|passenger| passenger.name}
        arr
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end
end