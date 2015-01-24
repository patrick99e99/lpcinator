module LPCinator
  class Reflector
    class Parameters
      attr_accessor :rms
      attr_reader :k

      def initialize(params)
        @k   = params.fetch(:k)
        @rms = params.fetch(:rms)
      end
    end

    def self.translate(coefficients, number_of_samples)
      new(coefficients, number_of_samples).translate
    end

    def initialize(coefficients, number_of_samples)
      @r                 = coefficients
      @number_of_samples = number_of_samples
    end

    def translate
      return if r.first.zero?

      # Leroux Guegen algorithm for finding K's

      k, b, d = [], [], []

      k[1] = -r[1] / r[0]
      d[1] = r[1]
      d[2] = r[0] + (k[1] * r[1])

      i = 2
      while i <= 10
        y = r[i]
        b[1] = y

        j = 1
        while j <= i - 1
          b[j + 1] = d[j] + (k[j] * y)
          y = y + (k[j] * d[j])
          d[j] = b[j]
          j += 1
        end

        k[i] = -y / d[i]
        d[i + 1] = d[i] + (k[i] * y)
        d[i] = b[i]
        i += 1
      end

      Parameters.new(k: k, rms: formatted_rms(d.last))
    end

  private

    def formatted_rms(rms)
      Math.sqrt(rms / number_of_samples) * (1 << 15)
    end

    attr_reader :r, :number_of_samples
  end
end

