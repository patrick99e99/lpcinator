desc 'autocorrelation function'
task :autocorrelation do |args|
  options = {}

  OptionParser.new(args) do |opts|
    opts.banner = "Usage: rake generate [options]"
    opts.on("-i", "--input {audiofile}", "Input audio file", String) do |file|
      options[:input] = file
    end
  end.parse!

  puts "generating pre emphasis file..."

  start_time = Time.now.to_f

  input      = LPCinator::Input.new(:path => options[:input])
  buffer     = input.read

  processor  = LPCinator::Autocorrelation.new(buffer)
  processor.process!

  seconds    = "%0.4f" % (Time.now.to_f - start_time)

  puts "Successfully processed #{input.info.frames} samples in #{seconds} seconds!"

  exit 0
end
