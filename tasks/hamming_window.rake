desc 'hamming window generator'
task :hamming_window do |args|
  options = {}

  OptionParser.new(args) do |opts|
    opts.banner = "Usage: rake generate [options]"
    opts.on("-i", "--input {audiofile}", "Input audio file", String) do |file|
      options[:input] = file
    end
    opts.on("-o", "--output {audiofile}", "Output audio file", String) do |file|
      options[:output] = file
    end
  end.parse!

  puts "generating hamming window file..."

  start_time = Time.now.to_f
  input      = LPCinator::Input.new(:path => options[:input])
  buffer     = input.read

  processor  = LPCinator::HammingWindow.new(buffer, { :samplerate => input.samplerate, :size => 20, :overlap => 5 })
  processor.process!

  output     = LPCinator::Output.new(:path => options[:output], :info => input.info, :buffer => buffer)
  output.write!

  seconds    = "%0.4f" % (Time.now.to_f - start_time)

  puts "Successfully processed #{input.info.frames} samples in #{seconds} seconds!"

  exit 0
end
