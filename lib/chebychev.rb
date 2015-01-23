module LPCinator
  class Chebychev < Bufferable
    def self.low_pass!(buffer, cutoff, time)
      new(buffer, cutoff, time).low_pass!
    end

    def initialize(buffer, cutoff, time)
      @buffer = buffer
      @cutoff = cutoff
      @time   = time
    end

    def low_pass!
      number_of_samples.times do |t|
        last_buffer        = t.zero? ? 0 : buffer[t - 1]
        buffer_before_last = t <= 1  ? 0 : buffer[t - 2]

        self.filter = coefficient_1 * buffer[t] + coefficient_2 * filter
        buffer[t]   = coefficient_3 * filter + coefficient_4 * last_buffer + coefficient_5 * buffer_before_last
      end
    end

  private

    def filter
      @filter || 0
    end

    def alpha_1
      @alpha_1 ||= 0.3572 * 2 * Math::PI * cutoff
    end

    def alpha_2
      @alpha_2 ||= 0.1786 * Math::PI * cutoff
    end

    def beta
      @beta ||= 0.8938 * Math::PI * cutoff
    end

    def coefficient_1
      1.0 - Math.exp(-alpha_1 * time)
    end

    def coefficient_2
      Math.exp(-alpha_1 * time)
    end

    def coefficient_3
      1.0 - 2.0 * Math.exp(-alpha_2 * time) * Math.cos(beta * time) + Math.exp(-2.0 * alpha_2 * time)
    end

    def coefficient_4
      2.0 * Math.exp(-alpha_2 * time) * Math.cos(beta * time)
    end

    def coefficient_5
      -Math.exp(-2.0 * alpha_2 * time)
    end

    attr_reader :cutoff, :time
    attr_writer :filter
  end
end

