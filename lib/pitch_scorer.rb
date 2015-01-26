module LPCinator
  class PitchScorer
    THRESHOLD = 13 

    def self.pitch_for_period(peak_matrix, peak_levels)
      new(peak_matrix, peak_levels).pitch_for_period
    end

    def initialize(peak_matrix, peak_levels)
      @peak_matrix = peak_matrix
      @peak_levels = peak_levels
    end

    def pitch_for_period
      max_score     = -100
      winning_pitch = nil

      (1..6).each do |t|
        candidate = pitch_matrix[1,t]
      
        next unless scorable?(candidate)
        score = score_for(candidate)

        if score > max_score
          max_score = score
          winning_pitch = pitch_matrix[1,t]
        end
      end

      max_score < 0 ? 0 : winning_pitch
    end

  private

    def pitch_matrix
      @pitch_matrix ||= begin
         LPCinator::Matrix.new(:rows => 6, :columns => 6).tap do |pitch_matrix|
           (1..6).each do |i|
             pitch_matrix[1,i] = peak_matrix[1,i] - peak_matrix[2,i]
             pitch_matrix[2,i] = peak_matrix[2,i] - peak_matrix[3,i]
             pitch_matrix[3,i] = peak_matrix[3,i] - peak_matrix[4,i]
             pitch_matrix[4,i] = peak_matrix[1,i] - peak_matrix[3,i]
             pitch_matrix[5,i] = peak_matrix[1,i] - peak_matrix[4,i]
             pitch_matrix[6,i] = peak_matrix[1,i] - peak_matrix[4,i]
          end
        end
      end
    end


    def window_width_matrix
      @window_width_matrix ||= LPCinator::Matrix.new(:rows => 4, :columns => 4, :values => [ [1,2,3,4], [2,4,6,8], [4,8,12,16], [8,16,24,32] ])
    end

    def bias
      @bias ||= [8,6,3,1]
    end

    def window_width_row_for(candidate)
      (1..4).each do |t|
        return t if candidate < peak_levels[t] || t == 4
      end
    end

    def scorable?(candidate)
      candidate > peak_levels.first && candidate < peak_levels.last
    end

    def score_for(candidate)
      window_width_row = window_width_row_for(candidate)
    
      score = 0
      pitch_counter = 0
    
      (1..4).each do |window_width_column|
        width = window_width_matrix[window_width_row, window_width_column]

        (1..6).each do |row|
          (1..6).each do |column|
            if (candidate - pitch_matrix[row, column]).abs <= width
              pitch_counter += 1
            end
          end
        end
        pitch_counter += bias[window_width_column - 1] - THRESHOLD
        score = pitch_counter if pitch_counter.abs > score.abs 
      end

      score
    end

    attr_reader :peak_levels, :peak_matrix
  end
end
