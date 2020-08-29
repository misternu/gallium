module Gallium
  class Controller
    attr_reader :options, :selected

    def initialize
      @view = View.new
      @options = ["v2", "webapp", "boost"]
      @selected = 0
      @running = true
    end

    def self.run
      self.new.run
    end

    def run
      while @running
        @view.handle_keys(self)
        @view.render(self)
      end
      @view.close
    end

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
