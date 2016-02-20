require 'yaml'

module ScrumPlanner
  class Configuration
    DEFAULT = {
      'sprint' => {
        'start_date' => Time.now,
        'length'     => 2
      },
      'gitlab' => {
        'token'    => nil,
        'web_hook' => nil,
        'group'    => {
          'name'    => nil,
          'private' => false
        }
      },
      'members' => [
        [ 'mc',         'mario' ],
        [ 'slack-name', 'gitlab-name' ]
      ]
    }

    def generate!
    end
  end
end
