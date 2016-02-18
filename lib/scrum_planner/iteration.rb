module ScrumPlanner
  # Class in charge of representing one single Scrum +Iteration+, the iteration
  #   length is specified in weeks and it requires the *real* start date to
  #   properly identify the beginning of the iteration as well as the last day
  #   of that said iteration. The first day is always a Monday and the last day
  #   is always a Friday. The iteration name is determined by the First Monday
  #   of the next iteration.
  #
  # For example, assuming today is "February 15 2016" with a project that
  #   originally started on +February 1 2016+ that has a length of 2 weeks.
  #   Today "Monday February 15 2016" would be the second sprint of the
  #   project, it would be also the beginning of that second sprint and it
  #   will end on "February 26 2016", the name of this sprint would be
  #   "2016-02-29"
  class Iteration
    attr_accessor :start

    attr_accessor :today

    attr_accessor :length

    SECONDS_IN_DAY = 86_400

    def initialize(start:, length:, today:)
      @length = length.to_i
      raise ArgumentError, ':length must be positive value' if @length == 0
      raise ArgumentError, ':start must be a Monday' unless start.monday?
      raise ArgumentError, ':start must be in the past' if start > today

      @start = build_time(start)
      @today = build_time(today)
    end

    def end_week?
      (week_number % length) == 0
    end

    def friday?
      today.friday?
    end

    def humanized_name
      v = start + ((iteration_number - 1) * length * SECONDS_IN_DAY * 7)
      v.strftime('%Y-%m-%d')
    end

    def iteration_number
      @iteration_number ||= (week_number / length.to_f).ceil
    end

    def monday?
      today.monday?
    end

    def start_week?
      (week_number % length) == 1
    end

    def week_number
      @week_number ||= (dates_difference_in_days / 7.to_f).ceil
    end

    private

    def build_time(time)
      Time.new(time.year,
               time.month,
               time.day,
               0,
               0,
               0,
               time.utc_offset)
    end

    def dates_difference_in_days
      @ddid ||= ((today - start).to_i / SECONDS_IN_DAY) + 1
    end

    def today_as_numeric_day
      @today_as_numeric_day ||= today.strftime('%u').to_i
    end
  end
end
