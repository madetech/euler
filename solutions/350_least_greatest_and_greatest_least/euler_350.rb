
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
require 'prime'

class Euler350
  def self.prime_factorisation(n)
    return 1 if n == 1

    divisors = []

    while n > 1
      factor = first_prime_factor(n)
      divisors << factor
      n = n / factor
    end

    divisors
  end

  def self.greatest_common_divisor(numbers)
    intersection(numbers.map(&method(:prime_factorisation)))
  end

  def self.intersection(numbers) #numbers eg [[2,3,3,3,3,3,3], [3,3,5]]
    gcd = [1]
    numbers.first.each do |factor|
      if numbers.all? { |factors| factors.include?(factor) }
        numbers.each { |factors| factors.delete(factor) }
        gcd.push(factor)
      end
    end
    gcd.reduce(:*)
  end

  def self.first_prime_factor(n)
    (2..n).detect do |i|
      n % i == 0 && i.prime?
    end
  end
end
