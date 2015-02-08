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
    opts.on("-c", "--cutoff frequency {cutoff}", "Low pass frequency in hz", String) do |cutoff|
      options[:cutoff] = cutoff
    end
    args = opts.order!(ARGV) {}
    opts.parse!(args)
  end

  options[:sample_rate] ||= 8000

  puts "generating downsampled version at #{options[:sample_rate]}hz with lowpass of #{options[:cutoff] || options[:sample_rate].to_f / 2}hz..."

  start_time      = Time.now.to_f

  input           = LPCinator::Input.new(options[:input])
  buffer          = input.read

  downsampled     = LPCinator::Downsampler.converted(buffer, options[:sample_rate], { :cutoff_in_hz => options[:cutoff] })

  info            = input.info.clone
  info.channels   = 1
  info.samplerate = options[:sample_rate]

  LPCinator::Output.write!(downsampled, :path => options[:output], :info => info)

  seconds         = "%0.4f" % (Time.now.to_f - start_time)

  puts "Successfully processed #{input.info.frames} samples in #{seconds} seconds!"

  exit 0
end
