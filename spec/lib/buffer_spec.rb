require 'spec_helper'

describe LPCinator::Buffer do
  let(:number_of_samples) { 8 }
  let(:sample_rate)       { 8000 }
  subject { described_class.new(number_of_samples, sample_rate) }
  specify { expect(subject).to be_a(RubyAudio::Buffer) }
  specify { expect(subject.sample_rate).to eq 8000 }

  describe 'energy' do
    before do
      number_of_samples.times do |t|
        subject[t] = t
      end
    end

    it 'returns the sum of the squares' do
      expect(subject.energy).to eq (1 ** 2 + 2 ** 2 + 3 ** 2 + 4 ** 2 + 5 ** 2 + 6 ** 2 + 7 ** 2)
    end
  end
end
