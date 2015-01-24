require 'spec_helper'

describe LPCinator::RMSNormalizer do
  let(:peak_rms) { 1000 }
  let(:parameters) do
    [
      LPCinator::Reflector::Parameters.new(:k => [], :rms => 100),
      LPCinator::Reflector::Parameters.new(:k => [], :rms => 500),
      LPCinator::Reflector::Parameters.new(:k => [], :rms => peak_rms),
    ]
  end

  subject { described_class.normalize!(parameters) }

  it 'normalizes the rms values' do
    expect(subject[0].rms).to eq 551
    expect(subject[1].rms).to eq 2757
    expect(subject[2].rms).to eq 5514
  end


  describe 'preventing gains of 15' do
    let(:peak_rms) { 99999 }
    it 'uses the 2nd to last entry in the rms table' do
      # There appears to be a bug in the TMS5220.c simulator where it outputs garbage audio 
      # when a frame with a gain of 15 played.  The normalizer forces the use of the penultimate 
      # rms value 5514 in the coding table as the max value rather than 7789.

      expect(subject[2].rms).to eq 5514
    end
  end
end
