module Solution

  class LetterCombination
  
    def self.letter_combinations(digits)
      #start time for calculating total response time
      time_start = Time.now()
    
      #return if number not valid
      return "Not a valid digit." if digits.nil? || digits.length != 10 || digits.split("").any?{|digit| digit.to_i == 0 || digit.to_i == 1}
    end
  end 
end

