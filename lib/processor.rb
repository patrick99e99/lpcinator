module LPCinator
  class Processor

    def initialize(options)
      input = Input.new(options)
      @buffer = input.read
      @index  = 0

      pre_emphasis(buffer)
      hamming_window(buffer)
      frames = autocorrelation(buffer)

      output_hex_byte_stream(frames)
    end

    private

    def next_frames
    end

    def pre_emphasis(buffer)
      processor = PreEmphasis.new(buffer)
      processor.process!
    end

    def hamming_window(buffer)
      processor = HammingWindow.new(buffer, {
        :samplerate => 8000,
        :size => 25,
        :overlap => 0,
      })
      processor.process!
    end

    def autocorrelation(buffer)
      processor = Autocorrelation.new(buffer)
      processor.process!
    end

    def output_hex_byte_stream(frames)
      puts HexByteStreamer.process!(frames)
    end
  end
end
