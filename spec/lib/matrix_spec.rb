require 'spec_helper'

describe LPCinator::Matrix do
  let(:row_1) { 1 }
  let(:row_2) { 2 }
  let(:row_3) { 3 }

  describe 'elements' do
    subject { described_class.new(:rows => 3, :columns => 3, :values => [[1,2,3],4,5]).elements }

    specify do
      expect(subject).to eq([[1,2,3],
                             [4,4,4],
                             [5,5,5]])
    end
  end

  describe 'accessing elements' do
    subject { described_class.new(:rows => 2, :columns => 2, :values => [[0,1],[2,3]]) }

    specify { expect(subject[0,0]).to be_nil }
    specify { expect(subject[0,1]).to be_nil }
    specify { expect(subject[1,0]).to be_nil }
    specify { expect(subject[1,1]).to eq(0) }
    specify { expect(subject[1,2]).to eq(1) }
    specify { expect(subject[2,1]).to eq(2) }
    specify { expect(subject[2,2]).to eq(3) }
    specify { expect(subject[2,3]).to be_nil }
  end

  describe 'setting elements' do
    subject { described_class.new(:rows => 2, :columns => 2, :values => [[0,1],[2,3]]) }

    specify do
      subject[1,1] = 4
      expect(subject).to eq([[4,1],
                             [2,3]])
    end
  end

  describe 'vertical columns' do
    describe 'row_at_column' do
      subject { described_class.new(:rows => 2, :columns => 2, :values => [[0,1],[2,3]]).row_at_column(2) }

      specify do
        expect(subject).to be_a(LPCinator::Matrix::Row)
        expect(subject).to eq([1,3])
      end
    end

    describe 'setting vertical columns' do
      subject { described_class.new(:rows => 2, :columns => 2, :values => [[0,1],[2,3]]) }

      specify do
        expect(subject).to eq([[0,1],
                               [2,3]])

        vertical = subject.row_at_column(2)
        vertical[1] = 999
        expect(vertical).to eq [999,3]
        expect(subject).to eq([[0,999],
                               [2,3]])
      end
    end
  end
end
