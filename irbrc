# frozen_string_literal: true

# if defined?(::Bundler)
#   global_gemset = ENV['GEM_PATH'].split(':').grep(/ruby.*@global/).first
#   if global_gemset
#     all_global_gem_paths = Dir.glob("#{global_gemset}/gems/*")
#     all_global_gem_paths.each do |p|
#       gem_path = "#{p}/lib"
#       $LOAD_PATH << gem_path
#     end
#   end
# end

require 'irb/completion'
require 'rubygems'
require 'pry'

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:PROMPT][:EVAN] = {
  :AUTO_INDENT => true,
  :PROMPT_I => "\e[31m \e[34m%N \e[37;1m\e[0m ",
  :PROMPT_C => " \e[31m %N \e[37;1m\e[0m ",
  :PROMPT_S => " \e[31m %N \e[37;1m%l\e[0m ",
  :RETURN   => "  \e[1;33m==> \e[0m%s\n"
}

IRB.conf[:PROMPT_MODE] = :EVAN

alias ex exit

# Use Pry everywhere
begin
  Pry.start
rescue => e
  puts e.message
  puts e.backtrace
end
exit
