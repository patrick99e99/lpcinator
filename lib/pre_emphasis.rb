module LPCinator
  class PreEmphasis < Bufferable
    A = -0.9

    def self.process!(buffer)
      new(buffer).process!
    end

    def process!
      pre_energy = buffer.energy

      number_of_samples.times do |t|
        next if t.zero?
        buffer[t] += buffer[t - 1] * A
      end

      LPCinator::Normalizer.process!(buffer, :scale => scale_for(pre_energy, buffer.energy))
    end

  private

    def scale_for(pre_energy, post_energy)
      Math.sqrt(pre_energy / post_energy)
    end
  end
end
