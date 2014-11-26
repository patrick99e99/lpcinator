module LPCinator
  class HammingWindow < Bufferable
    def initialize(buffer, options)
      @samplerate = options.fetch(:samplerate)
      @frames     = options.fetch(:size)    * samples_per_millisecond
      @overlap    = options.fetch(:overlap) * samples_per_millisecond
      
      super(buffer)
    end

    def process!(offset = 0)
      frames.times do |t|
        return if !buffer[t + offset]
        buffer[t + offset] *= window[t]
      end
      process!(offset + frames - overlap)
    end

    private

    def samples_per_millisecond
      samplerate / 1000
    end

    def window
      @window ||= [].tap do |window|
        frames.times do |t|
          window[t] = 0.54 - 0.46 * Math.cos(2 * Math::PI * t / frames - 1)
        end
      end
    end

    attr_reader :samplerate, :frames, :overlap
  end
end
