require 'pry'
require 'ruby-audio'

module LPC
  class Generator
    CHANNELS = 1

    def initialize(input, output, format = :float)
      @input  = RubyAudio::Sound.open(input)
      @output = RubyAudio::Sound.open(output, 'w', @input.info.clone)
      @format = format
      @number_of_samples = @input.info.length * @input.info.samplerate
    end

    def transform!
      buffer = reverse(1000)

      if buffer
        @output.write(buffer)
        transform!
      else
        @output.close
      end
    end

    def window
    end

    def reverse(frames)
      buffer  = @input.read(@format, frames)
      return if buffer == 0

      reversed = RubyAudio::Buffer.new(@format, frames, CHANNELS)

      index = 0
      while frames > 0
        value = buffer[frames - 1]
        break unless value

        reversed[index] = buffer[frames - 1]
        puts "#{index} : #{reversed[index]}"
        index  += 1
        frames -= 1
      end

      reversed
    end
  end
end

generator = LPC::Generator.new('audio/inc.wav', 'audio/reverse.wav')
generator.transform!
