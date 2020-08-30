module Gallium
  class View
    def initialize
      Curses.init_screen
      Curses.noecho
      Curses.curs_set(0)
      @window = Curses::Window.new(50, 50, 0, 0)
      @window.keypad = true
      @window.nodelay = true
      @keyboard = Keyboard.new(@window)
    end

    def render(controller)
      @keyboard.handle_keys(controller)
      options, selected = controller.options, controller.selected
      display_options(options, selected)
    end

    def display_options(options, selected)
      clear_window
      print_options(options, selected)
      refresh_window
    end

    def clear_window
      @window.clear
    end

    def refresh_window
      @window.refresh
    end

    def print_options(options, selected)
      options.each_with_index do |option, index|
        set_style(selected, index)
        print_option(option)
      end
    end

    def close
      Curses.close_screen
    end

    def set_style(a, b)
      return set_normal unless a == b
      set_selected
    end

    def set_normal
      @window.attrset(Curses::A_NORMAL)
    end

    def set_selected
      @window.attrset(Curses::A_STANDOUT)
    end

    def print_option(option)
      @window.addstr("#{option}\n")
    end
  end
end
