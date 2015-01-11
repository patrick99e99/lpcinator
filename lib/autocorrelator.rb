module LPCinator
  class Autocorrelator < Bufferable
    def self.coefficients_for(buffer)
      new(buffer).coefficients
    end

    def coefficients
      11.times.map { |t| a_for(t) }
    end

  private

    def a_for(n)
      sum = 0
      (number_of_samples - n).times do |t|
        sum += buffer[t + n] * buffer[t]
      end

      sum
    end
  end
end
