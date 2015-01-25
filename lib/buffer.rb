module LPCinator
  class Buffer < ::RubyAudio::Buffer
    CHANNELS = 1
    TYPE     = :float

    attr_reader :sample_rate

    def initialize(number_of_samples, sample_rate)
      @sample_rate = sample_rate
      super(TYPE, number_of_samples, CHANNELS)
    end
  end
end
