require 'thor'

module ScrumPlanner
  class Commands < Thor
    desc 'config <options>', 'Configuration commands'
    method_option :generate,
                  type:    :boolean,
                  aliases: '-g',
                  desc:    'Generates default configuration, if missing.'
    method_option :overwrite,
                  type:    :boolean,
                  aliases: '-o',
                  desc:    'Overwrites default configuration'
    def config
      puts 'Configuring...'
    end
  end
end
