/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk008 : List DirectRowArcFiniteOccurrence := [
  -- compact 9802; core 33701; terminal 2603937
  { outputClauseIndex := 9802, coreClauseIndex := 33701, terminalClauseIndex := 2603937, datum := { row := ⟨3, {4, 6, 7, 8}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9804; core 33707; terminal 2603943
  { outputClauseIndex := 9804, coreClauseIndex := 33707, terminalClauseIndex := 2603943, datum := { row := ⟨3, {4, 6, 7, 9}⟩, arc := ⟨3, .left, {0, 1, 2, 8, 9, 10}⟩ } },
  -- compact 9805; core 33708; terminal 2603944
  { outputClauseIndex := 9805, coreClauseIndex := 33708, terminalClauseIndex := 2603944, datum := { row := ⟨3, {4, 6, 7, 9}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9807; core 33714; terminal 2603950
  { outputClauseIndex := 9807, coreClauseIndex := 33714, terminalClauseIndex := 2603950, datum := { row := ⟨3, {4, 6, 7, 10}⟩, arc := ⟨3, .left, {0, 1, 2, 8, 9, 10}⟩ } },
  -- compact 9808; core 33715; terminal 2603951
  { outputClauseIndex := 9808, coreClauseIndex := 33715, terminalClauseIndex := 2603951, datum := { row := ⟨3, {4, 6, 7, 10}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9810; core 33721; terminal 2603957
  { outputClauseIndex := 9810, coreClauseIndex := 33721, terminalClauseIndex := 2603957, datum := { row := ⟨3, {4, 6, 8, 9}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9811; core 33722; terminal 2603958
  { outputClauseIndex := 9811, coreClauseIndex := 33722, terminalClauseIndex := 2603958, datum := { row := ⟨3, {4, 6, 8, 9}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9813; core 33728; terminal 2603964
  { outputClauseIndex := 9813, coreClauseIndex := 33728, terminalClauseIndex := 2603964, datum := { row := ⟨3, {4, 6, 8, 10}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9814; core 33729; terminal 2603965
  { outputClauseIndex := 9814, coreClauseIndex := 33729, terminalClauseIndex := 2603965, datum := { row := ⟨3, {4, 6, 8, 10}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9816; core 33735; terminal 2603971
  { outputClauseIndex := 9816, coreClauseIndex := 33735, terminalClauseIndex := 2603971, datum := { row := ⟨3, {4, 6, 9, 10}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9817; core 33736; terminal 2603972
  { outputClauseIndex := 9817, coreClauseIndex := 33736, terminalClauseIndex := 2603972, datum := { row := ⟨3, {4, 6, 9, 10}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9819; core 33742; terminal 2603978
  { outputClauseIndex := 9819, coreClauseIndex := 33742, terminalClauseIndex := 2603978, datum := { row := ⟨3, {4, 7, 8, 9}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9820; core 33743; terminal 2603979
  { outputClauseIndex := 9820, coreClauseIndex := 33743, terminalClauseIndex := 2603979, datum := { row := ⟨3, {4, 7, 8, 9}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9822; core 33749; terminal 2603985
  { outputClauseIndex := 9822, coreClauseIndex := 33749, terminalClauseIndex := 2603985, datum := { row := ⟨3, {4, 7, 8, 10}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9823; core 33750; terminal 2603986
  { outputClauseIndex := 9823, coreClauseIndex := 33750, terminalClauseIndex := 2603986, datum := { row := ⟨3, {4, 7, 8, 10}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9825; core 33756; terminal 2603992
  { outputClauseIndex := 9825, coreClauseIndex := 33756, terminalClauseIndex := 2603992, datum := { row := ⟨3, {4, 7, 9, 10}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9826; core 33757; terminal 2603993
  { outputClauseIndex := 9826, coreClauseIndex := 33757, terminalClauseIndex := 2603993, datum := { row := ⟨3, {4, 7, 9, 10}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9827; core 33762; terminal 2603999
  { outputClauseIndex := 9827, coreClauseIndex := 33762, terminalClauseIndex := 2603999, datum := { row := ⟨3, {4, 8, 9, 10}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9828; core 33763; terminal 2604000
  { outputClauseIndex := 9828, coreClauseIndex := 33763, terminalClauseIndex := 2604000, datum := { row := ⟨3, {4, 8, 9, 10}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9829; core 33787; terminal 2604041
  { outputClauseIndex := 9829, coreClauseIndex := 33787, terminalClauseIndex := 2604041, datum := { row := ⟨3, {5, 6, 9, 10}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9831; core 33793; terminal 2604048
  { outputClauseIndex := 9831, coreClauseIndex := 33793, terminalClauseIndex := 2604048, datum := { row := ⟨3, {5, 7, 8, 9}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9832; core 33794; terminal 2604049
  { outputClauseIndex := 9832, coreClauseIndex := 33794, terminalClauseIndex := 2604049, datum := { row := ⟨3, {5, 7, 8, 9}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9833; core 33799; terminal 2604055
  { outputClauseIndex := 9833, coreClauseIndex := 33799, terminalClauseIndex := 2604055, datum := { row := ⟨3, {5, 7, 8, 10}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9834; core 33800; terminal 2604056
  { outputClauseIndex := 9834, coreClauseIndex := 33800, terminalClauseIndex := 2604056, datum := { row := ⟨3, {5, 7, 8, 10}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9835; core 33805; terminal 2604062
  { outputClauseIndex := 9835, coreClauseIndex := 33805, terminalClauseIndex := 2604062, datum := { row := ⟨3, {5, 7, 9, 10}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9836; core 33806; terminal 2604063
  { outputClauseIndex := 9836, coreClauseIndex := 33806, terminalClauseIndex := 2604063, datum := { row := ⟨3, {5, 7, 9, 10}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9837; core 33811; terminal 2604069
  { outputClauseIndex := 9837, coreClauseIndex := 33811, terminalClauseIndex := 2604069, datum := { row := ⟨3, {5, 8, 9, 10}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9838; core 33812; terminal 2604070
  { outputClauseIndex := 9838, coreClauseIndex := 33812, terminalClauseIndex := 2604070, datum := { row := ⟨3, {5, 8, 9, 10}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9840; core 33818; terminal 2604076
  { outputClauseIndex := 9840, coreClauseIndex := 33818, terminalClauseIndex := 2604076, datum := { row := ⟨3, {6, 7, 8, 9}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9841; core 33819; terminal 2604077
  { outputClauseIndex := 9841, coreClauseIndex := 33819, terminalClauseIndex := 2604077, datum := { row := ⟨3, {6, 7, 8, 9}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9842; core 33824; terminal 2604083
  { outputClauseIndex := 9842, coreClauseIndex := 33824, terminalClauseIndex := 2604083, datum := { row := ⟨3, {6, 7, 8, 10}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9843; core 33825; terminal 2604084
  { outputClauseIndex := 9843, coreClauseIndex := 33825, terminalClauseIndex := 2604084, datum := { row := ⟨3, {6, 7, 8, 10}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9845; core 33831; terminal 2604090
  { outputClauseIndex := 9845, coreClauseIndex := 33831, terminalClauseIndex := 2604090, datum := { row := ⟨3, {6, 7, 9, 10}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9846; core 33832; terminal 2604091
  { outputClauseIndex := 9846, coreClauseIndex := 33832, terminalClauseIndex := 2604091, datum := { row := ⟨3, {6, 7, 9, 10}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9847; core 33837; terminal 2604097
  { outputClauseIndex := 9847, coreClauseIndex := 33837, terminalClauseIndex := 2604097, datum := { row := ⟨3, {6, 8, 9, 10}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9848; core 33838; terminal 2604098
  { outputClauseIndex := 9848, coreClauseIndex := 33838, terminalClauseIndex := 2604098, datum := { row := ⟨3, {6, 8, 9, 10}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9849; core 33843; terminal 2604104
  { outputClauseIndex := 9849, coreClauseIndex := 33843, terminalClauseIndex := 2604104, datum := { row := ⟨3, {7, 8, 9, 10}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9850; core 33844; terminal 2604105
  { outputClauseIndex := 9850, coreClauseIndex := 33844, terminalClauseIndex := 2604105, datum := { row := ⟨3, {7, 8, 9, 10}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9852; core 34081; terminal 2604608
  { outputClauseIndex := 9852, coreClauseIndex := 34081, terminalClauseIndex := 2604608, datum := { row := ⟨4, {0, 5, 8, 9}⟩, arc := ⟨4, .left, {0, 7, 8, 9, 10}⟩ } },
  -- compact 9853; core 34082; terminal 2604609
  { outputClauseIndex := 9853, coreClauseIndex := 34082, terminalClauseIndex := 2604609, datum := { row := ⟨4, {0, 5, 8, 9}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9855; core 34088; terminal 2604615
  { outputClauseIndex := 9855, coreClauseIndex := 34088, terminalClauseIndex := 2604615, datum := { row := ⟨4, {0, 5, 8, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9856; core 34089; terminal 2604616
  { outputClauseIndex := 9856, coreClauseIndex := 34089, terminalClauseIndex := 2604616, datum := { row := ⟨4, {0, 5, 8, 10}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9858; core 34095; terminal 2604622
  { outputClauseIndex := 9858, coreClauseIndex := 34095, terminalClauseIndex := 2604622, datum := { row := ⟨4, {0, 5, 9, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9859; core 34096; terminal 2604623
  { outputClauseIndex := 9859, coreClauseIndex := 34096, terminalClauseIndex := 2604623, datum := { row := ⟨4, {0, 5, 9, 10}⟩, arc := ⟨4, .right, {2, 3, 4, 5}⟩ } },
  -- compact 9861; core 34112; terminal 2604650
  { outputClauseIndex := 9861, coreClauseIndex := 34112, terminalClauseIndex := 2604650, datum := { row := ⟨4, {0, 6, 8, 9}⟩, arc := ⟨4, .left, {0, 7, 8, 9, 10}⟩ } },
  -- compact 9862; core 34113; terminal 2604651
  { outputClauseIndex := 9862, coreClauseIndex := 34113, terminalClauseIndex := 2604651, datum := { row := ⟨4, {0, 6, 8, 9}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9864; core 34119; terminal 2604657
  { outputClauseIndex := 9864, coreClauseIndex := 34119, terminalClauseIndex := 2604657, datum := { row := ⟨4, {0, 6, 8, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9865; core 34120; terminal 2604658
  { outputClauseIndex := 9865, coreClauseIndex := 34120, terminalClauseIndex := 2604658, datum := { row := ⟨4, {0, 6, 8, 10}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9867; core 34126; terminal 2604664
  { outputClauseIndex := 9867, coreClauseIndex := 34126, terminalClauseIndex := 2604664, datum := { row := ⟨4, {0, 6, 9, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9868; core 34127; terminal 2604665
  { outputClauseIndex := 9868, coreClauseIndex := 34127, terminalClauseIndex := 2604665, datum := { row := ⟨4, {0, 6, 9, 10}⟩, arc := ⟨4, .right, {2, 3, 4, 5}⟩ } },
  -- compact 9870; core 34133; terminal 2604671
  { outputClauseIndex := 9870, coreClauseIndex := 34133, terminalClauseIndex := 2604671, datum := { row := ⟨4, {0, 7, 8, 9}⟩, arc := ⟨4, .left, {0, 7, 8, 9, 10}⟩ } },
  -- compact 9871; core 34134; terminal 2604672
  { outputClauseIndex := 9871, coreClauseIndex := 34134, terminalClauseIndex := 2604672, datum := { row := ⟨4, {0, 7, 8, 9}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9873; core 34140; terminal 2604678
  { outputClauseIndex := 9873, coreClauseIndex := 34140, terminalClauseIndex := 2604678, datum := { row := ⟨4, {0, 7, 8, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9874; core 34141; terminal 2604679
  { outputClauseIndex := 9874, coreClauseIndex := 34141, terminalClauseIndex := 2604679, datum := { row := ⟨4, {0, 7, 8, 10}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9876; core 34147; terminal 2604685
  { outputClauseIndex := 9876, coreClauseIndex := 34147, terminalClauseIndex := 2604685, datum := { row := ⟨4, {0, 7, 9, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9877; core 34148; terminal 2604686
  { outputClauseIndex := 9877, coreClauseIndex := 34148, terminalClauseIndex := 2604686, datum := { row := ⟨4, {0, 7, 9, 10}⟩, arc := ⟨4, .right, {2, 3, 4, 5}⟩ } },
  -- compact 9879; core 34154; terminal 2604692
  { outputClauseIndex := 9879, coreClauseIndex := 34154, terminalClauseIndex := 2604692, datum := { row := ⟨4, {0, 8, 9, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9880; core 34155; terminal 2604693
  { outputClauseIndex := 9880, coreClauseIndex := 34155, terminalClauseIndex := 2604693, datum := { row := ⟨4, {0, 8, 9, 10}⟩, arc := ⟨4, .right, {2, 3, 4, 5}⟩ } },
  -- compact 9882; core 34306; terminal 2605000
  { outputClauseIndex := 9882, coreClauseIndex := 34306, terminalClauseIndex := 2605000, datum := { row := ⟨4, {1, 5, 8, 9}⟩, arc := ⟨4, .left, {0, 7, 8, 9, 10}⟩ } },
  -- compact 9883; core 34307; terminal 2605001
  { outputClauseIndex := 9883, coreClauseIndex := 34307, terminalClauseIndex := 2605001, datum := { row := ⟨4, {1, 5, 8, 9}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9885; core 34313; terminal 2605007
  { outputClauseIndex := 9885, coreClauseIndex := 34313, terminalClauseIndex := 2605007, datum := { row := ⟨4, {1, 5, 8, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9886; core 34314; terminal 2605008
  { outputClauseIndex := 9886, coreClauseIndex := 34314, terminalClauseIndex := 2605008, datum := { row := ⟨4, {1, 5, 8, 10}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9888; core 34320; terminal 2605014
  { outputClauseIndex := 9888, coreClauseIndex := 34320, terminalClauseIndex := 2605014, datum := { row := ⟨4, {1, 5, 9, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9889; core 34321; terminal 2605015
  { outputClauseIndex := 9889, coreClauseIndex := 34321, terminalClauseIndex := 2605015, datum := { row := ⟨4, {1, 5, 9, 10}⟩, arc := ⟨4, .right, {2, 3, 4, 5}⟩ } },
  -- compact 9891; core 34337; terminal 2605042
  { outputClauseIndex := 9891, coreClauseIndex := 34337, terminalClauseIndex := 2605042, datum := { row := ⟨4, {1, 6, 8, 9}⟩, arc := ⟨4, .left, {0, 7, 8, 9, 10}⟩ } },
  -- compact 9892; core 34338; terminal 2605043
  { outputClauseIndex := 9892, coreClauseIndex := 34338, terminalClauseIndex := 2605043, datum := { row := ⟨4, {1, 6, 8, 9}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9894; core 34344; terminal 2605049
  { outputClauseIndex := 9894, coreClauseIndex := 34344, terminalClauseIndex := 2605049, datum := { row := ⟨4, {1, 6, 8, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9895; core 34345; terminal 2605050
  { outputClauseIndex := 9895, coreClauseIndex := 34345, terminalClauseIndex := 2605050, datum := { row := ⟨4, {1, 6, 8, 10}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9897; core 34351; terminal 2605056
  { outputClauseIndex := 9897, coreClauseIndex := 34351, terminalClauseIndex := 2605056, datum := { row := ⟨4, {1, 6, 9, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9898; core 34352; terminal 2605057
  { outputClauseIndex := 9898, coreClauseIndex := 34352, terminalClauseIndex := 2605057, datum := { row := ⟨4, {1, 6, 9, 10}⟩, arc := ⟨4, .right, {2, 3, 4, 5}⟩ } },
  -- compact 9900; core 34358; terminal 2605063
  { outputClauseIndex := 9900, coreClauseIndex := 34358, terminalClauseIndex := 2605063, datum := { row := ⟨4, {1, 7, 8, 9}⟩, arc := ⟨4, .left, {0, 7, 8, 9, 10}⟩ } },
  -- compact 9901; core 34359; terminal 2605064
  { outputClauseIndex := 9901, coreClauseIndex := 34359, terminalClauseIndex := 2605064, datum := { row := ⟨4, {1, 7, 8, 9}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9903; core 34365; terminal 2605070
  { outputClauseIndex := 9903, coreClauseIndex := 34365, terminalClauseIndex := 2605070, datum := { row := ⟨4, {1, 7, 8, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9904; core 34366; terminal 2605071
  { outputClauseIndex := 9904, coreClauseIndex := 34366, terminalClauseIndex := 2605071, datum := { row := ⟨4, {1, 7, 8, 10}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9906; core 34372; terminal 2605077
  { outputClauseIndex := 9906, coreClauseIndex := 34372, terminalClauseIndex := 2605077, datum := { row := ⟨4, {1, 7, 9, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9907; core 34373; terminal 2605078
  { outputClauseIndex := 9907, coreClauseIndex := 34373, terminalClauseIndex := 2605078, datum := { row := ⟨4, {1, 7, 9, 10}⟩, arc := ⟨4, .right, {2, 3, 4, 5}⟩ } },
  -- compact 9909; core 34379; terminal 2605084
  { outputClauseIndex := 9909, coreClauseIndex := 34379, terminalClauseIndex := 2605084, datum := { row := ⟨4, {1, 8, 9, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9910; core 34380; terminal 2605085
  { outputClauseIndex := 9910, coreClauseIndex := 34380, terminalClauseIndex := 2605085, datum := { row := ⟨4, {1, 8, 9, 10}⟩, arc := ⟨4, .right, {2, 3, 4, 5}⟩ } },
  -- compact 9912; core 34463; terminal 2605245
  { outputClauseIndex := 9912, coreClauseIndex := 34463, terminalClauseIndex := 2605245, datum := { row := ⟨4, {2, 5, 8, 9}⟩, arc := ⟨4, .left, {0, 7, 8, 9, 10}⟩ } },
  -- compact 9913; core 34464; terminal 2605246
  { outputClauseIndex := 9913, coreClauseIndex := 34464, terminalClauseIndex := 2605246, datum := { row := ⟨4, {2, 5, 8, 9}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9915; core 34470; terminal 2605252
  { outputClauseIndex := 9915, coreClauseIndex := 34470, terminalClauseIndex := 2605252, datum := { row := ⟨4, {2, 5, 8, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9916; core 34471; terminal 2605253
  { outputClauseIndex := 9916, coreClauseIndex := 34471, terminalClauseIndex := 2605253, datum := { row := ⟨4, {2, 5, 8, 10}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9918; core 34477; terminal 2605259
  { outputClauseIndex := 9918, coreClauseIndex := 34477, terminalClauseIndex := 2605259, datum := { row := ⟨4, {2, 5, 9, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9919; core 34478; terminal 2605260
  { outputClauseIndex := 9919, coreClauseIndex := 34478, terminalClauseIndex := 2605260, datum := { row := ⟨4, {2, 5, 9, 10}⟩, arc := ⟨4, .right, {2, 3, 4, 5}⟩ } },
  -- compact 9921; core 34494; terminal 2605287
  { outputClauseIndex := 9921, coreClauseIndex := 34494, terminalClauseIndex := 2605287, datum := { row := ⟨4, {2, 6, 8, 9}⟩, arc := ⟨4, .left, {0, 7, 8, 9, 10}⟩ } },
  -- compact 9922; core 34495; terminal 2605288
  { outputClauseIndex := 9922, coreClauseIndex := 34495, terminalClauseIndex := 2605288, datum := { row := ⟨4, {2, 6, 8, 9}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9924; core 34501; terminal 2605294
  { outputClauseIndex := 9924, coreClauseIndex := 34501, terminalClauseIndex := 2605294, datum := { row := ⟨4, {2, 6, 8, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9925; core 34502; terminal 2605295
  { outputClauseIndex := 9925, coreClauseIndex := 34502, terminalClauseIndex := 2605295, datum := { row := ⟨4, {2, 6, 8, 10}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9927; core 34508; terminal 2605301
  { outputClauseIndex := 9927, coreClauseIndex := 34508, terminalClauseIndex := 2605301, datum := { row := ⟨4, {2, 6, 9, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9928; core 34509; terminal 2605302
  { outputClauseIndex := 9928, coreClauseIndex := 34509, terminalClauseIndex := 2605302, datum := { row := ⟨4, {2, 6, 9, 10}⟩, arc := ⟨4, .right, {2, 3, 4, 5}⟩ } },
  -- compact 9930; core 34515; terminal 2605308
  { outputClauseIndex := 9930, coreClauseIndex := 34515, terminalClauseIndex := 2605308, datum := { row := ⟨4, {2, 7, 8, 9}⟩, arc := ⟨4, .left, {0, 7, 8, 9, 10}⟩ } },
  -- compact 9931; core 34516; terminal 2605309
  { outputClauseIndex := 9931, coreClauseIndex := 34516, terminalClauseIndex := 2605309, datum := { row := ⟨4, {2, 7, 8, 9}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9933; core 34522; terminal 2605315
  { outputClauseIndex := 9933, coreClauseIndex := 34522, terminalClauseIndex := 2605315, datum := { row := ⟨4, {2, 7, 8, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9934; core 34523; terminal 2605316
  { outputClauseIndex := 9934, coreClauseIndex := 34523, terminalClauseIndex := 2605316, datum := { row := ⟨4, {2, 7, 8, 10}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9936; core 34529; terminal 2605322
  { outputClauseIndex := 9936, coreClauseIndex := 34529, terminalClauseIndex := 2605322, datum := { row := ⟨4, {2, 7, 9, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9937; core 34530; terminal 2605323
  { outputClauseIndex := 9937, coreClauseIndex := 34530, terminalClauseIndex := 2605323, datum := { row := ⟨4, {2, 7, 9, 10}⟩, arc := ⟨4, .right, {2, 3, 4, 5}⟩ } },
  -- compact 9939; core 34536; terminal 2605329
  { outputClauseIndex := 9939, coreClauseIndex := 34536, terminalClauseIndex := 2605329, datum := { row := ⟨4, {2, 8, 9, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9940; core 34537; terminal 2605330
  { outputClauseIndex := 9940, coreClauseIndex := 34537, terminalClauseIndex := 2605330, datum := { row := ⟨4, {2, 8, 9, 10}⟩, arc := ⟨4, .right, {2, 3, 4, 5}⟩ } },
  -- compact 9942; core 34565; terminal 2605385
  { outputClauseIndex := 9942, coreClauseIndex := 34565, terminalClauseIndex := 2605385, datum := { row := ⟨4, {3, 5, 8, 9}⟩, arc := ⟨4, .left, {0, 7, 8, 9, 10}⟩ } },
  -- compact 9943; core 34566; terminal 2605386
  { outputClauseIndex := 9943, coreClauseIndex := 34566, terminalClauseIndex := 2605386, datum := { row := ⟨4, {3, 5, 8, 9}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9945; core 34572; terminal 2605392
  { outputClauseIndex := 9945, coreClauseIndex := 34572, terminalClauseIndex := 2605392, datum := { row := ⟨4, {3, 5, 8, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9946; core 34573; terminal 2605393
  { outputClauseIndex := 9946, coreClauseIndex := 34573, terminalClauseIndex := 2605393, datum := { row := ⟨4, {3, 5, 8, 10}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9948; core 34579; terminal 2605399
  { outputClauseIndex := 9948, coreClauseIndex := 34579, terminalClauseIndex := 2605399, datum := { row := ⟨4, {3, 5, 9, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9949; core 34580; terminal 2605400
  { outputClauseIndex := 9949, coreClauseIndex := 34580, terminalClauseIndex := 2605400, datum := { row := ⟨4, {3, 5, 9, 10}⟩, arc := ⟨4, .right, {2, 3, 4, 5}⟩ } },
  -- compact 9951; core 34595; terminal 2605427
  { outputClauseIndex := 9951, coreClauseIndex := 34595, terminalClauseIndex := 2605427, datum := { row := ⟨4, {3, 6, 8, 9}⟩, arc := ⟨4, .left, {0, 7, 8, 9, 10}⟩ } },
  -- compact 9952; core 34596; terminal 2605428
  { outputClauseIndex := 9952, coreClauseIndex := 34596, terminalClauseIndex := 2605428, datum := { row := ⟨4, {3, 6, 8, 9}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9954; core 34602; terminal 2605434
  { outputClauseIndex := 9954, coreClauseIndex := 34602, terminalClauseIndex := 2605434, datum := { row := ⟨4, {3, 6, 8, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9955; core 34603; terminal 2605435
  { outputClauseIndex := 9955, coreClauseIndex := 34603, terminalClauseIndex := 2605435, datum := { row := ⟨4, {3, 6, 8, 10}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9957; core 34609; terminal 2605441
  { outputClauseIndex := 9957, coreClauseIndex := 34609, terminalClauseIndex := 2605441, datum := { row := ⟨4, {3, 6, 9, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9958; core 34610; terminal 2605442
  { outputClauseIndex := 9958, coreClauseIndex := 34610, terminalClauseIndex := 2605442, datum := { row := ⟨4, {3, 6, 9, 10}⟩, arc := ⟨4, .right, {2, 3, 4, 5}⟩ } },
  -- compact 9960; core 34616; terminal 2605448
  { outputClauseIndex := 9960, coreClauseIndex := 34616, terminalClauseIndex := 2605448, datum := { row := ⟨4, {3, 7, 8, 9}⟩, arc := ⟨4, .left, {0, 7, 8, 9, 10}⟩ } },
  -- compact 9961; core 34617; terminal 2605449
  { outputClauseIndex := 9961, coreClauseIndex := 34617, terminalClauseIndex := 2605449, datum := { row := ⟨4, {3, 7, 8, 9}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9963; core 34623; terminal 2605455
  { outputClauseIndex := 9963, coreClauseIndex := 34623, terminalClauseIndex := 2605455, datum := { row := ⟨4, {3, 7, 8, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9964; core 34624; terminal 2605456
  { outputClauseIndex := 9964, coreClauseIndex := 34624, terminalClauseIndex := 2605456, datum := { row := ⟨4, {3, 7, 8, 10}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9966; core 34630; terminal 2605462
  { outputClauseIndex := 9966, coreClauseIndex := 34630, terminalClauseIndex := 2605462, datum := { row := ⟨4, {3, 7, 9, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9967; core 34631; terminal 2605463
  { outputClauseIndex := 9967, coreClauseIndex := 34631, terminalClauseIndex := 2605463, datum := { row := ⟨4, {3, 7, 9, 10}⟩, arc := ⟨4, .right, {2, 3, 4, 5}⟩ } },
  -- compact 9969; core 34637; terminal 2605469
  { outputClauseIndex := 9969, coreClauseIndex := 34637, terminalClauseIndex := 2605469, datum := { row := ⟨4, {3, 8, 9, 10}⟩, arc := ⟨4, .left, {7, 8, 9, 10}⟩ } },
  -- compact 9970; core 34638; terminal 2605470
  { outputClauseIndex := 9970, coreClauseIndex := 34638, terminalClauseIndex := 2605470, datum := { row := ⟨4, {3, 8, 9, 10}⟩, arc := ⟨4, .right, {2, 3, 4, 5}⟩ } },
  -- compact 9972; core 34670; terminal 2605539
  { outputClauseIndex := 9972, coreClauseIndex := 34670, terminalClauseIndex := 2605539, datum := { row := ⟨4, {5, 8, 9, 10}⟩, arc := ⟨4, .left, {0, 7, 8, 9, 10}⟩ } },
  -- compact 9973; core 34671; terminal 2605540
  { outputClauseIndex := 9973, coreClauseIndex := 34671, terminalClauseIndex := 2605540, datum := { row := ⟨4, {5, 8, 9, 10}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9975; core 34687; terminal 2605567
  { outputClauseIndex := 9975, coreClauseIndex := 34687, terminalClauseIndex := 2605567, datum := { row := ⟨4, {6, 8, 9, 10}⟩, arc := ⟨4, .left, {0, 7, 8, 9, 10}⟩ } },
  -- compact 9976; core 34688; terminal 2605568
  { outputClauseIndex := 9976, coreClauseIndex := 34688, terminalClauseIndex := 2605568, datum := { row := ⟨4, {6, 8, 9, 10}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9978; core 34694; terminal 2605574
  { outputClauseIndex := 9978, coreClauseIndex := 34694, terminalClauseIndex := 2605574, datum := { row := ⟨4, {7, 8, 9, 10}⟩, arc := ⟨4, .left, {0, 7, 8, 9, 10}⟩ } },
  -- compact 9979; core 34695; terminal 2605575
  { outputClauseIndex := 9979, coreClauseIndex := 34695, terminalClauseIndex := 2605575, datum := { row := ⟨4, {7, 8, 9, 10}⟩, arc := ⟨4, .right, {3, 4, 5}⟩ } },
  -- compact 9980; core 34700; terminal 2605581
  { outputClauseIndex := 9980, coreClauseIndex := 34700, terminalClauseIndex := 2605581, datum := { row := ⟨5, {0, 1, 2, 3}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 9981; core 34701; terminal 2605582
  { outputClauseIndex := 9981, coreClauseIndex := 34701, terminalClauseIndex := 2605582, datum := { row := ⟨5, {0, 1, 2, 3}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 9983; core 34707; terminal 2605588
  { outputClauseIndex := 9983, coreClauseIndex := 34707, terminalClauseIndex := 2605588, datum := { row := ⟨5, {0, 1, 2, 4}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 9984; core 34708; terminal 2605589
  { outputClauseIndex := 9984, coreClauseIndex := 34708, terminalClauseIndex := 2605589, datum := { row := ⟨5, {0, 1, 2, 4}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4, 10}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk008_batch_valid :
    directRowArcFiniteOccurrencesChunk008.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk008, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk008 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk008.map (·.datum)

theorem directRowArcFiniteDataChunk008_batch_valid :
    directRowArcFiniteDataChunk008.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk008, datum.Valid := by
  rw [directRowArcFiniteDataChunk008]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk008_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk008_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
