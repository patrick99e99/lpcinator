module LPCinator
  class Output
    def self.aif_format
      RubyAudio::FORMAT_AIFF|RubyAudio::FORMAT_PCM_16
    end

    def self.wav_format
      RubyAudio::FORMAT_WAV|RubyAudio::FORMAT_PCM_16
    end

    def self.write!(buffer, options)
      new(buffer, options).write!
    end

    def initialize(buffer, options)
      @sound  = RubyAudio::Sound.open(options.fetch(:path), 'w', info_with_defaults(options))
      @buffer = buffer
    end

    def write!
      sound.write(buffer)
      sound.close
    end

    private

    def info_with_defaults(options)
      return options[:info] if options[:info] && options[:info].is_a?(RubyAudio::SoundInfo)

      RubyAudio::SoundInfo.new(
        :channels =>   options[:channels]    || 1, 
        :samplerate => options[:sample_rate] || 44100, 
        :format =>     options[:format]      || self.class.aif_format
      )
    end

    attr_reader :sound, :buffer
  end
end


