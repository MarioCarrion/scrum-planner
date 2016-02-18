module ScrumPlanner
  # Class in charge of representing one single Scrum +Iteration+, the iteration
  #   length is specified in weeks and it requires the *real* start date to
  #   properly identify the beginning of the iteration as well as the last day
  #   of that said iteration. The first day is always a Monday and the last day
  #   is always a Friday.
  #
  # For example, assuming today is "February 15 2016" with a project that
  #   originally started on +February 1 2016+ that has a length of 2 weeks.
  #   Today "Monday February 15 2016" would be the second sprint of the
  #   project, it would be also the beginning of that second sprint and it
  #   will end on "February 26 2016"
  class Iteration
    attr_accessor :real_start

    attr_accessor :today

    def initialize(real_start:, length:, today: Time.now)
      @length = length.to_i
      raise ArgumentError, ':length must be positive value' if @length == 0

      @real_start = real_start
      @today      = today
    end

    def friday?
      numeric_today == 5
    end

    def monday?
      numeric_today == 1
    end

    private

    def numeric_today
      @numeric_today ||= Time.now.strftime('%u').to_i
    end
  end
end
