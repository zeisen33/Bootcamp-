def partition(arr, num)
    subArr1 = arr.select {|n| n < num}
    subArr2 = arr.select {|n| n >= num}
    newArr = [subArr1, subArr2]
    newArr
end

def merge(hash1, hash2)
    h3 = Hash.new(nil)
    hash2.each {|k, v| h3[k] = v}
    hash1.each do |k, v|
        h3[k] = v if !h3.key?(k)
    end
    h3
end

def censorWord(word)
    newStr = ''
    vowels = 'aeiouAEIOU'
    word.each_char do |char|
        if vowels.include?(char)
            newStr += '*'
        else
            newStr += char
        end
    end
    newStr
end

def censor(sen, cursesArr)
    words = sen.split(' ')
    newWords = []
    words.each do |word|
        if cursesArr.include?(word.downcase)
            newWords << censorWord(word)
        else
            newWords << word
        end
    end
    newWords.join(' ')
end

def power_of_two?(num)
    return false if num < 1
    return true if num == 1
    i = 1
    while i <= num
        i *= 2
        return true if i == num
    end
    return false
end

