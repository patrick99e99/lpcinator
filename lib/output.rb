module LPCinator
  class Output
    def initialize(options)
      @sound  = RubyAudio::Sound.open(options.fetch(:path), 'w', options.fetch(:info))
      @buffer = options.fetch(:buffer)
    end

    def write!
      sound.write(buffer)
      sound.close
    end

    private

    attr_reader :sound, :buffer
  end
end


