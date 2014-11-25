module LPC
  module Table
    extend self

    CODING = [
      [-32158,-31968,-31840,-31744,-31616,-31488,-31327,-31039,-30720,-30464,-30176,-29854,-29535,-29152,-28703,-28223,-27213,-25373,-23023,-20089,-16528,-12354,-7654,-2595,2591,7651,12351,16526,20087,23021,25372,27212],
      [-21730,-20172,-18452,-16569,-14526,-12332,-10002,-7554,-5014,-2411,222,2854,5448,7975,10404,12713,14882,16898,18754,20446,21977,23352,24577,25663,26621,27461,28195,28835,29390,29870,30285,31824],
      [-29906,-26454,-23003,-19551,-16099,-12648,-9196,-5745,-2293,1157,4609,8060,11512,14964,18415,21867],
      [-22750,-19192,-15635,-12078,-8521,-4964,-1407,2149,5706,9263,12820,16377,19934,23492,27049,30605],
      [-22456,-19486,-16515,-13543,-10573,-7602,-4631,-1660,1310,4281,7252,10223,13194,16165,19136,22107],
      [-17803,-14964,-12124,-9284,-6444,-3604,-764,2075,4915,7755,10594,13434,16274,1911,21954,24794],
      [-21190,-18131,-15073,-12015,-8956,-5898,-2840,218,3276,6335,9393,12451,15510,18568,21626,24685],
      [-19426,-13341,-7255,-1170,4915,11000,17066,23171],
      [-18958,-13809,-8660,-3510,1638,6787,11937,17086],
      [-15447,-10766,-6085,-1404,3274,7958,12638,17320],
    ]

    def closest_value_for(coefficient, value)
      table = CODING[coefficient - 1]
      table.each_with_index do |coefficient, index|
        if coefficient > value
          previous_coefficient = table[index - 1]
          if coefficient - value < previous_coefficient - value
            return coefficient
          else
            return previous_coefficient
          end
        end
      end
      table.last
    end
  end
end