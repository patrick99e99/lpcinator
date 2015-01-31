module LPCinator
  class PreEmphasis < Bufferable
    A = -0.9

    def self.process!(buffer)
      new(buffer).process!
    end

    def process!
      max_level  = 0
      sum        = 0
      pre_energy = buffer.energy

      number_of_samples.times do |t|
        next if t.zero?

        buffer[t] += buffer[t - 1] * A
        absolute_buffer_value = buffer[t].abs
        max_level = absolute_buffer_value if absolute_buffer_value > max_level
        sum += buffer[t]
      end

      scale = scale_for(pre_energy, buffer.energy)
      mean  = sum / number_of_samples
      max_level -= mean
      normalize!(max_level, mean, 1)
    end

  private

    def normalize!(max_level, mean, scale)
      number_of_samples.times do |t|
        buffer[t] = ((buffer[t] - mean) / max_level) * scale
      end
    end

    def scale_for(pre_energy, post_energy)
      Math.sqrt(pre_energy / post_energy)
    end
  end
end
