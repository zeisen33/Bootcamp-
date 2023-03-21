def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(arr)
    (arr.sum + 0.0) / (arr.length + 0.0) * 1.0
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase! + '!'
end

def alternating_case(sen)
    words = sen.split(' ')
    words.each.with_index do |word, idx|
        if idx % 2 == 0
            word = word.upcase!
        else
            word = word.downcase!
        end
    end
    words.join(' ')
end