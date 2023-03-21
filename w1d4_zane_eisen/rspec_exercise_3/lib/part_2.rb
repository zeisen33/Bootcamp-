def element_count(arr)
    hsh = Hash.new(0)
    arr.each do |el|
        hsh[el] += 1
    end
    hsh
end

def char_replace!(str, hsh)
    str.each_char.with_index do |char, i|
        if hsh.key?(char)
            str[i] = hsh[char]
        end
    end
    str
end

def product_inject(numsArr)
    numsArr.inject {|acc, el| acc * el}
end