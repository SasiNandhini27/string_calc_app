# string calculator_service.rb

class StringCalculatorService
    def self.add(numbers)
        return 0 if numbers.empty?
        numbers.split(',').map(&:to_i).sum
    end
end
  