/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk014 : List DirectRowArcFiniteOccurrence := [
  -- compact 10929; core 36980; terminal 2607912
  { outputClauseIndex := 10929, coreClauseIndex := 36980, terminalClauseIndex := 2607912, datum := { row := ⟨6, {1, 4, 5, 10}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 10930; core 36981; terminal 2607913
  { outputClauseIndex := 10930, coreClauseIndex := 36981, terminalClauseIndex := 2607913, datum := { row := ⟨6, {1, 4, 5, 10}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10932; core 36987; terminal 2607919
  { outputClauseIndex := 10932, coreClauseIndex := 36987, terminalClauseIndex := 2607919, datum := { row := ⟨6, {1, 4, 7, 8}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10933; core 36988; terminal 2607920
  { outputClauseIndex := 10933, coreClauseIndex := 36988, terminalClauseIndex := 2607920, datum := { row := ⟨6, {1, 4, 7, 8}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 10935; core 36994; terminal 2607926
  { outputClauseIndex := 10935, coreClauseIndex := 36994, terminalClauseIndex := 2607926, datum := { row := ⟨6, {1, 4, 7, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10936; core 36995; terminal 2607927
  { outputClauseIndex := 10936, coreClauseIndex := 36995, terminalClauseIndex := 2607927, datum := { row := ⟨6, {1, 4, 7, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10938; core 37001; terminal 2607933
  { outputClauseIndex := 10938, coreClauseIndex := 37001, terminalClauseIndex := 2607933, datum := { row := ⟨6, {1, 4, 7, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10939; core 37002; terminal 2607934
  { outputClauseIndex := 10939, coreClauseIndex := 37002, terminalClauseIndex := 2607934, datum := { row := ⟨6, {1, 4, 7, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10941; core 37008; terminal 2607940
  { outputClauseIndex := 10941, coreClauseIndex := 37008, terminalClauseIndex := 2607940, datum := { row := ⟨6, {1, 4, 8, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10942; core 37009; terminal 2607941
  { outputClauseIndex := 10942, coreClauseIndex := 37009, terminalClauseIndex := 2607941, datum := { row := ⟨6, {1, 4, 8, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10944; core 37015; terminal 2607947
  { outputClauseIndex := 10944, coreClauseIndex := 37015, terminalClauseIndex := 2607947, datum := { row := ⟨6, {1, 4, 8, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10945; core 37016; terminal 2607948
  { outputClauseIndex := 10945, coreClauseIndex := 37016, terminalClauseIndex := 2607948, datum := { row := ⟨6, {1, 4, 8, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10947; core 37022; terminal 2607954
  { outputClauseIndex := 10947, coreClauseIndex := 37022, terminalClauseIndex := 2607954, datum := { row := ⟨6, {1, 4, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10948; core 37023; terminal 2607955
  { outputClauseIndex := 10948, coreClauseIndex := 37023, terminalClauseIndex := 2607955, datum := { row := ⟨6, {1, 4, 9, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10950; core 37029; terminal 2607961
  { outputClauseIndex := 10950, coreClauseIndex := 37029, terminalClauseIndex := 2607961, datum := { row := ⟨6, {1, 5, 7, 8}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10951; core 37030; terminal 2607962
  { outputClauseIndex := 10951, coreClauseIndex := 37030, terminalClauseIndex := 2607962, datum := { row := ⟨6, {1, 5, 7, 8}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 10953; core 37036; terminal 2607968
  { outputClauseIndex := 10953, coreClauseIndex := 37036, terminalClauseIndex := 2607968, datum := { row := ⟨6, {1, 5, 7, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10954; core 37037; terminal 2607969
  { outputClauseIndex := 10954, coreClauseIndex := 37037, terminalClauseIndex := 2607969, datum := { row := ⟨6, {1, 5, 7, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10956; core 37043; terminal 2607975
  { outputClauseIndex := 10956, coreClauseIndex := 37043, terminalClauseIndex := 2607975, datum := { row := ⟨6, {1, 5, 7, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10957; core 37044; terminal 2607976
  { outputClauseIndex := 10957, coreClauseIndex := 37044, terminalClauseIndex := 2607976, datum := { row := ⟨6, {1, 5, 7, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10959; core 37050; terminal 2607982
  { outputClauseIndex := 10959, coreClauseIndex := 37050, terminalClauseIndex := 2607982, datum := { row := ⟨6, {1, 5, 8, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10960; core 37051; terminal 2607983
  { outputClauseIndex := 10960, coreClauseIndex := 37051, terminalClauseIndex := 2607983, datum := { row := ⟨6, {1, 5, 8, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10962; core 37057; terminal 2607989
  { outputClauseIndex := 10962, coreClauseIndex := 37057, terminalClauseIndex := 2607989, datum := { row := ⟨6, {1, 5, 8, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10963; core 37058; terminal 2607990
  { outputClauseIndex := 10963, coreClauseIndex := 37058, terminalClauseIndex := 2607990, datum := { row := ⟨6, {1, 5, 8, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10965; core 37064; terminal 2607996
  { outputClauseIndex := 10965, coreClauseIndex := 37064, terminalClauseIndex := 2607996, datum := { row := ⟨6, {1, 5, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10966; core 37065; terminal 2607997
  { outputClauseIndex := 10966, coreClauseIndex := 37065, terminalClauseIndex := 2607997, datum := { row := ⟨6, {1, 5, 9, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10968; core 37071; terminal 2608003
  { outputClauseIndex := 10968, coreClauseIndex := 37071, terminalClauseIndex := 2608003, datum := { row := ⟨6, {1, 7, 8, 9}⟩, arc := ⟨6, .left, {0, 5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10969; core 37072; terminal 2608004
  { outputClauseIndex := 10969, coreClauseIndex := 37072, terminalClauseIndex := 2608004, datum := { row := ⟨6, {1, 7, 8, 9}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 10971; core 37078; terminal 2608010
  { outputClauseIndex := 10971, coreClauseIndex := 37078, terminalClauseIndex := 2608010, datum := { row := ⟨6, {1, 7, 8, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10972; core 37079; terminal 2608011
  { outputClauseIndex := 10972, coreClauseIndex := 37079, terminalClauseIndex := 2608011, datum := { row := ⟨6, {1, 7, 8, 10}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 10974; core 37085; terminal 2608017
  { outputClauseIndex := 10974, coreClauseIndex := 37085, terminalClauseIndex := 2608017, datum := { row := ⟨6, {1, 7, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10975; core 37086; terminal 2608018
  { outputClauseIndex := 10975, coreClauseIndex := 37086, terminalClauseIndex := 2608018, datum := { row := ⟨6, {1, 7, 9, 10}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10976; core 37091; terminal 2608024
  { outputClauseIndex := 10976, coreClauseIndex := 37091, terminalClauseIndex := 2608024, datum := { row := ⟨6, {1, 8, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10977; core 37092; terminal 2608025
  { outputClauseIndex := 10977, coreClauseIndex := 37092, terminalClauseIndex := 2608025, datum := { row := ⟨6, {1, 8, 9, 10}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10979; core 37098; terminal 2608031
  { outputClauseIndex := 10979, coreClauseIndex := 37098, terminalClauseIndex := 2608031, datum := { row := ⟨6, {2, 3, 4, 5}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 10981; core 37104; terminal 2608038
  { outputClauseIndex := 10981, coreClauseIndex := 37104, terminalClauseIndex := 2608038, datum := { row := ⟨6, {2, 3, 4, 7}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10982; core 37105; terminal 2608039
  { outputClauseIndex := 10982, coreClauseIndex := 37105, terminalClauseIndex := 2608039, datum := { row := ⟨6, {2, 3, 4, 7}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 10984; core 37111; terminal 2608045
  { outputClauseIndex := 10984, coreClauseIndex := 37111, terminalClauseIndex := 2608045, datum := { row := ⟨6, {2, 3, 4, 8}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10985; core 37112; terminal 2608046
  { outputClauseIndex := 10985, coreClauseIndex := 37112, terminalClauseIndex := 2608046, datum := { row := ⟨6, {2, 3, 4, 8}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 10987; core 37118; terminal 2608052
  { outputClauseIndex := 10987, coreClauseIndex := 37118, terminalClauseIndex := 2608052, datum := { row := ⟨6, {2, 3, 4, 9}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10988; core 37119; terminal 2608053
  { outputClauseIndex := 10988, coreClauseIndex := 37119, terminalClauseIndex := 2608053, datum := { row := ⟨6, {2, 3, 4, 9}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 10990; core 37125; terminal 2608059
  { outputClauseIndex := 10990, coreClauseIndex := 37125, terminalClauseIndex := 2608059, datum := { row := ⟨6, {2, 3, 4, 10}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10991; core 37126; terminal 2608060
  { outputClauseIndex := 10991, coreClauseIndex := 37126, terminalClauseIndex := 2608060, datum := { row := ⟨6, {2, 3, 4, 10}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 10993; core 37132; terminal 2608066
  { outputClauseIndex := 10993, coreClauseIndex := 37132, terminalClauseIndex := 2608066, datum := { row := ⟨6, {2, 3, 5, 7}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10994; core 37133; terminal 2608067
  { outputClauseIndex := 10994, coreClauseIndex := 37133, terminalClauseIndex := 2608067, datum := { row := ⟨6, {2, 3, 5, 7}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 10996; core 37139; terminal 2608073
  { outputClauseIndex := 10996, coreClauseIndex := 37139, terminalClauseIndex := 2608073, datum := { row := ⟨6, {2, 3, 5, 8}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10997; core 37140; terminal 2608074
  { outputClauseIndex := 10997, coreClauseIndex := 37140, terminalClauseIndex := 2608074, datum := { row := ⟨6, {2, 3, 5, 8}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 10999; core 37146; terminal 2608080
  { outputClauseIndex := 10999, coreClauseIndex := 37146, terminalClauseIndex := 2608080, datum := { row := ⟨6, {2, 3, 5, 9}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 11000; core 37147; terminal 2608081
  { outputClauseIndex := 11000, coreClauseIndex := 37147, terminalClauseIndex := 2608081, datum := { row := ⟨6, {2, 3, 5, 9}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 11002; core 37153; terminal 2608087
  { outputClauseIndex := 11002, coreClauseIndex := 37153, terminalClauseIndex := 2608087, datum := { row := ⟨6, {2, 3, 5, 10}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 11003; core 37154; terminal 2608088
  { outputClauseIndex := 11003, coreClauseIndex := 37154, terminalClauseIndex := 2608088, datum := { row := ⟨6, {2, 3, 5, 10}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 11005; core 37160; terminal 2608094
  { outputClauseIndex := 11005, coreClauseIndex := 37160, terminalClauseIndex := 2608094, datum := { row := ⟨6, {2, 3, 7, 8}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 11006; core 37161; terminal 2608095
  { outputClauseIndex := 11006, coreClauseIndex := 37161, terminalClauseIndex := 2608095, datum := { row := ⟨6, {2, 3, 7, 8}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 11008; core 37167; terminal 2608101
  { outputClauseIndex := 11008, coreClauseIndex := 37167, terminalClauseIndex := 2608101, datum := { row := ⟨6, {2, 3, 7, 9}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 11009; core 37168; terminal 2608102
  { outputClauseIndex := 11009, coreClauseIndex := 37168, terminalClauseIndex := 2608102, datum := { row := ⟨6, {2, 3, 7, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11011; core 37174; terminal 2608108
  { outputClauseIndex := 11011, coreClauseIndex := 37174, terminalClauseIndex := 2608108, datum := { row := ⟨6, {2, 3, 7, 10}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 11012; core 37175; terminal 2608109
  { outputClauseIndex := 11012, coreClauseIndex := 37175, terminalClauseIndex := 2608109, datum := { row := ⟨6, {2, 3, 7, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 11014; core 37181; terminal 2608115
  { outputClauseIndex := 11014, coreClauseIndex := 37181, terminalClauseIndex := 2608115, datum := { row := ⟨6, {2, 3, 8, 9}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 11015; core 37182; terminal 2608116
  { outputClauseIndex := 11015, coreClauseIndex := 37182, terminalClauseIndex := 2608116, datum := { row := ⟨6, {2, 3, 8, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11017; core 37188; terminal 2608122
  { outputClauseIndex := 11017, coreClauseIndex := 37188, terminalClauseIndex := 2608122, datum := { row := ⟨6, {2, 3, 8, 10}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 11018; core 37189; terminal 2608123
  { outputClauseIndex := 11018, coreClauseIndex := 37189, terminalClauseIndex := 2608123, datum := { row := ⟨6, {2, 3, 8, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 11020; core 37195; terminal 2608129
  { outputClauseIndex := 11020, coreClauseIndex := 37195, terminalClauseIndex := 2608129, datum := { row := ⟨6, {2, 3, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 11021; core 37196; terminal 2608130
  { outputClauseIndex := 11021, coreClauseIndex := 37196, terminalClauseIndex := 2608130, datum := { row := ⟨6, {2, 3, 9, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 11022; core 37201; terminal 2608136
  { outputClauseIndex := 11022, coreClauseIndex := 37201, terminalClauseIndex := 2608136, datum := { row := ⟨6, {2, 4, 5, 7}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 11023; core 37202; terminal 2608137
  { outputClauseIndex := 11023, coreClauseIndex := 37202, terminalClauseIndex := 2608137, datum := { row := ⟨6, {2, 4, 5, 7}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 11025; core 37208; terminal 2608143
  { outputClauseIndex := 11025, coreClauseIndex := 37208, terminalClauseIndex := 2608143, datum := { row := ⟨6, {2, 4, 5, 8}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 11026; core 37209; terminal 2608144
  { outputClauseIndex := 11026, coreClauseIndex := 37209, terminalClauseIndex := 2608144, datum := { row := ⟨6, {2, 4, 5, 8}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 11028; core 37215; terminal 2608150
  { outputClauseIndex := 11028, coreClauseIndex := 37215, terminalClauseIndex := 2608150, datum := { row := ⟨6, {2, 4, 5, 9}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 11029; core 37216; terminal 2608151
  { outputClauseIndex := 11029, coreClauseIndex := 37216, terminalClauseIndex := 2608151, datum := { row := ⟨6, {2, 4, 5, 9}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 11031; core 37222; terminal 2608157
  { outputClauseIndex := 11031, coreClauseIndex := 37222, terminalClauseIndex := 2608157, datum := { row := ⟨6, {2, 4, 5, 10}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 11032; core 37223; terminal 2608158
  { outputClauseIndex := 11032, coreClauseIndex := 37223, terminalClauseIndex := 2608158, datum := { row := ⟨6, {2, 4, 5, 10}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 11034; core 37229; terminal 2608164
  { outputClauseIndex := 11034, coreClauseIndex := 37229, terminalClauseIndex := 2608164, datum := { row := ⟨6, {2, 4, 7, 8}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 11035; core 37230; terminal 2608165
  { outputClauseIndex := 11035, coreClauseIndex := 37230, terminalClauseIndex := 2608165, datum := { row := ⟨6, {2, 4, 7, 8}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 11037; core 37236; terminal 2608171
  { outputClauseIndex := 11037, coreClauseIndex := 37236, terminalClauseIndex := 2608171, datum := { row := ⟨6, {2, 4, 7, 9}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 11038; core 37237; terminal 2608172
  { outputClauseIndex := 11038, coreClauseIndex := 37237, terminalClauseIndex := 2608172, datum := { row := ⟨6, {2, 4, 7, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11040; core 37243; terminal 2608178
  { outputClauseIndex := 11040, coreClauseIndex := 37243, terminalClauseIndex := 2608178, datum := { row := ⟨6, {2, 4, 7, 10}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 11041; core 37244; terminal 2608179
  { outputClauseIndex := 11041, coreClauseIndex := 37244, terminalClauseIndex := 2608179, datum := { row := ⟨6, {2, 4, 7, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 11043; core 37250; terminal 2608185
  { outputClauseIndex := 11043, coreClauseIndex := 37250, terminalClauseIndex := 2608185, datum := { row := ⟨6, {2, 4, 8, 9}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 11044; core 37251; terminal 2608186
  { outputClauseIndex := 11044, coreClauseIndex := 37251, terminalClauseIndex := 2608186, datum := { row := ⟨6, {2, 4, 8, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11046; core 37257; terminal 2608192
  { outputClauseIndex := 11046, coreClauseIndex := 37257, terminalClauseIndex := 2608192, datum := { row := ⟨6, {2, 4, 8, 10}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 11047; core 37258; terminal 2608193
  { outputClauseIndex := 11047, coreClauseIndex := 37258, terminalClauseIndex := 2608193, datum := { row := ⟨6, {2, 4, 8, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 11049; core 37264; terminal 2608199
  { outputClauseIndex := 11049, coreClauseIndex := 37264, terminalClauseIndex := 2608199, datum := { row := ⟨6, {2, 4, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 11050; core 37265; terminal 2608200
  { outputClauseIndex := 11050, coreClauseIndex := 37265, terminalClauseIndex := 2608200, datum := { row := ⟨6, {2, 4, 9, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 11052; core 37271; terminal 2608206
  { outputClauseIndex := 11052, coreClauseIndex := 37271, terminalClauseIndex := 2608206, datum := { row := ⟨6, {2, 5, 7, 8}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 11053; core 37272; terminal 2608207
  { outputClauseIndex := 11053, coreClauseIndex := 37272, terminalClauseIndex := 2608207, datum := { row := ⟨6, {2, 5, 7, 8}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 11055; core 37278; terminal 2608213
  { outputClauseIndex := 11055, coreClauseIndex := 37278, terminalClauseIndex := 2608213, datum := { row := ⟨6, {2, 5, 7, 9}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 11056; core 37279; terminal 2608214
  { outputClauseIndex := 11056, coreClauseIndex := 37279, terminalClauseIndex := 2608214, datum := { row := ⟨6, {2, 5, 7, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11058; core 37285; terminal 2608220
  { outputClauseIndex := 11058, coreClauseIndex := 37285, terminalClauseIndex := 2608220, datum := { row := ⟨6, {2, 5, 7, 10}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 11059; core 37286; terminal 2608221
  { outputClauseIndex := 11059, coreClauseIndex := 37286, terminalClauseIndex := 2608221, datum := { row := ⟨6, {2, 5, 7, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 11061; core 37292; terminal 2608227
  { outputClauseIndex := 11061, coreClauseIndex := 37292, terminalClauseIndex := 2608227, datum := { row := ⟨6, {2, 5, 8, 9}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 11062; core 37293; terminal 2608228
  { outputClauseIndex := 11062, coreClauseIndex := 37293, terminalClauseIndex := 2608228, datum := { row := ⟨6, {2, 5, 8, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11064; core 37299; terminal 2608234
  { outputClauseIndex := 11064, coreClauseIndex := 37299, terminalClauseIndex := 2608234, datum := { row := ⟨6, {2, 5, 8, 10}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 11065; core 37300; terminal 2608235
  { outputClauseIndex := 11065, coreClauseIndex := 37300, terminalClauseIndex := 2608235, datum := { row := ⟨6, {2, 5, 8, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 11067; core 37306; terminal 2608241
  { outputClauseIndex := 11067, coreClauseIndex := 37306, terminalClauseIndex := 2608241, datum := { row := ⟨6, {2, 5, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 11068; core 37307; terminal 2608242
  { outputClauseIndex := 11068, coreClauseIndex := 37307, terminalClauseIndex := 2608242, datum := { row := ⟨6, {2, 5, 9, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 11070; core 37313; terminal 2608248
  { outputClauseIndex := 11070, coreClauseIndex := 37313, terminalClauseIndex := 2608248, datum := { row := ⟨6, {2, 7, 8, 9}⟩, arc := ⟨6, .left, {0, 5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11071; core 37314; terminal 2608249
  { outputClauseIndex := 11071, coreClauseIndex := 37314, terminalClauseIndex := 2608249, datum := { row := ⟨6, {2, 7, 8, 9}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 11073; core 37320; terminal 2608255
  { outputClauseIndex := 11073, coreClauseIndex := 37320, terminalClauseIndex := 2608255, datum := { row := ⟨6, {2, 7, 8, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11074; core 37321; terminal 2608256
  { outputClauseIndex := 11074, coreClauseIndex := 37321, terminalClauseIndex := 2608256, datum := { row := ⟨6, {2, 7, 8, 10}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 11076; core 37327; terminal 2608262
  { outputClauseIndex := 11076, coreClauseIndex := 37327, terminalClauseIndex := 2608262, datum := { row := ⟨6, {2, 7, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11077; core 37328; terminal 2608263
  { outputClauseIndex := 11077, coreClauseIndex := 37328, terminalClauseIndex := 2608263, datum := { row := ⟨6, {2, 7, 9, 10}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11078; core 37333; terminal 2608269
  { outputClauseIndex := 11078, coreClauseIndex := 37333, terminalClauseIndex := 2608269, datum := { row := ⟨6, {2, 8, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11079; core 37334; terminal 2608270
  { outputClauseIndex := 11079, coreClauseIndex := 37334, terminalClauseIndex := 2608270, datum := { row := ⟨6, {2, 8, 9, 10}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11081; core 37344; terminal 2608283
  { outputClauseIndex := 11081, coreClauseIndex := 37344, terminalClauseIndex := 2608283, datum := { row := ⟨6, {3, 4, 5, 8}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 11083; core 37350; terminal 2608290
  { outputClauseIndex := 11083, coreClauseIndex := 37350, terminalClauseIndex := 2608290, datum := { row := ⟨6, {3, 4, 5, 9}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 11085; core 37356; terminal 2608297
  { outputClauseIndex := 11085, coreClauseIndex := 37356, terminalClauseIndex := 2608297, datum := { row := ⟨6, {3, 4, 5, 10}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 11087; core 37362; terminal 2608304
  { outputClauseIndex := 11087, coreClauseIndex := 37362, terminalClauseIndex := 2608304, datum := { row := ⟨6, {3, 4, 7, 8}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 11088; core 37363; terminal 2608305
  { outputClauseIndex := 11088, coreClauseIndex := 37363, terminalClauseIndex := 2608305, datum := { row := ⟨6, {3, 4, 7, 8}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 11090; core 37369; terminal 2608311
  { outputClauseIndex := 11090, coreClauseIndex := 37369, terminalClauseIndex := 2608311, datum := { row := ⟨6, {3, 4, 7, 9}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 11091; core 37370; terminal 2608312
  { outputClauseIndex := 11091, coreClauseIndex := 37370, terminalClauseIndex := 2608312, datum := { row := ⟨6, {3, 4, 7, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11093; core 37376; terminal 2608318
  { outputClauseIndex := 11093, coreClauseIndex := 37376, terminalClauseIndex := 2608318, datum := { row := ⟨6, {3, 4, 7, 10}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 11094; core 37377; terminal 2608319
  { outputClauseIndex := 11094, coreClauseIndex := 37377, terminalClauseIndex := 2608319, datum := { row := ⟨6, {3, 4, 7, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 11096; core 37383; terminal 2608325
  { outputClauseIndex := 11096, coreClauseIndex := 37383, terminalClauseIndex := 2608325, datum := { row := ⟨6, {3, 4, 8, 9}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 11097; core 37384; terminal 2608326
  { outputClauseIndex := 11097, coreClauseIndex := 37384, terminalClauseIndex := 2608326, datum := { row := ⟨6, {3, 4, 8, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11099; core 37390; terminal 2608332
  { outputClauseIndex := 11099, coreClauseIndex := 37390, terminalClauseIndex := 2608332, datum := { row := ⟨6, {3, 4, 8, 10}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 11100; core 37391; terminal 2608333
  { outputClauseIndex := 11100, coreClauseIndex := 37391, terminalClauseIndex := 2608333, datum := { row := ⟨6, {3, 4, 8, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 11102; core 37397; terminal 2608339
  { outputClauseIndex := 11102, coreClauseIndex := 37397, terminalClauseIndex := 2608339, datum := { row := ⟨6, {3, 4, 9, 10}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 11103; core 37398; terminal 2608340
  { outputClauseIndex := 11103, coreClauseIndex := 37398, terminalClauseIndex := 2608340, datum := { row := ⟨6, {3, 4, 9, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 11105; core 37404; terminal 2608346
  { outputClauseIndex := 11105, coreClauseIndex := 37404, terminalClauseIndex := 2608346, datum := { row := ⟨6, {3, 5, 7, 8}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 11106; core 37405; terminal 2608347
  { outputClauseIndex := 11106, coreClauseIndex := 37405, terminalClauseIndex := 2608347, datum := { row := ⟨6, {3, 5, 7, 8}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 11108; core 37411; terminal 2608353
  { outputClauseIndex := 11108, coreClauseIndex := 37411, terminalClauseIndex := 2608353, datum := { row := ⟨6, {3, 5, 7, 9}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 11109; core 37412; terminal 2608354
  { outputClauseIndex := 11109, coreClauseIndex := 37412, terminalClauseIndex := 2608354, datum := { row := ⟨6, {3, 5, 7, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11111; core 37418; terminal 2608360
  { outputClauseIndex := 11111, coreClauseIndex := 37418, terminalClauseIndex := 2608360, datum := { row := ⟨6, {3, 5, 7, 10}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 11112; core 37419; terminal 2608361
  { outputClauseIndex := 11112, coreClauseIndex := 37419, terminalClauseIndex := 2608361, datum := { row := ⟨6, {3, 5, 7, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 11114; core 37425; terminal 2608367
  { outputClauseIndex := 11114, coreClauseIndex := 37425, terminalClauseIndex := 2608367, datum := { row := ⟨6, {3, 5, 8, 9}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 11115; core 37426; terminal 2608368
  { outputClauseIndex := 11115, coreClauseIndex := 37426, terminalClauseIndex := 2608368, datum := { row := ⟨6, {3, 5, 8, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11117; core 37432; terminal 2608374
  { outputClauseIndex := 11117, coreClauseIndex := 37432, terminalClauseIndex := 2608374, datum := { row := ⟨6, {3, 5, 8, 10}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 11118; core 37433; terminal 2608375
  { outputClauseIndex := 11118, coreClauseIndex := 37433, terminalClauseIndex := 2608375, datum := { row := ⟨6, {3, 5, 8, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk014_batch_valid :
    directRowArcFiniteOccurrencesChunk014.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk014, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk014 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk014.map (·.datum)

theorem directRowArcFiniteDataChunk014_batch_valid :
    directRowArcFiniteDataChunk014.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk014, datum.Valid := by
  rw [directRowArcFiniteDataChunk014]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk014_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk014_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
