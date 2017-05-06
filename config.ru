$:.unshift File.dirname(__FILE__)

at_exit do
    puts 'Exiting...'
      exit false
end

require 'web'
run Web