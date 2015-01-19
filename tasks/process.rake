desc 'generates frame data and hex LPC for TMS5220'
task :process do |args|
  options = {}

  OptionParser.new(args) do |opts|
    opts.banner = "Usage: rake generate [options]"
    opts.on("-i", "--input {audiofile}", "Input audio file", String) do |file|
      options[:input] = file
    end
    opts.on("-p", "--pitch {pitch for frames}", "Pitch for frames", String) do |pitch|
      options[:pitch] = pitch
    end

    opts.on("-g", "--gain {gain for frames}", "Gain for frames", String) do |gain|
      options[:gain] = gain
    end

    opts.on("-f", "--frame-size {size in milliseconds}", "Frame size in ms", String) do |frame_size|
      options[:frame_size] = frame_size
    end

    opts.on("-t", "--translate", "Translate K values", String) do |translate|
      options[:translate] = true
    end
  end.parse!

  puts "generating LPC data..."

  start_time = Time.now.to_f

  LPCinator::Processor.generate_lpc options[:input], options

  seconds    = "%0.4f" % (Time.now.to_f - start_time)

  puts "Successfully created LPC in #{seconds} seconds!"

  exit 0
end
