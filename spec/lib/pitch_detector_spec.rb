require 'spec_helper'

describe LPCinator::PitchDetector do

  describe 'pitch_for_period' do
    let(:buffer) { LPCinator::Waveform.new(:duration => 25, :sample_rate => 8000).buffer }
    subject { LPCinator::PitchDetector.pitch_for_period(buffer) }

    context 'given a detectable frequency' do
      specify { expect(subject).to eq(440) }
    end

    context 'when no frequency should be detected' do
      let(:buffer) do 
        LPCinator::Buffer.new(200, 8000).tap do |buffer|
          200.times do |t|
            buffer[t] = 0
          end
        end
      end
      specify { expect(subject).to eq(0) }
    end
  end
end
