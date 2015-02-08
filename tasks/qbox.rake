desc 'generate hex byte stream from QboxPro frame data'
task :qbox do
  options = {}

  OptionParser.new do |opts|
    opts.banner = "Usage: rake generate [options]"
    opts.on("-i", "--input {qbox frame file}", "Input qbox frame file", String) do |file|
      options[:input] = file
    end

    opts.on("-p", "--pitch {pitch for frames}", "Pitch for frames", String) do |pitch|
      options[:pitch] = pitch
    end

    opts.on("-g", "--gain {gain for frames}", "Gain for frames", String) do |gain|
      options[:gain] = gain
    end

    opts.on("-t", "--translate", "Translate parameters", String) do |translate|
      options[:translate] = true
    end
    args = opts.order!(ARGV) {}
    opts.parse!(args)
  end

  puts "generating LPC data..."

  start_time = Time.now.to_f

  LPCinator::QboxFrameParser.to_hex_byte_stream options[:input], options

  seconds    = "%0.4f" % (Time.now.to_f - start_time)

  puts "Successfully created LPC in #{seconds} seconds!"

  exit 0
end
