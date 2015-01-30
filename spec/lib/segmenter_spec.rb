require 'spec_helper'

describe LPCinator::Segmenter do
  let(:number_of_samples) { 4 }
  let(:sample_rate)       { 8000 }
  let(:buffer)            { LPCinator::Buffer.new(number_of_samples, sample_rate) }

  before do
    4.times do |t|
      buffer[t] = 2 ** t
    end
  end

  subject { described_class.new(buffer, :size_in_milliseconds => 0.25) }

  describe 'each_segment' do
    it 'yields the segment, index, and the number of samples' do
      samples = []
      indexes = []
      numbers = []

      subject.each_segment do |segment, index, number_of_samples|
        indexes << index
        numbers << number_of_samples

        segment.real_size.times do |t|
          samples << segment[t].to_i
        end
      end

      expect(samples).to eq([1, 2, 4, 8])
      expect(indexes).to eq([0, 1])
      expect(numbers).to eq([2, 2])
    end
  end

  describe 'segments' do
    specify do
      expect(subject.segments).to be_empty
      subject.each_segment {}

      expect(subject.segments.length).to eq 2
      expect(subject.segments[0][0]).to eq  1
      expect(subject.segments[0][1]).to eq  2
      expect(subject.segments[1][0]).to eq  4
      expect(subject.segments[1][1]).to eq  8
    end
  end
end

