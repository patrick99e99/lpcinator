module LPC
  class PreEmphasis
    def initialize(buffer)
      @buffer = buffer
    end

    def process!
      max_level = 0

      buffer.real_size.times do |t|
        next if t.zero?
        break if !buffer[t]

        buffer[t] += buffer[t - 1] * multiplier
        max_level = buffer[t].abs if buffer[t].abs > max_level
      end

      normalize!(max_level)
      buffer
    end

    def multiplier
      0.5
    end

    def normalize!(max_level)
      buffer.real_size.times do |t|
        break if !buffer[t]
        buffer[t] /= max_level
      end
    end

    private

    attr_reader :buffer
  end
end
