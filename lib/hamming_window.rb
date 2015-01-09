module LPCinator
  class HammingWindow < Bufferable
    def self.process!(buffer)
      new(buffer).process!
    end

    def process!
      number_of_samples.times do |t|
        buffer[t] *= window[t]
      end
    end

    private

    def window
      @window ||= [].tap do |window|
        number_of_samples.times do |t|
          window[t] = 0.54 - 0.46 * Math.cos(2 * Math::PI * t / (number_of_samples - 1))
        end
      end
    end
  end
end
