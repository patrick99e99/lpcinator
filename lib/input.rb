module LPCinator
  class Input
    def initialize(options)
      @sound    = RubyAudio::Sound.open(options.fetch(:path))
      @format   = options.fetch(:format, :float)
      @channels = options.fetch(:channels, 1)
    end

    def info
      sound.info
    end

    def total_frames
      info.frames
    end

    def samplerate
      info.samplerate 
    end

    def read
      move_playhead_to 0
      RubyAudio::Buffer.new(format, total_frames, channels).tap do |buffer|
        sound.read(buffer)
      end
    end

    private

    def move_playhead_to(frame)
      sound.seek(frame, IO::SEEK_SET)
    end

    attr_reader :sound, :format, :channels
  end
end

