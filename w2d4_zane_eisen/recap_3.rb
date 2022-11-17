def no_dupes(arr)
    newArr = []
    arr.each.with_index do |el, idx|
        if idx == arr.length - 1 && !arr[0...idx].include?(el)
            newArr << el
        elsif !(arr[0...idx] + arr[idx + 1..-1]).include?(el)
            newArr << el 
        end
    end
    newArr
end
# p no_dupes([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes([true, true, true])            # => []

def no_consecutive_repeats?(arr)

end