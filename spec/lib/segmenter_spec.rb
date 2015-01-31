require 'spec_helper'

describe LPCinator::Segmenter do
  let(:number_of_samples) { 8 }
  let(:sample_rate)       { 8000 }
  let(:buffer)            { LPCinator::Buffer.new(number_of_samples, sample_rate) }
  let(:options)           { { :size_in_milliseconds => 0.25 } }

  before do
    8.times do |t|
      buffer[t] = 2 ** t
    end
  end

  subject { described_class.new(buffer, options) }

  describe 'each_segment' do
    it 'yields the segment, index, and the number of samples' do
      samples = []
      indexes = []
      numbers = []

      subject.each_segment do |segment, index, number_of_samples|
        indexes << index
        numbers << number_of_samples
        samples << segment.to_a.map(&:to_i)
      end

      expect(samples).to eq([[1, 2], [4, 8], [16, 32], [64, 128]])
      expect(indexes).to eq([0, 1, 2, 3])
      expect(numbers).to eq([2, 2, 2, 2])
    end

    context 'given a window size' do
      let(:options) { { :size_in_milliseconds => 0.25, :window_size => 2 } }

      it 'multiplies the number of samples by the window size' do
        samples = []
        indexes = []
        numbers = []

        subject.each_segment do |segment, index, number_of_samples|
          indexes << index
          numbers << number_of_samples
          samples << segment.to_a.map(&:to_i)
        end

        expect(samples).to eq([[1, 2, 4, 8], [4, 8, 16, 32], [16, 32, 64, 128], [64, 128, 0, 0]])
        expect(indexes).to eq([0, 1, 2, 3])
        expect(numbers).to eq([4, 4, 4, 4])
      end
    end
  end

  describe 'segments' do
    specify do
      expect(subject.segments).to be_empty
      subject.each_segment {}

      expect(subject.segments.length).to eq 4
      expect(subject.segments[0][0]).to eq  1
      expect(subject.segments[0][1]).to eq  2
      expect(subject.segments[1][0]).to eq  4
      expect(subject.segments[1][1]).to eq  8
      expect(subject.segments[2][0]).to eq  16
      expect(subject.segments[2][1]).to eq  32
      expect(subject.segments[3][0]).to eq  64
      expect(subject.segments[3][1]).to eq  128
    end
  end
end

