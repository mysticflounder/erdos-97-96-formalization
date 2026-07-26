/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk000 : List DirectRowArcFiniteOccurrence := [
  -- compact 8430; core 29749; terminal 2598679
  { outputClauseIndex := 8430, coreClauseIndex := 29749, terminalClauseIndex := 2598679, datum := { row := ⟨0, {1, 5, 6, 7}⟩, arc := ⟨0, .left, {0, 1, 2, 3}⟩ } },
  -- compact 8431; core 29750; terminal 2598680
  { outputClauseIndex := 8431, coreClauseIndex := 29750, terminalClauseIndex := 2598680, datum := { row := ⟨0, {1, 5, 6, 7}⟩, arc := ⟨0, .right, {6, 7, 8, 9}⟩ } },
  -- compact 8433; core 29754; terminal 2598686
  { outputClauseIndex := 8433, coreClauseIndex := 29754, terminalClauseIndex := 2598686, datum := { row := ⟨0, {1, 5, 6, 8}⟩, arc := ⟨0, .left, {0, 1, 2, 3}⟩ } },
  -- compact 8434; core 29755; terminal 2598687
  { outputClauseIndex := 8434, coreClauseIndex := 29755, terminalClauseIndex := 2598687, datum := { row := ⟨0, {1, 5, 6, 8}⟩, arc := ⟨0, .right, {6, 7, 8, 9}⟩ } },
  -- compact 8436; core 29759; terminal 2598693
  { outputClauseIndex := 8436, coreClauseIndex := 29759, terminalClauseIndex := 2598693, datum := { row := ⟨0, {1, 5, 6, 9}⟩, arc := ⟨0, .left, {0, 1, 2, 3}⟩ } },
  -- compact 8437; core 29760; terminal 2598694
  { outputClauseIndex := 8437, coreClauseIndex := 29760, terminalClauseIndex := 2598694, datum := { row := ⟨0, {1, 5, 6, 9}⟩, arc := ⟨0, .right, {6, 7, 8, 9}⟩ } },
  -- compact 8439; core 29764; terminal 2598700
  { outputClauseIndex := 8439, coreClauseIndex := 29764, terminalClauseIndex := 2598700, datum := { row := ⟨0, {1, 5, 6, 10}⟩, arc := ⟨0, .left, {0, 1, 2, 3}⟩ } },
  -- compact 8440; core 29765; terminal 2598701
  { outputClauseIndex := 8440, coreClauseIndex := 29765, terminalClauseIndex := 2598701, datum := { row := ⟨0, {1, 5, 6, 10}⟩, arc := ⟨0, .right, {6, 7, 8, 9}⟩ } },
  -- compact 8442; core 29861; terminal 2599071
  { outputClauseIndex := 8442, coreClauseIndex := 29861, terminalClauseIndex := 2599071, datum := { row := ⟨0, {2, 5, 6, 7}⟩, arc := ⟨0, .left, {0, 1, 2, 3}⟩ } },
  -- compact 8443; core 29862; terminal 2599072
  { outputClauseIndex := 8443, coreClauseIndex := 29862, terminalClauseIndex := 2599072, datum := { row := ⟨0, {2, 5, 6, 7}⟩, arc := ⟨0, .right, {6, 7, 8, 9}⟩ } },
  -- compact 8445; core 29866; terminal 2599078
  { outputClauseIndex := 8445, coreClauseIndex := 29866, terminalClauseIndex := 2599078, datum := { row := ⟨0, {2, 5, 6, 8}⟩, arc := ⟨0, .left, {0, 1, 2, 3}⟩ } },
  -- compact 8446; core 29867; terminal 2599079
  { outputClauseIndex := 8446, coreClauseIndex := 29867, terminalClauseIndex := 2599079, datum := { row := ⟨0, {2, 5, 6, 8}⟩, arc := ⟨0, .right, {6, 7, 8, 9}⟩ } },
  -- compact 8448; core 29871; terminal 2599085
  { outputClauseIndex := 8448, coreClauseIndex := 29871, terminalClauseIndex := 2599085, datum := { row := ⟨0, {2, 5, 6, 9}⟩, arc := ⟨0, .left, {0, 1, 2, 3}⟩ } },
  -- compact 8449; core 29872; terminal 2599086
  { outputClauseIndex := 8449, coreClauseIndex := 29872, terminalClauseIndex := 2599086, datum := { row := ⟨0, {2, 5, 6, 9}⟩, arc := ⟨0, .right, {6, 7, 8, 9}⟩ } },
  -- compact 8451; core 29876; terminal 2599092
  { outputClauseIndex := 8451, coreClauseIndex := 29876, terminalClauseIndex := 2599092, datum := { row := ⟨0, {2, 5, 6, 10}⟩, arc := ⟨0, .left, {0, 1, 2, 3}⟩ } },
  -- compact 8452; core 29877; terminal 2599093
  { outputClauseIndex := 8452, coreClauseIndex := 29877, terminalClauseIndex := 2599093, datum := { row := ⟨0, {2, 5, 6, 10}⟩, arc := ⟨0, .right, {6, 7, 8, 9}⟩ } },
  -- compact 8454; core 29948; terminal 2599316
  { outputClauseIndex := 8454, coreClauseIndex := 29948, terminalClauseIndex := 2599316, datum := { row := ⟨0, {3, 5, 6, 7}⟩, arc := ⟨0, .left, {0, 1, 2, 3}⟩ } },
  -- compact 8455; core 29949; terminal 2599317
  { outputClauseIndex := 8455, coreClauseIndex := 29949, terminalClauseIndex := 2599317, datum := { row := ⟨0, {3, 5, 6, 7}⟩, arc := ⟨0, .right, {6, 7, 8, 9}⟩ } },
  -- compact 8457; core 29953; terminal 2599323
  { outputClauseIndex := 8457, coreClauseIndex := 29953, terminalClauseIndex := 2599323, datum := { row := ⟨0, {3, 5, 6, 8}⟩, arc := ⟨0, .left, {0, 1, 2, 3}⟩ } },
  -- compact 8458; core 29954; terminal 2599324
  { outputClauseIndex := 8458, coreClauseIndex := 29954, terminalClauseIndex := 2599324, datum := { row := ⟨0, {3, 5, 6, 8}⟩, arc := ⟨0, .right, {6, 7, 8, 9}⟩ } },
  -- compact 8460; core 29958; terminal 2599330
  { outputClauseIndex := 8460, coreClauseIndex := 29958, terminalClauseIndex := 2599330, datum := { row := ⟨0, {3, 5, 6, 9}⟩, arc := ⟨0, .left, {0, 1, 2, 3}⟩ } },
  -- compact 8461; core 29959; terminal 2599331
  { outputClauseIndex := 8461, coreClauseIndex := 29959, terminalClauseIndex := 2599331, datum := { row := ⟨0, {3, 5, 6, 9}⟩, arc := ⟨0, .right, {6, 7, 8, 9}⟩ } },
  -- compact 8463; core 29963; terminal 2599337
  { outputClauseIndex := 8463, coreClauseIndex := 29963, terminalClauseIndex := 2599337, datum := { row := ⟨0, {3, 5, 6, 10}⟩, arc := ⟨0, .left, {0, 1, 2, 3}⟩ } },
  -- compact 8464; core 29964; terminal 2599338
  { outputClauseIndex := 8464, coreClauseIndex := 29964, terminalClauseIndex := 2599338, datum := { row := ⟨0, {3, 5, 6, 10}⟩, arc := ⟨0, .right, {6, 7, 8, 9}⟩ } },
  -- compact 8466; core 29994; terminal 2599456
  { outputClauseIndex := 8466, coreClauseIndex := 29994, terminalClauseIndex := 2599456, datum := { row := ⟨0, {4, 5, 6, 7}⟩, arc := ⟨0, .left, {0, 1, 2, 3}⟩ } },
  -- compact 8467; core 29995; terminal 2599457
  { outputClauseIndex := 8467, coreClauseIndex := 29995, terminalClauseIndex := 2599457, datum := { row := ⟨0, {4, 5, 6, 7}⟩, arc := ⟨0, .right, {6, 7, 8, 9}⟩ } },
  -- compact 8469; core 29999; terminal 2599463
  { outputClauseIndex := 8469, coreClauseIndex := 29999, terminalClauseIndex := 2599463, datum := { row := ⟨0, {4, 5, 6, 8}⟩, arc := ⟨0, .left, {0, 1, 2, 3}⟩ } },
  -- compact 8470; core 30000; terminal 2599464
  { outputClauseIndex := 8470, coreClauseIndex := 30000, terminalClauseIndex := 2599464, datum := { row := ⟨0, {4, 5, 6, 8}⟩, arc := ⟨0, .right, {6, 7, 8, 9}⟩ } },
  -- compact 8472; core 30004; terminal 2599470
  { outputClauseIndex := 8472, coreClauseIndex := 30004, terminalClauseIndex := 2599470, datum := { row := ⟨0, {4, 5, 6, 9}⟩, arc := ⟨0, .left, {0, 1, 2, 3}⟩ } },
  -- compact 8473; core 30005; terminal 2599471
  { outputClauseIndex := 8473, coreClauseIndex := 30005, terminalClauseIndex := 2599471, datum := { row := ⟨0, {4, 5, 6, 9}⟩, arc := ⟨0, .right, {6, 7, 8, 9}⟩ } },
  -- compact 8475; core 30009; terminal 2599477
  { outputClauseIndex := 8475, coreClauseIndex := 30009, terminalClauseIndex := 2599477, datum := { row := ⟨0, {4, 5, 6, 10}⟩, arc := ⟨0, .left, {0, 1, 2, 3}⟩ } },
  -- compact 8476; core 30010; terminal 2599478
  { outputClauseIndex := 8476, coreClauseIndex := 30010, terminalClauseIndex := 2599478, datum := { row := ⟨0, {4, 5, 6, 10}⟩, arc := ⟨0, .right, {6, 7, 8, 9}⟩ } },
  -- compact 8477; core 30061; terminal 2599702
  { outputClauseIndex := 8477, coreClauseIndex := 30061, terminalClauseIndex := 2599702, datum := { row := ⟨1, {0, 2, 3, 4}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8478; core 30066; terminal 2599708
  { outputClauseIndex := 8478, coreClauseIndex := 30066, terminalClauseIndex := 2599708, datum := { row := ⟨1, {0, 2, 3, 5}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 8479; core 30087; terminal 2599743
  { outputClauseIndex := 8479, coreClauseIndex := 30087, terminalClauseIndex := 2599743, datum := { row := ⟨1, {0, 2, 3, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8480; core 30092; terminal 2599751
  { outputClauseIndex := 8480, coreClauseIndex := 30092, terminalClauseIndex := 2599751, datum := { row := ⟨1, {0, 2, 4, 5}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8481; core 30097; terminal 2599758
  { outputClauseIndex := 8481, coreClauseIndex := 30097, terminalClauseIndex := 2599758, datum := { row := ⟨1, {0, 2, 4, 6}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8482; core 30102; terminal 2599765
  { outputClauseIndex := 8482, coreClauseIndex := 30102, terminalClauseIndex := 2599765, datum := { row := ⟨1, {0, 2, 4, 7}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8483; core 30107; terminal 2599772
  { outputClauseIndex := 8483, coreClauseIndex := 30107, terminalClauseIndex := 2599772, datum := { row := ⟨1, {0, 2, 4, 8}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8484; core 30112; terminal 2599779
  { outputClauseIndex := 8484, coreClauseIndex := 30112, terminalClauseIndex := 2599779, datum := { row := ⟨1, {0, 2, 4, 9}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8485; core 30117; terminal 2599785
  { outputClauseIndex := 8485, coreClauseIndex := 30117, terminalClauseIndex := 2599785, datum := { row := ⟨1, {0, 2, 4, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8486; core 30118; terminal 2599786
  { outputClauseIndex := 8486, coreClauseIndex := 30118, terminalClauseIndex := 2599786, datum := { row := ⟨1, {0, 2, 4, 10}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8487; core 30123; terminal 2599793
  { outputClauseIndex := 8487, coreClauseIndex := 30123, terminalClauseIndex := 2599793, datum := { row := ⟨1, {0, 2, 5, 6}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8488; core 30128; terminal 2599799
  { outputClauseIndex := 8488, coreClauseIndex := 30128, terminalClauseIndex := 2599799, datum := { row := ⟨1, {0, 2, 5, 7}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8489; core 30129; terminal 2599800
  { outputClauseIndex := 8489, coreClauseIndex := 30129, terminalClauseIndex := 2599800, datum := { row := ⟨1, {0, 2, 5, 7}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8490; core 30134; terminal 2599806
  { outputClauseIndex := 8490, coreClauseIndex := 30134, terminalClauseIndex := 2599806, datum := { row := ⟨1, {0, 2, 5, 8}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8491; core 30135; terminal 2599807
  { outputClauseIndex := 8491, coreClauseIndex := 30135, terminalClauseIndex := 2599807, datum := { row := ⟨1, {0, 2, 5, 8}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8492; core 30140; terminal 2599813
  { outputClauseIndex := 8492, coreClauseIndex := 30140, terminalClauseIndex := 2599813, datum := { row := ⟨1, {0, 2, 5, 9}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8493; core 30141; terminal 2599814
  { outputClauseIndex := 8493, coreClauseIndex := 30141, terminalClauseIndex := 2599814, datum := { row := ⟨1, {0, 2, 5, 9}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8494; core 30146; terminal 2599820
  { outputClauseIndex := 8494, coreClauseIndex := 30146, terminalClauseIndex := 2599820, datum := { row := ⟨1, {0, 2, 5, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8495; core 30147; terminal 2599821
  { outputClauseIndex := 8495, coreClauseIndex := 30147, terminalClauseIndex := 2599821, datum := { row := ⟨1, {0, 2, 5, 10}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8496; core 30152; terminal 2599827
  { outputClauseIndex := 8496, coreClauseIndex := 30152, terminalClauseIndex := 2599827, datum := { row := ⟨1, {0, 2, 6, 7}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8497; core 30157; terminal 2599834
  { outputClauseIndex := 8497, coreClauseIndex := 30157, terminalClauseIndex := 2599834, datum := { row := ⟨1, {0, 2, 6, 8}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8498; core 30162; terminal 2599841
  { outputClauseIndex := 8498, coreClauseIndex := 30162, terminalClauseIndex := 2599841, datum := { row := ⟨1, {0, 2, 6, 9}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8500; core 30168; terminal 2599848
  { outputClauseIndex := 8500, coreClauseIndex := 30168, terminalClauseIndex := 2599848, datum := { row := ⟨1, {0, 2, 6, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8501; core 30173; terminal 2599855
  { outputClauseIndex := 8501, coreClauseIndex := 30173, terminalClauseIndex := 2599855, datum := { row := ⟨1, {0, 2, 7, 8}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8502; core 30174; terminal 2599856
  { outputClauseIndex := 8502, coreClauseIndex := 30174, terminalClauseIndex := 2599856, datum := { row := ⟨1, {0, 2, 7, 8}⟩, arc := ⟨1, .right, {4, 5, 6, 7, 8}⟩ } },
  -- compact 8503; core 30179; terminal 2599862
  { outputClauseIndex := 8503, coreClauseIndex := 30179, terminalClauseIndex := 2599862, datum := { row := ⟨1, {0, 2, 7, 9}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8504; core 30180; terminal 2599863
  { outputClauseIndex := 8504, coreClauseIndex := 30180, terminalClauseIndex := 2599863, datum := { row := ⟨1, {0, 2, 7, 9}⟩, arc := ⟨1, .right, {4, 5, 6, 7, 8}⟩ } },
  -- compact 8505; core 30185; terminal 2599869
  { outputClauseIndex := 8505, coreClauseIndex := 30185, terminalClauseIndex := 2599869, datum := { row := ⟨1, {0, 2, 7, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8506; core 30186; terminal 2599870
  { outputClauseIndex := 8506, coreClauseIndex := 30186, terminalClauseIndex := 2599870, datum := { row := ⟨1, {0, 2, 7, 10}⟩, arc := ⟨1, .right, {4, 5, 6, 7, 8}⟩ } },
  -- compact 8508; core 30191; terminal 2599876
  { outputClauseIndex := 8508, coreClauseIndex := 30191, terminalClauseIndex := 2599876, datum := { row := ⟨1, {0, 2, 8, 9}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8509; core 30195; terminal 2599883
  { outputClauseIndex := 8509, coreClauseIndex := 30195, terminalClauseIndex := 2599883, datum := { row := ⟨1, {0, 2, 8, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8510; core 30196; terminal 2599884
  { outputClauseIndex := 8510, coreClauseIndex := 30196, terminalClauseIndex := 2599884, datum := { row := ⟨1, {0, 2, 8, 10}⟩, arc := ⟨1, .right, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 8512; core 30201; terminal 2599890
  { outputClauseIndex := 8512, coreClauseIndex := 30201, terminalClauseIndex := 2599890, datum := { row := ⟨1, {0, 2, 9, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8513; core 30202; terminal 2599891
  { outputClauseIndex := 8513, coreClauseIndex := 30202, terminalClauseIndex := 2599891, datum := { row := ⟨1, {0, 2, 9, 10}⟩, arc := ⟨1, .right, {2, 3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 8514; core 30207; terminal 2599897
  { outputClauseIndex := 8514, coreClauseIndex := 30207, terminalClauseIndex := 2599897, datum := { row := ⟨1, {0, 3, 4, 5}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 8515; core 30208; terminal 2599898
  { outputClauseIndex := 8515, coreClauseIndex := 30208, terminalClauseIndex := 2599898, datum := { row := ⟨1, {0, 3, 4, 5}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8516; core 30213; terminal 2599905
  { outputClauseIndex := 8516, coreClauseIndex := 30213, terminalClauseIndex := 2599905, datum := { row := ⟨1, {0, 3, 4, 6}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8517; core 30218; terminal 2599912
  { outputClauseIndex := 8517, coreClauseIndex := 30218, terminalClauseIndex := 2599912, datum := { row := ⟨1, {0, 3, 4, 7}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8518; core 30223; terminal 2599919
  { outputClauseIndex := 8518, coreClauseIndex := 30223, terminalClauseIndex := 2599919, datum := { row := ⟨1, {0, 3, 4, 8}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8519; core 30228; terminal 2599926
  { outputClauseIndex := 8519, coreClauseIndex := 30228, terminalClauseIndex := 2599926, datum := { row := ⟨1, {0, 3, 4, 9}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8520; core 30233; terminal 2599932
  { outputClauseIndex := 8520, coreClauseIndex := 30233, terminalClauseIndex := 2599932, datum := { row := ⟨1, {0, 3, 4, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8521; core 30234; terminal 2599933
  { outputClauseIndex := 8521, coreClauseIndex := 30234, terminalClauseIndex := 2599933, datum := { row := ⟨1, {0, 3, 4, 10}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8522; core 30239; terminal 2599940
  { outputClauseIndex := 8522, coreClauseIndex := 30239, terminalClauseIndex := 2599940, datum := { row := ⟨1, {0, 3, 5, 6}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8523; core 30244; terminal 2599946
  { outputClauseIndex := 8523, coreClauseIndex := 30244, terminalClauseIndex := 2599946, datum := { row := ⟨1, {0, 3, 5, 7}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8524; core 30245; terminal 2599947
  { outputClauseIndex := 8524, coreClauseIndex := 30245, terminalClauseIndex := 2599947, datum := { row := ⟨1, {0, 3, 5, 7}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8525; core 30250; terminal 2599953
  { outputClauseIndex := 8525, coreClauseIndex := 30250, terminalClauseIndex := 2599953, datum := { row := ⟨1, {0, 3, 5, 8}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8526; core 30251; terminal 2599954
  { outputClauseIndex := 8526, coreClauseIndex := 30251, terminalClauseIndex := 2599954, datum := { row := ⟨1, {0, 3, 5, 8}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8527; core 30256; terminal 2599960
  { outputClauseIndex := 8527, coreClauseIndex := 30256, terminalClauseIndex := 2599960, datum := { row := ⟨1, {0, 3, 5, 9}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8528; core 30257; terminal 2599961
  { outputClauseIndex := 8528, coreClauseIndex := 30257, terminalClauseIndex := 2599961, datum := { row := ⟨1, {0, 3, 5, 9}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8529; core 30262; terminal 2599967
  { outputClauseIndex := 8529, coreClauseIndex := 30262, terminalClauseIndex := 2599967, datum := { row := ⟨1, {0, 3, 5, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8530; core 30263; terminal 2599968
  { outputClauseIndex := 8530, coreClauseIndex := 30263, terminalClauseIndex := 2599968, datum := { row := ⟨1, {0, 3, 5, 10}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8531; core 30268; terminal 2599974
  { outputClauseIndex := 8531, coreClauseIndex := 30268, terminalClauseIndex := 2599974, datum := { row := ⟨1, {0, 3, 6, 7}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8532; core 30273; terminal 2599981
  { outputClauseIndex := 8532, coreClauseIndex := 30273, terminalClauseIndex := 2599981, datum := { row := ⟨1, {0, 3, 6, 8}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8533; core 30278; terminal 2599988
  { outputClauseIndex := 8533, coreClauseIndex := 30278, terminalClauseIndex := 2599988, datum := { row := ⟨1, {0, 3, 6, 9}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8534; core 30283; terminal 2599995
  { outputClauseIndex := 8534, coreClauseIndex := 30283, terminalClauseIndex := 2599995, datum := { row := ⟨1, {0, 3, 6, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8536; core 30289; terminal 2600002
  { outputClauseIndex := 8536, coreClauseIndex := 30289, terminalClauseIndex := 2600002, datum := { row := ⟨1, {0, 3, 7, 8}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8537; core 30290; terminal 2600003
  { outputClauseIndex := 8537, coreClauseIndex := 30290, terminalClauseIndex := 2600003, datum := { row := ⟨1, {0, 3, 7, 8}⟩, arc := ⟨1, .right, {4, 5, 6, 7, 8}⟩ } },
  -- compact 8538; core 30295; terminal 2600009
  { outputClauseIndex := 8538, coreClauseIndex := 30295, terminalClauseIndex := 2600009, datum := { row := ⟨1, {0, 3, 7, 9}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8539; core 30296; terminal 2600010
  { outputClauseIndex := 8539, coreClauseIndex := 30296, terminalClauseIndex := 2600010, datum := { row := ⟨1, {0, 3, 7, 9}⟩, arc := ⟨1, .right, {4, 5, 6, 7, 8}⟩ } },
  -- compact 8540; core 30301; terminal 2600016
  { outputClauseIndex := 8540, coreClauseIndex := 30301, terminalClauseIndex := 2600016, datum := { row := ⟨1, {0, 3, 7, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8541; core 30302; terminal 2600017
  { outputClauseIndex := 8541, coreClauseIndex := 30302, terminalClauseIndex := 2600017, datum := { row := ⟨1, {0, 3, 7, 10}⟩, arc := ⟨1, .right, {4, 5, 6, 7, 8}⟩ } },
  -- compact 8543; core 30307; terminal 2600023
  { outputClauseIndex := 8543, coreClauseIndex := 30307, terminalClauseIndex := 2600023, datum := { row := ⟨1, {0, 3, 8, 9}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8544; core 30312; terminal 2600030
  { outputClauseIndex := 8544, coreClauseIndex := 30312, terminalClauseIndex := 2600030, datum := { row := ⟨1, {0, 3, 8, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8545; core 30313; terminal 2600031
  { outputClauseIndex := 8545, coreClauseIndex := 30313, terminalClauseIndex := 2600031, datum := { row := ⟨1, {0, 3, 8, 10}⟩, arc := ⟨1, .right, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 8547; core 30318; terminal 2600037
  { outputClauseIndex := 8547, coreClauseIndex := 30318, terminalClauseIndex := 2600037, datum := { row := ⟨1, {0, 3, 9, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8548; core 30319; terminal 2600038
  { outputClauseIndex := 8548, coreClauseIndex := 30319, terminalClauseIndex := 2600038, datum := { row := ⟨1, {0, 3, 9, 10}⟩, arc := ⟨1, .right, {2, 3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 8549; core 30323; terminal 2600045
  { outputClauseIndex := 8549, coreClauseIndex := 30323, terminalClauseIndex := 2600045, datum := { row := ⟨1, {0, 4, 5, 6}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8551; core 30329; terminal 2600051
  { outputClauseIndex := 8551, coreClauseIndex := 30329, terminalClauseIndex := 2600051, datum := { row := ⟨1, {0, 4, 5, 7}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8552; core 30330; terminal 2600052
  { outputClauseIndex := 8552, coreClauseIndex := 30330, terminalClauseIndex := 2600052, datum := { row := ⟨1, {0, 4, 5, 7}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8553; core 30335; terminal 2600058
  { outputClauseIndex := 8553, coreClauseIndex := 30335, terminalClauseIndex := 2600058, datum := { row := ⟨1, {0, 4, 5, 8}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8554; core 30336; terminal 2600059
  { outputClauseIndex := 8554, coreClauseIndex := 30336, terminalClauseIndex := 2600059, datum := { row := ⟨1, {0, 4, 5, 8}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8555; core 30341; terminal 2600065
  { outputClauseIndex := 8555, coreClauseIndex := 30341, terminalClauseIndex := 2600065, datum := { row := ⟨1, {0, 4, 5, 9}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8556; core 30342; terminal 2600066
  { outputClauseIndex := 8556, coreClauseIndex := 30342, terminalClauseIndex := 2600066, datum := { row := ⟨1, {0, 4, 5, 9}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8557; core 30347; terminal 2600072
  { outputClauseIndex := 8557, coreClauseIndex := 30347, terminalClauseIndex := 2600072, datum := { row := ⟨1, {0, 4, 5, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8558; core 30348; terminal 2600073
  { outputClauseIndex := 8558, coreClauseIndex := 30348, terminalClauseIndex := 2600073, datum := { row := ⟨1, {0, 4, 5, 10}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8559; core 30353; terminal 2600079
  { outputClauseIndex := 8559, coreClauseIndex := 30353, terminalClauseIndex := 2600079, datum := { row := ⟨1, {0, 4, 6, 7}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8560; core 30358; terminal 2600086
  { outputClauseIndex := 8560, coreClauseIndex := 30358, terminalClauseIndex := 2600086, datum := { row := ⟨1, {0, 4, 6, 8}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8561; core 30363; terminal 2600093
  { outputClauseIndex := 8561, coreClauseIndex := 30363, terminalClauseIndex := 2600093, datum := { row := ⟨1, {0, 4, 6, 9}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8562; core 30368; terminal 2600100
  { outputClauseIndex := 8562, coreClauseIndex := 30368, terminalClauseIndex := 2600100, datum := { row := ⟨1, {0, 4, 6, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8563; core 30373; terminal 2600107
  { outputClauseIndex := 8563, coreClauseIndex := 30373, terminalClauseIndex := 2600107, datum := { row := ⟨1, {0, 4, 7, 8}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8564; core 30374; terminal 2600108
  { outputClauseIndex := 8564, coreClauseIndex := 30374, terminalClauseIndex := 2600108, datum := { row := ⟨1, {0, 4, 7, 8}⟩, arc := ⟨1, .right, {4, 5, 6, 7, 8}⟩ } },
  -- compact 8565; core 30379; terminal 2600114
  { outputClauseIndex := 8565, coreClauseIndex := 30379, terminalClauseIndex := 2600114, datum := { row := ⟨1, {0, 4, 7, 9}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8566; core 30380; terminal 2600115
  { outputClauseIndex := 8566, coreClauseIndex := 30380, terminalClauseIndex := 2600115, datum := { row := ⟨1, {0, 4, 7, 9}⟩, arc := ⟨1, .right, {4, 5, 6, 7, 8}⟩ } },
  -- compact 8567; core 30385; terminal 2600121
  { outputClauseIndex := 8567, coreClauseIndex := 30385, terminalClauseIndex := 2600121, datum := { row := ⟨1, {0, 4, 7, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8568; core 30386; terminal 2600122
  { outputClauseIndex := 8568, coreClauseIndex := 30386, terminalClauseIndex := 2600122, datum := { row := ⟨1, {0, 4, 7, 10}⟩, arc := ⟨1, .right, {4, 5, 6, 7, 8}⟩ } },
  -- compact 8570; core 30391; terminal 2600128
  { outputClauseIndex := 8570, coreClauseIndex := 30391, terminalClauseIndex := 2600128, datum := { row := ⟨1, {0, 4, 8, 9}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8571; core 30396; terminal 2600135
  { outputClauseIndex := 8571, coreClauseIndex := 30396, terminalClauseIndex := 2600135, datum := { row := ⟨1, {0, 4, 8, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8572; core 30397; terminal 2600136
  { outputClauseIndex := 8572, coreClauseIndex := 30397, terminalClauseIndex := 2600136, datum := { row := ⟨1, {0, 4, 8, 10}⟩, arc := ⟨1, .right, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 8574; core 30402; terminal 2600142
  { outputClauseIndex := 8574, coreClauseIndex := 30402, terminalClauseIndex := 2600142, datum := { row := ⟨1, {0, 4, 9, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8575; core 30403; terminal 2600143
  { outputClauseIndex := 8575, coreClauseIndex := 30403, terminalClauseIndex := 2600143, datum := { row := ⟨1, {0, 4, 9, 10}⟩, arc := ⟨1, .right, {2, 3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 8576; core 30408; terminal 2600149
  { outputClauseIndex := 8576, coreClauseIndex := 30408, terminalClauseIndex := 2600149, datum := { row := ⟨1, {0, 5, 6, 7}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8577; core 30413; terminal 2600156
  { outputClauseIndex := 8577, coreClauseIndex := 30413, terminalClauseIndex := 2600156, datum := { row := ⟨1, {0, 5, 6, 8}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8578; core 30418; terminal 2600163
  { outputClauseIndex := 8578, coreClauseIndex := 30418, terminalClauseIndex := 2600163, datum := { row := ⟨1, {0, 5, 6, 9}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8579; core 30423; terminal 2600170
  { outputClauseIndex := 8579, coreClauseIndex := 30423, terminalClauseIndex := 2600170, datum := { row := ⟨1, {0, 5, 6, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8580; core 30428; terminal 2600177
  { outputClauseIndex := 8580, coreClauseIndex := 30428, terminalClauseIndex := 2600177, datum := { row := ⟨1, {0, 5, 7, 8}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8581; core 30433; terminal 2600184
  { outputClauseIndex := 8581, coreClauseIndex := 30433, terminalClauseIndex := 2600184, datum := { row := ⟨1, {0, 5, 7, 9}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk000_batch_valid :
    directRowArcFiniteOccurrencesChunk000.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk000, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk000 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk000.map (·.datum)

theorem directRowArcFiniteDataChunk000_batch_valid :
    directRowArcFiniteDataChunk000.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk000, datum.Valid := by
  rw [directRowArcFiniteDataChunk000]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk000_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk000_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
