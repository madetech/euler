class MadeDate
  def initialize(year, month, day)
    @year = year
    @month = month
    @day = day
  end

  attr_reader :year, :month, :day

  def tomorrow
    MadeDate.new(next_year, next_month, next_day)
  end

  def next_week
    date = MadeDate.new(year, month, day)
    7.times do
      date = date.tomorrow
    end

    date
  end

  def <(other_date)
    if other_date.year < year
      return false
    elsif year < other_date.year
      return true
    end

    if other_date.month < month
      return false
    elsif month < other_date.month
      return true
    end

    if other_date.day < day
      return false
    elsif day < other_date.day
      return true
    end
  end

  def to_s
    "#{year}-#{month.to_s.rjust(2, '0')}-#{day.to_s.rjust(2, '0')}"
  end

  private

  def next_day
    if day == days_in_month
      1
    else
      day + 1
    end
  end

  def next_month
    if month == 12 and day == days_in_month
      1
    elsif day == days_in_month
      month + 1
    else
      month
    end
  end

  def next_year
    if month == 12 and day == days_in_month
      year + 1
    else
      year
    end
  end

  def days_in_month
    calendar_days[month]
  end

  def calendar_days
    { 1 => 31,
      2 => days_in_february,
      3 => 31,
      4 => 30,
      5 => 31,
      6 => 30,
      7 => 31,
      8 => 31,
      9 => 30,
      10 => 31,
      11 => 30,
      12 => 31 }
  end

  def days_in_february
    if is_leap_year?
      29
    else
      28
    end
  end

  def is_leap_year?
    year % 4 === 0 && year % 400 != 0
  end
end
