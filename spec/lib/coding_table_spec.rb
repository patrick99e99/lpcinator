require 'spec_helper'

describe LPCinator::CodingTable do

  describe '#index_for_closest_k_value' do
    it 'finds the closest index given a value and bin' do
      expect(subject.index_for_closest_k_value(0.25, :k => 8)).to eq(4)
      expect(subject.index_for_closest_k_value(0.25, :k => 9)).to eq(5)
      expect(subject.index_for_closest_k_value(-1.0, :k => 1)).to eq(0)
      expect(subject.index_for_closest_k_value(1.0, :k => 10)).to eq(7)
    end
  end

  describe '#index_for_closest_rms_value' do
    let(:rms_values_length) { LPCinator::CodingTable::VALUES[:rms].length }

    it 'finds the closest index given a value' do
      expect(subject.index_for_closest_rms_value(-999)).to eq(0)
      expect(subject.index_for_closest_rms_value(2)).to eq(0)
      expect(subject.index_for_closest_rms_value(44)).to eq(1)
      expect(subject.index_for_closest_rms_value(60)).to eq(1)
      expect(subject.index_for_closest_rms_value(80)).to eq(2)
      expect(subject.index_for_closest_rms_value(8000)).to eq(rms_values_length - 1)
      expect(subject.index_for_closest_rms_value(8000)).to eq(rms_values_length - 1)
    end
  end
end

