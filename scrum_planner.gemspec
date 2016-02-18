require_relative 'lib/scrum_planner/version'

Gem::Specification.new do |s|
  s.name                  = 'scrum_planner'
  s.licenses              = ['MIT']
  s.version               = ScrumPlanner::Version::VERSION
  s.date                  = ScrumPlanner::Version::DATE

  s.authors               = ['Mario Carrion']
  s.email                 = 'info@carrion.ws'
  s.homepage              = 'https://github.com/mariocarrion/scrum-planner'

  s.summary               = 'Scrum Planner helps you plan your iterations'
  s.description           = 'Scrum Planner is a collection of programs for '\
                            'helping you planning your Scrum iterations.'

  s.files                 = `git ls-files`.split("\n")
  s.test_files            = `git ls-files -- {spec}`.split("\n")
  s.require_path          = 'lib'

  s.required_ruby_version = '~> 2.2'

  s.add_development_dependency 'pry',                          '~> 0.10.3'
  s.add_development_dependency 'pry-nav',                      '~> 0.2.4'
  s.add_development_dependency 'rspec',                        '~> 3.3.2'
  s.add_development_dependency 'rubocop',                      '~> 0.37.2'
  s.add_development_dependency 'rubocop-checkstyle_formatter', '~> 0.2.0'
  s.add_development_dependency 'rubocop-rspec',                '~> 1.4.0'
  s.add_development_dependency 'timecop',                      '~> 0.8.0'
  s.add_development_dependency 'coveralls',                    '~> 0.8.10'
end
