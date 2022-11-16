require "byebug"

def zip(*arrs)
    # debugger
    newArr = []
    i = 0
    while i < arrs[0].length 
        subArr = []
        j = 0
        while j < arrs.length
            subArr << arrs[j][i]
            j += 1
        end
        newArr << subArr
        i += 1
    end
    newArr 
end
# array_1 = ['a', 'b', 'c'] 
# array_2 = [1, 2, 3]
# array_3 = ['w', 'x', 'y']
# p zip(array_1, array_2, array_3)
# p zip(array_2, array_1)
# p zip(array_1, array_2)

def prizz_proc(arr, proc1, proc2)
    arr.select {|el| (proc1[el] || proc2[el]) && !(proc1[el] && proc2[el])}
end

def zany_zip(*arrs)
    newArr = []
    i = 0
    lens = []
    arrs.each {|arr| lens << arr.length}
    while i < lens.max
        subArr = []
        j = 0
        while j < arrs.length
            subArr << arrs[j][i]
            j += 1
        end
        newArr << subArr
        i += 1
    end
    newArr
end

# array_1 = ['a', 'b', 'c']
# array_2 = [1, 2, 3]
# array_3 = [11, 13, 15, 17]
# array_4 = ['v', 'w', 'x', 'y', 'z']
# p zany_zip(array_3, array_2, array_1)

def maximum (arr, &prc)
    if arr.length == 0
        return nil
    end
    newArr = arr.map {|el| prc[el]}
    max = arr[0]
    newArr.each.with_index do |el, idx|
        if el >= newArr[0]
            max = arr[idx]
        end
    end
    max
end

def my_group_by(arr, &prc)
    hsh = Hash.new {|h,k| h[k] = []}
    arr.each do |el|
        # debugger
        a = prc[el]
        hsh[a] << el
    end
    hsh
end
# array_1 = ['mouse', 'dog', 'goat', 'bird', 'cat'] 
# array_2 = [1, 2, 9, 30, 11, 38] 
# p my_group_by(array_1) { |s| s.length }

def max_tie_breaker(arr, prc, &prc2)
    return nil if arr.length == 0
    arr.inject do |acc, el|
        if prc2[acc] > prc2[el]
            acc = acc
        elsif prc2[acc] < prc2[el]
            acc = el
        else
            if prc[acc] >= prc[el]
                acc = acc
            else
                acc = el
            end
        end
    end
end

def lastVowelIdx(word)
    vowels = 'aeiouAEIOU'
    i = word.length - 1
    while i >= 0
        return i if vowels.include?(word[i])
        i -= 1
    end
    return "no vowels"
end   

def firstVowelIdx(word)
    vowels = 'aeiouAEIOU'
    i = 0
    while i < word.length
        return i if vowels.include?(word[i])
        i += 1
    end
    return "no vowels"
end   

def vowelCount(word)
    vowels = 'aeiouAEIOU'
    count = 0
    word.each_char {|char| count += 1 if vowels.include?(char)}
    return count
end
# p lastVowelIdx('hwdng')

def silly_syllables(sen)
    vowels = 'aeiouAEIOU'
    newWords = []
    words = sen.split(' ')
    words.each.with_index do |word, idx|
        if vowelCount(word) < 2
            newWords << word
        else
            i = firstVowelIdx(word)
            j = lastVowelIdx(word)
            newWords << (word[i..j])
        end
    end
    newWords.join(' ')
end
# p silly_syllables('properly precisely written code')