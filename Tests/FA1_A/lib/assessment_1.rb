def my_map!(arr, &prc)
    arr.each.with_index do |el, idx|
        arr[idx] = prc[el]
    end
    arr
end

def two?(arr, &prc)
    arr.count {|el| prc[el]} == 2
end

def nor_select(arr, prc1, prc2)
    newArr = arr.select {|el| !prc1[el] && !prc2[el]}
    newArr
end

def array_of_hash_sum(hshArr)
    sum = 0
    hshArr.each do |hsh|
        sum += hsh.values.sum
    end
    sum
end

def slangify(sen)
    vowels = 'aeiouAEIOU'
    words = sen.split(' ')
    newWords = []
    words.each do |word|
        vowels_removed = 0
        newWord = ''
        word.each_char do |char|
            if vowels.include?(char) && vowels_removed < 1
                vowels_removed += 1
                next
            else
                newWord += char
            end
        end
        newWords << newWord
    end
    newWords.join(' ')
end

def char_counter(str, *chars)
    hsh = Hash.new(0)
    if chars.length == 0
        str.each_char do |char|
            hsh[char] += 1
        end
        return hsh
    else
        chars.each do |char|
            count = 0
            str.each_char do |matchChar|
                if matchChar == char
                    count += 1
                end
            end
            hsh[char] = count
        end
        return hsh
    end
end