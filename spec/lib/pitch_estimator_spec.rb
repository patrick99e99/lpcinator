require 'spec_helper'

describe LPCinator::PitchEstimator do
  describe 'pitch_for_period' do
    let(:number_of_samples)     { 200 }
    let(:sample_rate)           { 8000 }
    let(:number_of_msec)        { 25 }
    let(:duration)              { 2 * number_of_msec }
    let(:buffer)                { LPCinator::Waveform.new(:duration => duration, :sample_rate => sample_rate, :frequency => 120).buffer }
    let(:pre_emphasized_buffer) { LPCinator::Buffer.new(number_of_samples, sample_rate) }
    let(:pre_emphasized_energy) { 100 }
    let(:energy)                { 100 }

    subject                     { described_class.pitch_for_period(buffer, pre_emphasized_buffer) }

    before do
      allow(pre_emphasized_buffer).to receive(:energy) { pre_emphasized_energy }
      allow(buffer).to receive(:energy)                { energy }
    end

    context 'when the energy requirements are not met' do
      let(:pre_emphasized_energy) { 100 }
      let(:energy)                { 40 }

      it 'is unvoiced' do
        pending
        expect(subject).to be_zero
      end
    end

    context 'when the energy requirements are met' do
      it 'returns the pitch period in samples' do
        expect(subject).to be_within(67).of(0.5)
      end
    end
  end
end
