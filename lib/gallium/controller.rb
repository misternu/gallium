module Gallium
  class Controller
    include Actions
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
        @view.render(self)
      end
      @view.close
    end
  end
end
