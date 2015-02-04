module LPCinator
  class PitchEstimator < Bufferable
    LOWPASS_CUTOFF_FREQUENCY_IN_HZ = 800
    MINIMUM_PITCH_IN_HZ            = 50.0
    MAXIMUM_PITCH_IN_HZ            = 200.0
    SUB_MULTIPLE_THRESHOLD         = 0.9

    def self.pitch_for_period(buffer, pre_emphasized_buffer)
      new(buffer, pre_emphasized_buffer).pitch_for_period
    end

    def initialize(buffer, pre_emphasized_buffer)
      super(buffer)
      @pre_emphasized_buffer = pre_emphasized_buffer
    end

    def pitch_for_period
      LPCinator::Chebychev.low_pass!(buffer, LOWPASS_CUTOFF_FREQUENCY_IN_HZ) 

      if energy_mismatch?
      end

      if out_of_range?
        return 0
      end

      print "."
      perform_pitch_detection!
    end

  private

    def energy_mismatch?
      pre_emphasized_buffer.energy > buffer.energy
    end

    def out_of_range?
      normalized[best_period_index] < normalized[best_period_index - 1] &&
      normalized[best_period_index] < normalized[best_period_index + 1] 
    end

    def interpolated
      middle = normalized[best_period_index]
      left   = normalized[best_period_index - 1]
      right  = normalized[best_period_index + 1]

      best_period_index + 0.5 * (right - left) / (2 * middle - left - right)
    end

    def perform_pitch_detection!
      maximum_multiple = best_period_index / minimum_period
      found = false

      estimate = interpolated
      return 0 if estimate.nan?

      while !found && maximum_multiple >= 1
        sub_multiples_are_strong = true

        maximum_multiple.times do |t|
          sub_multiple_period = ((t + 1) * estimate / maximum_multiple + 0.5).to_i

          if normalized[sub_multiple_period] && normalized[sub_multiple_period] < SUB_MULTIPLE_THRESHOLD * normalized[best_period_index]
            sub_multiples_are_strong = false
          end
        end

        if sub_multiples_are_strong
          estimate /= maximum_multiple 
          found = true
        end

        maximum_multiple -= 1
      end

      estimate
    end

    def normalized
      @normalized ||= Autocorrelator.normalized_for(buffer, minimum_period - 1, maximum_period + 1)
    end

    def best_period_index
      @best_period ||= begin
        best_period = minimum_period
        (minimum_period + 1..maximum_period).each do |period|
          best_period = period if normalized[period] > normalized[best_period]
        end
        best_period
      end
    end

    def sample_rate
      buffer.sample_rate
    end

    def minimum_period
      (sample_rate / MAXIMUM_PITCH_IN_HZ - 1).to_i
    end

    def maximum_period
      (sample_rate / MINIMUM_PITCH_IN_HZ + 1).to_i
    end

    attr_reader :pre_emphasized_buffer
  end
end
