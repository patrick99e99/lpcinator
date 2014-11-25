module LPCinator
  class Config
    attr_accessor :channels, :window_size, :overlap, :format

    def initialize(options = {})
      @channels    = options[:channels] || 1
      @window_size = options[:window_size] || 20
      @overlap     = options[:overlap] || 5
      @format      = options[:format] || :float
    end
  end
end
