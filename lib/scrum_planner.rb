module ScrumPlanner
end

__scrum_planner_as_path = File.join(File.expand_path('..', __FILE__),
                                    '**',
                                    '*.rb')
Dir[__scrum_planner_as_path].each { |f| require f }
