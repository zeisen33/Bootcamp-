# Define your methods here. 

def first_letter_vowel_count(sen)
    vowels = 'aeiouAEIOU'
    words = sen.split(" ")
    count = 0
    words.each {|word| count += 1 if vowels.include?word[0]}
    count
end

def count_true(arr, prc)
    arr.count {|el| prc[el]}
end

def procformation(arr, prc1, prc2, prc3)
    arr.map do |el|
        if prc1[el]
            prc2[el]
        else
            prc3[el]
        end
    end
end

def array_of_array_sum(outerArr)
    outerArr.flatten.sum
end

def selective_reverse(sen)
    vowels = 'aieouAEIOU'
    words = sen.split(" ")
    newWords = []
    words.each do |word|
        if vowels.include?(word[0]) || vowels.include?(word[-1])
            newWords << word
        else
            newWords << word.reverse
        end
    end
    newWords.join(" ")
end

def hash_missing_keys(hsh, *testKeys)
    arr = []
    testKeys.each do |k|
       if !hsh.keys.include?(k)
          arr << k
       end
    end
    arr
end