module LPCinator
  class Autocorrelator < Bufferable
    def self.coefficients_for(buffer)
      new(buffer).coefficients
    end

    def self.sum_of_squares_for(buffer)
      new(buffer).sum_of_squares
    end

    def coefficients
      11.times.map { |t| a_for(t) }
    end

    def sum_of_squares 
      a_for(0)
    end

  private

    def a_for(n)
      (number_of_samples - n).times.inject do |sum, t|
        sum += buffer[t + n] * buffer[t]
      end
    end
  end
end
