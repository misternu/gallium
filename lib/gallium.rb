require "dry/cli"
require "curses"

Dir[File.join(File.dirname(__dir__), 'lib/gallium/*.rb')].each do |file|
  require file
end
