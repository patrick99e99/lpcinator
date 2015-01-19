module LPCinator
  class Processor
    DEFAULT_FRAME_SIZE = 25

    def self.generate_lpc(path, options = {})
      puts new(path, options).lpc_hex_bytes
    end

    def self.frames(path, options = {})
      new(path, options).normalized_frame_data
    end

    def initialize(path, options = {})
      @input   = Input.new({ :path => path })
      @options = options
    end

    def lpc_hex_bytes
      LPCinator::HexByteStreamer.translate(normalized_frame_data)
    end

    def normalized_frame_data
      @normalized_frame_data ||= FrameDataGainNormalizer.normalize!(frame_data)
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
        size_in_milliseconds: frame_size,
      })
    end

    def frame_size
      (options[:frame_size] && options[:frame_size].to_i) || DEFAULT_FRAME_SIZE 
    end

    def frame_data
      [].tap do |data|
        segmenter.each_segment_with_index do |segment, index|
          LPCinator::HammingWindow.process!(segment)

          autocorrelation_coefficients = LPCinator::Autocorrelator.coefficients_for(segment)
          parameters                   = LPCinator::Reflector.translate(autocorrelation_coefficients)

          entry = LPCinator::FrameDataBuilder.create_for(segment, parameters, pitch, options)

          data << entry
          puts entry
        end
      end
    end

    attr_reader :input, :options
  end
end

