module LPCinator::BitPacker
  module NibbleSwitcher
    extend self

    def process(bytes)
      bytes.map do |byte|
        if byte.length == 1
          byte << '0'
        else
          byte.reverse
        end
      end
    end
  end
end
