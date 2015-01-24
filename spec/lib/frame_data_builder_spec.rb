require 'spec_helper'

describe LPCinator::FrameDataBuilder do
  describe '#create_for' do
    let(:parameters) { LPCinator::Reflector::Parameters.new(:k => ks, :rms => rms) }
    let(:ks)         { [nil] + 10.times.map { -1.0 } }
    let(:rms)        { 1000 }
    let(:pitch)      { 32 }
    let(:options)    { { } }
    subject          { described_class.create_for(parameters, pitch, options) }

    context 'when the pitch is greater than zero' do
      specify do
        expect(subject.keys).to match_array([:gain, :repeat, :pitch, :k1, :k2, :k3, :k4, :k5, :k6, :k7, :k8, :k9, :k10])
        expect(subject[:k1]).to be_zero
      end

      context 'when there are gain options for unvoiced frames' do
        let(:options)    { { :unvoiced_gain => 'unvoiced' } }
        specify do
          expect(LPCinator::ParameterModifier).to_not receive(:value_for)
          subject
        end
      end

      context 'when there are gain options for voiced frames' do
        let(:options)    { { :voiced_gain => 'voiced' } }
        specify do
          expect(LPCinator::ParameterModifier).to receive(:value_for).with(9, 'voiced', { min: 2, max: 14 })
          subject
        end
      end
    end

    context 'when the pitch is zero' do
      let(:pitch) { 0 }
      specify do
        expect(subject.keys).to match_array([:gain, :repeat, :pitch, :k1, :k2, :k3, :k4])
        expect(subject[:gain]).to eq 9
        expect(subject[:k1]).to be_zero
        expect(subject[:k2]).to be_zero
        expect(subject[:k3]).to be_zero
        expect(subject[:k4]).to be_zero
      end

      context 'when there are gain options for unvoiced frames' do
        let(:options)    { { :unvoiced_gain => 'unvoiced' } }
        specify do
          expect(LPCinator::ParameterModifier).to receive(:value_for).with(9, 'unvoiced', { min: 2, max: 14 })
          subject
        end
      end
      
      context 'when there are gain options for voiced frames' do
        let(:options)    { { :voiced_gain => 'voiced' } }
        specify do
          expect(LPCinator::ParameterModifier).to_not receive(:value_for)
          subject
        end
      end
    end

    context 'when the values should be translated' do
      let(:options) { { :translate => true } }
      specify do
        expect(subject[:k1]).to eq(-0.97850)
      end
    end
  end
end
