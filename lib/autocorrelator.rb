module LPCinator
  class Autocorrelator < Bufferable
    def self.coefficients_for(buffer)
      new(buffer).coefficients
    end

    def self.sum_of_squares_for(buffer)
      new(buffer).sum_of_squares
    end

    def self.normalized_for(buffer, minimum_period, maximum_period)
      new(buffer).normalized_for(minimum_period, maximum_period)
    end

    def coefficients
      11.times.map { |lag| a_for(lag) }
    end

    def sum_of_squares 
      a_for(0)
    end

    def normalized_for(minimum_period, maximum_period)
      (minimum_period).times.map {0}.tap do |normalized|    
        (minimum_period..maximum_period).each do |lag|
          sum_of_squares_beginning = 0
          sum_of_squares_ending    = 0

          autocorrelation = a_for(lag) do |n|
            sum_of_squares_beginning += buffer[n] * buffer[n]
            sum_of_squares_ending    += buffer[n + lag] * buffer[n + lag]
          end

          normalized[lag] = autocorrelation / Math.sqrt(sum_of_squares_beginning * sum_of_squares_ending)
        end
      end
    end

  private

    def a_for(lag)
      (number_of_samples - lag).times.inject do |sum, n|
        yield n if block_given?
        sum += buffer[n + lag] * buffer[n]
      end
    end
  end
end
