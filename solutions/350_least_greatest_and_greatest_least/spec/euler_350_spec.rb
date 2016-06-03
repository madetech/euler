require_relative '../euler_350'
require 'pry'

# (10, 100, 1) = 91
# (10, 100, 2) = 327
# (10, 100, 3) = 1135

#
# 5 = 5
# 95 = 5 * 19
# 18 = 2 * 3 * 3
# 27 =     3 * 3 * 3
#
# 2 * 3 * 3 * 3 = 54
#
#
# 3 * 3 = 9
# GCD = intersection of both prime factorisations
# LCM = union of both prime factorisations

describe 'Euler350' do
  context 'when calculating prime factorisation' do
    context 'and given one number' do
      it 'returns its divisors' do
        expect(Euler350.prime_factorisation(95)).to eq([5, 19])
        expect(Euler350.prime_factorisation(5)).to eq([5])
        expect(Euler350.prime_factorisation(18)).to eq([2, 3, 3])
        expect(Euler350.prime_factorisation(976)).to eq([2, 2, 2, 2, 61])
      end
    end
  end

  context 'when calculating greatest common divisor' do
    context 'and given two numbers' do
      it 'returns their greatest common divisor' do
        expect(Euler350.greatest_common_divisor([5,95])).to eq(5)
        expect(Euler350.greatest_common_divisor([18,27])).to eq(9)
        expect(Euler350.greatest_common_divisor([3,7])).to eq(1)
      end
    end
  end
end
