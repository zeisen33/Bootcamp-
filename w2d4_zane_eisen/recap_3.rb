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
    i = 0
    while i < arr.length - 1
        return false if arr[i] == arr[i + 1]
        i += 1
    end
    true
end
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    hsh = Hash.new {|h,k| h[k] = []}
    str.each_char.with_index do |char, idx|
        hsh[char] << idx
    end
    hsh 
end
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    letter = nil
    max_streak = 0
    str.each_char.with_index do |char, idx|
        count = 0
        i = idx
        while str[i] == char
            count += 1
            if count >= max_streak
                max_streak = count
                letter = char
            end
            i += 1
        end
    end
    letter * max_streak
end
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def prime?(num)
    return false if num < 2
    (2...num).each do |n|
        if num % n == 0
            return false
        end
    end
    true
end
# p prime?(5)

def bi_prime?(num)
    (2..num/2).each do |n|
        (2..num/2).each do |m|
            if num == n * m && prime?(n) && prime?(m)
                return true
            end
        end
    end
    false
end
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(str, arr)
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    newStr = ''
    keys = arr * (str.length / arr.length) * 2
    # p keys
    # p keys.class
    str.each_char.with_index do |char, idx|
        # p keys[idx]
        # p keys[idx].class
        newStr += alphabet[(alphabet.index(char) + keys[idx]) % 26]
    end
    newStr
end
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    vowels = 'aeiou'
    newStr = ''
    str.each_char.with_index do |char, idx|
        if !vowels.include?(char)
            newStr += char
        else
            i = idx - 1
            added = false
            while !added
                added = false
                if vowels.include?(str[i])
                    newStr += str[i]
                    added = true 
                end
                i -= 1
            end
        end
    end
    str = newStr
    str
end
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

class String
    def select(&prc)
        str = ''
        return str if prc == nil
        self.each_char {|char| str += char if prc[char]}
        str
    end

    def map!(&prc)
        self.each_char.with_index do |char, idx|
            self[idx] = prc[char, idx]
        end
        self
    end
end
# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

def multiply(a, b)
    if a == 1
        return b
    elsif a > 1
        return b + multiply(a - 1, b)
    elsif a == 0
        return 0
    else
        return multiply(a + 1, b) - b
    end
end
# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(len)
    return [] if len == 0
    return [2] if len == 1
    return [2, 1] if len == 2
    return lucas_sequence(len - 1).push (lucas_sequence(len - 1).pop + lucas_sequence(len - 2).pop)
end
# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def greatest_factor(num)
    i = num - 1
    while i > 1
        return i if num % i == 0
        i -= 1
    end
end

def prime_factorization(num)
    return [num] if prime?(num)
    return prime_factorization(num / greatest_factor(num)) + (prime_factorization(greatest_factor(num)))
end
# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]