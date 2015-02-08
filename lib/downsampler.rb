module LPCinator
  class Downsampler < Bufferable

    def self.converted(buffer, target_sample_rate, options = {})
      new(buffer, target_sample_rate, options).converted
    end

    def initialize(buffer, target_sample_rate, options = {})
      LPCinator::Chebychev.low_pass!(buffer, options[:cutoff_in_hz] && options[:cutoff_in_hz].to_f || target_sample_rate.to_f / 2)
      super(buffer)
      @target_sample_rate = target_sample_rate
    end

    def converted
      LPCinator::Buffer.new(downsampled_number_of_samples, target_sample_rate).tap do |downsampled|
        counter = 0
        index   = 0
        last_whole_part = nil

        number_of_samples.times do 
          counter += ratio
          whole_part    = counter.floor
          fraction_part = counter - whole_part

          break if !buffer[whole_part + 1]
          if last_whole_part != whole_part
            downsampled[index] = (1.0 - fraction_part) * buffer[whole_part] + fraction_part * buffer[whole_part + 1]
            last_whole_part = whole_part
            index += 1
          end
        end

        LPCinator::Normalizer.process!(downsampled)
      end
    end

  private

    def ratio
      @ratio ||= buffer.sample_rate.to_f / target_sample_rate 
    end

    def downsampled_number_of_samples
      @downsampled_number_of_samples ||= (number_of_samples / ratio).ceil
    end

    attr_reader :target_sample_rate

  end
end
