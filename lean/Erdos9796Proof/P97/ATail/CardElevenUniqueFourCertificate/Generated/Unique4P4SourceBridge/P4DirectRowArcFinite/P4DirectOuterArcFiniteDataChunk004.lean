/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk004 : List DirectRowArcFiniteOccurrence := [
  -- compact 9076; core 31824; terminal 2601865
  { outputClauseIndex := 9076, coreClauseIndex := 31824, terminalClauseIndex := 2601865, datum := { row := ⟨2, {1, 3, 7, 8}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9078; core 31830; terminal 2601871
  { outputClauseIndex := 9078, coreClauseIndex := 31830, terminalClauseIndex := 2601871, datum := { row := ⟨2, {1, 3, 7, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9079; core 31831; terminal 2601872
  { outputClauseIndex := 9079, coreClauseIndex := 31831, terminalClauseIndex := 2601872, datum := { row := ⟨2, {1, 3, 7, 9}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9081; core 31837; terminal 2601878
  { outputClauseIndex := 9081, coreClauseIndex := 31837, terminalClauseIndex := 2601878, datum := { row := ⟨2, {1, 3, 7, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9082; core 31838; terminal 2601879
  { outputClauseIndex := 9082, coreClauseIndex := 31838, terminalClauseIndex := 2601879, datum := { row := ⟨2, {1, 3, 7, 10}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9084; core 31844; terminal 2601885
  { outputClauseIndex := 9084, coreClauseIndex := 31844, terminalClauseIndex := 2601885, datum := { row := ⟨2, {1, 3, 8, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9085; core 31845; terminal 2601886
  { outputClauseIndex := 9085, coreClauseIndex := 31845, terminalClauseIndex := 2601886, datum := { row := ⟨2, {1, 3, 8, 9}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9087; core 31851; terminal 2601892
  { outputClauseIndex := 9087, coreClauseIndex := 31851, terminalClauseIndex := 2601892, datum := { row := ⟨2, {1, 3, 8, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9088; core 31852; terminal 2601893
  { outputClauseIndex := 9088, coreClauseIndex := 31852, terminalClauseIndex := 2601893, datum := { row := ⟨2, {1, 3, 8, 10}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9090; core 31858; terminal 2601899
  { outputClauseIndex := 9090, coreClauseIndex := 31858, terminalClauseIndex := 2601899, datum := { row := ⟨2, {1, 3, 9, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9091; core 31859; terminal 2601900
  { outputClauseIndex := 9091, coreClauseIndex := 31859, terminalClauseIndex := 2601900, datum := { row := ⟨2, {1, 3, 9, 10}⟩, arc := ⟨2, .right, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 9093; core 31869; terminal 2601913
  { outputClauseIndex := 9093, coreClauseIndex := 31869, terminalClauseIndex := 2601913, datum := { row := ⟨2, {1, 4, 5, 7}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9094; core 31870; terminal 2601914
  { outputClauseIndex := 9094, coreClauseIndex := 31870, terminalClauseIndex := 2601914, datum := { row := ⟨2, {1, 4, 5, 7}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9096; core 31876; terminal 2601920
  { outputClauseIndex := 9096, coreClauseIndex := 31876, terminalClauseIndex := 2601920, datum := { row := ⟨2, {1, 4, 5, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9097; core 31877; terminal 2601921
  { outputClauseIndex := 9097, coreClauseIndex := 31877, terminalClauseIndex := 2601921, datum := { row := ⟨2, {1, 4, 5, 8}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9099; core 31883; terminal 2601927
  { outputClauseIndex := 9099, coreClauseIndex := 31883, terminalClauseIndex := 2601927, datum := { row := ⟨2, {1, 4, 5, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9100; core 31884; terminal 2601928
  { outputClauseIndex := 9100, coreClauseIndex := 31884, terminalClauseIndex := 2601928, datum := { row := ⟨2, {1, 4, 5, 9}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9102; core 31890; terminal 2601934
  { outputClauseIndex := 9102, coreClauseIndex := 31890, terminalClauseIndex := 2601934, datum := { row := ⟨2, {1, 4, 5, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9103; core 31891; terminal 2601935
  { outputClauseIndex := 9103, coreClauseIndex := 31891, terminalClauseIndex := 2601935, datum := { row := ⟨2, {1, 4, 5, 10}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9105; core 31897; terminal 2601941
  { outputClauseIndex := 9105, coreClauseIndex := 31897, terminalClauseIndex := 2601941, datum := { row := ⟨2, {1, 4, 6, 7}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9106; core 31898; terminal 2601942
  { outputClauseIndex := 9106, coreClauseIndex := 31898, terminalClauseIndex := 2601942, datum := { row := ⟨2, {1, 4, 6, 7}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9108; core 31904; terminal 2601948
  { outputClauseIndex := 9108, coreClauseIndex := 31904, terminalClauseIndex := 2601948, datum := { row := ⟨2, {1, 4, 6, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9109; core 31905; terminal 2601949
  { outputClauseIndex := 9109, coreClauseIndex := 31905, terminalClauseIndex := 2601949, datum := { row := ⟨2, {1, 4, 6, 8}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9111; core 31911; terminal 2601955
  { outputClauseIndex := 9111, coreClauseIndex := 31911, terminalClauseIndex := 2601955, datum := { row := ⟨2, {1, 4, 6, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9112; core 31912; terminal 2601956
  { outputClauseIndex := 9112, coreClauseIndex := 31912, terminalClauseIndex := 2601956, datum := { row := ⟨2, {1, 4, 6, 9}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9114; core 31918; terminal 2601962
  { outputClauseIndex := 9114, coreClauseIndex := 31918, terminalClauseIndex := 2601962, datum := { row := ⟨2, {1, 4, 6, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9115; core 31919; terminal 2601963
  { outputClauseIndex := 9115, coreClauseIndex := 31919, terminalClauseIndex := 2601963, datum := { row := ⟨2, {1, 4, 6, 10}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9117; core 31925; terminal 2601969
  { outputClauseIndex := 9117, coreClauseIndex := 31925, terminalClauseIndex := 2601969, datum := { row := ⟨2, {1, 4, 7, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9118; core 31926; terminal 2601970
  { outputClauseIndex := 9118, coreClauseIndex := 31926, terminalClauseIndex := 2601970, datum := { row := ⟨2, {1, 4, 7, 8}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9120; core 31932; terminal 2601976
  { outputClauseIndex := 9120, coreClauseIndex := 31932, terminalClauseIndex := 2601976, datum := { row := ⟨2, {1, 4, 7, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9121; core 31933; terminal 2601977
  { outputClauseIndex := 9121, coreClauseIndex := 31933, terminalClauseIndex := 2601977, datum := { row := ⟨2, {1, 4, 7, 9}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9123; core 31939; terminal 2601983
  { outputClauseIndex := 9123, coreClauseIndex := 31939, terminalClauseIndex := 2601983, datum := { row := ⟨2, {1, 4, 7, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9124; core 31940; terminal 2601984
  { outputClauseIndex := 9124, coreClauseIndex := 31940, terminalClauseIndex := 2601984, datum := { row := ⟨2, {1, 4, 7, 10}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9126; core 31946; terminal 2601990
  { outputClauseIndex := 9126, coreClauseIndex := 31946, terminalClauseIndex := 2601990, datum := { row := ⟨2, {1, 4, 8, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9127; core 31947; terminal 2601991
  { outputClauseIndex := 9127, coreClauseIndex := 31947, terminalClauseIndex := 2601991, datum := { row := ⟨2, {1, 4, 8, 9}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9129; core 31953; terminal 2601997
  { outputClauseIndex := 9129, coreClauseIndex := 31953, terminalClauseIndex := 2601997, datum := { row := ⟨2, {1, 4, 8, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9130; core 31954; terminal 2601998
  { outputClauseIndex := 9130, coreClauseIndex := 31954, terminalClauseIndex := 2601998, datum := { row := ⟨2, {1, 4, 8, 10}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9132; core 31960; terminal 2602004
  { outputClauseIndex := 9132, coreClauseIndex := 31960, terminalClauseIndex := 2602004, datum := { row := ⟨2, {1, 4, 9, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9133; core 31961; terminal 2602005
  { outputClauseIndex := 9133, coreClauseIndex := 31961, terminalClauseIndex := 2602005, datum := { row := ⟨2, {1, 4, 9, 10}⟩, arc := ⟨2, .right, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 9134; core 31965; terminal 2602011
  { outputClauseIndex := 9134, coreClauseIndex := 31965, terminalClauseIndex := 2602011, datum := { row := ⟨2, {1, 5, 6, 7}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9135; core 31969; terminal 2602018
  { outputClauseIndex := 9135, coreClauseIndex := 31969, terminalClauseIndex := 2602018, datum := { row := ⟨2, {1, 5, 6, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9136; core 31974; terminal 2602025
  { outputClauseIndex := 9136, coreClauseIndex := 31974, terminalClauseIndex := 2602025, datum := { row := ⟨2, {1, 5, 6, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9137; core 31979; terminal 2602032
  { outputClauseIndex := 9137, coreClauseIndex := 31979, terminalClauseIndex := 2602032, datum := { row := ⟨2, {1, 5, 6, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9139; core 31985; terminal 2602039
  { outputClauseIndex := 9139, coreClauseIndex := 31985, terminalClauseIndex := 2602039, datum := { row := ⟨2, {1, 5, 7, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9140; core 31986; terminal 2602040
  { outputClauseIndex := 9140, coreClauseIndex := 31986, terminalClauseIndex := 2602040, datum := { row := ⟨2, {1, 5, 7, 8}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9142; core 31992; terminal 2602046
  { outputClauseIndex := 9142, coreClauseIndex := 31992, terminalClauseIndex := 2602046, datum := { row := ⟨2, {1, 5, 7, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9143; core 31993; terminal 2602047
  { outputClauseIndex := 9143, coreClauseIndex := 31993, terminalClauseIndex := 2602047, datum := { row := ⟨2, {1, 5, 7, 9}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9145; core 31999; terminal 2602053
  { outputClauseIndex := 9145, coreClauseIndex := 31999, terminalClauseIndex := 2602053, datum := { row := ⟨2, {1, 5, 7, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9146; core 32000; terminal 2602054
  { outputClauseIndex := 9146, coreClauseIndex := 32000, terminalClauseIndex := 2602054, datum := { row := ⟨2, {1, 5, 7, 10}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9148; core 32006; terminal 2602060
  { outputClauseIndex := 9148, coreClauseIndex := 32006, terminalClauseIndex := 2602060, datum := { row := ⟨2, {1, 5, 8, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9149; core 32007; terminal 2602061
  { outputClauseIndex := 9149, coreClauseIndex := 32007, terminalClauseIndex := 2602061, datum := { row := ⟨2, {1, 5, 8, 9}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9151; core 32013; terminal 2602067
  { outputClauseIndex := 9151, coreClauseIndex := 32013, terminalClauseIndex := 2602067, datum := { row := ⟨2, {1, 5, 8, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9152; core 32014; terminal 2602068
  { outputClauseIndex := 9152, coreClauseIndex := 32014, terminalClauseIndex := 2602068, datum := { row := ⟨2, {1, 5, 8, 10}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9154; core 32020; terminal 2602074
  { outputClauseIndex := 9154, coreClauseIndex := 32020, terminalClauseIndex := 2602074, datum := { row := ⟨2, {1, 5, 9, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9155; core 32021; terminal 2602075
  { outputClauseIndex := 9155, coreClauseIndex := 32021, terminalClauseIndex := 2602075, datum := { row := ⟨2, {1, 5, 9, 10}⟩, arc := ⟨2, .right, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 9157; core 32027; terminal 2602081
  { outputClauseIndex := 9157, coreClauseIndex := 32027, terminalClauseIndex := 2602081, datum := { row := ⟨2, {1, 6, 7, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9158; core 32028; terminal 2602082
  { outputClauseIndex := 9158, coreClauseIndex := 32028, terminalClauseIndex := 2602082, datum := { row := ⟨2, {1, 6, 7, 8}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9160; core 32034; terminal 2602088
  { outputClauseIndex := 9160, coreClauseIndex := 32034, terminalClauseIndex := 2602088, datum := { row := ⟨2, {1, 6, 7, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9161; core 32035; terminal 2602089
  { outputClauseIndex := 9161, coreClauseIndex := 32035, terminalClauseIndex := 2602089, datum := { row := ⟨2, {1, 6, 7, 9}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9163; core 32041; terminal 2602095
  { outputClauseIndex := 9163, coreClauseIndex := 32041, terminalClauseIndex := 2602095, datum := { row := ⟨2, {1, 6, 7, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9164; core 32042; terminal 2602096
  { outputClauseIndex := 9164, coreClauseIndex := 32042, terminalClauseIndex := 2602096, datum := { row := ⟨2, {1, 6, 7, 10}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9166; core 32048; terminal 2602102
  { outputClauseIndex := 9166, coreClauseIndex := 32048, terminalClauseIndex := 2602102, datum := { row := ⟨2, {1, 6, 8, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9167; core 32049; terminal 2602103
  { outputClauseIndex := 9167, coreClauseIndex := 32049, terminalClauseIndex := 2602103, datum := { row := ⟨2, {1, 6, 8, 9}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9169; core 32055; terminal 2602109
  { outputClauseIndex := 9169, coreClauseIndex := 32055, terminalClauseIndex := 2602109, datum := { row := ⟨2, {1, 6, 8, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9170; core 32056; terminal 2602110
  { outputClauseIndex := 9170, coreClauseIndex := 32056, terminalClauseIndex := 2602110, datum := { row := ⟨2, {1, 6, 8, 10}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9172; core 32062; terminal 2602116
  { outputClauseIndex := 9172, coreClauseIndex := 32062, terminalClauseIndex := 2602116, datum := { row := ⟨2, {1, 6, 9, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9173; core 32063; terminal 2602117
  { outputClauseIndex := 9173, coreClauseIndex := 32063, terminalClauseIndex := 2602117, datum := { row := ⟨2, {1, 6, 9, 10}⟩, arc := ⟨2, .right, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 9175; core 32069; terminal 2602123
  { outputClauseIndex := 9175, coreClauseIndex := 32069, terminalClauseIndex := 2602123, datum := { row := ⟨2, {1, 7, 8, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9176; core 32070; terminal 2602124
  { outputClauseIndex := 9176, coreClauseIndex := 32070, terminalClauseIndex := 2602124, datum := { row := ⟨2, {1, 7, 8, 9}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9178; core 32076; terminal 2602130
  { outputClauseIndex := 9178, coreClauseIndex := 32076, terminalClauseIndex := 2602130, datum := { row := ⟨2, {1, 7, 8, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9179; core 32077; terminal 2602131
  { outputClauseIndex := 9179, coreClauseIndex := 32077, terminalClauseIndex := 2602131, datum := { row := ⟨2, {1, 7, 8, 10}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9181; core 32083; terminal 2602137
  { outputClauseIndex := 9181, coreClauseIndex := 32083, terminalClauseIndex := 2602137, datum := { row := ⟨2, {1, 7, 9, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9182; core 32084; terminal 2602138
  { outputClauseIndex := 9182, coreClauseIndex := 32084, terminalClauseIndex := 2602138, datum := { row := ⟨2, {1, 7, 9, 10}⟩, arc := ⟨2, .right, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 9183; core 32089; terminal 2602144
  { outputClauseIndex := 9183, coreClauseIndex := 32089, terminalClauseIndex := 2602144, datum := { row := ⟨2, {1, 8, 9, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9184; core 32090; terminal 2602145
  { outputClauseIndex := 9184, coreClauseIndex := 32090, terminalClauseIndex := 2602145, datum := { row := ⟨2, {1, 8, 9, 10}⟩, arc := ⟨2, .right, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 9185; core 32094; terminal 2602151
  { outputClauseIndex := 9185, coreClauseIndex := 32094, terminalClauseIndex := 2602151, datum := { row := ⟨2, {3, 4, 5, 6}⟩, arc := ⟨2, .left, {0, 1, 2, 3, 4, 9, 10}⟩ } },
  -- compact 9186; core 32095; terminal 2602152
  { outputClauseIndex := 9186, coreClauseIndex := 32095, terminalClauseIndex := 2602152, datum := { row := ⟨2, {3, 4, 5, 6}⟩, arc := ⟨2, .right, {7}⟩ } },
  -- compact 9188; core 32100; terminal 2602158
  { outputClauseIndex := 9188, coreClauseIndex := 32100, terminalClauseIndex := 2602158, datum := { row := ⟨2, {3, 4, 5, 7}⟩, arc := ⟨2, .left, {0, 1, 2, 3, 4, 9, 10}⟩ } },
  -- compact 9189; core 32101; terminal 2602159
  { outputClauseIndex := 9189, coreClauseIndex := 32101, terminalClauseIndex := 2602159, datum := { row := ⟨2, {3, 4, 5, 7}⟩, arc := ⟨2, .right, {7}⟩ } },
  -- compact 9191; core 32106; terminal 2602165
  { outputClauseIndex := 9191, coreClauseIndex := 32106, terminalClauseIndex := 2602165, datum := { row := ⟨2, {3, 4, 5, 8}⟩, arc := ⟨2, .left, {0, 1, 2, 3, 4, 9, 10}⟩ } },
  -- compact 9192; core 32107; terminal 2602166
  { outputClauseIndex := 9192, coreClauseIndex := 32107, terminalClauseIndex := 2602166, datum := { row := ⟨2, {3, 4, 5, 8}⟩, arc := ⟨2, .right, {7}⟩ } },
  -- compact 9194; core 32112; terminal 2602172
  { outputClauseIndex := 9194, coreClauseIndex := 32112, terminalClauseIndex := 2602172, datum := { row := ⟨2, {3, 4, 5, 9}⟩, arc := ⟨2, .left, {0, 1, 2, 3, 4, 9, 10}⟩ } },
  -- compact 9195; core 32113; terminal 2602173
  { outputClauseIndex := 9195, coreClauseIndex := 32113, terminalClauseIndex := 2602173, datum := { row := ⟨2, {3, 4, 5, 9}⟩, arc := ⟨2, .right, {7}⟩ } },
  -- compact 9197; core 32118; terminal 2602179
  { outputClauseIndex := 9197, coreClauseIndex := 32118, terminalClauseIndex := 2602179, datum := { row := ⟨2, {3, 4, 5, 10}⟩, arc := ⟨2, .left, {0, 1, 2, 3, 4, 9, 10}⟩ } },
  -- compact 9198; core 32119; terminal 2602180
  { outputClauseIndex := 9198, coreClauseIndex := 32119, terminalClauseIndex := 2602180, datum := { row := ⟨2, {3, 4, 5, 10}⟩, arc := ⟨2, .right, {7}⟩ } },
  -- compact 9200; core 32124; terminal 2602186
  { outputClauseIndex := 9200, coreClauseIndex := 32124, terminalClauseIndex := 2602186, datum := { row := ⟨2, {3, 4, 6, 7}⟩, arc := ⟨2, .left, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 9201; core 32125; terminal 2602187
  { outputClauseIndex := 9201, coreClauseIndex := 32125, terminalClauseIndex := 2602187, datum := { row := ⟨2, {3, 4, 6, 7}⟩, arc := ⟨2, .right, {7}⟩ } },
  -- compact 9203; core 32130; terminal 2602193
  { outputClauseIndex := 9203, coreClauseIndex := 32130, terminalClauseIndex := 2602193, datum := { row := ⟨2, {3, 4, 6, 8}⟩, arc := ⟨2, .left, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 9204; core 32131; terminal 2602194
  { outputClauseIndex := 9204, coreClauseIndex := 32131, terminalClauseIndex := 2602194, datum := { row := ⟨2, {3, 4, 6, 8}⟩, arc := ⟨2, .right, {7}⟩ } },
  -- compact 9206; core 32137; terminal 2602200
  { outputClauseIndex := 9206, coreClauseIndex := 32137, terminalClauseIndex := 2602200, datum := { row := ⟨2, {3, 4, 6, 9}⟩, arc := ⟨2, .left, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 9207; core 32138; terminal 2602201
  { outputClauseIndex := 9207, coreClauseIndex := 32138, terminalClauseIndex := 2602201, datum := { row := ⟨2, {3, 4, 6, 9}⟩, arc := ⟨2, .right, {7}⟩ } },
  -- compact 9209; core 32144; terminal 2602207
  { outputClauseIndex := 9209, coreClauseIndex := 32144, terminalClauseIndex := 2602207, datum := { row := ⟨2, {3, 4, 6, 10}⟩, arc := ⟨2, .left, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 9210; core 32145; terminal 2602208
  { outputClauseIndex := 9210, coreClauseIndex := 32145, terminalClauseIndex := 2602208, datum := { row := ⟨2, {3, 4, 6, 10}⟩, arc := ⟨2, .right, {7}⟩ } },
  -- compact 9212; core 32151; terminal 2602214
  { outputClauseIndex := 9212, coreClauseIndex := 32151, terminalClauseIndex := 2602214, datum := { row := ⟨2, {3, 4, 7, 8}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9213; core 32152; terminal 2602215
  { outputClauseIndex := 9213, coreClauseIndex := 32152, terminalClauseIndex := 2602215, datum := { row := ⟨2, {3, 4, 7, 8}⟩, arc := ⟨2, .right, {7}⟩ } },
  -- compact 9215; core 32158; terminal 2602221
  { outputClauseIndex := 9215, coreClauseIndex := 32158, terminalClauseIndex := 2602221, datum := { row := ⟨2, {3, 4, 7, 9}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9216; core 32159; terminal 2602222
  { outputClauseIndex := 9216, coreClauseIndex := 32159, terminalClauseIndex := 2602222, datum := { row := ⟨2, {3, 4, 7, 9}⟩, arc := ⟨2, .right, {7}⟩ } },
  -- compact 9218; core 32165; terminal 2602228
  { outputClauseIndex := 9218, coreClauseIndex := 32165, terminalClauseIndex := 2602228, datum := { row := ⟨2, {3, 4, 7, 10}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9219; core 32166; terminal 2602229
  { outputClauseIndex := 9219, coreClauseIndex := 32166, terminalClauseIndex := 2602229, datum := { row := ⟨2, {3, 4, 7, 10}⟩, arc := ⟨2, .right, {7}⟩ } },
  -- compact 9221; core 32172; terminal 2602235
  { outputClauseIndex := 9221, coreClauseIndex := 32172, terminalClauseIndex := 2602235, datum := { row := ⟨2, {3, 4, 8, 9}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9222; core 32173; terminal 2602236
  { outputClauseIndex := 9222, coreClauseIndex := 32173, terminalClauseIndex := 2602236, datum := { row := ⟨2, {3, 4, 8, 9}⟩, arc := ⟨2, .right, {7}⟩ } },
  -- compact 9224; core 32179; terminal 2602242
  { outputClauseIndex := 9224, coreClauseIndex := 32179, terminalClauseIndex := 2602242, datum := { row := ⟨2, {3, 4, 8, 10}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9225; core 32180; terminal 2602243
  { outputClauseIndex := 9225, coreClauseIndex := 32180, terminalClauseIndex := 2602243, datum := { row := ⟨2, {3, 4, 8, 10}⟩, arc := ⟨2, .right, {7}⟩ } },
  -- compact 9227; core 32186; terminal 2602249
  { outputClauseIndex := 9227, coreClauseIndex := 32186, terminalClauseIndex := 2602249, datum := { row := ⟨2, {3, 4, 9, 10}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9228; core 32187; terminal 2602250
  { outputClauseIndex := 9228, coreClauseIndex := 32187, terminalClauseIndex := 2602250, datum := { row := ⟨2, {3, 4, 9, 10}⟩, arc := ⟨2, .right, {7}⟩ } },
  -- compact 9230; core 32205; terminal 2602284
  { outputClauseIndex := 9230, coreClauseIndex := 32205, terminalClauseIndex := 2602284, datum := { row := ⟨2, {3, 5, 7, 8}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9231; core 32206; terminal 2602285
  { outputClauseIndex := 9231, coreClauseIndex := 32206, terminalClauseIndex := 2602285, datum := { row := ⟨2, {3, 5, 7, 8}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9233; core 32212; terminal 2602291
  { outputClauseIndex := 9233, coreClauseIndex := 32212, terminalClauseIndex := 2602291, datum := { row := ⟨2, {3, 5, 7, 9}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9234; core 32213; terminal 2602292
  { outputClauseIndex := 9234, coreClauseIndex := 32213, terminalClauseIndex := 2602292, datum := { row := ⟨2, {3, 5, 7, 9}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9236; core 32219; terminal 2602298
  { outputClauseIndex := 9236, coreClauseIndex := 32219, terminalClauseIndex := 2602298, datum := { row := ⟨2, {3, 5, 7, 10}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9237; core 32220; terminal 2602299
  { outputClauseIndex := 9237, coreClauseIndex := 32220, terminalClauseIndex := 2602299, datum := { row := ⟨2, {3, 5, 7, 10}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9239; core 32226; terminal 2602305
  { outputClauseIndex := 9239, coreClauseIndex := 32226, terminalClauseIndex := 2602305, datum := { row := ⟨2, {3, 5, 8, 9}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9240; core 32227; terminal 2602306
  { outputClauseIndex := 9240, coreClauseIndex := 32227, terminalClauseIndex := 2602306, datum := { row := ⟨2, {3, 5, 8, 9}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9242; core 32233; terminal 2602312
  { outputClauseIndex := 9242, coreClauseIndex := 32233, terminalClauseIndex := 2602312, datum := { row := ⟨2, {3, 5, 8, 10}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9243; core 32234; terminal 2602313
  { outputClauseIndex := 9243, coreClauseIndex := 32234, terminalClauseIndex := 2602313, datum := { row := ⟨2, {3, 5, 8, 10}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9245; core 32240; terminal 2602319
  { outputClauseIndex := 9245, coreClauseIndex := 32240, terminalClauseIndex := 2602319, datum := { row := ⟨2, {3, 5, 9, 10}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9246; core 32241; terminal 2602320
  { outputClauseIndex := 9246, coreClauseIndex := 32241, terminalClauseIndex := 2602320, datum := { row := ⟨2, {3, 5, 9, 10}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9248; core 32247; terminal 2602326
  { outputClauseIndex := 9248, coreClauseIndex := 32247, terminalClauseIndex := 2602326, datum := { row := ⟨2, {3, 6, 7, 8}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9249; core 32248; terminal 2602327
  { outputClauseIndex := 9249, coreClauseIndex := 32248, terminalClauseIndex := 2602327, datum := { row := ⟨2, {3, 6, 7, 8}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9251; core 32254; terminal 2602333
  { outputClauseIndex := 9251, coreClauseIndex := 32254, terminalClauseIndex := 2602333, datum := { row := ⟨2, {3, 6, 7, 9}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9252; core 32255; terminal 2602334
  { outputClauseIndex := 9252, coreClauseIndex := 32255, terminalClauseIndex := 2602334, datum := { row := ⟨2, {3, 6, 7, 9}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9254; core 32261; terminal 2602340
  { outputClauseIndex := 9254, coreClauseIndex := 32261, terminalClauseIndex := 2602340, datum := { row := ⟨2, {3, 6, 7, 10}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9255; core 32262; terminal 2602341
  { outputClauseIndex := 9255, coreClauseIndex := 32262, terminalClauseIndex := 2602341, datum := { row := ⟨2, {3, 6, 7, 10}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9257; core 32268; terminal 2602347
  { outputClauseIndex := 9257, coreClauseIndex := 32268, terminalClauseIndex := 2602347, datum := { row := ⟨2, {3, 6, 8, 9}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9258; core 32269; terminal 2602348
  { outputClauseIndex := 9258, coreClauseIndex := 32269, terminalClauseIndex := 2602348, datum := { row := ⟨2, {3, 6, 8, 9}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9260; core 32275; terminal 2602354
  { outputClauseIndex := 9260, coreClauseIndex := 32275, terminalClauseIndex := 2602354, datum := { row := ⟨2, {3, 6, 8, 10}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9261; core 32276; terminal 2602355
  { outputClauseIndex := 9261, coreClauseIndex := 32276, terminalClauseIndex := 2602355, datum := { row := ⟨2, {3, 6, 8, 10}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9263; core 32282; terminal 2602361
  { outputClauseIndex := 9263, coreClauseIndex := 32282, terminalClauseIndex := 2602361, datum := { row := ⟨2, {3, 6, 9, 10}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk004_batch_valid :
    directRowArcFiniteOccurrencesChunk004.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk004, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk004 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk004.map (·.datum)

theorem directRowArcFiniteDataChunk004_batch_valid :
    directRowArcFiniteDataChunk004.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk004, datum.Valid := by
  rw [directRowArcFiniteDataChunk004]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk004_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk004_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
