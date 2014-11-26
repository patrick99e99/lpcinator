require 'spec_helper'

describe LPCinator::CodingTable do

  it 'finds the closest coefficient given a bin and a value' do
    expect(subject.closest_value_for(8, 5000)).to eq(4915)
    expect(subject.closest_value_for(9, 5000)).to eq(6787)
    expect(subject.closest_value_for(1, -31969)).to eq(-31968)
    expect(subject.closest_value_for(1, -31967)).to eq(-31968)
    expect(subject.closest_value_for(10, 999999)).to eq(17320)
    expect(subject.closest_value_for(10, -999999)).to eq(-15447)
  end
end

