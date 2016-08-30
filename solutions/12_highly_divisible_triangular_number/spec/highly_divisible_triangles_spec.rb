require_relative '../highly_divisible_triangles.rb'

describe HighlyDivisibleTriangles do
  it 'returns the lowest triangle number with n factors' do
    expect(described_class.new.lowest_triangle_number_with_factors(5)).to eq(28)
    expect(described_class.new.lowest_triangle_number_with_factors(500)).to eq(76576500)
  end
end
