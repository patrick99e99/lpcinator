require 'spec_helper'

describe LPCinator::Downsampler do

  let(:groups)             { 3 }
  let(:numbers)            { 6 }
  let(:number_of_samples)  { groups * numbers }
  let(:sample_rate)        { 44100 }
  let(:target_sample_rate) { 8000 }

  let(:buffer) do
    LPCinator::Buffer.new(number_of_samples, 44100).tap do |buffer|
      groups.times do |g|
        numbers.times do |t|
          buffer[(6 * g) + t] = t + 1
        end
      end
    end
  end

  subject { described_class.converted(buffer, target_sample_rate).to_a }

  before do
    allow(LPCinator::Chebychev).to receive(:low_pass!)
  end
  let(:ratio) { sample_rate.to_f / target_sample_rate.to_f }
  let(:frac)  { ratio - ratio.floor }
  let(:group_1) { 1 + 2 + 3 + 4 + 5 + (frac * 6) }
  let(:group_2) { ((1 - frac) * 6) + 1 + 2 + 3 + 4 + (frac * 5) }
  let(:group_3) { ((1 - frac) * 5) + 6 + 1 + 2 + 3 + (frac * 4) }
  let(:group_4) { ((1 - frac) * 4) + 5 + 6 }

  specify do
    expect(LPCinator::Chebychev).to receive(:low_pass!).with(buffer, 4, 0.1)

    expect(subject[0]).to be_within(group_1 / 5.0).of(0.005)
    expect(subject[1]).to be_within(group_2 / 5.0).of(0.005)
    expect(subject[2]).to be_within(group_3 / 5.0).of(0.005)
    expect(subject[3]).to be_within(group_4).of(0.005)
  end
end
