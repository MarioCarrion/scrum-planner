# +ScrumPlanner+ is the module containing all the Scrum Planner related classes
module ScrumPlanner
end

scrum_planner_as_path = File.join(File.expand_path('..', __FILE__),
                                  '**',
                                  '*.rb')
Dir[scrum_planner_as_path].each { |f| require f }
