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
      [].tap do |frame_data|
        segmenter.each_segment do |segment|
          LPCinator::HammingWindow.process!(segment)
          frame_data << LPCinator::Autocorrelator.frame_data_for(segment)
        end

        perform_pitch_detection_for!(frame_data)
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

    def perform_pitch_detection_for!(frame_data)
      frame_data.each do |frame|
        frame[:pitch] = 32
      end
    end

    attr_reader :input
  end
end

