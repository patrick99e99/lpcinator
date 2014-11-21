require 'pry'
require 'ruby-audio'

module LPC
  class Config
    attr_accessor :channels, :window_size, :overlap, :format

    def initialize(options = {})
      @channels    = options[:channels] || 1
      @window_size = options[:window_size] || 20
      @overlap     = options[:overlap] || 5
      @format      = options[:format] || :float
    end
  end

  class Generator
    def initialize(input, config)
      @config = config
      @input  = RubyAudio::Sound.open(input)

      @output = RubyAudio::Sound.open('audio/lol.wav', 'w', @input.info.clone)
    end

    def process!(index = 0, options = {})
      result = next_window(index, options)
      buffer = result[:buffer]

      apply_hamming_window(buffer)
  
      @output.write(buffer)
      process!(index + 1, :overlap => true) unless result[:complete]
    end

    def next_window(index, options)
      buffer = RubyAudio::Buffer.new(@config.format, frames, @config.channels)
      position = (@config.window_size - @config.overlap) * index
      @input.seek(position, IO::SEEK_SET) if options[:overlap] && position < @input.info.frames
      complete = @input.read(buffer).zero?

      { buffer: buffer, complete: complete }
    end

    def samplerate
      @input.info.samplerate 
    end

    def frames
      (samplerate / 1000) * @config.window_size
    end

    def apply_hamming_window(buffer)
      window_frames = frames - 1
      @config.window_size.times do |t|
        break if !buffer[t]
        window_value = 0.54 - 0.46 * Math.cos(2 * Math::PI * t / window_frames)
        buffer[t] *= window_value
      end
    end

  end
end

config    = LPC::Config.new
generator = LPC::Generator.new('audio/inc.wav', config)
generator.process!
