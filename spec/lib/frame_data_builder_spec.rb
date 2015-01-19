require 'spec_helper'

describe LPCinator::FrameDataBuilder do
  describe '#create_for' do
    let(:segment)    { RubyAudio::Buffer.new(:float, 4, 8) }
    let(:parameters) { LPCinator::Reflector::Parameters.new(:k => ks, :rms => rms) }
    let(:ks)         { [nil] + 10.times.map { -1.0 } }
    let(:rms)        { 0.5 }
    let(:pitch)      { 32 }
    let(:options)    { {} }
    subject          { described_class.create_for(segment, parameters, pitch, options) }

    context 'when the pitch is greater than zero' do
      specify do
        expect(subject.keys).to match_array([:gain, :repeat, :pitch, :k1, :k2, :k3, :k4, :k5, :k6, :k7, :k8, :k9, :k10])
        expect(subject[:k1]).to eq(0)
      end
    end

    context 'when the pitch is zero' do
      let(:pitch) { 0 }
      specify do
        expect(subject.keys).to match_array([:gain, :repeat, :pitch, :k1, :k2, :k3, :k4])
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
