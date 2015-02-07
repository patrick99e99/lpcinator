desc 'convert LPC hex into frame data'
task :decode do |args|
  options = {}

  OptionParser.new(args) do |opts|
    opts.banner = "Usage: rake generate [options]"
    opts.on("-i", "--input {lpc}", "Input lpc file", String) do |file|
      options[:input] = file
    end
  end.parse!

  print "generating LPC frame data"

  start_time = Time.now.to_f

  options[:input] = 'lpc/welcome_blue_valkrie.lpc'
  byte_stream = File.read(options[:input])

  frame_data = LPCinator::BitPacker.unpack byte_stream
  puts frame_data
  byte_stream = LPCinator::BitPacker.pack frame_data
  puts byte_stream

  seconds = "%0.4f" % (Time.now.to_f - start_time)

  puts "Successfully created LPC in #{seconds} seconds!"

  exit 0
end
