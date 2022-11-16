require "byebug"

class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) {"_"}
    @attempted_chars = Array.new
    @remaining_incorrect_guesses = 5
  end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def already_attempted?(char)
    return false if !@attempted_chars.include?(char)
    return true
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index do |lett, idx|
      arr << idx if lett == char
    end
    arr
  end

  def fill_indices(char, indsArr)
    indsArr.each {|idx| @guess_word[idx] = char}
  end

  def try_guess(char)
    if already_attempted?(char)
      p "that has already been attempted"
      return false
    else
      @attempted_chars << char
      idcs = get_matching_indices(char)
      if idcs.length == 0
      @remaining_incorrect_guesses -= 1
      else 
        fill_indices(char, idcs)
      end
      return true
    end
  end

  def ask_user_for_guess
    p "Enter a char:"
    guess = gets.chomp
    try_guess(guess)
  end
      
  def arr_match?(arr1, arr2)
    arr1.each.with_index do |char, idx|
      if arr2[idx] != char
        return false
      end
    end
    return true
  end

  def win?
    # debugger
    # if @guess_word == @secret_word
    if arr_match?(@guess_word, @secret_word)
      p "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      p @secret_word
      return true
    else
      return false
    end
  end
end
