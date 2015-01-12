module LPCinator
  class Autocorrelator < Bufferable
    def self.coefficients_for(buffer)
      new(buffer).coefficients
    end

    def coefficients
      11.times.map { |t| puts "a#{t}: #{a_for(t)}"; a_for(t) }
    end

  private

    def a_for(n)
      (number_of_samples - n).times.inject do |sum, t|
        sum += buffer[t + n] * buffer[t]
      end
    end
  end
end
