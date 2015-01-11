module LPCinator::HexByteStreamer
  extend self

  def do_it
    translate(
[
 { :gain => 6, :repeat => 0, :pitch =>  47, :k1 =>  21, :k2 =>  11, :k3 =>  3, :k4 =>   5, :k5 =>   3, :k6 =>   7, :k7 =>  11, :k8 =>   3, :k9 =>   4 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  50, :k1 =>  17, :k2 =>  12, :k3 =>  3, :k4 =>   9, :k5 =>   6, :k6 =>  13, :k7 =>   8, :k8 =>   4, :k9 =>   4 , :k10 =>  1 },
 { :gain => 6, :repeat => 0, :pitch =>  50, :k1 =>  20, :k2 =>  15, :k3 =>  2, :k4 =>   7, :k5 =>   3, :k6 =>  13, :k7 =>   6, :k8 =>   6, :k9 =>   4 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  48, :k1 =>  22, :k2 =>  16, :k3 =>  4, :k4 =>   7, :k5 =>   1, :k6 =>  11, :k7 =>   5, :k8 =>   5, :k9 =>   4 , :k10 =>  7 },
 { :gain => 6, :repeat => 0, :pitch =>  48, :k1 =>  20, :k2 =>  11, :k3 =>  3, :k4 =>   8, :k5 =>   0, :k6 =>  12, :k7 =>   6, :k8 =>   4, :k9 =>   5 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  48, :k1 =>  17, :k2 =>  13, :k3 =>  1, :k4 =>   6, :k5 =>  10, :k6 =>  11, :k7 =>   9, :k8 =>   1, :k9 =>   5 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  49, :k1 =>  15, :k2 =>  14, :k3 =>  0, :k4 =>   9, :k5 =>  13, :k6 =>  10, :k7 =>   7, :k8 =>   2, :k9 =>   4 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  50, :k1 =>  20, :k2 =>  11, :k3 =>  4, :k4 =>   8, :k5 =>   1, :k6 =>   4, :k7 =>   7, :k8 =>   4, :k9 =>   5 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  40, :k1 =>  22, :k2 =>  18, :k3 =>  7, :k4 =>   1, :k5 =>   6, :k6 =>   6, :k7 =>   6, :k8 =>   2, :k9 =>   3 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  28, :k1 =>  19, :k2 =>  24, :k3 => 14, :k4 =>   3, :k5 =>   6, :k6 =>   9, :k7 =>   7, :k8 =>   4, :k9 =>   3 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  37, :k1 =>  18, :k2 =>  21, :k3 => 13, :k4 =>   2, :k5 =>   8, :k6 =>   6, :k7 =>   6, :k8 =>   4, :k9 =>   3 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  18, :k2 =>  25, :k3 =>  8, :k4 =>   5, :k5 =>   5, :k6 =>   2, :k7 =>   7, :k8 =>   2, :k9 =>   3 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  43, :k1 =>  13, :k2 =>  21, :k3 =>  1, :k4 =>   9, :k5 =>   7, :k6 =>  10, :k7 =>   6, :k8 =>   3, :k9 =>   7 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  43, :k1 =>  15, :k2 =>  21, :k3 =>  2, :k4 =>   7, :k5 =>   4, :k6 =>  13, :k7 =>   7, :k8 =>   4, :k9 =>   4 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  45, :k1 =>  17, :k2 =>  22, :k3 =>  3, :k4 =>   8, :k5 =>   3, :k6 =>  13, :k7 =>   3, :k8 =>   5, :k9 =>   5 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  45, :k1 =>  16, :k2 =>  20, :k3 =>  3, :k4 =>   9, :k5 =>   4, :k6 =>  14, :k7 =>   7, :k8 =>   4, :k9 =>   6 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  17, :k2 =>  19, :k3 =>  3, :k4 =>   9, :k5 =>   2, :k6 =>  14, :k7 =>   5, :k8 =>   5, :k9 =>   4 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  18, :k2 =>  18, :k3 =>  4, :k4 =>   7, :k5 =>   2, :k6 =>  14, :k7 =>   5, :k8 =>   5, :k9 =>   4 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  47, :k1 =>  20, :k2 =>  27, :k3 =>  2, :k4 =>   6, :k5 =>   2, :k6 =>  11, :k7 =>   3, :k8 =>   5, :k9 =>   5 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  18, :k2 =>  17, :k3 =>  5, :k4 =>   5, :k5 =>   6, :k6 =>   9, :k7 =>   9, :k8 =>   3, :k9 =>   4 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  18, :k2 =>  19, :k3 =>  3, :k4 =>   7, :k5 =>   4, :k6 =>  10, :k7 =>   9, :k8 =>   3, :k9 =>   4 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  41, :k1 =>  18, :k2 =>  18, :k3 =>  3, :k4 =>   7, :k5 =>   5, :k6 =>  10, :k7 =>   9, :k8 =>   2, :k9 =>   6 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  17, :k2 =>  20, :k3 =>  5, :k4 =>   7, :k5 =>   5, :k6 =>  10, :k7 =>   8, :k8 =>   2, :k9 =>   5 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  18, :k2 =>  16, :k3 =>  6, :k4 =>   5, :k5 =>   7, :k6 =>   9, :k7 =>  10, :k8 =>   3, :k9 =>   3 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  42, :k1 =>  17, :k2 =>  14, :k3 =>  5, :k4 =>   6, :k5 =>   8, :k6 =>   6, :k7 =>   4, :k8 =>   3, :k9 =>   3 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  43, :k1 =>   5, :k2 =>  17, :k3 =>  4, :k4 =>  13, :k5 =>   9, :k6 =>   2, :k7 =>   7, :k8 =>   4, :k9 =>   3 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  15, :k2 =>  14, :k3 =>  1, :k4 =>  13, :k5 =>   7, :k6 =>   5, :k7 =>   7, :k8 =>   4, :k9 =>   3 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  19, :k2 =>  13, :k3 =>  4, :k4 =>   9, :k5 =>   1, :k6 =>  11, :k7 =>   6, :k8 =>   5, :k9 =>   4 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  18, :k2 =>  15, :k3 =>  5, :k4 =>   9, :k5 =>   2, :k6 =>  12, :k7 =>   7, :k8 =>   5, :k9 =>   5 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  16, :k2 =>  17, :k3 =>  5, :k4 =>   9, :k5 =>   3, :k6 =>  13, :k7 =>   5, :k8 =>   6, :k9 =>   5 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  16, :k2 =>  15, :k3 =>  6, :k4 =>  11, :k5 =>   1, :k6 =>  13, :k7 =>   5, :k8 =>   6, :k9 =>   4 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  17, :k2 =>  14, :k3 =>  5, :k4 =>  11, :k5 =>   1, :k6 =>  11, :k7 =>   5, :k8 =>   5, :k9 =>   5 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  17, :k2 =>  14, :k3 =>  5, :k4 =>  10, :k5 =>   2, :k6 =>  12, :k7 =>   3, :k8 =>   6, :k9 =>   5 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  19, :k2 =>  14, :k3 =>  4, :k4 =>  10, :k5 =>   1, :k6 =>  10, :k7 =>   1, :k8 =>   6, :k9 =>   5 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  18, :k2 =>  15, :k3 =>  2, :k4 =>  11, :k5 =>   2, :k6 =>   9, :k7 =>   3, :k8 =>   5, :k9 =>   6 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  17, :k2 =>  16, :k3 =>  5, :k4 =>  10, :k5 =>   1, :k6 =>  12, :k7 =>   5, :k8 =>   6, :k9 =>   7 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  16, :k2 =>  16, :k3 =>  5, :k4 =>  11, :k5 =>   4, :k6 =>  12, :k7 =>   6, :k8 =>   5, :k9 =>   6 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  45, :k1 =>  17, :k2 =>  15, :k3 =>  4, :k4 =>   9, :k5 =>   3, :k6 =>  12, :k7 =>   8, :k8 =>   5, :k9 =>   6 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  45, :k1 =>  17, :k2 =>  17, :k3 =>  4, :k4 =>   8, :k5 =>   2, :k6 =>  14, :k7 =>   6, :k8 =>   6, :k9 =>   5 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  45, :k1 =>  19, :k2 =>  16, :k3 =>  4, :k4 =>   8, :k5 =>   1, :k6 =>  10, :k7 =>   5, :k8 =>   6, :k9 =>   5 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  18, :k2 =>  13, :k3 =>  5, :k4 =>   7, :k5 =>   1, :k6 =>   9, :k7 =>   6, :k8 =>   5, :k9 =>   6 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  19, :k2 =>  14, :k3 =>  5, :k4 =>   7, :k5 =>   1, :k6 =>  10, :k7 =>   5, :k8 =>   6, :k9 =>   5 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  19, :k2 =>  15, :k3 =>  4, :k4 =>   8, :k5 =>   1, :k6 =>  10, :k7 =>   4, :k8 =>   6, :k9 =>   5 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  19, :k2 =>  16, :k3 =>  4, :k4 =>   9, :k5 =>   2, :k6 =>  11, :k7 =>   4, :k8 =>   6, :k9 =>   5 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  43, :k1 =>  18, :k2 =>  18, :k3 =>  5, :k4 =>   8, :k5 =>   0, :k6 =>  11, :k7 =>   5, :k8 =>   6, :k9 =>   4 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  17, :k2 =>  14, :k3 =>  2, :k4 =>   9, :k5 =>   5, :k6 =>  10, :k7 =>   4, :k8 =>   3, :k9 =>   5 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  16, :k2 =>  14, :k3 =>  4, :k4 =>   8, :k5 =>   5, :k6 =>   9, :k7 =>   5, :k8 =>   3, :k9 =>   6 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  17, :k2 =>  16, :k3 =>  6, :k4 =>   8, :k5 =>   2, :k6 =>  11, :k7 =>   5, :k8 =>   6, :k9 =>   3 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  17, :k2 =>  15, :k3 =>  3, :k4 =>  10, :k5 =>   5, :k6 =>   9, :k7 =>   5, :k8 =>   5, :k9 =>   4 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  48, :k1 =>  19, :k2 =>  11, :k3 =>  6, :k4 =>   6, :k5 =>   4, :k6 =>   3, :k7 =>   8, :k8 =>   2, :k9 =>   3 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  47, :k1 =>  23, :k2 =>  13, :k3 =>  8, :k4 =>   6, :k5 =>   7, :k6 =>   4, :k7 =>   6, :k8 =>   2, :k9 =>   3 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  22, :k2 =>  16, :k3 =>  9, :k4 =>   7, :k5 =>   6, :k6 =>   5, :k7 =>   4, :k8 =>   3, :k9 =>   3 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  43, :k1 =>  18, :k2 =>  16, :k3 =>  4, :k4 =>   5, :k5 =>   3, :k6 =>   8, :k7 =>   8, :k8 =>   4, :k9 =>   6 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  43, :k1 =>  18, :k2 =>  18, :k3 =>  2, :k4 =>   4, :k5 =>   3, :k6 =>  12, :k7 =>   7, :k8 =>   4, :k9 =>   7 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  13, :k2 =>  14, :k3 =>  2, :k4 =>   4, :k5 =>   7, :k6 =>  10, :k7 =>   9, :k8 =>   3, :k9 =>   4 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  39, :k1 =>  23, :k2 =>  24, :k3 => 10, :k4 =>   4, :k5 =>   7, :k6 =>   5, :k7 =>   5, :k8 =>   3, :k9 =>   3 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  51, :k1 =>  22, :k2 =>  24, :k3 =>  8, :k4 =>   5, :k5 =>   9, :k6 =>   7, :k7 =>   6, :k8 =>   3, :k9 =>   3 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  40, :k1 =>  23, :k2 =>  20, :k3 =>  6, :k4 =>   3, :k5 =>   5, :k6 =>   7, :k7 =>   9, :k8 =>   4, :k9 =>   4 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  42, :k1 =>  20, :k2 =>  11, :k3 =>  3, :k4 =>   6, :k5 =>   2, :k6 =>  11, :k7 =>   9, :k8 =>   4, :k9 =>   6 , :k10 =>  2 },
 { :gain => 6, :repeat => 0, :pitch =>  41, :k1 =>  20, :k2 =>  13, :k3 =>  3, :k4 =>   7, :k5 =>   2, :k6 =>  13, :k7 =>   5, :k8 =>   6, :k9 =>   4 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  42, :k1 =>  19, :k2 =>  14, :k3 =>  2, :k4 =>   8, :k5 =>   3, :k6 =>  13, :k7 =>   6, :k8 =>   6, :k9 =>   4 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  43, :k1 =>  19, :k2 =>  15, :k3 =>  2, :k4 =>   7, :k5 =>   2, :k6 =>  13, :k7 =>   6, :k8 =>   6, :k9 =>   5 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  19, :k2 =>  13, :k3 =>  3, :k4 =>   7, :k5 =>   2, :k6 =>  13, :k7 =>   7, :k8 =>   6, :k9 =>   5 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  20, :k2 =>  14, :k3 =>  3, :k4 =>   7, :k5 =>   0, :k6 =>  13, :k7 =>   6, :k8 =>   6, :k9 =>   4 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  24, :k2 =>  20, :k3 =>  7, :k4 =>   4, :k5 =>   1, :k6 =>   2, :k7 =>   8, :k8 =>   3, :k9 =>   4 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  33, :k1 =>  25, :k2 =>  27, :k3 => 12, :k4 =>  10, :k5 =>  10, :k6 =>   1, :k7 =>   4, :k8 =>   2, :k9 =>   3 , :k10 =>  2 },
 { :gain => 6, :repeat => 0, :pitch =>  33, :k1 =>  25, :k2 =>  25, :k3 => 13, :k4 =>  11, :k5 =>  12, :k6 =>   2, :k7 =>   2, :k8 =>   3, :k9 =>   3 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  43, :k1 =>  25, :k2 =>  27, :k3 => 11, :k4 =>  10, :k5 =>  12, :k6 =>   9, :k7 =>   9, :k8 =>   3, :k9 =>   3 , :k10 =>  1 },
 { :gain => 6, :repeat => 0, :pitch =>  42, :k1 =>  25, :k2 =>  20, :k3 =>  8, :k4 =>  10, :k5 =>  10, :k6 =>   5, :k7 =>   5, :k8 =>   3, :k9 =>   2 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  41, :k1 =>  18, :k2 =>  10, :k3 =>  3, :k4 =>   9, :k5 =>   3, :k6 =>  10, :k7 =>  10, :k8 =>   3, :k9 =>   4 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  42, :k1 =>  16, :k2 =>  15, :k3 =>  1, :k4 =>  11, :k5 =>  11, :k6 =>   8, :k7 =>   5, :k8 =>   3, :k9 =>   5 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  43, :k1 =>  17, :k2 =>  15, :k3 =>  0, :k4 =>  12, :k5 =>  10, :k6 =>   7, :k7 =>   6, :k8 =>   3, :k9 =>   3 , :k10 =>  2 },
 { :gain => 6, :repeat => 0, :pitch =>  45, :k1 =>  16, :k2 =>  15, :k3 =>  0, :k4 =>  12, :k5 =>   9, :k6 =>   9, :k7 =>   5, :k8 =>   3, :k9 =>   4 , :k10 =>  2 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  14, :k2 =>  14, :k3 =>  2, :k4 =>   9, :k5 =>  12, :k6 =>  10, :k7 =>   6, :k8 =>   1, :k9 =>   3 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  20, :k2 =>  18, :k3 => 11, :k4 =>   8, :k5 =>   9, :k6 =>   6, :k7 =>   8, :k8 =>   1, :k9 =>   4 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  19, :k2 =>  15, :k3 => 12, :k4 =>   7, :k5 =>   7, :k6 =>   3, :k7 =>  10, :k8 =>   2, :k9 =>   5 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  21, :k2 =>  13, :k3 =>  9, :k4 =>   8, :k5 =>   7, :k6 =>   2, :k7 =>   6, :k8 =>   2, :k9 =>   2 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  45, :k1 =>  18, :k2 =>  13, :k3 =>  9, :k4 =>   9, :k5 =>   4, :k6 =>   2, :k7 =>   8, :k8 =>   3, :k9 =>   4 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  17, :k2 =>  17, :k3 =>  7, :k4 =>  10, :k5 =>   5, :k6 =>   8, :k7 =>   3, :k8 =>   4, :k9 =>   5 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  16, :k2 =>  24, :k3 =>  6, :k4 =>  11, :k5 =>   2, :k6 =>   7, :k7 =>   7, :k8 =>   5, :k9 =>   6 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  45, :k1 =>  16, :k2 =>  25, :k3 =>  5, :k4 =>   8, :k5 =>   3, :k6 =>  11, :k7 =>   7, :k8 =>   5, :k9 =>   4 , :k10 =>  2 },
 { :gain => 6, :repeat => 0, :pitch =>  45, :k1 =>  16, :k2 =>  24, :k3 =>  4, :k4 =>   8, :k5 =>   4, :k6 =>   8, :k7 =>   7, :k8 =>   5, :k9 =>   4 , :k10 =>  2 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  15, :k2 =>  20, :k3 =>  5, :k4 =>   6, :k5 =>   6, :k6 =>   9, :k7 =>   9, :k8 =>   4, :k9 =>   4 , :k10 =>  2 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  15, :k2 =>  15, :k3 =>  7, :k4 =>   5, :k5 =>   7, :k6 =>   3, :k7 =>   8, :k8 =>   4, :k9 =>   6 , :k10 =>  2 },
 { :gain => 6, :repeat => 0, :pitch =>  47, :k1 =>  21, :k2 =>   1, :k3 => 11, :k4 =>   6, :k5 =>   5, :k6 =>   4, :k7 =>   4, :k8 =>   3, :k9 =>   4 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  47, :k1 =>  24, :k2 =>   1, :k3 =>  9, :k4 =>   7, :k5 =>   6, :k6 =>   2, :k7 =>   6, :k8 =>   2, :k9 =>   3 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  23, :k2 =>   0, :k3 =>  7, :k4 =>   7, :k5 =>   7, :k6 =>   3, :k7 =>   6, :k8 =>   4, :k9 =>   4 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  16, :k2 =>  10, :k3 => 11, :k4 =>   4, :k5 =>   5, :k6 =>   5, :k7 =>   8, :k8 =>   4, :k9 =>   6 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  15, :k2 =>  17, :k3 =>  7, :k4 =>   3, :k5 =>   5, :k6 =>   6, :k7 =>   9, :k8 =>   5, :k9 =>   7 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  14, :k2 =>  17, :k3 =>  6, :k4 =>   5, :k5 =>   4, :k6 =>   7, :k7 =>   9, :k8 =>   4, :k9 =>   6 , :k10 =>  2 },
 { :gain => 6, :repeat => 0, :pitch =>  47, :k1 =>  16, :k2 =>  14, :k3 =>  9, :k4 =>   3, :k5 =>   6, :k6 =>   4, :k7 =>   9, :k8 =>   4, :k9 =>   7 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  48, :k1 =>  18, :k2 =>   7, :k3 => 10, :k4 =>   4, :k5 =>   7, :k6 =>   4, :k7 =>   6, :k8 =>   4, :k9 =>   5 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  49, :k1 =>  24, :k2 =>   0, :k3 =>  8, :k4 =>   4, :k5 =>   8, :k6 =>   4, :k7 =>   5, :k8 =>   3, :k9 =>   4 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  50, :k1 =>  24, :k2 =>   5, :k3 => 10, :k4 =>   3, :k5 =>   4, :k6 =>   5, :k7 =>   5, :k8 =>   3, :k9 =>   3 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  48, :k1 =>  17, :k2 =>   7, :k3 =>  7, :k4 =>   5, :k5 =>   9, :k6 =>  10, :k7 =>   6, :k8 =>   3, :k9 =>   3 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  48, :k1 =>   6, :k2 =>  12, :k3 => 11, :k4 =>  12, :k5 =>   4, :k6 =>   5, :k7 =>   5, :k8 =>   3, :k9 =>   4 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  48, :k1 =>  11, :k2 =>   9, :k3 =>  9, :k4 =>  12, :k5 =>   7, :k6 =>   5, :k7 =>   4, :k8 =>   4, :k9 =>   3 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  48, :k1 =>  13, :k2 =>  10, :k3 =>  8, :k4 =>  13, :k5 =>   4, :k6 =>   3, :k7 =>   4, :k8 =>   5, :k9 =>   5 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  47, :k1 =>  12, :k2 =>  15, :k3 =>  9, :k4 =>  10, :k5 =>   3, :k6 =>   9, :k7 =>   8, :k8 =>   5, :k9 =>   5 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  47, :k1 =>  16, :k2 =>  18, :k3 =>  4, :k4 =>   6, :k5 =>   6, :k6 =>  11, :k7 =>   9, :k8 =>   4, :k9 =>   6 , :k10 =>  2 },
 { :gain => 6, :repeat => 0, :pitch =>  47, :k1 =>  16, :k2 =>  12, :k3 =>  5, :k4 =>   8, :k5 =>   7, :k6 =>  11, :k7 =>  11, :k8 =>   4, :k9 =>   6 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  19, :k2 =>  13, :k3 =>  2, :k4 =>   7, :k5 =>   4, :k6 =>  13, :k7 =>   7, :k8 =>   5, :k9 =>   6 , :k10 =>  2 },
 { :gain => 6, :repeat => 0, :pitch =>  45, :k1 =>  17, :k2 =>  11, :k3 =>  3, :k4 =>   8, :k5 =>   5, :k6 =>  15, :k7 =>   8, :k8 =>   6, :k9 =>   5 , :k10 =>  1 },
 { :gain => 6, :repeat => 0, :pitch =>  43, :k1 =>  19, :k2 =>  13, :k3 =>  2, :k4 =>   7, :k5 =>   3, :k6 =>  13, :k7 =>   7, :k8 =>   6, :k9 =>   5 , :k10 =>  2 },
 { :gain => 6, :repeat => 0, :pitch =>  43, :k1 =>  19, :k2 =>  11, :k3 =>  3, :k4 =>   6, :k5 =>   2, :k6 =>  12, :k7 =>   6, :k8 =>   6, :k9 =>   5 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  43, :k1 =>  17, :k2 =>   9, :k3 =>  6, :k4 =>   3, :k5 =>   8, :k6 =>   6, :k7 =>   8, :k8 =>   4, :k9 =>   7 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  44, :k1 =>  24, :k2 =>   4, :k3 =>  8, :k4 =>   5, :k5 =>   4, :k6 =>   5, :k7 =>   4, :k8 =>   2, :k9 =>   5 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  48, :k1 =>  28, :k2 =>  10, :k3 =>  5, :k4 =>   5, :k5 =>   5, :k6 =>   5, :k7 =>   4, :k8 =>   2, :k9 =>   3 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  49, :k1 =>  25, :k2 =>  11, :k3 =>  4, :k4 =>   6, :k5 =>   8, :k6 =>   2, :k7 =>   3, :k8 =>   3, :k9 =>   3 , :k10 =>  7 },
 { :gain => 6, :repeat => 0, :pitch =>  50, :k1 =>  21, :k2 =>  12, :k3 =>  3, :k4 =>   9, :k5 =>   3, :k6 =>   3, :k7 =>   8, :k8 =>   4, :k9 =>   6 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  51, :k1 =>  18, :k2 =>  13, :k3 =>  3, :k4 =>   9, :k5 =>   4, :k6 =>   8, :k7 =>   8, :k8 =>   5, :k9 =>   5 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  53, :k1 =>  17, :k2 =>  14, :k3 =>  3, :k4 =>   9, :k5 =>   3, :k6 =>  10, :k7 =>  10, :k8 =>   5, :k9 =>   4 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  54, :k1 =>  17, :k2 =>  13, :k3 =>  3, :k4 =>   9, :k5 =>   3, :k6 =>   8, :k7 =>  10, :k8 =>   5, :k9 =>   5 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  55, :k1 =>  18, :k2 =>  13, :k3 =>  2, :k4 =>   9, :k5 =>   4, :k6 =>   8, :k7 =>   9, :k8 =>   4, :k9 =>   5 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  54, :k1 =>  22, :k2 =>  16, :k3 =>  5, :k4 =>   5, :k5 =>   5, :k6 =>   3, :k7 =>   6, :k8 =>   2, :k9 =>   4 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  51, :k1 =>  26, :k2 =>  24, :k3 => 12, :k4 =>   6, :k5 =>   9, :k6 =>   4, :k7 =>   4, :k8 =>   3, :k9 =>   2 , :k10 =>  2 },
 { :gain => 6, :repeat => 0, :pitch =>  38, :k1 =>  27, :k2 =>  25, :k3 => 14, :k4 =>   9, :k5 =>   9, :k6 =>   6, :k7 =>   4, :k8 =>   2, :k9 =>   3 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  38, :k1 =>  28, :k2 =>  22, :k3 => 11, :k4 =>   5, :k5 =>   6, :k6 =>   8, :k7 =>   7, :k8 =>   3, :k9 =>   4 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  38, :k1 =>  26, :k2 =>  14, :k3 =>  6, :k4 =>   3, :k5 =>   8, :k6 =>   8, :k7 =>   8, :k8 =>   3, :k9 =>   4 , :k10 =>  2 },
 { :gain => 6, :repeat => 0, :pitch =>  47, :k1 =>  25, :k2 =>  12, :k3 =>  5, :k4 =>   7, :k5 =>   7, :k6 =>   5, :k7 =>   8, :k8 =>   3, :k9 =>   3 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  47, :k1 =>  26, :k2 =>  17, :k3 =>  7, :k4 =>   4, :k5 =>   6, :k6 =>   6, :k7 =>   6, :k8 =>   4, :k9 =>   4 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>   0, :k1 =>  23, :k2 =>   8, :k3 =>  2, :k4 =>   3 },
 { :gain => 6, :repeat => 0, :pitch =>   0, :k1 =>  24, :k2 =>   9, :k3 =>  5, :k4 =>   3 },
 { :gain => 6, :repeat => 0, :pitch =>  46, :k1 =>  23, :k2 =>  17, :k3 =>  6, :k4 =>   3, :k5 =>   2, :k6 =>   3, :k7 =>   6, :k8 =>   3, :k9 =>   3, :k10 =>   6 },
 { :gain => 6, :repeat => 0, :pitch =>  49, :k1 =>  15, :k2 =>  10, :k3 =>  5, :k4 =>   7, :k5 =>   5, :k6 =>  12, :k7 =>  12, :k8 =>   4, :k9 =>   4 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  50, :k1 =>  17, :k2 =>   7, :k3 =>  4, :k4 =>  10, :k5 =>   6, :k6 =>   8, :k7 =>  12, :k8 =>   4, :k9 =>   4 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  50, :k1 =>  17, :k2 =>   5, :k3 =>  6, :k4 =>   8, :k5 =>   8, :k6 =>  11, :k7 =>  12, :k8 =>   5, :k9 =>   4 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  50, :k1 =>  21, :k2 =>   5, :k3 =>  4, :k4 =>   6, :k5 =>   6, :k6 =>   9, :k7 =>  10, :k8 =>   3, :k9 =>   4 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  50, :k1 =>  16, :k2 =>  13, :k3 =>  9, :k4 =>  10, :k5 =>   6, :k6 =>   4, :k7 =>   5, :k8 =>   3, :k9 =>   4 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  55, :k1 =>  10, :k2 =>  17, :k3 =>  8, :k4 =>   9, :k5 =>   5, :k6 =>   3, :k7 =>   7, :k8 =>   3, :k9 =>   6 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  54, :k1 =>  13, :k2 =>  15, :k3 =>  8, :k4 =>  11, :k5 =>   5, :k6 =>   5, :k7 =>   5, :k8 =>   3, :k9 =>   5 , :k10 =>  7 },
 { :gain => 6, :repeat => 0, :pitch =>  54, :k1 =>   7, :k2 =>  17, :k3 =>  8, :k4 =>  11, :k5 =>   8, :k6 =>   6, :k7 =>   5, :k8 =>   2, :k9 =>   5 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  54, :k1 =>   6, :k2 =>  19, :k3 =>  9, :k4 =>  10, :k5 =>   5, :k6 =>   6, :k7 =>   6, :k8 =>   3, :k9 =>   6 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  55, :k1 =>  12, :k2 =>  14, :k3 =>  6, :k4 =>   6, :k5 =>   8, :k6 =>   8, :k7 =>   8, :k8 =>   2, :k9 =>   3 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  57, :k1 =>  18, :k2 =>  10, :k3 =>  5, :k4 =>   6, :k5 =>   8, :k6 =>   4, :k7 =>   6, :k8 =>   3, :k9 =>   3 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  58, :k1 =>  19, :k2 =>  10, :k3 =>  9, :k4 =>   3, :k5 =>   7, :k6 =>   4, :k7 =>   7, :k8 =>   4, :k9 =>   2 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  56, :k1 =>  16, :k2 =>  19, :k3 =>  5, :k4 =>   6, :k5 =>   5, :k6 =>   7, :k7 =>   8, :k8 =>   2, :k9 =>   3 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  56, :k1 =>  15, :k2 =>  25, :k3 =>  1, :k4 =>   8, :k5 =>   5, :k6 =>  12, :k7 =>   7, :k8 =>   2, :k9 =>   6 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  57, :k1 =>  17, :k2 =>  24, :k3 =>  1, :k4 =>   8, :k5 =>   5, :k6 =>  11, :k7 =>   8, :k8 =>   2, :k9 =>   5 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  58, :k1 =>  18, :k2 =>  24, :k3 =>  1, :k4 =>   7, :k5 =>   5, :k6 =>  11, :k7 =>   7, :k8 =>   3, :k9 =>   4 , :k10 =>  6 },
 { :gain => 6, :repeat => 0, :pitch =>  42, :k1 =>  20, :k2 =>  26, :k3 =>  6, :k4 =>   4, :k5 =>   5, :k6 =>   5, :k7 =>   6, :k8 =>   4, :k9 =>   2 , :k10 =>  7 },
 { :gain => 6, :repeat => 0, :pitch =>  42, :k1 =>  22, :k2 =>  21, :k3 => 14, :k4 =>   9, :k5 =>  10, :k6 =>   3, :k7 =>   3, :k8 =>   3, :k9 =>   2 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  42, :k1 =>  26, :k2 =>  15, :k3 => 12, :k4 =>   7, :k5 =>   5, :k6 =>   5, :k7 =>   4, :k8 =>   3, :k9 =>   3 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  42, :k1 =>  26, :k2 =>  20, :k3 => 12, :k4 =>   7, :k5 =>   5, :k6 =>   6, :k7 =>   3, :k8 =>   2, :k9 =>   3 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  42, :k1 =>  26, :k2 =>  22, :k3 => 10, :k4 =>   6, :k5 =>   4, :k6 =>   4, :k7 =>   7, :k8 =>   3, :k9 =>   4 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  42, :k1 =>  26, :k2 =>  18, :k3 => 11, :k4 =>   6, :k5 =>   6, :k6 =>   3, :k7 =>   3, :k8 =>   4, :k9 =>   5 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  42, :k1 =>  25, :k2 =>  17, :k3 =>  8, :k4 =>   5, :k5 =>   3, :k6 =>   1, :k7 =>   4, :k8 =>   5, :k9 =>   4 , :k10 =>  2 },
 { :gain => 6, :repeat => 0, :pitch =>  50, :k1 =>  19, :k2 =>   6, :k3 =>  2, :k4 =>   7, :k5 =>   6, :k6 =>  10, :k7 =>  13, :k8 =>   5, :k9 =>   3 , :k10 =>  2 },
 { :gain => 6, :repeat => 0, :pitch =>  50, :k1 =>  19, :k2 =>   6, :k3 =>  1, :k4 =>   8, :k5 =>   7, :k6 =>  10, :k7 =>  13, :k8 =>   6, :k9 =>   4 , :k10 =>  1 },
 { :gain => 6, :repeat => 0, :pitch =>  49, :k1 =>  19, :k2 =>   6, :k3 =>  1, :k4 =>   8, :k5 =>   7, :k6 =>  10, :k7 =>  13, :k8 =>   6, :k9 =>   5 , :k10 =>  1 },
 { :gain => 6, :repeat => 0, :pitch =>  49, :k1 =>  19, :k2 =>   6, :k3 =>  1, :k4 =>   7, :k5 =>   4, :k6 =>  11, :k7 =>  13, :k8 =>   6, :k9 =>   5 , :k10 =>  2 },
 { :gain => 6, :repeat => 0, :pitch =>  50, :k1 =>  22, :k2 =>   8, :k3 =>  1, :k4 =>   5, :k5 =>   5, :k6 =>   7, :k7 =>  12, :k8 =>   6, :k9 =>   6 , :k10 =>  2 },
 { :gain => 6, :repeat => 0, :pitch =>  51, :k1 =>  23, :k2 =>  11, :k3 =>  0, :k4 =>   6, :k5 =>   4, :k6 =>  10, :k7 =>  10, :k8 =>   6, :k9 =>   7 , :k10 =>  1 },
 { :gain => 6, :repeat => 0, :pitch =>  54, :k1 =>  23, :k2 =>   9, :k3 =>  0, :k4 =>   7, :k5 =>   8, :k6 =>  12, :k7 =>  12, :k8 =>   5, :k9 =>   6 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  54, :k1 =>  23, :k2 =>  12, :k3 =>  2, :k4 =>   6, :k5 =>   0, :k6 =>   8, :k7 =>  12, :k8 =>   4, :k9 =>   7 , :k10 =>  3 },
 { :gain => 0 },
 { :gain => 0 },
 { :gain => 0 },
 { :gain => 0 },
 { :gain => 6, :repeat => 0, :pitch =>  32, :k1 =>  22, :k2 =>  11, :k3 =>  9, :k4 =>   6, :k5 =>   8, :k6 =>   6, :k7 =>   7, :k8 =>   3, :k9 =>   3 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  32, :k1 =>  23, :k2 =>  10, :k3 =>  9, :k4 =>   4, :k5 =>   7, :k6 =>   6, :k7 =>   6, :k8 =>   4, :k9 =>   5 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  25, :k1 =>  26, :k2 =>  15, :k3 => 12, :k4 =>   8, :k5 =>   9, :k6 =>   6, :k7 =>   4, :k8 =>   0, :k9 =>   1 , :k10 =>  3 },
 { :gain => 6, :repeat => 0, :pitch =>  25, :k1 =>  22, :k2 =>  16, :k3 => 14, :k4 =>   8, :k5 =>   9, :k6 =>   4, :k7 =>   0, :k8 =>   2, :k9 =>   2 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  25, :k1 =>  23, :k2 =>  15, :k3 => 12, :k4 =>  10, :k5 =>   6, :k6 =>   2, :k7 =>   5, :k8 =>   4, :k9 =>   3 , :k10 =>  5 },
 { :gain => 6, :repeat => 0, :pitch =>  25, :k1 =>  22, :k2 =>  12, :k3 =>  7, :k4 =>   6, :k5 =>   5, :k6 =>   4, :k7 =>   7, :k8 =>   4, :k9 =>   4 , :k10 =>  4 },
 { :gain => 6, :repeat => 0, :pitch =>  25, :k1 =>  20, :k2 =>  11, :k3 =>  7, :k4 =>   6, :k5 =>   5, :k6 =>   7, :k7 =>  11, :k8 =>   4, :k9 =>   3 , :k10 =>  3 },
])
  end

  BIT_TABLE = {
    :gain => 4,
    :repeat => 1,
    :pitch => 6,
    :k1 => 5,
    :k2 => 5,
    :k3 => 4,
    :k4 => 4,
    :k5 => 4,
    :k6 => 4,
    :k7 => 4,
    :k8 => 3,
    :k9 => 3,
    :k10 => 3,
  }

  def translate(frames)
    bit_patterns = bit_patterns_for(frames)
    reversed_hex_bytes_from(bit_patterns).join(',')
  end

private

  def bit_patterns_for(frames)
    frames.map do |frame|
      BIT_TABLE.keys.map.each_with_index do |key, index|
        next unless frame[key]
        frame[key].to_s(2).tap do |bits|
          while bits.length < BIT_TABLE[key]
            bits.insert(0, '0')
          end
        end
      end
    end.flatten.compact.join
  end
  
  def reversed_hex_bytes_from(bit_patterns)
    bit_patterns.scan(/\d{4}/).map(&:reverse).each_slice(2).map do |byte|
      reversed_hex_byte byte
    end
  end
  
  def reversed_hex_byte(byte)
    reversed = byte.join.to_i(2).to_s(16).reverse
    if reversed.length == 1
      reversed << '0'
    end
    reversed
  end
end

