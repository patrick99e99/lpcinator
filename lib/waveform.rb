module LPCinator
  class Waveform
    attr_reader :sample_rate, :duration, :phase, :amplitude, :frequency, :channels, :output

    def initialize(options = {})
      @sample_rate = options[:sample_rate] || 44100
      @duration    = options[:duration]    || 1000
      @phase       = options[:phase]       || 0
      @amplitude   = options[:amplitude]   || 100
      @frequency   = [options[:frequency]  || 440].flatten
      @channels    = options[:channels]    || 1
      @output      = options[:output]      || 'audio/waveform.wav'
    end

    def buffer
      @buffer ||= LPCinator::Buffer.new(number_of_samples, sample_rate).tap do |buffer|
        degree = 0
        number_of_samples.times do |t|
          degree += 1
          value = frequency.inject(0) do |accumulator, freq|
            sine = Math.sin(2.0 * Math::PI * freq * degree / sample_rate)
            accumulator += (sine * amplitude / frequency.size)
          end
          buffer[t] = value
        end
      end
    end
    
    def generate!
      info = RubyAudio::SoundInfo.new(
        :channels => channels, 
        :samplerate => sample_rate, 
        :format => RubyAudio::FORMAT_WAV|RubyAudio::FORMAT_PCM_32,
      )

      file = LPCinator::Output.new(:path => output, :info => info, :buffer => buffer)
      file.write!
    end

    def description
      { :sample_rate => sample_rate,
        :duration    => duration,
        :phase       => phase,
        :amplitude   => amplitude,
        :frequency   => frequency,
        :channels    => channels }
    end

    def number_of_samples
      ((duration / 1000.0) * sample_rate).to_i
    end

  private
    
    def amplitude
      @amplitude / 100.0
    end
  end
end
