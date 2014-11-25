module LPCinator
  class Autocorrelation < Bufferable
    def process!
      a0  = a_for(0)
      a1  = a_for(1)
      a2  = a_for(2)
      a3  = a_for(3)
      a4  = a_for(4)
      a5  = a_for(5)
      a6  = a_for(6)
      a7  = a_for(7)
      a8  = a_for(8)
      a9  = a_for(9)
      a10 = a_for(10)
    end

    def a_for(n)
      sum = 0
      number_of_samples.times do |t|
        next unless t >= n
        break if !buffer[t]
        sum += buffer[t] * buffer[t - n]
      end

      sum
    end
  end
end
