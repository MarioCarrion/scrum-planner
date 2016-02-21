require 'thor'

module ScrumPlanner
  class Commands < Thor
    desc 'print-schedule', 'Prints out schedule'
    method_option :duration,
                  required: true,
                  desc:     'Possible options are "year" and "month"',
                  default:  'year',
                  type:     :string,
                  aliases:  '-d'

    method_option :length,
                  required: true,
                  desc:     'Length of duration for output',
                  default:  1,
                  type:     :numeric,
                  aliases:  '-l'
    def print_schedule
      validate_options

      puts 'Configuring...'
      @starting_time = Time.new(2016, 1, 4)
      @length        = options[:length].to_i

      iteration = ScrumPlanner::Iteration.new(start:  @starting_time,
                                              length: 2,
                                              today:  @starting_time)

      while !breaking_time?(iteration.today)
        puts iteration.humanized_name
        iteration = iteration.next_iteration
      end
    end

    private

    def breaking_time?(time)
      time.year == time_with_seconds_to_break.year &&
        time.month == time_with_seconds_to_break.month
    end

    def time_with_seconds_to_break
      @time_with_seconds_to_break ||= begin
        weeks  = (options[:duration] == 'year' ? 52 : 4) * @length
        to_add = ScrumPlanner::Iteration.seconds_in_a_week(weeks)

        @starting_time + to_add
      end
    end

    def validate_options
      unless %w(year month).include?(options[:duration])
        puts "ERROR: Invalid parameter: #{options[:duration]}"
        exit false
      end
    end
  end
end
