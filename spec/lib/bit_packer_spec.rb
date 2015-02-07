require 'spec_helper'

describe LPCinator::BitPacker do
  let(:hex_byte_stream) { '09,d4,66,66,81,05,4b,a5,a0,6a,5d,b5,b6,5e,a6,45,17,a8,5e,0c' }
  let(:frame_data) {
    [
      { :gain => 9, :repeat => 0, :pitch => 0, :k1 => 21, :k2 => 22, :k3 => 6, :k4 => 6 },
      { :gain => 6, :repeat => 1, :pitch => 0 },
      { :gain => 6, :repeat => 1, :pitch => 0 },
      { :gain => 13, :repeat => 0, :pitch => 10, :k1 => 18, :k2 => 16, :k3 => 5, :k4 => 5, :k5 => 6, :k6 => 11, :k7 => 10, :k8 => 5, :k9 => 3, :k10 => 2 },
      { :gain => 13, :repeat => 1, :pitch => 11 },
      { :gain => 13, :repeat => 0, :pitch => 12, :k1 => 22, :k2 => 17, :k3 => 7, :k4 => 4, :k5 => 0, :k6 => 10, :k7 => 11, :k8 => 6, :k9 => 4, :k10 => 3 },
      { :gain => 0 }
    ]
  }

  before do
    stub_const('LPCinator::CodingTable::BITS', { :gain => 4, :repeat => 1, :pitch => 5, :k1 => 5, :k2 => 5, :k3 => 4, :k4 => 4, :k5 => 4, :k6 => 4, :k7 => 4, :k8 => 3, :k9 => 3, :k10 => 3, })
  end

  describe LPCinator::BitPacker do
    describe 'pack' do
      subject { LPCinator::BitPacker.pack(frame_data) }
      specify do
        expect(subject).to eq hex_byte_stream
      end
    end

    describe 'unpack' do
      subject { LPCinator::BitPacker.unpack(hex_byte_stream) }
      specify do
        expect(subject).to eq frame_data
      end
    end
  end

  describe 'packing/unpacking algorithm components' do
    let(:binary)        { LPCinator::BitPacker::FrameDataBinaryEncoder.process(frame_data) }
    let(:hex)           { LPCinator::BitPacker::HexConverter.process(binary) }
    let(:reversed_bits) { LPCinator::BitPacker::NibbleBitReverser.process(hex) }

    describe LPCinator::BitPacker::FrameDataBinaryEncoder do
      describe 'process' do
        subject { binary }

        specify do
          expect(subject).to eq [ '1001', '0000', '0010', '1011', '0110', '0110', '0110', '0110', '1000', '0001', '1010', '0000', '1101', '0010', '1010', '0101', '0000', '0101', '0101', '0110', '1011', '1010', '1010', '1101', '0110', '1101', '0111', '1010', '0110', '0101', '1010', '0010', '1110', '1000', '0001', '0101', '0111', '1010', '0011', "0000" ] 
        end
      end
    end

    describe LPCinator::BitPacker::HexByteBinaryEncoder do
      describe 'process' do
        subject { LPCinator::BitPacker::HexByteBinaryEncoder.process(hex) }

        specify do
          expect(subject).to eq [ '1001', '0000', '0010', '1011', '0110', '0110', '0110', '0110', '1000', '0001', '1010', '0000', '1101', '0010', '1010', '0101', '0000', '0101', '0101', '0110', '1011', '1010', '1010', '1101', '0110', '1101', '0111', '1010', '0110', '0101', '1010', '0010', '1110', '1000', '0001', '0101', '0111', '1010', '0011', "0000" ] 
        end
      end
    end

    describe LPCinator::BitPacker::HexConverter do
      describe 'process' do
        subject { hex }
        specify do
          expect(subject).to eq ['90', '2b', '66', '66', '81', 'a0', 'd2', 'a5', '05', '56', 'ba', 'ad', '6d', '7a', '65', 'a2', 'e8', '15', '7a', '30' ]
        end
      end
    end

    describe LPCinator::BitPacker::NibbleBitReverser do
      describe 'process' do
        subject { reversed_bits }
        specify do
          expect(subject).to eq ['90', '4d', '66', '66', '18', '50', 'b4', '5a', '0a', 'a6', 'd5', '5b', '6b', 'e5', '6a', '54', '71', '8a', 'e5', 'c0' ]
        end
      end
    end

    describe LPCinator::BitPacker::NibbleSwitcher do
      describe 'process' do
        subject { LPCinator::BitPacker::NibbleSwitcher.process(reversed_bits) }
        specify do
          expect(subject).to eq ['09', 'd4', '66', '66', '81', '05', '4b', 'a5', 'a0', '6a', '5d', 'b5', 'b6', '5e', 'a6', '45', '17', 'a8', '5e', '0c' ]
        end
      end
    end
  end
end
