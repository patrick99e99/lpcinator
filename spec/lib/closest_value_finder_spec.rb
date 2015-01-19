require 'spec_helper'

describe LPCinator::ClosestValueFinder do

  describe '#index_or_translated_value' do
    it 'finds the closest index given an actual value and a list of values' do
      expect(subject.index_or_translated_value(0.25, [0, 1], false)).to eq(0)
      expect(subject.index_or_translated_value(0.75, [0, 1], false)).to eq(1)
      expect(subject.index_or_translated_value(-1, [0, 1], false)).to eq(0)
      expect(subject.index_or_translated_value(2, [0, 1], false)).to eq(1)
    end

    describe 'translate' do
      it 'returns the translation' do
        expect(subject.index_or_translated_value(50, [100, 200], true)).to eq(100)
        expect(subject.index_or_translated_value(250, [100, 200], true)).to eq(200)
      end
    end
  end
end

