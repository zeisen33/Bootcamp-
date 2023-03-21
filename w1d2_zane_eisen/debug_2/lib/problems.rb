# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def prime?(num)
    return false if num < 2

    (2...num).each do |n|
        return false if num % n == 0
    end
    return true
end

def largest_prime_factor(num)
    i = num 
    while i >= 2
        if num % i == 0 && prime?(i)
            return i
        end
        i -= 1
    end
end

def unique_chars?(str)
    chars = Hash.new(0)
    str.each_char do |char|
        chars[char] += 1
        if chars[char] > 1
            return false
        end
    end
    return true
end

def dupe_indices(arr)
    idcs = Hash.new(nil)
    arr.each.with_index do |el, idx|
        if idcs[el] == nil
            idcs[el] = [idx]
        else 
            idcs[el] << idx
        end
    end
    dupes = idcs.select {|k, v| v.length > 1}
    dupes
end

def ana_array(arr1, arr2)
    return false if arr1.length != arr2.length
    hash1 = Hash.new(nil)
    hash2 = Hash.new(nil)
    arr1.each do |el|
        if hash1[el] == nil
            hash1[el] = 1
        else
            hash1[el] += 1
        end
    end
    arr2.each do |el|
        if hash2[el] == nil
            hash2[el] = 1
        else
            hash2[el] += 1
        end
    end
    hash1.each do |k, v|
        if hash2[k] != v
            return false
        end
    end
    hash2.each do |k, v|
        if hash1[k] != v
            return false
        end
    end
    true
end

p ana_array(["i","c","e","m","a","n"], ["c","i","n","e","m","a"])