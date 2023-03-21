require_relative "room"
require "byebug"

class Hotel
    attr_reader :name, :rooms
    def initialize(name, roomsHash)
        @name = name
        @rooms = Hash.new
        roomsHash.each do |k, v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        newWords = []
        words = @name.split(" ")
        words.each {|word| newWords << word.capitalize}
        return newWords.join(" ")
    end

    def room_exists?(name)
        @rooms[name] != nil
    end

    def check_in(person, roomName)
        if !room_exists?(roomName)
            p "sorry, room does not exist"
        else
            # p @rooms[roomName].class
            # debugger
            # p "@rooms: #{@rooms}"
            # p "@rooms[roomName]: #{@rooms[roomName]}"
            # p "Basement".add_occupant(person)
            # p roomName.class
            if @rooms[roomName].add_occupant(person)
                p "check in successful"
                # p self
            else
                p "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        return true if !@rooms.values[0].full?
        false
    end

    def list_rooms
        @rooms.each do |roomName, room|
            puts "#{roomName} : #{room.available_space}"
        end
    end


end
h = Hotel.new("hilbert's grand hotel", "Basement"=>4, "Attic"=>2, "Under the Stairs"=>1) 
# h.check_in('me', 'Basement')
# h.check_in("Regis", "Under the Stairs")
# h.check_in("Elvis", "Under the Stairs")
# h.list_rooms