module LPC
  class PreEmphasis
    attr_reader :config

    def initialize(input, config)
      @input  = RubyAudio::Sound.open(input)
      @config = config
      @output = RubyAudio::Sound.open('audio/pre_emphasis.wav', 'w', @input.info.clone)
    end

    def process!(last_value = nil)
      frames = 1000
      buffer = RubyAudio::Buffer.new(config.format, frames, config.channels)

      if sound.read(buffer).zero?
        @output.close
        return
      end

      frames.times do |t|
        next if t.zero? && !last_value 
        break if !buffer[t]

        last_value = t.zero? ? last_value : buffer[t - 1]
        buffer[t] += last_value * multiplier
      end

      @output.write(buffer)
      process!(buffer[frames - 1])
    end

    def multiplier
      0.5
    end

    def sound
      @input
    end

    def total_frames
      @input.info.frames
    end
  end
end
