desc 'generates frame data and hex LPC for TMS5220'
namespace :process do
  def parse_options
    {}.tap do |options|
      OptionParser.new do |opts|
        opts.banner = "Usage: rake generate [options]"
        opts.on("-i", "--input {audiofile}", "Input audio file", String) do |file|
          options[:input] = file
        end
        opts.on("-p", "--pitch {pitch for frames}", "Pitch for frames", String) do |pitch|
          options[:pitch] = pitch
        end

        opts.on("-g", "--gain {gain for frames}", "Gain modification for all frames", String) do |gain|
          options[:gain] = gain
        end

        opts.on("-f", "--frame-size {size in milliseconds}", "Frame size in ms", String) do |frame_size|
          options[:frame_size] = frame_size
        end

        opts.on("-t", "--translate", "Translate K values", String) do |translate| 
          options[:translate] = true
        end

        opts.on("--unvoiced-gain {amount}", "Gain modification for unvoiced frames", String) do |unvoiced|
          options[:unvoiced_gain] = unvoiced
        end

        opts.on("--voiced-gain {amount}", "Gain modification for unvoiced frames", String) do |voiced|
          options[:voiced_gain] = voiced
        end

        opts.on("--unvoiced-only", "Display only unvoiced frames", String) do |unvoiced|
          options[:unvoiced] = true
        end

        opts.on("--voiced-only", "Display only voiced frames", String) do |voiced|
          options[:voiced] = true
        end

        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          exit
        end

        yield opts if block_given?

        args = opts.order!(ARGV) {}
        opts.parse!(args)
      end
    end
  end

  task :byte_stream do 
    options = parse_options

    print "generating LPC hex byte stream"

    start_time = Time.now.to_f

    LPCinator::Processor.byte_stream options[:input], options

    seconds = "%0.4f" % (Time.now.to_f - start_time)

    puts "Successfully created LPC in #{seconds} seconds!"

    exit 0
  end

  task :frame_data do 
    options = parse_options do |opts|
      opts.on("-w", "--whisper", "Whisper speech", String) do |whisper|
        options[:whisper] = true
      end
    end

    print "generating LPC frame data..."

    start_time = Time.now.to_f

    LPCinator::Processor.frame_data options[:input], options

    seconds    = "%0.4f" % (Time.now.to_f - start_time)

    puts "Successfully created LPC in #{seconds} seconds!"

    exit 0
  end
end
