require 'spec_helper'

describe LPCinator::ParameterModifier do
  describe 'value_for' do
    let(:options)              { { min: 4, max: 8 } }
    let(:unvoiced_gain_option) { '5' }
    let(:current_gain)         { 6 }
    subject { described_class.value_for(current_gain, unvoiced_gain_option, options) }

    context 'when it is an integer' do
      specify { expect(subject).to eq 5 }
    end

    context 'and it is subtractive' do
      let(:unvoiced_gain_option) { 'subtract:2' }
      specify { expect(subject).to eq 4 }

      context 'and it would exceed the minimum' do
        let(:current_gain) { 5 }
        specify { expect(subject).to eq 4 }
      end
    end

    context 'and it is additive' do
      let(:unvoiced_gain_option) { 'add:2' }
      specify { expect(subject).to eq 8 }

      context 'and it would exceed the maximum' do
        let(:current_gain) { 7 }
        specify { expect(subject).to eq 8 }
      end
    end

    context 'when the gain was already outside of the minimum' do
      let(:current_gain) { 3 }

      context 'and it is subtractive' do
        let(:unvoiced_gain_option) { 'subtract:2' }
        specify { expect(subject).to eq current_gain }
      end

      context 'and it is additive' do
        let(:unvoiced_gain_option) { 'add:2' }
        specify { expect(subject).to eq 5 }
      end
    end

    context 'when the gain was already outside of the maximum' do
      let(:current_gain) { 10 }
      context 'and it is subtractive' do
        let(:unvoiced_gain_option) { 'subtract:2' }
        specify { expect(subject).to eq 8 }
      end

      context 'and it is additive' do
        let(:unvoiced_gain_option) { 'add:2' }
        specify { expect(subject).to eq current_gain }
      end
    end
  end
end
