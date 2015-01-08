module LPCinator
  class Segmenter < Bufferable

    def initialize(size)
      @size = size
    end

    def next(index)
      RubyAudio::Buffer.new(buffer.type, size, buffer.channels).tap do |frames|
        size.times do |t|
          frames[t] = buffer[index * size + t]
        end
      end
    end

  private

    attr_reader :size
  end
end
