words_file = Rails.root.join("db", "words.txt")

File.foreach(words_file) do |line|
  word = line.strip
  next if word.blank?

  Word.find_or_create_by!(text: word)
end
