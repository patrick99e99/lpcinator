class Waveform
  attr_reader :samplerate, :duration, :phase, :amplitude, :frequency, :channels, :output

  def initialize(options = {})
    @samplerate = options[:samplerate] || 44100
    @duration   = options[:duration]   || 1000
    @phase      = options[:phase]      || 0
    @amplitude  = options[:amplitude]  || 100
    @frequency  = [options[:frequency] || 440].flatten
    @channels   = options[:channels]   || 1
    @output     = options[:output]     || 'audio/waveform.wav'
  end
  
  def generate!
    buffer = RubyAudio::Buffer.float(number_of_samples)
    degree = 0
    number_of_samples.times do |t|
      degree += 1
      value = frequency.inject(0) do |accumulator, freq|
        sine = Math.sin(2.0 * Math::PI * freq * degree / samplerate)
        accumulator += (sine * amplitude / frequency.size)
      end
      buffer[t] = value
    end

    file.write(buffer)
    file.close
  end

  def description
    { :samplerate => samplerate,
      :duration   => duration,
      :phase      => phase,
      :amplitude  => amplitude,
      :frequency  => frequency,
      :channels   => channels }
  end

  def number_of_samples
    (duration / 1000) * samplerate
  end

private

  def file
    @file ||= begin
      info = RubyAudio::SoundInfo.new(
        :channels => channels, 
        :samplerate => samplerate, 
        :format => RubyAudio::FORMAT_WAV|RubyAudio::FORMAT_PCM_32,
      )
      RubyAudio::Sound.open(output, 'w', info) 
    end
  end
  
  def amplitude
    @amplitude / 100.0
  end

end

