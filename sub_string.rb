# frozen_string_literal: true

dictionary = %w[below down go going horn how howdy it i low own part partner sit]
string = "Howdy partner, sit down! How's it going?"

def standardize(input)
  # Takes Array or String. Removes all punctuation and returns an array of lowercase words.
  input = input.join(' ') if input.is_a? Array
  input.split.map(&:split).map do |arr|
    arr.map! do |word|
      word.split.keep_if { |char| char =~ /[a-zA-Z]/ }.join
    end
    arr.join.downcase
  end
end

def substrings(string, dictionary)
  string = standardize(string)
  dictionary = standardize(dictionary)
  dictionary.class
  result = Hash.new(0)
  dictionary.each do |word|
    string.each do |string_word|
      result[word] += 1 if string_word.include? word
    end
  end
  result
end

puts substrings(string, dictionary)
