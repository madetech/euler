require_relative '../made_date'
require_relative '../counting_sundays'

describe CountingSundays do
  it 'gets all the sundays in a month' do
    params = {
      start_date: MadeDate.new(1900, 01, 07),
      end_date: MadeDate.new(1900, 12, 31)
    }

    expect(described_class.new(params).number_of_sundays).to eq(2)
  end

  it 'gets all the sundays in the century' do
    params = {
      start_date: MadeDate.new(1901, 01, 06),
      end_date: MadeDate.new(2000, 12, 31)
    }

    expect(described_class.new(params).number_of_sundays).to eq(171)
  end
end

describe MadeDate do
  context '#tomorrow' do
    it 'returns the next day in the same month' do
      expect(described_class.new(1900, 01, 01).tomorrow.to_s).to eq('1900-01-02')
    end

    it 'returns the next day in the next month' do
      expect(described_class.new(1900, 01, 31).tomorrow.to_s).to eq('1900-02-01')
    end

    it 'returns the next day in the next year' do
      expect(described_class.new(1900, 12, 31).tomorrow.to_s).to eq('1901-01-01')
    end

    it 'factors in the number of days in each month' do
      expect(described_class.new(1900, 04, 30).tomorrow.to_s).to eq('1900-05-01')
    end

    it 'factors in leap years' do
      expect(described_class.new(1903, 02, 28).tomorrow.to_s).to eq('1903-03-01')
      expect(described_class.new(1904, 02, 28).tomorrow.to_s).to eq('1904-02-29')
    end
  end

  context '#next_week' do
    it 'returns the date + 7 days' do
      expect(described_class.new(1903, 02, 01).next_week.to_s).to eq('1903-02-08')
    end
  end

  context '#<' do
    it 'returns true if the date is less than the compared date' do
      expect(described_class.new(1901, 01, 01) < described_class.new(1901, 01, 02)).to be(true)
    end
  end
end

# {
#   '01': {
#     days: 31
#   },
#   '02': {
#
#   }
# }
