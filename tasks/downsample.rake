desc 'downsample'
task :downsample do
  options = {}

  OptionParser.new do |opts|
    opts.banner = "Usage: rake generate [options]"
    opts.on("-i", "--input {audiofile}", "Input audio file", String) do |file|
      options[:input] = file
    end
    opts.on("-o", "--output {audiofile}", "Output audio file", String) do |file|
      options[:output] = file
    end
    opts.on("-s", "--sample rate {samplerate}", "Target sample rate in hz", String) do |sr|
      options[:sample_rate] = sr
    end
    args = opts.order!(ARGV) {}
    opts.parse!(args)
  end

  options[:sample_rate] ||= 8000

  puts "generating downsampled version at #{options[:sample_rate]}hz..."

  start_time      = Time.now.to_f

  input           = LPCinator::Input.new(options[:input])
  buffer          = input.read

  downsampled     = LPCinator::Downsampler.converted(buffer, options[:sample_rate])

  info            = input.info.clone
  info.samplerate = options[:sample_rate]

  output          = LPCinator::Output.new(downsampled, :path => options[:output], :info => info)
  output.write!

  seconds         = "%0.4f" % (Time.now.to_f - start_time)

  puts "Successfully processed #{input.info.frames} samples in #{seconds} seconds!"

  exit 0
end
