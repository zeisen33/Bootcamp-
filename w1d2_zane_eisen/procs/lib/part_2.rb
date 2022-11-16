def reverser(str, &prc)
    newStr = ""
    str.each_char {|char| newStr = char + newStr}
    prc[newStr]
end

def word_changer(sen, &prc)
    words = sen.split(' ')
    newSen = []
    words.each {|word| newSen << prc[word]}
    newSen.join(' ')
end

def greater_proc_value(num, prc1, prc2)
    [prc1[num], prc2[num]].max
end

def and_selector(arr, prc1, prc2)
    newArr = arr.select {|el| prc1[el] && prc2[el]}
    newArr
end

def alternating_mapper(arr, prc1, prc2)
    newArr = []
    arr.each.with_index do |el, idx|
        if idx % 2 == 0
            newArr << prc1[el]
        else
            newArr << prc2[el]
        end
    end
    newArr
end