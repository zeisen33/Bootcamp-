require_relative "item.rb"

class List
    
    def initialize(label)
        @label = label
        @items = Array.new
    end

    attr_accessor :label

    def add_item(title, deadline, description = '')
        begin
            newItem = Item.new(title, deadline, description)
        rescue
            return false
        end
        @items << newItem
        true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if index < 0
        return false if index >= @items.length
        true
    end

    def swap(index_1, index_2)
        if !valid_index?(index_1) || !valid_index?(index_2)
            return false
        else
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        end
    end

    def [](index)
        if !valid_index?(index)
            return nil 
        else
            return @items[index]
        end
    end

    def priority
        @items[0]
    end

    def print
        puts @label.upcase
        @items.each.with_index do |item, idx|
            puts "Index: #{idx} | Item: #{item.title} | Deadline #{item.deadline}"
        end
    end

    def print_full_item(index)
        if !valid_index?(index)
            return false
        else
            puts "Index: #{idx} | Item: #{item.title} | Deadline #{item.deadline}"
        end
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount=1)
        if !valid_index?(index)
            return false
        end
        if amount == 0 || index == 0
            return true
        else
            @items[index - 1], @items[index] = @items[index], @items[index - 1]
            return up(index - 1, amount - 1)
        end
    end

    def down(index, amount=1)
        if !valid_index?(index)
            return false
        end
        if index == @items.length - 1 || amount == 0
            return true
        else
            @items[index], @items[index + 1] = @items[index + 1], @items[index]
            return down(index + 1, amount - 1)
        end
    end 

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

end
# l = List.new('Groceries')
# l.add_item('cheese','2019-10-25')
# l.add_item('toothpaste', '2019-10-25')
# l.add_item('shampoo', '2019-10-24')
# l.add_item('candy', '2019-10-31')
# l.print
# l.sort_by_date!
# l.print


# l.down(0)
# l.print
# l.down(0, 2)
# l.print
# l.up(3, 10)
# l.print
# p l.up(7, 3)
# l.print