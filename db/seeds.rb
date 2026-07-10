config_dir = Pathname.new(Dir.home).join(".config", "spell_bee")
config_dir.mkpath

words_file = config_dir.join("words.txt")

unless words_file.exist?
  raise <<~ERROR
    Word list not found: #{words_file}
    Create the file and add one word per line.
  ERROR
end

File.foreach(words_file) do |line|
  word = line.strip
  next if word.blank?

  Word.find_or_create_by!(text: word)
end

puts "Imported words from #{words_file}"
