require "gallium/controller"
require "gallium/version"
require "gallium/view"

require "dry/cli"
require "curses"

module Gallium
  class Error < StandardError; end

  class CLI
    def call(*args)
      Dry::CLI.new(Command).call(*args)
    end

    class Command < Dry::CLI::Command
      def call(*)
        Controller.run
      end
    end
  end
end
