desc 'low pass filter'
task :chebychev do |args|
  options = {}

  OptionParser.new(args) do |opts|
    opts.banner = "Usage: rake generate [options]"
    opts.on("-i", "--input {audiofile}", "Input audio file", String) do |file|
      options[:input] = file
    end
    opts.on("-o", "--output {audiofile}", "Output audio file", String) do |file|
      options[:output] = file
    end
    
    opts.on("-c", "--cutoff {cutoff}", "Cutoff frequency", String) do |cutoff|
      options[:cutoff] = cutoff
    end
    
    opts.on("-t", "--time {time}", "Sample period in milliseconds", String) do |time|
      options[:time] = time
    end
  end.parse!

  puts "low pass filtering with a cutoff of #{options[:cutoff]}..."

  start_time = Time.now.to_f

  input      = LPCinator::Input.new(:path => options[:input])
  buffer     = input.read

  LPCinator::Chebychev.low_pass!(buffer, options[:cutoff].to_f, options[:time] || 0.1)

  output     = LPCinator::Output.new(buffer, :path => options[:output], :info => input.info)
  output.write!

  seconds    = "%0.4f" % (Time.now.to_f - start_time)

  puts "Successfully processed #{input.info.frames} samples in #{seconds} seconds!"

  exit 0
end
