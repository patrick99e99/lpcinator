require 'spec_helper'

describe LPCinator::HexByteStreamer do
  let(:frames) {
    [
      { :gain => 9, :repeat => 0, :pitch => 0, :k1 => 21, :k2 => 22, :k3 => 6, :k4 => 6 },
      { :gain => 6, :repeat => 1, :pitch => 0 },
      { :gain => 6, :repeat => 1, :pitch => 0 },
      { :gain => 13, :repeat => 0, :pitch => 10, :k1 => 18, :k2 => 16, :k3 => 5, :k4 => 5, :k5 => 6, :k6 => 11, :k7 => 10, :k8 => 5, :k9 => 3, :k10 => 2 },
      { :gain => 13, :repeat => 1, :pitch => 11 },
      { :gain => 13, :repeat => 0, :pitch => 12, :k1 => 22, :k2 => 17, :k3 => 7, :k4 => 4, :k5 => 0, :k6 => 10, :k7 => 11, :k8 => 6, :k9 => 4, :k10 => 3 },
      { :gain => 13 },
    ]
  }

  subject { described_class.process!(frames) }

  it 'converts frame data into hex' do
    expect(subject).to eq '09,a8,cd,cc,02,16,58,54,0a,aa,d6,55,6b,d3,8b,69,d1,05,aa,17,f0'
  end
end
