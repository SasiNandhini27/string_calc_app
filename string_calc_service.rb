class StringCalculatorService
    def self.add(numbers)
      # Return 0 for an empty string
      return 0 if numbers.empty?
  
      # Check if the string starts with a custom delimiter declaration
      if numbers.start_with?("//")
        # Split to get the delimiter and numbers
        parts = numbers.split("\n", 2)
        delimiter_line = parts[0]
        numbers = parts[1] || ''  # Handle case where there's no newline
  
        delimiter = delimiter_line[2..-1]  # Remove the "//" part
  
        # If there are multiple characters as the delimiter (e.g., "$1$2"), we handle that
        if delimiter.start_with?('[') && delimiter.end_with?(']')
          # The delimiter is a list of possible delimiters
          delimiter = delimiter[1..-2].split('][')
        else
          # Single delimiter
          delimiter = [delimiter]
        end
  
        # Escape special characters in the delimiters to treat them literally
        delimiter_regex = delimiter.map { |del| Regexp.escape(del) }.join('|')
  
      else
        # Default delimiters: comma and newline
        delimiter_regex = ",|\n"
      end
  
      # Split the string using the delimiter(s) and convert them to integers
      numbers_array = numbers.split(/#{delimiter_regex}/).map(&:to_i)
  
      # Return the sum of the numbers
      numbers_array.sum
    end
  end
  