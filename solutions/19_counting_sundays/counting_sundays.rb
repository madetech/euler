class CountingSundays
  def initialize(params)
    @params = params
  end

  attr_reader :params

  def number_of_sundays
    start_date = params[:start_date]
    end_date = params[:end_date]
    count = 0
    current_date = start_date

    while current_date < end_date
      count += 1 if current_date.day == 1
      current_date = current_date.next_week
    end

    count

  #   check_date = find first sunday
  #   loop until exceeed end date {
  #     current day += days mod 7
  #     is checkdate first of month? count ++ : dont
  #     first of next month
  #   }
  # end
  end
end
