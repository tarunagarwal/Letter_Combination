module Solution

  class LetterCombination
  
    def self.letter_combinations(digits)
      #start time for calculating total response time
      time_start = Time.now()
    
      #return if number not valid
      return "Not a valid digit." if digits.nil? || digits.length != 10 || digits.split("").any?{|digit| digit.to_i == 0 || digit.to_i == 1}

      #number to letters mapping
      letters = {"2" => ["a", "b", "c"],"3" => ["d", "e", "f"],"4" => ["g", "h", "i"],"5" => ["j", "k", "l"],"6" => ["m", "n", "o"],"7" => ["p", "q", "r", "s"],"8" => ["t", "u", "v"],"9" => ["w", "x", "y", "z"]}

    
    end
  end 
end

