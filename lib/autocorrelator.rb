module LPCinator
  class Autocorrelator < Bufferable
    def self.frame_data_for(buffer)
      new(buffer).process!
    end

    def process!
      {}.tap do |frame_data|
        11.times do |t|
          a = a_for(t) * (1 << 15)

          next if t.zero?
          key = "k#{t}".to_sym
          frame_data[key] = CodingTable.reflection_coefficient_for(t, a)
        end

        frame_data[:gain] = gain
      end
    end

    def a_for(n)
      sum = 0
      (number_of_samples - n).times do |t|
        sum += buffer[t + n] * buffer[t]
      end

      sum
    end

    def gain
      sum = 0
      number_of_samples.times do |t|
        sum += buffer[t] * buffer[t]
      end
      (Math.sqrt(sum) * (1 / number_of_samples) * ((1 << 4) - 1)).round
    end
  end
end
