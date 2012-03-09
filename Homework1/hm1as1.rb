def palindrome? (string)
  cut_sings(string).downcase!
  string == string.reverse
end

def count_words(string)
  i=0
  hash_for_check = Hash.new
  array = string.split(/\W+/) #leave only words; \W not the same
  while i < array.size do
    #puts string.split(/\W+/)[i].downcase! - as a sample of strong method
    word = string.split(/\W+/)[i].downcase
    #puts word
    quantity_of_word = array.find_all{|elem| elem.downcase == word}.size
    #puts quantity_of_word
    #hash_for_check [word] = quantity_of_word
    hash_for_check.store(word, quantity_of_word)
    i += 1
  end
  hash_for_check
  #puts hash_for_check
end

def cut_sings (string) 
  string.gsub!(/(\W|\b)/, "")
end

=begin
if palindrome?("A man, a plan, a canal -- Panama")
  puts "yes"
else
  puts "no"  
end

count_words("A man,    a plan, a canal -- Panama")
count_words("Doo bee doo bee doo")
=end

