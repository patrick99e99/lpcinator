module LPCinator
  class Input
    def initialize(path)
      @sound = RubyAudio::Sound.open(path)
    end

    def info
      sound.info
    end

    def total_frames
      info.frames
    end

    def sample_rate
      info.samplerate 
    end

    def read
      move_playhead_to 0
      LPCinator::Buffer.new(total_frames, sample_rate).tap do |buffer|
        sound.read(buffer)
      end
    end

    private

    def move_playhead_to(frame)
      sound.seek(frame, IO::SEEK_SET)
    end

    attr_reader :sound, :type, :channels
  end
end

