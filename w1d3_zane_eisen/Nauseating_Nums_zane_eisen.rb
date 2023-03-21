require "byebug"
def strange_sums(numsArray)
    count = 0
    numsArray.each {|num| count += 1 if numsArray.include? -1 * num}
    count / 2
end
# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product(numsArray, product)
    i = 0
    while i < numsArray.length
        j = 0
        while j < numsArray.length
            if i != j && numsArray[i] * numsArray[j] == product
                return true
            end
            j += 1
        end
        i += 1
    end
    return false
end
# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(str, hsh)
    newStr = ''
    str.each_char do |char|
        if !hsh.key?(char)
            newStr += char
        else
            newStr += char * hsh[char]
        end
    end
    newStr
end
# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square?(num)
    (0..num).each do |n|
        return true if n * n == num
    end
    false
end
# p perfect_square?(1)     # true
# p perfect_square?(4)     # true
# p perfect_square?(64)    # true
# p perfect_square?(100)   # true
# p perfect_square?(169)   # true
# p perfect_square?(2)     # false
# p perfect_square?(40)    # false
# p perfect_square?(32)    # false
# p perfect_square?(50)    # false

def divisors(num)
    divsrs = []
    (1..num).each {|n| divsrs << n if num % n == 0}
    divsrs
end

def anti_prime?(num)
    (1...num).each {|n| return false if divisors(n).length > divisors(num).length}
    true
end
# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

def matrix_addition(mat1, mat2)
    outer = []
    i = 0
    while i < mat1.length
        # debugger
        j = 0
        inner = []
        while j < mat1[0].length
            # p [i,j]
            # p [mat1[i][j], mat2[i][j]]
            a = [mat1[i][j], mat2[i][j]]
            inner << mat1[i][j] + mat2[i][j]
            # p "___________"
            j += 1
        end
        i += 1
        outer << inner
    end
    outer
end
matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*nums)
    common = []
    (1..nums.min).each do |n|
        if nums.all? {|num| divisors(num).include?(n)}
            common << n
        end
    end
    common
end
# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(n)
    trib = [1, 1, 2]
    (n - 3).times do 
        trib << trib[-1] + trib[-2] + trib[-3]
        # p trib
    end
    trib[n - 1]
end
# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

def matrix_addition_reloaded(*matrices)
    if !matrices.all? {|mtrx| mtrx.length == matrices[0].length}
        return nil
    end
    # matrix_d = [[2, -5], [7, 10], [0, 1]]
    # matrix_e = [[0 , 0], [12, 4], [6,  3]]
    # matrix_f = [[5 , 2], [322, 3], [5,  7]]
    i = 0
    outer = []
    while i < matrices[0].length
        j = 0 
        mid = []
        while j < matrices[0][0].length
            k = 0
            sum = 0
            while k < matrices.length
                sum += matrices[k][i][j]
                k += 1
            end
            mid << sum
            j += 1
        end
        i += 1
        outer << mid
    end
    outer    
end
# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(arr2d)
    # arr2d.none? {|arr| arr.all? {|el| el == arr[0]}}
    i = 0
    while i < arr2d.length
        return true if arr2d[i].all? {|el| el == arr2d[i][0]}
        return true if arr2d.all? {|arr| arr[i] == arr2d[0][i]}
        i += 1
    end
    false
end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ])
# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def squaragonal?(arr2d)
    i = 0
    while i < arr2d.length
        trueFor = arr2d[i][i] == arr2d[0][0]
        if trueFor
            i += 1
        else break
        end
        if trueFor && i == arr2d.length
            return true
        end
    end

    i = 0
    while i < arr2d.reverse.length
        trueBack = arr2d.reverse[i][i] == arr2d.reverse[0][0]
        if trueBack
            i += 1
        else break
        end
        if trueBack && i == arr2d.length
            return true
        end
    end
    return false
end
# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

def next_row(arr)
    newArr = [1]
    i = 1
    while i <= arr.length - 1
        newArr << arr[i] + arr[i - 1]
        i += 1
    end
    newArr << 1 if arr.length > 0
    newArr
end

def pascals_triangle(n)
    currentRow = []
    newArr = []
    n.times do 
        currentRow = next_row(currentRow)
        newArr << currentRow
    end
    newArr
end

# p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

# p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]

def prime?(n)
    return false if n < 2
    return true if n == 2
    (2...n).each do |i|
        return false if n % i == 0
    end
    return true
end

def power(a, b)
    product = 1
    b.times do
        product *= a
    end
    product
end

def power_of?(a,n)
    return true if n == 0
    i = 1
    while power(a, i) < n
        i += 1
        return true if power(a, i) == n
    end
    false
end

def mersenne_prime_fast(n) # fast bc only one loop, incremented by 2**x 
    i = 1
    x = 2
    while i <= n
        # debugger
        try = 2**x - 1
        if prime?(try)
            currMers = try
            x += 1
            i += 1
        else
            x += 1
        end
    end
    currMers

end
# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071



def mersenne_prime_slow(n)
    mersennes = [3]
    while mersennes.length < n
        i = mersennes[-1] + 1
        while !prime?(i) || !power_of?(2, i + 1)
            # p i
            i += 1
        end
        mersennes << i
    end
    return mersennes[n - 1]
end


def mersenne_prime_also_pretty_slow(n)       
    mersennes = [3]
    while mersennes.length < n
        i = mersennes[-1] + 1
        while !prime?(i) || !(1..i/2).any? {|num| 2**num - 1 == i }
            p i
            i += 1
        end
        mersennes << i
    end
    return mersennes[n - 1]
end
# p mersenne_prime_also_pretty_slow(6) # 131071

def triangular_num?(num)
    triangle_nums = [1]
    i = 1
    num.times do 
        i += 1
        triangle_nums << triangle_nums[-1] + i
    end
    return triangle_nums.include?(num)
end

def triangular_word?(word)
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    sum = 0
    word.each_char do |char|
        sum += alphabet.index(char) + 1
    end
    triangular_num?(sum)
end
# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def consecutive_collapse(numsArr)
    collapse_made = true
    currArr = numsArr
    while collapse_made
        collapse_made = false
        
        i = 0
        while i < currArr.length - 1
            if currArr[i + 1] == currArr[i] + 1 || currArr[i + 1] == currArr[i] - 1
                currArr = currArr[0...i] + currArr[i + 2..-1]
                collapse_made = true
                break
            end
            i += 1
        end
    end
    currArr
end
# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

def next_prime(n)
    if n == nil
        return nil
    end
    i = 1
    while !prime?(n + i)
        i += 1
    end
    i + n
end
# p next_prime(7)

def prev_prime(n)
    if n == nil
        return nil
    end
    if n <= 2
        return nil
    else
        i = 1
        while !prime?(n - i)
            i += 1
        end
    end
    n - i
end
# p prev_prime(7)


def pretentious_primes(arr, n)
    return arr if n == 0
    if n > 0
        arr.each.with_index do |num, idx|
            nextPrimes = [num]
            n.times {nextPrimes << next_prime(nextPrimes[-1])}
            arr[idx] = nextPrimes[-1]
        end
    elsif n < 0
        arr.each.with_index do |num, idx|
            prevPrimes = [num]
            (n * -1).times {prevPrimes << prev_prime(prevPrimes[-1])}
            arr[idx] = prevPrimes[-1]
        end
    end
    arr
end
# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]
