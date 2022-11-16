def select_even_nums(arr)
    arr.select {|num| num.even?}
end

def reject_puppies(arr)
    arr.reject {|dog| dog["age"] <= 2 }
end

def count_positive_subarrays(arr2d)
    arr2d.count {|arr| arr.sum > 0}
end

def aba_translate(word)
    vowels = 'aeiouAEIOU'
    newStr = ''
    word.each_char do |char|
        if vowels.include?(char)
            newStr += char + 'b' + char
        else
            newStr += char
        end
    end
    newStr
end

def aba_array(wordsArr)
    newArr = wordsArr.map {|word| aba_translate(word)}
    newArr
end
