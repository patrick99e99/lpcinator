module LPCinator
  class Downsampler < Bufferable

    def self.converted(buffer, target_sample_rate)
      new(buffer, target_sample_rate).converted
    end

    def initialize(buffer, target_sample_rate)
      super(buffer)
      @target_sample_rate = target_sample_rate
    end

 # let(:group_1) { (1 + 2 + 3 + 4 + (4 + frac1 * (5 - 4))) / ratio }
 # let(:group_2) { ((4 + (1 - frac1) * (5-4)) + 6 + 1 + 2 + 3 + (3 + frac2 * (4 - 3))) / ratio }
  
    def converted
      LPCinator::Chebychev.low_pass!(buffer, low_pass_frequency, 0.1)
      delta    = buffer.sample_rate.to_f / target_sample_rate
      floored  = delta.floor
      fraction = 0.0

      n = 0
      i = 0
      penultimate_sample = 0
      ultimate_sample    = 0

      while n <= number_of_samples
        if n.zero?
          sample = buffer[0] 
          puts "sample = [0] => #{buffer[0]}"
        else
          sample = (penultimate_sample + (1.0 - fraction) * (ultimate_sample - penultimate_sample)) + (buffer[floored * (i + 1) + 1] || 0)
          puts "sample = (#{penultimate_sample} + (1.0 - #{fraction}) * #{ultimate_sample} - #{penultimate_sample}) + #{buffer[floored * (i + 1) + 1] || 0} = #{sample}"
        end

        penultimate_sample = 0
        (floored - 2).times.each do |t|
          multiplier = i.zero? ? 1 : (floored * i + 1)
          index = t + 1 * multiplier
          if !buffer[index]
            downsampled[i] = sample
            return downsampled
          end
          penultimate_sample = buffer[index]
          sample += penultimate_sample
          puts " adding: [#{index}] #{buffer[index]} => #{sample}"
        end

        fraction = ((delta - floored) * (i + 1)) - ((delta - floored) * (i + 1)).floor
        puts "setting fraction to #{fraction}"
        
        ultimate_index  = (floored * (i + 1)) - 1
        ultimate_sample = buffer[ultimate_index]
        sample += penultimate_sample + fraction * (ultimate_sample - penultimate_sample)
        puts "adding: #{penultimate_sample} + #{fraction} * (#{ultimate_sample} - #{penultimate_sample}"

        downsampled[i] = sample / delta

        puts "averaged: #{sample / delta}"
        i += 1
        n += delta
      end

      downsampled
    end

  private

    def downsampled
      @downsampled ||= begin
        #samples = (number_of_samples * (target_sample_rate.to_f / buffer.sample_rate)).ceil
        LPCinator::Buffer.new(number_of_samples, target_sample_rate)
      end
    end

    def low_pass_frequency
      target_sample_rate / 2 / 1000
    end

    attr_reader :target_sample_rate

  end
end
