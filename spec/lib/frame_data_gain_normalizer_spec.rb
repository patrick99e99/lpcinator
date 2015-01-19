require 'spec_helper'

describe LPCinator::FrameDataGainNormalizer do
  let(:frame_data) do
    [
      { :gain => 0 },
      { :gain => 3 },
      { :gain => 5 },
    ]
  end

  subject { described_class.normalize!(frame_data) }

  it 'normalizes the gain' do
    expect(subject[0][:gain]).to eq(0)
    expect(subject[1][:gain]).to eq(8)
    expect(subject[2][:gain]).to eq(14)
  end
end
