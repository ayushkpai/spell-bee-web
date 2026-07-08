words = %w[
elephant
beautiful
calendar
necessary
knowledge
restaurant
because
adventure
environment
dictionary
language
computer
umbrella
mountain
chocolate
]

words.each do |word|
  Word.find_or_create_by!(text: word)
end
