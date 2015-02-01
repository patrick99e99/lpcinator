require 'spec_helper'

describe LPCinator::Downsampler do

  let(:groups)             { 5 }
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
  let(:ratio)   { sample_rate.to_f / target_sample_rate.to_f }
  let(:frac1)   { ratio - ratio.floor }
  let(:frac2)   { (frac1 * 2) - (frac1 * 2).floor }
  let(:frac3)   { (frac1 * 3) - (frac1 * 3).floor }
  let(:frac4)   { (frac1 * 4) - (frac1 * 4).floor }
  let(:group_1) { (1 + 2 + 3 + 4 + (4 + frac1 * (5 - 4))) / ratio }
  let(:group_2) { ((4 + (1 - frac1) * (5-4)) + 6 + 1 + 2 + 3 + (3 + frac2 * (4 - 3))) / ratio }
  let(:group_3) { ((3 + (1 - frac2) * (4-3)) + 5 + 6 + 1 + 2 + (2 + frac3 * (3 - 2))) / ratio }
  let(:group_4) { ((2 + (1 - frac3) * (3-2)) + 4 + 5 + 6 + 1 + (1 + frac4 * (2 - 1))) / ratio }

  specify do
    expect(LPCinator::Chebychev).to receive(:low_pass!).with(buffer, 4, 0.1)

    puts
    4.times do |t|
      puts subject.inspect
    end
    expect(subject[0]).to be_within(0.005).of(group_1)
    expect(subject[1]).to be_within(0.005).of(group_2)
    expect(subject[2]).to be_within(0.005).of(group_3)
    expect(subject[3]).to be_within(0.005).of(group_4)
  end
end
