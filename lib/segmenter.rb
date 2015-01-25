module LPCinator
  class Segmenter < Bufferable
    def initialize(buffer, config)
      @buffer            = buffer
      @number_of_samples = buffer.sample_rate / 1000 * config.fetch(:size_in_milliseconds)
    end

    def each_segment
      number_of_segments.times.map do |index|
        segment = new_buffer
        number_of_samples.times do |t|
          sample = buffer[index * number_of_samples + t]
          break if !sample

          segment[t] = sample
        end

        yield segment, segment.real_size
      end
    end

  private

    def new_buffer
      LPCinator::Buffer.new(number_of_samples, buffer.sample_rate)
    end

    def number_of_segments
      buffer.real_size / number_of_samples
    end

    attr_reader :number_of_samples, :buffer
  end
end

