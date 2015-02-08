module LPCinator
  class Normalizer < Bufferable
    def self.process!(buffer, options = {})
      new(buffer, options).process!
    end

    def initialize(buffer, options = {})
      super(buffer)
      @scale = options[:scale] || 1
    end

    def process!(scale = 1)
      max_level  = 0
      sum        = 0

      number_of_samples.times do |t|
        absolute_buffer_value = buffer[t].abs
        max_level = absolute_buffer_value if absolute_buffer_value > max_level
        sum += buffer[t]
      end

      mean = sum / number_of_samples
      max_level -= mean
      normalize!(max_level, mean)
    end

  private

    def normalize!(max_level, mean)
      number_of_samples.times do |t|
        buffer[t] = ((buffer[t] - mean) / max_level) * scale
      end
    end

    attr_reader :scale
  end
end
