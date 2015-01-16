module LPCinator
  class Processor
    FRAME_SIZE = 25

    def self.generate_lpc(path, options = {})
      puts new(path, options).lpc_hex_bytes
    end

    def initialize(path, options = {})
      @input   = Input.new({ :path => path })
      @options = options
    end

    def lpc_hex_bytes
      LPCinator::HexByteStreamer.translate(frame_data)
    end

    def frame_data
      [].tap do |data|
        segmenter.each_segment_with_index do |segment, index|

          LPCinator::HammingWindow.process!(segment)

          autocorrelation_coefficients = LPCinator::Autocorrelator.coefficients_for(segment)
          parameters                   = LPCinator::Reflector.translate(autocorrelation_coefficients)

          entry = LPCinator::FrameDataBuilder.create_for(parameters)
          entry[:pitch] = options[:pitch].to_i
          entry[:gain]  = options[:gain].to_i
          entry[:repeat] = 0

          data << entry

          puts "#{index} #{entry}"
        end
      end
    end

    private

    def pre_emphasized_buffer
      @pre_emphasized_buffer ||= begin
        input.read.tap { |buffer| LPCinator::PreEmphasis.process!(buffer) }
      end
    end

    def segmenter
      @segmenter ||= LPCinator::Segmenter.new(pre_emphasized_buffer, { 
        samplerate: input.samplerate, 
        size_in_milliseconds: FRAME_SIZE 
      })
    end

    attr_reader :input, :options
  end
end

