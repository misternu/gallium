module Gallium
  class Keyboard
    KEYS = [
      KEY_UP      = Curses::Key::UP,
      KEY_DOWN    = Curses::Key::DOWN,
      KEY_ESCAPE  = 27
    ]

    MAPPING = {
      KEY_UP      => :key_up,
      KEY_DOWN    => :key_down,
      KEY_ESCAPE  => :key_escape
    }

    def initialize(window)
      @window = window
    end

    def handle_keys(controller)
      key = @window.getch
      action = MAPPING[key]
      controller.send(action) if action
    end
  end
end
