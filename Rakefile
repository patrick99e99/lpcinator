$:.push File.expand_path('./lib')
require 'optparse'
require 'pry'
require 'lpcinator'

task :pre_emphasis do |args|
  options = {}

  OptionParser.new(args) do |opts|
    opts.banner = "Usage: rake generate [options]"
    opts.on("-i", "--input {audiofile}", "Input audio file", String) do |file|
      options[:input] = file
    end
    opts.on("-o", "--output {audiofile}", "Output audio file", String) do |file|
      options[:output] = file
    end
  end.parse!

  puts "generating pre emphasis file..."

  start_time = Time.now.to_f
  config     = LPCinator::Config.new

  input      = LPCinator::Input.new(:path => options[:input], :config => config)
  buffer     = input.read

  emphasis   = LPCinator::PreEmphasis.new(buffer)
  emphasis.process!

  output     = LPCinator::Output.new(:path => options[:output], :info => input.info, :buffer => buffer)
  output.write!

  seconds    = "%0.4f" % (Time.now.to_f - start_time)

  puts "Successfully processed #{input.info.frames} samples in #{seconds} seconds!"

  exit 0
end

task :autocorrelate do |args|
  options = {}

  OptionParser.new(args) do |opts|
    opts.banner = "Usage: rake generate [options]"
    opts.on("-i", "--input {audiofile}", "Input audio file", String) do |file|
      options[:input] = file
    end
  end.parse!

  puts "generating pre emphasis file..."

  start_time = Time.now.to_f
  config     = LPCinator::Config.new

  input      = LPCinator::Input.new(:path => options[:input], :config => config)
  buffer     = input.read

  a   = LPCinator::Autocorrelation.new(buffer)
  a.process!

  seconds    = "%0.4f" % (Time.now.to_f - start_time)

  puts "Successfully processed #{input.info.frames} samples in #{seconds} seconds!"

  exit 0
end

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
