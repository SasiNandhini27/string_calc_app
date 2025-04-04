# spec/services/string_calc_service_spec.rb

require 'rspec'
require_relative '../../string_calc_service'

RSpec.describe StringCalculatorService, type: :service do
    describe '.add' do
        it 'returns 0 for an empty string' do
            expect(StringCalculatorService.add('')).to eq(0)
        end
    end
end