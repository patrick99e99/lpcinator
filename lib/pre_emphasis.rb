module LPCinator
  class PreEmphasis < Bufferable
    A = 0.5

    def self.process!(buffer)
      new(buffer).process!
    end

    def process!
      max_level = 0;
      sum       = 0;

      number_of_samples.times do |t|
        next if t.zero?

        buffer[t] += buffer[t - 1] * A
        absolute_buffer_value = buffer[t].abs
        max_level = absolute_buffer_value if absolute_buffer_value > max_level
        sum += buffer[t];
      end

      mean = sum / number_of_samples
      max_level -= mean
      normalize!(max_level, mean)
    end

    def normalize!(max_level, mean)
      number_of_samples.times do |t|
        buffer[t] = (buffer[t] - mean) / max_level;
      end
    end
  end
end
