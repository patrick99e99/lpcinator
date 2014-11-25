module LPC
  class Bufferable
    def initialize(buffer)
      @buffer = buffer
    end

    def number_of_samples
      buffer.real_size
    end

    protected

    attr_reader :buffer
  end
end
