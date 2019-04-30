module Solution

  class LetterCombination
  
    def self.letter_combinations(digits)
      #start time for calculating total response time
      time_start = Time.now()
    
      #return if number not valid
      return "Not a valid digit." if digits.nil? || digits.length != 10 || digits.split("").any?{|digit| digit.to_i == 0 || digit.to_i == 1}

      #number to letters mapping
      letters = {"2" => ["a", "b", "c"],"3" => ["d", "e", "f"],"4" => ["g", "h", "i"],"5" => ["j", "k", "l"],"6" => ["m", "n", "o"],"7" => ["p", "q", "r", "s"],"8" => ["t", "u", "v"],"9" => ["w", "x", "y", "z"]}
      
     
      #create dictionary hash with length as a key with empty array value.

      dictionary = {}
      for i in (1..30)
        dictionary[i] = []
      end

      # Read dictionary file and save values in length form
      file_path = "dictionary.txt"
      File.foreach( file_path ) do |word|
        dictionary[word.chop.length] << word.chop.to_s.downcase
      end
      
      # array of letters values
      keys = digits.chars.map{|digit| letters[digit] }
      final_words = []
      total_number = keys.length - 1 # total numbers
    
      #Loop through all letters and get matching records with dictionary
      for i in (0..total_number)
        next if (i < 2 || i > 7) # because 2 digit letter is not allowed in combination
        first_array = keys[0..i]
        second_array = keys[i + 1..total_number]
        first_combination = first_array.shift.product(*first_array).map(&:join) # Get product of arrays #get_combination(first_array, dictionary)#
        first_combination = first_combination & dictionary[i+1]
        if second_array.length == 7 # because we have 2 combination here [3, 3 ,4], [3, 4, 3]
           sec_array1 = second_array[0..2]
           sec_combination1 = sec_array1.shift.product(*sec_array1).map(&:join)  & dictionary[3]
           sec_array2 = second_array[3..6]
           sec_combination2 = sec_array2.shift.product(*sec_array2).map(&:join) & dictionary[4]
           final_words << first_combination.product(sec_combination1).product(sec_combination2).map(&:flatten) if first_combination.any? && sec_combination1.any? && sec_combination2.any?
           sec_array1 = second_array[0..3]
           sec_combination1 = sec_array1.shift.product(*sec_array1).map(&:join)  & dictionary[4]
           sec_array2 = second_array[4..6]
           sec_combination2 = sec_array2.shift.product(*sec_array2).map(&:join) & dictionary[3]
           final_words << first_combination.product(sec_combination1).product(sec_combination2).map(&:flatten) if first_combination.any? && sec_combination1.any? && sec_combination2.any?
        elsif second_array.length == 6 # we have 1 combination here [3, 3]
           sec_array1 = second_array[0..2]
           sec_combination1 = sec_array1.shift.product(*sec_array1).map(&:join)  & dictionary[3]
           sec_array2 = second_array[3..6]
           sec_combination2 = sec_array2.shift.product(*sec_array2).map(&:join) & dictionary[3]
           final_words << first_combination.product(sec_combination1).product(sec_combination2).map(&:flatten) if first_combination.any? && sec_combination1.any? && sec_combination2.any?
        end
        second_combination = second_array.shift.product(*second_array).map(&:join)
        second_combination = second_combination & dictionary[total_number - i]
        final_words << first_combination.product(second_combination).map(&:flatten) if second_combination.any? && first_combination.any? 
      end
    
      # join final_words result with 10 digit combinations
      final_words << (keys.shift.product(*keys).map(&:join) & dictionary[10]).join(", ") # matche with all character
      time_end = Time.now()
      puts "Time #{time_end.to_f - time_start.to_f}"
      final_words
1    end
  end 
end

