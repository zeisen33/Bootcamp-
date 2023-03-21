def palindrome?(str)
    backwards = ''
    str.each_char {|char| backwards = char + backwards}
    str == backwards
end

def substrings(str)
    arr = []
    i = 0
    while i < str.length
        j = 1
        while j <= str.length
            if i < j 
                arr << str[i...j]
            end
            j += 1
        end
        i += 1   
    end
    arr
end

def palindrome_substrings(str)
    substrings(str).select {|subs| palindrome?(subs) && subs.length > 1}
end