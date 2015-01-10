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

  LPCinator::Processor.generate_lpc options[:input]

  seconds    = "%0.4f" % (Time.now.to_f - start_time)

  puts "Successfully created LPC in #{seconds} seconds!"

  exit 0
end
