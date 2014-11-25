class Waveform
  attr_accessor :samplerate, :duration, :phase, :amplitude, :frequency, :channels, :output
  
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
        formula = 2 * Math::PI * freq * degree / (samplerate.to_f)
        sine = Math.sin(formula)
        accumulator += (sine * amplitude / frequency.size) 
      end
      buffer[t] = value
    end

    file.write(buffer)
    file.close
  end

  def number_of_samples
    (duration / 1000) * samplerate
  end

  def amplitude
    @amplitude / 100.0
  end

  def info
    { :samplerate => samplerate,
      :duration   => duration,
      :phase      => phase,
      :amplitude  => amplitude,
      :frequency  => frequency,
      :channels   => channels }
  end

private

  def file
    return @file if @file
    info = RubyAudio::SoundInfo.new(
      :channels => channels, 
      :samplerate => samplerate, 
      :format => RubyAudio::FORMAT_WAV|RubyAudio::FORMAT_PCM_32,
    )
    @file ||= RubyAudio::Sound.open(output, 'w', info) 
  end
end

