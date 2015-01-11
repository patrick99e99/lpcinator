module LPCinator
  class Reflector

    def self.translate(coefficients)
      new(coefficients).translate
    end

    def initialize(coefficients)
      @autocorrelation_coefficients = coefficients
    end

    def translate
      return if r[0] == 0

      fk[1]  = r[1] / r[0]
      b[1]   = r[1]
      rms[1] = r[0] - (fk[1] * r[1])

      i = 2
      while i <= 10
        y = r[i]
        delay = y

        j = 1
        while j <= i - 1
          fnext = b[j] - (fk[j] * y)
          y = y - (fk[j] * b[j])
          b[j] = delay
          delay = fnext
          j += 1
        end

        b[i] = delay
        fk[i] = y / rms[i - 1]
        rms[i] = rms[i - 1] - (fk[i] * y)
        i += 1
      end

puts fk[1]
      fk
    end

    def fk
      @fk ||= [nil]
    end

    def b
      @b ||= [nil]
    end

    def rms
      @rms ||= [nil]
    end

    def bim1
      @bim1 ||= [nil]
    end

    def bi
      @bi ||= [nil]
    end

    def r
      autocorrelation_coefficients
    end

    attr_reader :autocorrelation_coefficients
  end
end

