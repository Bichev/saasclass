def combine_anagrams(words)
    hash_of_anns = Hash.new
 
    words.each do |word|
    mask = word.downcase.split('').sort.join
     
    unless hash_of_anns.has_key?(mask)
        hash_of_anns[mask] = Array.new
        hash_of_anns[mask] << word
    else
        hash_of_anns[mask] << word
    end      
    end
 
    hash_of_anns.values
end


#puts combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams','scream'])
