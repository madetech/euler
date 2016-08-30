require_relative '../euler_350_new'
require 'pry'

describe 'Euler350New' do
  context 'when calculating greatest common divisor' do
    context 'and given two numbers' do
      it 'returns their greatest common divisor' do
        # expect(Euler350New.greatest_common_divisor([5,95])).to eq(5)
        # expect(Euler350New.greatest_common_divisor([18,27])).to eq(9)
        # expect(Euler350New.greatest_common_divisor([3,7])).to eq(1)
        # expect(Euler350New.greatest_common_divisor([2323452344,4235234532452])).to eq(4)
        expect(Euler350New.greatest_common_divisor([12560,6545])).to eq(5)
      end
    end
  end
end
