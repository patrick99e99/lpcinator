module LPCinator
  class Reflector
    class Parameters
      attr_reader :k, :rms

      def initialize(params)
        @k   = params.fetch(:k)
        @rms = params.fetch(:rms)
      end
    end

    def self.translate(coefficients)
      new(coefficients).translate
    end

    def initialize(coefficients)
      @r = coefficients
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

      Parameters.new(k: k, rms: d.last)
    end

  private

    attr_reader :r
  end
end

