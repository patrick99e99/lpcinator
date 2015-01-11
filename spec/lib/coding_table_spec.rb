require 'spec_helper'

describe LPCinator::CodingTable do

  describe '#reflection_coefficient_for' do
    it 'finds the closest index given a bin and a value' do
      expect(subject.index_for_closest_value(8, 0.25)).to eq(4)
      expect(subject.index_for_closest_value(9, 0.25)).to eq(5)
      expect(subject.index_for_closest_value(1, -1.0)).to eq(0)
      expect(subject.index_for_closest_value(10, 1.0)).to eq(7)
    end
  end
end

