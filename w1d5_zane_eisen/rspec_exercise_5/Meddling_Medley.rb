require "byebug"

def duos(str)
    count = 0
    str.each_char.with_index do |char, i|
        if i == str.length - 1
            next
        else
            count += 1 if char == str[i + 1]
        end
    end
    count
end
# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sen, hsh)
    words = sen.split(' ')
    newWords = []
    words.each do |word|
        if hsh[word] == nil
            newWords << word 
        else
            newWords << hsh[word]
        end
    end
    newWords.join(' ')
end
# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hsh, prc, &prc2)
    newHash = Hash.new {|h, k| h[k] = nil}
    hsh.each do |k, v|
        newHash[prc2[k]] = prc[v]
    end
    newHash
end
# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(str)
    arr = []
    twice = []
    i = 0
    while i < str.length - 1
        if str[i + 1...str.length].include?(str[i])
            twice << str[i]
        end
        i += 1
    end
    j = 0
    while j < twice.length - 1
        if twice[j + 1...twice.length].include?(twice[j])
            if !arr.include?(twice[j])
                arr << twice[j]
            end
        end
        j += 1
    end
    arr
end
# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true?(str)
    str.each_char.with_index do |char, i|
        next if i >= str.length - 2
        return true if str[i] == str[i + 1] && str[i] == str[i + 2]
    end
    false
end
# p triplet_true?('caaabb')        # true
# p triplet_true?('terrrrrible')   # true
# p triplet_true?('runninggg')     # true
# p triplet_true?('bootcamp')      # false
# p triplet_true?('e')             # false

def energetic_encoding(str, hsh)
    newStr = ''
    str.each_char.with_index do |char|
        if char == ' '
            newStr += ' '
        elsif hsh[char] == nil
            newStr += '?'
        else
            newStr += hsh[char]
        end
    end
    newStr
end
# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(str)
    newStr = ''
    digits = '0123456789'
    str.each_char.with_index do |char, i|
        if i == str.length - 1
            next
        elsif !digits.include?(char)
            newStr += char * str[i + 1].to_i
        end
    end
    newStr
end
# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(arr, *prcs)
    arr.select {|el| prcs.all? {|prc| prc[el]}}
end
# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def firstVowelIdx(word)
    vowels = 'aeiouAEIOU'
    i = 0
    while i < word.length
        return i if vowels.include?(word[i])
        i += 1
    end
    return "no vowels"
end

def convert_pig_latin(sen)
    words = sen.split(' ')
    vowels = 'aeiouAEIOU'
    newWords = []
    words.each.with_index do |word, idx|
        if word.length < 3 
            newWords << word
        elsif vowels.include?(word[0])
            newWords << word + 'yay'
        else
            newEnd = word[0...firstVowelIdx(word)] + 'ay'
            newWords << word[firstVowelIdx(word)..-1] + newEnd
        end
        if word == word.capitalize
            newWords[idx] = newWords[idx].capitalize
        else
            newWords[idx] = newWords[idx].downcase
        end
    end
    newWords.join(' ')
end
# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def lastVowelIdx(word)
    vowels = 'aeiouAEIOU'
    i = word.length - 1
    while i >= 0
        return i if vowels.include?(word[i])
        i -= 1
    end
    return "no vowels"
end


def reverberate(sen)
    vowels = 'aieouAEIOU'
    words = sen.split(' ')
    newWords = []
    words.each.with_index do |word, idx|
        if word.length < 3
            newWords << word
        elsif vowels.include?(word[-1])
            newWords << word + word
        else
            newWords << word + word[lastVowelIdx(word)..-1]
        end
        
        if word == word.capitalize
            newWords[idx] = newWords[idx].capitalize
        else
            newWords[idx] = newWords[idx].downcase
        end
    end
    newWords.join(' ')
end
# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

# def disjunct_select(arr, *prcs)
#     newArr = []
#     arr.each do |el|
#         if prcs.any? {|prc| prc[el]}
#             newArr << el
#         end
#     end
#     newArr
# end

def disjunct_select(arr, *prcs)
    arr.select {|el| prcs.any? {|prc| prc[el]}}
end
# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def vowel_count(str)
    vowels = 'aieouAEIOU'
    count = 0
    str.each_char {|char| count += 1 if vowels.include?(char)}
    count
end

def alternating_vowel(sen)
    newWords = []
    words = sen.split(' ')
    words.each.with_index do |word, idx|
        if vowel_count(word) == 0
            newWords << word
        else
            fVow = firstVowelIdx(word)
            lVow = lastVowelIdx(word)
            if idx % 2 == 0
                newWords << (word[0...fVow] + word[fVow + 1..-1])
                # newWords << word.slice!(0...firstVowelIdx(word))
            else
                newWords << (word[0...lVow] + word[lVow + 1..-1])
                # newWords << word.slice!(lastVowelIdx(word))
            end
        end
    end
    newWords.join(' ')
end
# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

# p [2,4,5,8].select(&:odd?) # = run method on all

def silly_talk(sen)
    words = sen.split(' ')
    newWords = []
    vowels = 'aeiouAEIOU'
    
    words.each.with_index do |word, idx|
        if vowels.include?(word[-1])
            newWords << (word + word[-1])
        else
            newWord = ''
            
            word.each_char do |char|
                # debugger
                if vowels.include?(char)
                    newWord += char + 'b' + char
                else
                    newWord += char
                end
            end
            newWords << newWord
        end
    end
    newWords.join(' ')
end
# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"


    

