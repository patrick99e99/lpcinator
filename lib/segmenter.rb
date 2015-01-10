module LPCinator
  class Segmenter < Bufferable
    def each_buffer(config, &block)
      new(config).each_buffer(block)
    end

    def initialize(buffer, config)
      @buffer            = buffer
      @number_of_samples = config.fetch(:samplerate) / 1000 * config.fetch(:size_in_milliseconds)
    end

    def each_segment
      number_of_segments.times do |index|
        segment = new_buffer
        number_of_samples.times do |t|
          sample = buffer[index * number_of_samples + t]
          break if !sample

          segment[t] = sample
        end

        yield segment
      end
    end

  private

    def new_buffer
      RubyAudio::Buffer.new(buffer.type, number_of_samples, buffer.channels)
    end

    def number_of_segments
      buffer.real_size / number_of_samples
    end

    attr_reader :number_of_samples, :buffer
  end
end
