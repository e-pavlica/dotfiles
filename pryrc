# frozen_string_literal: true

Pry.config.prompt = [
  proc { "\e[31m \e[34mpry \e[37;1m\e[0m " },
  proc { " \e[31m pry \e[37;1m\e[0m " }
]

Pry.config.editor = 'vim'

# Pry::Commands.alias_command 'ex', 'exit'
#
# if Kernel.const_defined?('Rails')
#   # load Rails Console helpers like reload
#   require 'rails/console/app'
#   extend Rails::ConsoleMethods
#   puts 'Rails Console Helpers loaded'
# end
