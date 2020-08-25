require "gallium/version"
require "dry/cli"
require "curses"

module Gallium
  class Error < StandardError; end

  class CLI
    def call(*args)
      Dry::CLI.new(GalliumCommand).call(*args)
    end

    class GalliumCommand < Dry::CLI::Command
      def call(*)
        win = Curses::Window.new(20, 20, 0, 0)
        win.keypad = true
        loop do
          input = win.getch
          win.clear
          if input == Curses::Key::LEFT then
            win.addstr(input.to_s)
            win.addstr("Left key")
          else
            win.addstr("other")
          end
          win.refresh
        end
      end
    end
  end
end
