$:.push File.expand_path('./lib')
require 'ruby-audio'
require 'config'
require 'lpc'
require 'optparse'
require 'pry'

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

