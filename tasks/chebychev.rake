desc 'low pass filter'
task :chebychev do 
  options = {}
  OptionParser.new do |opts|
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

    args = opts.order!(ARGV) {}
    opts.parse!(args)
  end

  puts "low pass filtering with a cutoff of #{options[:cutoff]} hz..."

  start_time = Time.now.to_f

  input      = LPCinator::Input.new(options[:input])
  buffer     = input.read

  LPCinator::Chebychev.low_pass!(buffer, options[:cutoff].to_f, { :time => options[:time] })

  LPCinator::Output.write!(buffer, :path => options[:output], :info => input.info.clone)

  seconds    = "%0.4f" % (Time.now.to_f - start_time)

  puts "Successfully processed #{input.info.frames} samples in #{seconds} seconds!"

  exit 0
end
