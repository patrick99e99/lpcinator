module LPCinator
  class Generator
    def initialize(input, config)
      @config = config
      @input  = RubyAudio::Sound.open(input)

      @output = RubyAudio::Sound.open('audio/out.wav', 'w', @input.info.clone)
    end

    def total_frames
      @input.info.frames
    end

    def process!(index = 0, options = {})
      result = next_window(index, options)
      buffer = result[:buffer]

      apply_hamming_window(buffer)
  
      @output.write(buffer)
      process!(index + 1, :overlap => true) unless result[:complete]
    end

  private

    def preprocess(value)
      # pre-emphasis code goes here
      value
    end

    def move_playhead_to(frame)
      @input.seek(frame, IO::SEEK_SET)
    end

    def next_window(index, options)
      buffer = RubyAudio::Buffer.new(@config.format, frames, @config.channels)
      position = (@config.window_size - @config.overlap) * index
      move_playhead_to(position) if options[:overlap] && position < total_frames
      complete = @input.read(buffer).zero?

      { buffer: buffer, complete: complete }
    end

    def frames
      (samplerate / 1000) * @config.window_size
    end

    def samplerate
      @input.info.samplerate 
    end

    def apply_hamming_window(buffer)
      window_frames = frames - 1
      @config.window_size.times do |t|
        break if !buffer[t]
        window_value = 0.54 - 0.46 * Math.cos(2 * Math::PI * t / window_frames)
        preprocessed = preprocess(buffer[t])
        buffer[t] = preprocessed *= window_value
      end
    end
  end
end

