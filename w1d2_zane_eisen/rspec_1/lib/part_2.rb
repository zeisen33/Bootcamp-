def hipsterfy(word)
    vowels = 'aeiouAEIOU'
    i = word.length - 1

    while i >= 0
        if vowels.include?(word[i])
            return word[0,i] + word[i+1,word.length]
        end
        i -= 1
    end

    return word
end

def vowel_counts(str)
    count = Hash.new(0)
    vowels = 'aeiouAEIOU'
    str.each_char do |char|
        if vowels.include?(char)
            count[char.downcase] += 1
        end
    end
    count
end

def caesar_cipher(sen, n)
    newSen = ''
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    sen.each_char do |char|
        if alphabet.include?(char)
            newSen += alphabet[(alphabet.index(char) + n) % 26]
        else
            newSen += char
        end
    end
    newSen
end
p caesar_cipher("hello world!", 1)