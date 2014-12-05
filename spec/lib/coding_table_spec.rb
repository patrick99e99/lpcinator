require 'spec_helper'

describe LPCinator::CodingTable do

  describe '#reflection_coefficient_for' do
    it 'finds the closest index given a bin and a value' do
      expect(subject.reflection_coefficient_for(8, 5000)).to eq(4)
      expect(subject.reflection_coefficient_for(9, 5000)).to eq(5)
      expect(subject.reflection_coefficient_for(1, -31969)).to eq(1)
      expect(subject.reflection_coefficient_for(1, -31967)).to eq(1)
      expect(subject.reflection_coefficient_for(10, 999999)).to eq(7)
      expect(subject.reflection_coefficient_for(10, -999999)).to eq(0)
    end
  end
end

