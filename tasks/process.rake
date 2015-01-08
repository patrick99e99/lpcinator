desc 'lpc generation'
task :process do |args|
  options = {}

  OptionParser.new(args) do |opts|
    opts.banner = "Usage: rake generate [options]"
    opts.on("-i", "--input {audiofile}", "Input audio file", String) do |file|
      options[:input] = file
    end
  end.parse!

  puts "generating LPC data..."

  start_time = Time.now.to_f

  LPCinator::Processor.process! 'audio/inc.wav'

  seconds    = "%0.4f" % (Time.now.to_f - start_time)

  puts "Successfully processed #{input.info.frames} samples in #{seconds} seconds!"

  exit 0
end
