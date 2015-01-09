module LPCinator
  class PreEmphasis < Bufferable
    def self.process!(buffer)
      new(buffer).process!
    end

    def process!
      max_level = 0
      sum       = 0

      number_of_samples.times do |t|
        next if t.zero?

        buffer[t] += buffer[t - 1] * multiplier
        max_level = buffer[t].abs if buffer[t].abs > max_level
        sum += buffer[t]
      end

      mean = sum / number_of_samples
      normalize!(max_level, mean)
      buffer
    end

    def multiplier
      0.5
    end

    def normalize!(max_level, mean)
      number_of_samples.times do |t|
        buffer[t] = (buffer[t] - mean) / max_level
      end
    end
  end
end
