class Euler350New
  def self.greatest_common_divisor(numbers)
    a = numbers.max
    b = numbers.min
    if a % b == 0
      return b 
    else
      greatest_common_divisor([b, a%b])
    end
  end
end
