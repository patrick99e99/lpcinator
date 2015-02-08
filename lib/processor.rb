module LPCinator
  class Processor
    DEFAULT_FRAME_SIZE = 25

    def self.byte_stream(path, options = {})
      puts
      puts new(path, options).byte_stream
    end

    def self.frame_data(path, options = {})
      puts
      new(path, options).frame_data.each_with_index do |frame, index|
        puts "#{index}: #{frame}" 
      end
    end

    def initialize(path, options = {})
      @input   = Input.new(path)
      @options = options
    end

    def byte_stream
      LPCinator::BitPacker.pack(frame_data)
    end

    def frame_data
      LPCinator::RMSNormalizer.normalize!(parameters)

      parameters.each_with_index.map do |parameters, index|
        pitch = options[:whisper] ? 0 : ((options[:pitch] && options[:pitch][0].to_i > 0) ? options[:pitch][0].to_i : pitch_table[index])

        frame = LPCinator::FrameDataBuilder.create_for(parameters, pitch, options)
        frame if (options[:unvoiced]  && frame[:pitch] && frame[:pitch].zero?)  ||
                 (options[:voiced]    && frame[:pitch] && !frame[:pitch].zero?) ||
                 (!options[:unvoiced] && !options[:voiced])
      end.compact
    end

    private

    def pitch_table
      @pitch_table ||= pitch_segmenter.each_segment do |segment, index|
        pre_emphasized_segment = pre_emphasized_segmenter.segments[index]
        LPCinator::PitchEstimator.pitch_for_period(segment, pre_emphasized_segment)
      end
    end

    def pre_emphasized_buffer
      @pre_emphasized_buffer ||= begin
        input.read.tap { |buffer| LPCinator::PreEmphasis.process!(buffer) }
      end
    end

    def pre_emphasized_segmenter
      @pre_emphasized_segmenter ||= LPCinator::Segmenter.new(pre_emphasized_buffer, size_in_milliseconds: frame_size)
    end

    def pitch_segmenter
      @pitch_segmenter ||= LPCinator::Segmenter.new(input.read, size_in_milliseconds: frame_size, window_size: 2)
    end

    def frame_size
      (options[:frame_size] && options[:frame_size].to_i) || DEFAULT_FRAME_SIZE 
    end

    def parameters
      @parameters ||= pre_emphasized_segmenter.each_segment do |segment, index, number_of_samples|
        LPCinator::HammingWindow.process!(segment)

        autocorrelation_coefficients = LPCinator::Autocorrelator.coefficients_for(segment)
        LPCinator::Reflector.translate(autocorrelation_coefficients, number_of_samples)
      end
    end

    attr_reader :input, :options
  end
end

