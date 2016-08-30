class HighlyDivisibleTriangles
  @@stored_factors = {}

  def lowest_triangle_number_with_factors(target_number_of_factors)
    n = 1

    while factors_of_n_less_than_target(n, target_number_of_factors)
      n += 1
    end

    nth_triangular_number(n)
  end

  def factors_of_n_less_than_target(n, target_number_of_factors)
    even, odd = [n, n + 1].sort { |a| a % 2 == 0 ? -1 : 1 }
    (number_of_factors(even/2) * number_of_factors(odd)) < target_number_of_factors
  end

  def number_of_factors(number)
    @@stored_factors[number] ||= begin
      m = 1
      count_of_factors = 0

      # if perfect square we want to only count factor once
      count_of_factors += 1 if number == Math.sqrt(number) ** 2

      # all other factors occur in pairs, first of which is
      # always < sqrt(number), paired with one greater
      while m < Math.sqrt(number)
        count_of_factors += 2 if number % m == 0
        m += 1
      end

      count_of_factors
    end
  end

  def nth_triangular_number(n)
    n * (n+1) / 2
  end
end
