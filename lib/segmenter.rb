module LPCinator
  class Segmenter < Bufferable
    def initialize(buffer, options)
      @buffer            = buffer
      @number_of_samples = (buffer.sample_rate / 1000 * options.fetch(:size_in_milliseconds)).ceil
      @window_size       = options[:window_size] || 1
    end

    def each_segment
      number_of_segments.times.map do |index|
        segment = new_buffer
        number_of_samples_for_window.times do |t|
          sample = buffer[index * number_of_samples + t] || 0
          segment[t] = sample
        end

        segments << segment

        yield segment, index, segment.real_size
      end
    end

    def segments
      @segments ||= []
    end

  private

    def new_buffer
      LPCinator::Buffer.new(number_of_samples_for_window, buffer.sample_rate)
    end

    def number_of_segments
      buffer.real_size / number_of_samples
    end

    def number_of_samples_for_window
      number_of_samples * window_size
    end

    attr_reader :number_of_samples, :buffer, :window_size
  end
end

