$:.push File.expand_path('./lib')
require 'ruby-audio'
require 'config'
require 'lpc'
require 'optparse'
require 'pry'
require 'waveform'
require 'pre_emphasis'

desc 'convert audio file to LPC'
task :generate do |args|
  options = {}

  OptionParser.new(args) do |opts|
    opts.banner = "Usage: rake generate [options]"
    opts.on("-f", "--file {audiofile}", "Audio file to convert to LPC", String) do |file|
      options[:file] = file
    end
  end.parse!

  puts "generating linear predictive coding for TMS5220 & friends..."

  start_time = Time.now.to_f
  config     = LPC::Config.new
  generator  = LPC::Generator.new(options[:file], config)
  generator.process!
  seconds    = "%0.4f" % (Time.now.to_f - start_time)

  puts "Successfully processed #{generator.total_frames} samples in #{seconds} seconds!"

  exit 0
end

task :pre_emphasis do |args|
  options = {}

  OptionParser.new(args) do |opts|
    opts.banner = "Usage: rake generate [options]"
    opts.on("-f", "--file {audiofile}", "Input audio file", String) do |file|
      options[:file] = file
    end
  end.parse!

  puts "generating linear predictive coding for TMS5220 & friends..."

  start_time = Time.now.to_f
  config     = LPC::Config.new
  emphasis   = LPC::PreEmphasis.new(options[:file], config)
  emphasis.process!
  seconds    = "%0.4f" % (Time.now.to_f - start_time)

  puts "Successfully processed #{emphasis.total_frames} samples in #{seconds} seconds!"

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
