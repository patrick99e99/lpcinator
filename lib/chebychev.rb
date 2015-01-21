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
      last_filter = 0

      number_of_samples.times do |t|
        last_buffer        = t.zero? ? 0 : buffer[t - 1]
        buffer_before_last = t <= 1  ? 0 : buffer[t - 2]

        filter      = filter_coefficients[0] * buffer[t] + filter_coefficients[1] * last_filter
        buffer[t]   = filter_coefficients[2] * filter + filter_coefficients[3] * last_buffer * filter_coefficients[4] * buffer_before_last
        last_filter = filter
      end
    end

  private

    def alpha_1
      @alpha_1 ||= 0.3572 * 2 * Math::PI * cutoff
    end

    def alpha_2
      @alpha_2 ||= 0.1786 * Math::PI * cutoff
    end

    def beta
      @beta ||= 0.8938 * Math::PI * cutoff
    end

    def filter_coefficients
      @filter_coefficients ||= 5.times.map do |t|
        send("coefficient_#{t + 1}".to_sym)
      end
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

  end
end

