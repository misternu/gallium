module Gallium
  class CLI
    def call(*args)
      Dry::CLI.new(Command).call(*args)
    end
  end
end
