module LPCinator
  class FrameDataGainNormalizer
    MAX_GAIN = 14 # for some reason, the TMS5220.c simulator breaks when it plays a frame with gain of 15, so we use 14 as our loudest value

    def self.normalize!(frame_data)
      new(frame_data).normalize!
    end

    def initialize(frame_data)
      @frame_data = frame_data
    end

    def normalize!
      frame_data.each do |frame|
        frame[:gain] = (frame[:gain] * ratio).round
      end
    end

    private

    def max_gain_in_frame_data
      @max_gain_in_frame_data ||= frame_data.map {|frame| frame[:gain] }.max
    end

    def ratio
      @ratio ||= MAX_GAIN / max_gain_in_frame_data.to_f
    end

    attr_reader :frame_data
  end
end

