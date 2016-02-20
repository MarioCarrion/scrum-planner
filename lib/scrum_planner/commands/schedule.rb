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
    def print_schedule
      validate_options

      puts 'Configuring...'
      iteration = ScrumPlanner::Iteration.new(start:  Time.new(2016, 1, 4),
                                              length: 2,
                                              today:  Time.new(2016, 1, 4))

      next_iteration = 0
      while next_iteration < 2
        puts iteration.humanized_name
        iteration = iteration.next_iteration

        next_iteration += 1 if iteration.today.year == 2017
      end
    end

    private

    def validate_options
      unless %w(year month).include?(options[:duration])
        puts "ERROR: Invalid parameter: #{options[:duration]}"
        exit false
      end
    end
  end
end
