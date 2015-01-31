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
      LPCinator::HexByteStreamer.translate(frame_data)
    end

    def frame_data
      parameters_with_normalized_rms.each_with_index.map do |parameters, index|
        pitch = options[:whisper] ? 0 : (options[:pitch] ? options[:pitch].to_i : pitch_table[index])

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
        #LPCinator::PitchEstimator.pitch_for_period(segment, pre_emphasized_segment)
        100
      end
    end

    def overrides
      [
{:gain=>0},
{:gain=>0},
{:gain=>0},
{:gain=>0},
{:gain=>3, :pitch=>20},
{:gain=>5, :pitch=>20},
{:gain=>13, :pitch=>22},
{:gain=>13, :pitch=>22},
{:gain=>13, :pitch=>22},
{:gain=>9, :pitch=>22},
{:gain=>8, :pitch=>22},
{:gain=>7, :pitch=>22},
{:gain=>9, :pitch=>24},
{:gain=>6, :pitch=>26},
{:gain=>8, :pitch=>30},
{:gain=>10, :pitch=>30},
{:gain=>9, :pitch=>23},
{:gain=>8, :pitch=>23},
{:gain=>8, :pitch=>23},
{:gain=>11, :pitch=>23},
{:gain=>14, :pitch=>23},
{:gain=>14, :pitch=>27},
{:gain=>14, :pitch=>28},
{:gain=>14, :pitch=>29},
{:gain=>14, :pitch=>29},
{:gain=>14, :pitch=>29},
{:gain=>9, :pitch=>32},
{:gain=>8, :pitch=>40},
{:gain=>2, :pitch=>0},
{:gain=>6, :pitch=>0},
{:gain=>7, :pitch=>0},
{:gain=>11, :pitch=>30},
{:gain=>14, :pitch=>30},
{:gain=>14, :pitch=>31},
{:gain=>13, :pitch=>31},
{:gain=>12, :pitch=>31},
{:gain=>11, :pitch=>31},
{:gain=>11, :pitch=>32},
{:gain=>12, :pitch=>33},
{:gain=>14, :pitch=>34},
{:gain=>14, :pitch=>35},
{:gain=>14, :pitch=>38},
{:gain=>14, :pitch=>40},
{:gain=>14, :pitch=>41},
{:gain=>14, :pitch=>43},
{:gain=>14, :pitch=>43},
{:gain=>14, :pitch=>44},
{:gain=>12, :pitch=>42},
{:gain=>8, :pitch=>0},
{:gain=>6, :pitch=>0},
{:gain=>7, :pitch=>0},
{:gain=>7, :pitch=>0},
{:gain=>8, :pitch=>0},
{:gain=>14, :pitch=>45},
{:gain=>14, :pitch=>47},
{:gain=>12, :pitch=>49},
{:gain=>10, :pitch=>50},
{:gain=>8, :pitch=>51},
{:gain=>8, :pitch=>50},
{:gain=>10, :pitch=>50},
{:gain=>3, :pitch=>0},
{:gain=>4, :pitch=>0},
{:gain=>11, :pitch=>32},
{:gain=>9, :pitch=>32},
{:gain=>2, :pitch=>32},
{:gain=>1, :pitch=>32},
{:gain=>2, :pitch=>0},
{:gain=>2, :pitch=>0},
{:gain=>9, :pitch=>35},
{:gain=>11, :pitch=>32},
{:gain=>12, :pitch=>31},
{:gain=>11, :pitch=>30},
{:gain=>11, :pitch=>29},
{:gain=>8, :pitch=>29},
{:gain=>8, :pitch=>29},
{:gain=>8, :pitch=>30},
{:gain=>11, :pitch=>30},
{:gain=>12, :pitch=>32},
{:gain=>14, :pitch=>34},
{:gain=>14, :pitch=>35},
{:gain=>14, :pitch=>35},
{:gain=>12, :pitch=>35},
{:gain=>12, :pitch=>36},
{:gain=>11, :pitch=>36},
{:gain=>11, :pitch=>37},
{:gain=>11, :pitch=>37},
{:gain=>14, :pitch=>39},
{:gain=>14, :pitch=>41},
{:gain=>14, :pitch=>47},
{:gain=>14, :pitch=>47},
{:gain=>14, :pitch=>49},
{:gain=>14, :pitch=>49},
{:gain=>14, :pitch=>48},
{:gain=>14, :pitch=>48},
{:gain=>14, :pitch=>47},
{:gain=>14, :pitch=>47},
{:gain=>14, :pitch=>45},
{:gain=>13, :pitch=>43},
{:gain=>13, :pitch=>41},
{:gain=>12, :pitch=>40},
{:gain=>10, :pitch=>39},
{:gain=>9, :pitch=>38},
{:gain=>9, :pitch=>38},
{:gain=>9, :pitch=>40},
{:gain=>9, :pitch=>44},
{:gain=>10, :pitch=>43},
{:gain=>13, :pitch=>44},
{:gain=>14, :pitch=>45},
{:gain=>14, :pitch=>45},
{:gain=>12, :pitch=>43},
{:gain=>12, :pitch=>43},
{:gain=>14, :pitch=>43},
{:gain=>14, :pitch=>43},
{:gain=>13, :pitch=>43},
{:gain=>8, :pitch=>49},
{:gain=>6, :pitch=>46},
{:gain=>9, :pitch=>44},
{:gain=>14, :pitch=>42},
{:gain=>14, :pitch=>43},
{:gain=>12, :pitch=>43},
{:gain=>6, :pitch=>47},
{:gain=>5, :pitch=>47},
{:gain=>2, :pitch=>47},
{:gain=>2, :pitch=>0},
{:gain=>6, :pitch=>0},
{:gain=>6, :pitch=>0},
{:gain=>11, :pitch=>32},
{:gain=>14, :pitch=>36},
{:gain=>14, :pitch=>36},
{:gain=>14, :pitch=>36},
{:gain=>14, :pitch=>36},
{:gain=>14, :pitch=>33},
{:gain=>14, :pitch=>33},
{:gain=>11, :pitch=>34},
{:gain=>5, :pitch=>33},
{:gain=>4, :pitch=>33},
{:gain=>2, :pitch=>20},
{:gain=>3, :pitch=>35},
{:gain=>3, :pitch=>35},
{:gain=>5, :pitch=>35},
{:gain=>9, :pitch=>38},
{:gain=>9, :pitch=>35},
{:gain=>9, :pitch=>35},
{:gain=>11, :pitch=>34},
{:gain=>14, :pitch=>37},
{:gain=>14, :pitch=>38},
{:gain=>13, :pitch=>38},
{:gain=>13, :pitch=>38},
{:gain=>9, :pitch=>38},
{:gain=>5, :pitch=>41},
{:gain=>4, :pitch=>38},
{:gain=>3, :pitch=>41},
{:gain=>3, :pitch=>44},
{:gain=>3, :pitch=>52},
{:gain=>2, :pitch=>40},
{:gain=>9, :pitch=>46},
{:gain=>12, :pitch=>49},
{:gain=>14, :pitch=>52},
{:gain=>14, :pitch=>53},
{:gain=>14, :pitch=>54},
{:gain=>14, :pitch=>54},
{:gain=>14, :pitch=>54},
{:gain=>14, :pitch=>54},
{:gain=>10, :pitch=>52},
{:gain=>10, :pitch=>52},
{:gain=>7, :pitch=>14},
{:gain=>7, :pitch=>14},
{:gain=>3, :pitch=>0},
{:gain=>3, :pitch=>0},
{:gain=>7, :pitch=>14},
{:gain=>5, :pitch=>14},
{:gain=>2, :pitch=>0},
{:gain=>4, :pitch=>0},
{:gain=>9, :pitch=>0},
{:gain=>10, :pitch=>0},
{:gain=>14, :pitch=>56},
{:gain=>13, :pitch=>57},
{:gain=>11, :pitch=>57},
{:gain=>10, :pitch=>58},
{:gain=>11, :pitch=>58},
{:gain=>10, :pitch=>58},
{:gain=>9, :pitch=>58},
{:gain=>9, :pitch=>58},
{:gain=>10, :pitch=>58},
{:gain=>9, :pitch=>59},
{:gain=>8, :pitch=>60},
{:gain=>5, :pitch=>1},
{:gain=>4, :pitch=>1},
{:gain=>2, :pitch=>0},
{:gain=>2, :pitch=>0},
{:gain=>2, :pitch=>0},
{:gain=>2, :pitch=>0},
{:gain=>2, :pitch=>0},
{:gain=>2, :pitch=>0},
{:gain=>2, :pitch=>0},
{:gain=>2, :pitch=>0},
{:gain=>2, :pitch=>0},
{:gain=>2, :pitch=>0},
{:gain=>1, :pitch=>1},
{:gain=>1, :pitch=>3},
{:gain=>1, :pitch=>1},
{:gain=>1, :pitch=>1},
{:gain=>0},
{:gain=>0},
      ]
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

    def parameters_with_normalized_rms
      @parameters_with_normalized_rms ||= LPCinator::RMSNormalizer.normalize!(parameters)
    end

    attr_reader :input, :options
  end
end

