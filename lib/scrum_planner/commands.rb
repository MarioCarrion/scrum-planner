scrum_planner_commands_as_path = File.join(File.expand_path(__FILE__),
                                           'commands',
                                           '*.rb')
Dir[scrum_planner_commands_as_path].each { |f| require f }
