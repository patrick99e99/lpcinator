module LPCinator
  class Processor
    FRAME_SIZE = 25

    def self.generate_lpc(path)
      puts new(:path => path).lpc_hex_bytes
    end

    def initialize(config)
      @input = Input.new(config)
    end

    def lpc_hex_bytes
      LPCinator::HexByteStreamer.translate(frame_data)
    end

    def frame_data
      [].tap do |data|
        segmenter.each_segment do |segment|
          LPCinator::HammingWindow.process!(segment)

          autocorrelation_coefficients = LPCinator::Autocorrelator.coefficients_for(segment)
          parameters                   = LPCinator::Reflector.translate(autocorrelation_coefficients)

          entry = LPCinator::FrameDataBuilder.create_for(parameters)
          entry[:pitch] = 22
          entry[:repeat] = 0
puts entry
return

          data << entry
        end

data.each_with_index do |hash, idx|
  puts "#{idx} #{hash}"
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

    attr_reader :input
  end
end

