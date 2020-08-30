module Gallium
  class Command < Dry::CLI::Command
    def call(*)
      Controller.run
    end
  end
end
