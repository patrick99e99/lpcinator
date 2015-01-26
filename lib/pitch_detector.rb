 module LPCinator
  class PitchDetector < Bufferable
    THRESHOLD = 50

    def self.pitch_for_period(buffer)
      LPCinator::Chebychev.low_pass!(buffer, 0.8, 0.1)
      new(buffer).pitch_for_period
    end

    def initialize(buffer)
      super
      @voicing = true
    end

    def pitch_for_period
      if exceeds_threshold?
        update_peaks_and_perform_pitch_estimations!
        pitch = LPCinator::PitchScorer.pitch_for_period(peak_matrix, peak_levels)
      else
        pitch = 0
      end

      update_peak_locations!
      pitch
    end

  private

    attr_accessor :voicing, :slope

    def voicing?
      !!voicing
    end

    def exceeds_threshold?
      max_sample - min_sample > THRESHOLD
    end

    def peak_matrix
      @peak_matrix ||= LPCinator::Matrix.new(:rows => 9, :columns => 6, :values => [ 0, -20, -50, -90, 0, 0, msec(5), msec(1), 0 ])
    end

    def decays
      @decays ||= begin
        value = peak_matrix[7, 1]
        6.times.map do |t|
          Math.exp(-0.695 / value)
        end
      end 
    end

    def min_pav
      @min_pav ||= msec(4)
    end

    def max_pav
      @max_pav ||= msec(10)
    end

    def peak_levels
      @peak_levels ||= [ msec(1.6), msec(3.2), msec(6.3), msec(12.7), msec(25.5) ]
    end

    def min_sample
      @min_sample ||= buffer.min * (1 << 15)
    end

    def max_sample
      @max_sample ||= buffer.max * (1 << 15)
    end

    def slope_for(t)
      buffer[t + 1] - buffer[t] >= 0 ? 1 : -1
    end

    def positive_peak?
      slope < 0
    end

    def set_peak_matrix_at_row_and_detect!(row, column, t, value)
      peak_matrix[row, column] = value
      detect!(t, column)
    end

    def update_peaks_and_perform_pitch_estimations!
      (number_of_samples - 1).times do |t|
        slope = slope_for(t)

        if (slope != @slope) 
          @slope = slope

          if positive_peak? 
            peak_matrix[6,1] = peak_matrix[5,1]
            set_peak_matrix_at_row_and_detect!(5, 1, t, buffer[t])
            set_peak_matrix_at_row_and_detect!(5, 2, t, buffer[t] + peak_matrix[5,4])
            set_peak_matrix_at_row_and_detect!(5, 3, t, buffer[t] - peak_matrix[6,1])
          else 
            peak_matrix[6,4] = peak_matrix[5,4]
            set_peak_matrix_at_row_and_detect!(5, 4, t, -buffer[t])
            set_peak_matrix_at_row_and_detect!(5, 5, t, -buffer[t] + peak_matrix[5,1])
            set_peak_matrix_at_row_and_detect!(5, 6, t, -buffer[t] - peak_matrix[6,4])
          end
        end
      end
    end 

    def update_peak_locations!
      (1..6).each do |i|
        (1..4).each do |j|
          peak_matrix[j,i] = peak_matrix[j,i] - number_of_samples
        end
      end
    end

    def detect!(index, column)
      row = peak_matrix.row_at_column(column)
      decay = decays[column - 1]

      idle_time = index - row[1] - row[8]
      return if idle_time < 0

      threshold = row[9] * decay ** idle_time
      return if threshold > row[5]

      row[9] = row[5]
      row[4] = row[3]
      row[3] = row[2]
      row[2] = row[1]
      row[1] = index

      if voicing?
        row[7] = (row[7] + row[1] - row[2]) / 2
        
        row[7] = min_pav if row[7] < min_pav
        row[7] = max_pav if row[7] > max_pav

        row[8] = 0.4 * row[7] + 0.5
        @decays[column - 1] = Math.exp(-0.695 / row[7])
      end
    end

    def msec(number)
      number * 1000 / sample_period
    end

    def sample_period
      @sample_period ||= 1.0 / buffer.sample_rate * 1000000
    end

  end
end
