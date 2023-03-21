# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if self.length == 0
            return nil
        else
            return self.max - self.min
        end
    end

    def average
        if self.length == 0
            return nil
        else
            return (self.sum / self.length.to_f).to_f
        end
    end

    def median
        if self.length == 0
            return nil
        elsif self.length % 2 == 1
            return self.sort[self.length / 2]
        else
            return self.sort[(self.length / 2) - 1 .. (self.length / 2)].average
        end
    end

    def counts
        hsh = Hash.new(0)
        self.each {|el| hsh[el] += 1}
        hsh
    end

    def my_count(val)
        count = 0
        self.each {|el| count += 1 if val == el}
        count
    end

    def my_index(val)
        self.each.with_index do |el, idx|
            if el == val
                return idx
            end
        end
        nil
    end

    def my_uniq
        arr = []
        self.each {|el| arr << el if !arr.include?(el)}
        arr
    end

    def my_transpose
        arr = []
        i = 0
        while i < self.length
            j = 0
            subArr = []
            while j < self.length
                subArr << self[j][i]
                j += 1
            end
            i += 1
            arr << subArr
        end
        arr
    end
end
