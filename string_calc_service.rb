# string calculator_service.rb

class StringCalculatorService
    def self.add(numbers)
        return 0 if numbers.empty?
        numbers_array = numbers.split(/[,\n]/).map(&:to_i)
        numbers_array.sum
    end
end
  