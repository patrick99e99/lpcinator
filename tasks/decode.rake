desc 'convert LPC hex into frame data'
task :decode do 
  options = {}

  OptionParser.new do |opts|
    opts.banner = "Usage: rake generate [options]"
    opts.on("-i", "--input {lpc}", "Input lpc file", String) do |file|
      options[:input] = file
    end
    args = opts.order!(ARGV) {}
    opts.parse!(args)
  end

  print "generating LPC frame data\n"

  start_time = Time.now.to_f

  original_byte_stream = File.read(options[:input])

  frame_data = LPCinator::BitPacker.unpack(original_byte_stream)
  
  frame_data.each_with_index do |frame, idx|
    puts "#{idx}: #{frame.inspect}"
  end
  byte_stream = LPCinator::BitPacker.pack frame_data
  puts "original:\n"
  puts original_byte_stream
  puts "reconstructed:\n"
  puts byte_stream

  seconds = "%0.4f" % (Time.now.to_f - start_time)

  puts "Successfully created LPC in #{seconds} seconds!"

  exit 0
end
