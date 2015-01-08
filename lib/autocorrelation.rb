module LPCinator
  class Autocorrelation < Bufferable
    def process!
      frame_data = {}
      11.times do |t|
        a = a_for(t) * (1 << 15)

        next if t.zero?
        key = "k#{t}".to_sym
        frame_data[key] = CodingTable.reflection_coefficient_for(t, a)
      end
      frame_data[:gain] = gain
      frame_data[:pitch] = 32
      frame_data
    end

    def a_for(n)
      sum = 0
      (number_of_samples - n).times do |t|
        break if !buffer[t]
        sum += buffer[t + n] * buffer[t]
      end

      sum
    end

    def gain
      sum = 0
      number_of_samples.times do |t|
        break if !buffer[t]
        sum += buffer[t] * buffer[t]
      end
      (Math.sqrt(sum) * (1 / number_of_samples) * ((1 << 4) - 1)).round
    end
  end
end
