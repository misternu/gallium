require "gallium/version"
require "dry/cli"
require "tty-prompt"

module Gallium
  class Error < StandardError; end
  # Your code goes here...

  class CLI
    def call(*args)
      Dry::CLI.new(Commands).call(*args)
    end

    module Commands
      extend Dry::CLI::Registry

      class Testing < Dry::CLI::Command
        def call(*)
          prompt = TTY::Prompt.new
          prompt.select("What size?") do |menu|
            menu.choice name: "small",  value: 1
            menu.choice name: "medium",  value: 2
            menu.choice name: "large",  value: 3
          end
        end
      end

      register "testing", Testing
    end
  end
end
