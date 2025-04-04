# spec/services/string_calc_service_spec.rb

require 'rspec'
require_relative '../../string_calc_service'

RSpec.describe StringCalculatorService, type: :service do
    describe '.add' do
        it 'returns 0 for an empty string' do
            expect(StringCalculatorService.add('')).to eq(0)
        end
        
        it 'returns the sum of single number' do
            expect(StringCalculatorService.add('3')).to eq(3)
        end
        
        it 'returns the sum of two numbers' do
            expect(StringCalculatorService.add('7,3')).to eq(10)
        end

        it 'returns the sum of five numbers' do
            expect(StringCalculatorService.add('2,5,4,15,3,1')).to eq(30)
        end
        
        it 'returns the sum of numbers with new lines' do
            expect(StringCalculatorService.add("1\n2,3")).to eq(6)
        end

        it 'handles a custom delimiter (semicolon) and returns correct sum' do
            expect(StringCalculatorService.add("//;\n1;2")).to eq(3)
        end

        it 'raises an exception for negative numbers' do
            expect { StringCalculatorService.add("1,-2,3") }.to raise_error("Negatives not allowed: -2")
        end

        it 'raises an exception for multiple negative numbers' do
            expect { StringCalculatorService.add("1,-2,-3,4") }.to raise_error("Negatives not allowed: -2, -3")
        end
    end
end