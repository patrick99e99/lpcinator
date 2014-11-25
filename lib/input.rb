module LPCinator
  class Input
    def initialize(options)
      @sound  = RubyAudio::Sound.open(options.fetch(:path))
      @config = options.fetch(:config)
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
      RubyAudio::Buffer.new(config.format, total_frames, config.channels).tap do |buffer|
        sound.read(buffer)
      end
    end

    private

    def move_playhead_to(frame)
      sound.seek(frame, IO::SEEK_SET)
    end

    attr_reader :sound, :config
  end
end

