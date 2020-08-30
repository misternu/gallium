module Gallium
  module Actions
    def key_up
      @selected = [@selected-1, 0].max
    end

    def key_down
      @selected = [@selected+1, @options.length-1].min
    end

    def key_escape
      @running = false
    end
  end
end
