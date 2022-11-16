def all_words_capitalized?(wordsArr)
    wordsArr.all? {|word| word == word.capitalize}
end

def no_valid_url?(urlsArr)
    urlsArr.none? do |url|
        url[-4..-1] == '.com' || url[-4..-1] == '.net' || url[-4..-1] == '.org' || url[-3..-1] == '.io'
    end
end

def any_passing_students?(studsArr)
    studsArr.any? do |stud|
        ((stud[:grades]).sum) / ((stud[:grades]).length) >= 75
    end
end