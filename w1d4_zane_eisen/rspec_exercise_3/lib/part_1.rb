def is_prime?(num)
    return false if num < 2
    return true if num == 2
    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end
    true
end

def nth_prime(n)
    i = 0
    count = 0
    while count < n
        if !is_prime?(i)
            i += 1
        else
            count += 1
            i += 1
        end
    end
    i - 1
end
# p nth_prime (300)

def prime_range(min, max)
    arr = []
    (min..max).each do |num|
        if is_prime?(num)
            arr << num
        end
    end
    arr
end