class Dog
    # attr_reader "name"
    def initialize (name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    def name
        @name
    end
    def breed
        @breed
    end
    def age
        @age
    end
    def bark
        return @bark.upcase if @age > 3
        return @bark.downcase if @age <= 3 
    end
    def favorite_foods
        @favorite_foods
    end

    def name= (str)
        @name = str
    end
    def breed= (str)
        @breed = str
    end
    def age= (str)
        @age = str
    end
    def bark= (str)
        @bark = str
    end
    def favorite_foods= (arr)
        @favorite_foods = arr
    end

    def favorite_food?(str)
        favs = self.favorite_foods
        favs.each.with_index do |el, idx|
            favs[idx] = el.downcase
        end
        favs.include?(str.downcase)
    end
end
