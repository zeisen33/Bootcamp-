# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def get_vowels(word)
    vowels = 'aeiouAEIOU'
    newWord = ''
    word.each_char do |char|
        newWord += char if vowels.include?(char)
    end
    newWord.downcase
end

def every_vowel(word)
    vowels = 'aeiou'
    vowels.each_char do |vow|
        if !word.include?(vow)
            return false
        end
    end
    true
end

def all_vowel_pairs(words)
    vowels = 'aieou'
    
    # p words
    # p vowels_only
    
    i = 0
    pairs = []
    while i < words.length
        j = 1
        while j < words.length
            if i < j
                vowels_only = []
                words.each {|word| vowels_only << get_vowels(word)}
                test_pair = vowels_only[i] + vowels_only[j]
                pairs << words[i] + " " + words[j] if every_vowel(test_pair)
            end
            j += 1
        end
        i += 1
    end
    pairs
end

all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"]) #.to eq(["action europe", "tear impromptu"])


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    return false if num < 2
    (2...num).each do |n|
        return true if num % n == 0
    end
    false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    newArr = []
    bigrams.each do |str2letters|
        if str.index(str2letters) == nil
            next
        else
            newArr << str2letters
        end
    end
    newArr
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        # &prc is always an optional arg bc ruby always has a single option block arg
        newHash = {}
        if prc == nil
            self.each do |k, v|
                newHash[k] = v if k == v
            end
        else
            self.each do |k, v|
                newHash[k] = v if prc[k, v]
            end
        end
        newHash  
    end
end
# hash_1 = {x: 7, y: 1, z: 8}
# p hash_1.my_select #{ |k, v| v.odd? } #.to eq({x: 7, y: 1})

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        arr = []
        if length == nil
            i = 0
            while i < self.length
                j = 0
                while j < self.length
                    arr << self[i..j] if i <= j
                    j += 1
                end
                i += 1
            end

        else
            i = 0
            while i < self.length
                j = 0
                while j < self.length
                    arr << self[i..j] if i <= j && self[i..j].length == length
                    j += 1
                end
                i += 1
            end
        end
        arr
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alphabet = 'abcdefghijklmnopqrstuvwxyz'
        newStr = ''
        self.each_char do |char|
            newStr += alphabet[(alphabet.index(char) + num) % 26]
        end
        newStr
    end
end
