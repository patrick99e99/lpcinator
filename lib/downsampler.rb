module LPCinator
  class Downsampler < Bufferable

    def self.converted(buffer, target_sample_rate)
      new(buffer, target_sample_rate).converted
    end

    def initialize(buffer, target_sample_rate)
      super(buffer)
      @target_sample_rate = target_sample_rate
    end

    def converted
      LPCinator::Chebychev.low_pass!(buffer, low_pass_frequency, 0.1)
      delta    = buffer.sample_rate.to_f / target_sample_rate
      floored  = delta.floor
      fraction = delta - floored

      n = 0
      i = 0
      last_sample = 0

      while n < number_of_samples
        if n.zero?
          sample = buffer[0] 
          puts "sample = [0] => #{buffer[0]}"
        else
          sample = (1.0 - fraction) * last_sample
          puts "sample = 1.0 - #{fraction} * #{last_sample} => #{sample}"
        end

        (floored - 1).times.each do |t|
          index = t + 1 * (floored * i + 1)
          if !buffer[index]
            downsampled[i] = sample
            return downsampled
          end
          sample += buffer[index]
          puts " adding: [#{index}] #{buffer[index]} => #{sample}"
        end

        last_index  = floored * (i + 1)
        last_sample = buffer[last_index]
        puts "last sample set to: [#{last_index}] #{last_sample}"

        sample += last_sample * fraction
        puts "adding fraction: #{last_sample} * #{fraction} => #{sample}"
        downsampled[i] = sample / floored

        puts "averaged: #{sample / floored}"
        i += 1
        n += delta
      end

      downsampled
    end

  private

    def downsampled
      @downsampled ||= begin
        samples = (number_of_samples * (target_sample_rate.to_f / buffer.sample_rate)).ceil
        LPCinator::Buffer.new(number_of_samples, target_sample_rate)
      end
    end

    def low_pass_frequency
      target_sample_rate / 2 / 1000
    end

    attr_reader :target_sample_rate

  end
end
