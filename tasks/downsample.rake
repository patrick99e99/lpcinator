desc 'downsample'
task :downsample do |args|
  options = {}

  OptionParser.new(args) do |opts|
    opts.banner = "Usage: rake generate [options]"
    opts.on("-i", "--input {audiofile}", "Input audio file", String) do |file|
      options[:input] = file
    end
    opts.on("-o", "--output {audiofile}", "Output audio file", String) do |file|
      options[:output] = file
    end
    opts.on("-s", "--sample rate {samplerate}", "Target sample rate", String) do |sr|
      options[:sample_rate] = sr
    end
  end.parse!

  puts "generating downsampled version..."

  start_time   = Time.now.to_f

  input        = LPCinator::Input.new(options[:input])
  buffer       = input.read

  options[:sample_rate] ||= 8000
  downsampled  = LPCinator::Downsampler.converted(buffer, options[:sample_rate])

  input.info.samplerate = options[:sample_rate]
  output       = LPCinator::Output.new(:path => options[:output], :info => input.info, :buffer => downsampled)
  output.write!

  seconds      = "%0.4f" % (Time.now.to_f - start_time)

  puts "Successfully processed #{input.info.frames} samples in #{seconds} seconds!"

  exit 0
end
