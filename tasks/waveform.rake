desc 'generate test waveform wav file'
task :waveform do |args|
  options = {}

  OptionParser.new(args) do |opts|
    opts.banner = "Usage: rake test_waveform [options]"
    [
      { :output => "Output file for test waveform" },
      { :samplerate => "Sample rate" },
      { :duration => "Length of signal" },
      { :phase => "Phase shift of signal" },
      { :amplitude => "Amplitude of signal" },
      { :frequency => "Frequency in hz" },
      { :channels => "Number of channels" },
    ].each do |hash|
      hash.each do |option, desc|
        opts.on("-#{option.to_s[0]}", "--#{option} {value}", desc, String) do |value|
          if value.include?(',') 
            options[option] = value.split(',').map(&:to_i).uniq
          else
            options[option] = value.to_i
          end
        end
      end
    end
  end.parse!

  waveform = Waveform.new(options)
  puts "Creating waveform at #{waveform.output} with #{waveform.info}"
  waveform.generate!
  puts "Success!"

  exit 0
end
