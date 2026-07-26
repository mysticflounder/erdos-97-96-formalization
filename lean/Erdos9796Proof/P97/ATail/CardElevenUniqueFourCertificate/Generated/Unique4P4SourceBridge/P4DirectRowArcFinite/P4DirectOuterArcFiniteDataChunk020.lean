/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk020 : List DirectRowArcFiniteOccurrence := [
  -- compact 12011; core 40049; terminal 2611868
  { outputClauseIndex := 12011, coreClauseIndex := 40049, terminalClauseIndex := 2611868, datum := { row := ⟨9, {0, 3, 6, 7}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12013; core 40055; terminal 2611874
  { outputClauseIndex := 12013, coreClauseIndex := 40055, terminalClauseIndex := 2611874, datum := { row := ⟨9, {0, 3, 6, 8}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12014; core 40056; terminal 2611875
  { outputClauseIndex := 12014, coreClauseIndex := 40056, terminalClauseIndex := 2611875, datum := { row := ⟨9, {0, 3, 6, 8}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12016; core 40062; terminal 2611881
  { outputClauseIndex := 12016, coreClauseIndex := 40062, terminalClauseIndex := 2611881, datum := { row := ⟨9, {0, 3, 6, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 12017; core 40063; terminal 2611882
  { outputClauseIndex := 12017, coreClauseIndex := 40063, terminalClauseIndex := 2611882, datum := { row := ⟨9, {0, 3, 6, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 12018; core 40068; terminal 2611888
  { outputClauseIndex := 12018, coreClauseIndex := 40068, terminalClauseIndex := 2611888, datum := { row := ⟨9, {0, 3, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12019; core 40069; terminal 2611889
  { outputClauseIndex := 12019, coreClauseIndex := 40069, terminalClauseIndex := 2611889, datum := { row := ⟨9, {0, 3, 7, 8}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12020; core 40074; terminal 2611895
  { outputClauseIndex := 12020, coreClauseIndex := 40074, terminalClauseIndex := 2611895, datum := { row := ⟨9, {0, 3, 7, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 12021; core 40075; terminal 2611896
  { outputClauseIndex := 12021, coreClauseIndex := 40075, terminalClauseIndex := 2611896, datum := { row := ⟨9, {0, 3, 7, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 12022; core 40080; terminal 2611902
  { outputClauseIndex := 12022, coreClauseIndex := 40080, terminalClauseIndex := 2611902, datum := { row := ⟨9, {0, 3, 8, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 12023; core 40081; terminal 2611903
  { outputClauseIndex := 12023, coreClauseIndex := 40081, terminalClauseIndex := 2611903, datum := { row := ⟨9, {0, 3, 8, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 12024; core 40086; terminal 2611910
  { outputClauseIndex := 12024, coreClauseIndex := 40086, terminalClauseIndex := 2611910, datum := { row := ⟨9, {0, 4, 5, 6}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12026; core 40092; terminal 2611916
  { outputClauseIndex := 12026, coreClauseIndex := 40092, terminalClauseIndex := 2611916, datum := { row := ⟨9, {0, 4, 5, 7}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12027; core 40093; terminal 2611917
  { outputClauseIndex := 12027, coreClauseIndex := 40093, terminalClauseIndex := 2611917, datum := { row := ⟨9, {0, 4, 5, 7}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12029; core 40099; terminal 2611923
  { outputClauseIndex := 12029, coreClauseIndex := 40099, terminalClauseIndex := 2611923, datum := { row := ⟨9, {0, 4, 5, 8}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12030; core 40100; terminal 2611924
  { outputClauseIndex := 12030, coreClauseIndex := 40100, terminalClauseIndex := 2611924, datum := { row := ⟨9, {0, 4, 5, 8}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12032; core 40106; terminal 2611930
  { outputClauseIndex := 12032, coreClauseIndex := 40106, terminalClauseIndex := 2611930, datum := { row := ⟨9, {0, 4, 5, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12033; core 40107; terminal 2611931
  { outputClauseIndex := 12033, coreClauseIndex := 40107, terminalClauseIndex := 2611931, datum := { row := ⟨9, {0, 4, 5, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 12035; core 40113; terminal 2611937
  { outputClauseIndex := 12035, coreClauseIndex := 40113, terminalClauseIndex := 2611937, datum := { row := ⟨9, {0, 4, 6, 7}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12036; core 40114; terminal 2611938
  { outputClauseIndex := 12036, coreClauseIndex := 40114, terminalClauseIndex := 2611938, datum := { row := ⟨9, {0, 4, 6, 7}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12038; core 40120; terminal 2611944
  { outputClauseIndex := 12038, coreClauseIndex := 40120, terminalClauseIndex := 2611944, datum := { row := ⟨9, {0, 4, 6, 8}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12039; core 40121; terminal 2611945
  { outputClauseIndex := 12039, coreClauseIndex := 40121, terminalClauseIndex := 2611945, datum := { row := ⟨9, {0, 4, 6, 8}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12041; core 40127; terminal 2611951
  { outputClauseIndex := 12041, coreClauseIndex := 40127, terminalClauseIndex := 2611951, datum := { row := ⟨9, {0, 4, 6, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12042; core 40128; terminal 2611952
  { outputClauseIndex := 12042, coreClauseIndex := 40128, terminalClauseIndex := 2611952, datum := { row := ⟨9, {0, 4, 6, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 12043; core 40133; terminal 2611958
  { outputClauseIndex := 12043, coreClauseIndex := 40133, terminalClauseIndex := 2611958, datum := { row := ⟨9, {0, 4, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12044; core 40134; terminal 2611959
  { outputClauseIndex := 12044, coreClauseIndex := 40134, terminalClauseIndex := 2611959, datum := { row := ⟨9, {0, 4, 7, 8}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12045; core 40139; terminal 2611965
  { outputClauseIndex := 12045, coreClauseIndex := 40139, terminalClauseIndex := 2611965, datum := { row := ⟨9, {0, 4, 7, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12046; core 40144; terminal 2611972
  { outputClauseIndex := 12046, coreClauseIndex := 40144, terminalClauseIndex := 2611972, datum := { row := ⟨9, {0, 4, 8, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12047; core 40145; terminal 2611973
  { outputClauseIndex := 12047, coreClauseIndex := 40145, terminalClauseIndex := 2611973, datum := { row := ⟨9, {0, 4, 8, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 12048; core 40156; terminal 2611993
  { outputClauseIndex := 12048, coreClauseIndex := 40156, terminalClauseIndex := 2611993, datum := { row := ⟨9, {0, 5, 6, 10}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12049; core 40157; terminal 2611994
  { outputClauseIndex := 12049, coreClauseIndex := 40157, terminalClauseIndex := 2611994, datum := { row := ⟨9, {0, 5, 6, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 12050; core 40162; terminal 2612000
  { outputClauseIndex := 12050, coreClauseIndex := 40162, terminalClauseIndex := 2612000, datum := { row := ⟨9, {0, 5, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12051; core 40167; terminal 2612007
  { outputClauseIndex := 12051, coreClauseIndex := 40167, terminalClauseIndex := 2612007, datum := { row := ⟨9, {0, 5, 7, 10}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12052; core 40172; terminal 2612014
  { outputClauseIndex := 12052, coreClauseIndex := 40172, terminalClauseIndex := 2612014, datum := { row := ⟨9, {0, 5, 8, 10}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12053; core 40173; terminal 2612015
  { outputClauseIndex := 12053, coreClauseIndex := 40173, terminalClauseIndex := 2612015, datum := { row := ⟨9, {0, 5, 8, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 12054; core 40178; terminal 2612021
  { outputClauseIndex := 12054, coreClauseIndex := 40178, terminalClauseIndex := 2612021, datum := { row := ⟨9, {0, 6, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12055; core 40179; terminal 2612022
  { outputClauseIndex := 12055, coreClauseIndex := 40179, terminalClauseIndex := 2612022, datum := { row := ⟨9, {0, 6, 7, 8}⟩, arc := ⟨9, .right, {0, 5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12056; core 40184; terminal 2612028
  { outputClauseIndex := 12056, coreClauseIndex := 40184, terminalClauseIndex := 2612028, datum := { row := ⟨9, {0, 6, 7, 10}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12057; core 40185; terminal 2612029
  { outputClauseIndex := 12057, coreClauseIndex := 40185, terminalClauseIndex := 2612029, datum := { row := ⟨9, {0, 6, 7, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 12058; core 40190; terminal 2612036
  { outputClauseIndex := 12058, coreClauseIndex := 40190, terminalClauseIndex := 2612036, datum := { row := ⟨9, {0, 6, 8, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 12059; core 40195; terminal 2612042
  { outputClauseIndex := 12059, coreClauseIndex := 40195, terminalClauseIndex := 2612042, datum := { row := ⟨9, {0, 7, 8, 10}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12060; core 40196; terminal 2612043
  { outputClauseIndex := 12060, coreClauseIndex := 40196, terminalClauseIndex := 2612043, datum := { row := ⟨9, {0, 7, 8, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 12061; core 40201; terminal 2612049
  { outputClauseIndex := 12061, coreClauseIndex := 40201, terminalClauseIndex := 2612049, datum := { row := ⟨9, {1, 2, 3, 4}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 12062; core 40202; terminal 2612050
  { outputClauseIndex := 12062, coreClauseIndex := 40202, terminalClauseIndex := 2612050, datum := { row := ⟨9, {1, 2, 3, 4}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12063; core 40207; terminal 2612056
  { outputClauseIndex := 12063, coreClauseIndex := 40207, terminalClauseIndex := 2612056, datum := { row := ⟨9, {1, 2, 3, 5}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 12064; core 40208; terminal 2612057
  { outputClauseIndex := 12064, coreClauseIndex := 40208, terminalClauseIndex := 2612057, datum := { row := ⟨9, {1, 2, 3, 5}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12065; core 40213; terminal 2612063
  { outputClauseIndex := 12065, coreClauseIndex := 40213, terminalClauseIndex := 2612063, datum := { row := ⟨9, {1, 2, 3, 6}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 12066; core 40214; terminal 2612064
  { outputClauseIndex := 12066, coreClauseIndex := 40214, terminalClauseIndex := 2612064, datum := { row := ⟨9, {1, 2, 3, 6}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12068; core 40220; terminal 2612070
  { outputClauseIndex := 12068, coreClauseIndex := 40220, terminalClauseIndex := 2612070, datum := { row := ⟨9, {1, 2, 3, 7}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 12069; core 40221; terminal 2612071
  { outputClauseIndex := 12069, coreClauseIndex := 40221, terminalClauseIndex := 2612071, datum := { row := ⟨9, {1, 2, 3, 7}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12071; core 40227; terminal 2612077
  { outputClauseIndex := 12071, coreClauseIndex := 40227, terminalClauseIndex := 2612077, datum := { row := ⟨9, {1, 2, 3, 8}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 12072; core 40228; terminal 2612078
  { outputClauseIndex := 12072, coreClauseIndex := 40228, terminalClauseIndex := 2612078, datum := { row := ⟨9, {1, 2, 3, 8}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12074; core 40234; terminal 2612084
  { outputClauseIndex := 12074, coreClauseIndex := 40234, terminalClauseIndex := 2612084, datum := { row := ⟨9, {1, 2, 3, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 12075; core 40235; terminal 2612085
  { outputClauseIndex := 12075, coreClauseIndex := 40235, terminalClauseIndex := 2612085, datum := { row := ⟨9, {1, 2, 3, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12076; core 40240; terminal 2612091
  { outputClauseIndex := 12076, coreClauseIndex := 40240, terminalClauseIndex := 2612091, datum := { row := ⟨9, {1, 2, 4, 5}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12077; core 40241; terminal 2612092
  { outputClauseIndex := 12077, coreClauseIndex := 40241, terminalClauseIndex := 2612092, datum := { row := ⟨9, {1, 2, 4, 5}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12078; core 40246; terminal 2612098
  { outputClauseIndex := 12078, coreClauseIndex := 40246, terminalClauseIndex := 2612098, datum := { row := ⟨9, {1, 2, 4, 6}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12079; core 40247; terminal 2612099
  { outputClauseIndex := 12079, coreClauseIndex := 40247, terminalClauseIndex := 2612099, datum := { row := ⟨9, {1, 2, 4, 6}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12081; core 40253; terminal 2612105
  { outputClauseIndex := 12081, coreClauseIndex := 40253, terminalClauseIndex := 2612105, datum := { row := ⟨9, {1, 2, 4, 7}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12082; core 40254; terminal 2612106
  { outputClauseIndex := 12082, coreClauseIndex := 40254, terminalClauseIndex := 2612106, datum := { row := ⟨9, {1, 2, 4, 7}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12084; core 40260; terminal 2612112
  { outputClauseIndex := 12084, coreClauseIndex := 40260, terminalClauseIndex := 2612112, datum := { row := ⟨9, {1, 2, 4, 8}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12085; core 40261; terminal 2612113
  { outputClauseIndex := 12085, coreClauseIndex := 40261, terminalClauseIndex := 2612113, datum := { row := ⟨9, {1, 2, 4, 8}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12087; core 40267; terminal 2612119
  { outputClauseIndex := 12087, coreClauseIndex := 40267, terminalClauseIndex := 2612119, datum := { row := ⟨9, {1, 2, 4, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 12088; core 40268; terminal 2612120
  { outputClauseIndex := 12088, coreClauseIndex := 40268, terminalClauseIndex := 2612120, datum := { row := ⟨9, {1, 2, 4, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12089; core 40273; terminal 2612126
  { outputClauseIndex := 12089, coreClauseIndex := 40273, terminalClauseIndex := 2612126, datum := { row := ⟨9, {1, 2, 5, 6}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12090; core 40274; terminal 2612127
  { outputClauseIndex := 12090, coreClauseIndex := 40274, terminalClauseIndex := 2612127, datum := { row := ⟨9, {1, 2, 5, 6}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12092; core 40280; terminal 2612133
  { outputClauseIndex := 12092, coreClauseIndex := 40280, terminalClauseIndex := 2612133, datum := { row := ⟨9, {1, 2, 5, 7}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12093; core 40281; terminal 2612134
  { outputClauseIndex := 12093, coreClauseIndex := 40281, terminalClauseIndex := 2612134, datum := { row := ⟨9, {1, 2, 5, 7}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12095; core 40287; terminal 2612140
  { outputClauseIndex := 12095, coreClauseIndex := 40287, terminalClauseIndex := 2612140, datum := { row := ⟨9, {1, 2, 5, 8}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12096; core 40288; terminal 2612141
  { outputClauseIndex := 12096, coreClauseIndex := 40288, terminalClauseIndex := 2612141, datum := { row := ⟨9, {1, 2, 5, 8}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12098; core 40294; terminal 2612147
  { outputClauseIndex := 12098, coreClauseIndex := 40294, terminalClauseIndex := 2612147, datum := { row := ⟨9, {1, 2, 5, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 12099; core 40295; terminal 2612148
  { outputClauseIndex := 12099, coreClauseIndex := 40295, terminalClauseIndex := 2612148, datum := { row := ⟨9, {1, 2, 5, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12101; core 40301; terminal 2612154
  { outputClauseIndex := 12101, coreClauseIndex := 40301, terminalClauseIndex := 2612154, datum := { row := ⟨9, {1, 2, 6, 7}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12102; core 40302; terminal 2612155
  { outputClauseIndex := 12102, coreClauseIndex := 40302, terminalClauseIndex := 2612155, datum := { row := ⟨9, {1, 2, 6, 7}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12104; core 40308; terminal 2612161
  { outputClauseIndex := 12104, coreClauseIndex := 40308, terminalClauseIndex := 2612161, datum := { row := ⟨9, {1, 2, 6, 8}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12105; core 40309; terminal 2612162
  { outputClauseIndex := 12105, coreClauseIndex := 40309, terminalClauseIndex := 2612162, datum := { row := ⟨9, {1, 2, 6, 8}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12107; core 40315; terminal 2612168
  { outputClauseIndex := 12107, coreClauseIndex := 40315, terminalClauseIndex := 2612168, datum := { row := ⟨9, {1, 2, 6, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 12108; core 40316; terminal 2612169
  { outputClauseIndex := 12108, coreClauseIndex := 40316, terminalClauseIndex := 2612169, datum := { row := ⟨9, {1, 2, 6, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12110; core 40322; terminal 2612175
  { outputClauseIndex := 12110, coreClauseIndex := 40322, terminalClauseIndex := 2612175, datum := { row := ⟨9, {1, 2, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12111; core 40323; terminal 2612176
  { outputClauseIndex := 12111, coreClauseIndex := 40323, terminalClauseIndex := 2612176, datum := { row := ⟨9, {1, 2, 7, 8}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12113; core 40329; terminal 2612182
  { outputClauseIndex := 12113, coreClauseIndex := 40329, terminalClauseIndex := 2612182, datum := { row := ⟨9, {1, 2, 7, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 12114; core 40330; terminal 2612183
  { outputClauseIndex := 12114, coreClauseIndex := 40330, terminalClauseIndex := 2612183, datum := { row := ⟨9, {1, 2, 7, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12116; core 40336; terminal 2612189
  { outputClauseIndex := 12116, coreClauseIndex := 40336, terminalClauseIndex := 2612189, datum := { row := ⟨9, {1, 2, 8, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 12117; core 40337; terminal 2612190
  { outputClauseIndex := 12117, coreClauseIndex := 40337, terminalClauseIndex := 2612190, datum := { row := ⟨9, {1, 2, 8, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12118; core 40342; terminal 2612196
  { outputClauseIndex := 12118, coreClauseIndex := 40342, terminalClauseIndex := 2612196, datum := { row := ⟨9, {1, 3, 4, 5}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12119; core 40343; terminal 2612197
  { outputClauseIndex := 12119, coreClauseIndex := 40343, terminalClauseIndex := 2612197, datum := { row := ⟨9, {1, 3, 4, 5}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12120; core 40348; terminal 2612203
  { outputClauseIndex := 12120, coreClauseIndex := 40348, terminalClauseIndex := 2612203, datum := { row := ⟨9, {1, 3, 4, 6}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12121; core 40349; terminal 2612204
  { outputClauseIndex := 12121, coreClauseIndex := 40349, terminalClauseIndex := 2612204, datum := { row := ⟨9, {1, 3, 4, 6}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12123; core 40355; terminal 2612210
  { outputClauseIndex := 12123, coreClauseIndex := 40355, terminalClauseIndex := 2612210, datum := { row := ⟨9, {1, 3, 4, 7}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12124; core 40356; terminal 2612211
  { outputClauseIndex := 12124, coreClauseIndex := 40356, terminalClauseIndex := 2612211, datum := { row := ⟨9, {1, 3, 4, 7}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12126; core 40362; terminal 2612217
  { outputClauseIndex := 12126, coreClauseIndex := 40362, terminalClauseIndex := 2612217, datum := { row := ⟨9, {1, 3, 4, 8}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12127; core 40363; terminal 2612218
  { outputClauseIndex := 12127, coreClauseIndex := 40363, terminalClauseIndex := 2612218, datum := { row := ⟨9, {1, 3, 4, 8}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12129; core 40369; terminal 2612224
  { outputClauseIndex := 12129, coreClauseIndex := 40369, terminalClauseIndex := 2612224, datum := { row := ⟨9, {1, 3, 4, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 12130; core 40370; terminal 2612225
  { outputClauseIndex := 12130, coreClauseIndex := 40370, terminalClauseIndex := 2612225, datum := { row := ⟨9, {1, 3, 4, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12131; core 40375; terminal 2612231
  { outputClauseIndex := 12131, coreClauseIndex := 40375, terminalClauseIndex := 2612231, datum := { row := ⟨9, {1, 3, 5, 6}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12132; core 40376; terminal 2612232
  { outputClauseIndex := 12132, coreClauseIndex := 40376, terminalClauseIndex := 2612232, datum := { row := ⟨9, {1, 3, 5, 6}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12134; core 40382; terminal 2612238
  { outputClauseIndex := 12134, coreClauseIndex := 40382, terminalClauseIndex := 2612238, datum := { row := ⟨9, {1, 3, 5, 7}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12135; core 40383; terminal 2612239
  { outputClauseIndex := 12135, coreClauseIndex := 40383, terminalClauseIndex := 2612239, datum := { row := ⟨9, {1, 3, 5, 7}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12137; core 40389; terminal 2612245
  { outputClauseIndex := 12137, coreClauseIndex := 40389, terminalClauseIndex := 2612245, datum := { row := ⟨9, {1, 3, 5, 8}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12138; core 40390; terminal 2612246
  { outputClauseIndex := 12138, coreClauseIndex := 40390, terminalClauseIndex := 2612246, datum := { row := ⟨9, {1, 3, 5, 8}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12140; core 40396; terminal 2612252
  { outputClauseIndex := 12140, coreClauseIndex := 40396, terminalClauseIndex := 2612252, datum := { row := ⟨9, {1, 3, 5, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 12141; core 40397; terminal 2612253
  { outputClauseIndex := 12141, coreClauseIndex := 40397, terminalClauseIndex := 2612253, datum := { row := ⟨9, {1, 3, 5, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12143; core 40403; terminal 2612259
  { outputClauseIndex := 12143, coreClauseIndex := 40403, terminalClauseIndex := 2612259, datum := { row := ⟨9, {1, 3, 6, 7}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12144; core 40404; terminal 2612260
  { outputClauseIndex := 12144, coreClauseIndex := 40404, terminalClauseIndex := 2612260, datum := { row := ⟨9, {1, 3, 6, 7}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12146; core 40410; terminal 2612266
  { outputClauseIndex := 12146, coreClauseIndex := 40410, terminalClauseIndex := 2612266, datum := { row := ⟨9, {1, 3, 6, 8}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12147; core 40411; terminal 2612267
  { outputClauseIndex := 12147, coreClauseIndex := 40411, terminalClauseIndex := 2612267, datum := { row := ⟨9, {1, 3, 6, 8}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12149; core 40417; terminal 2612273
  { outputClauseIndex := 12149, coreClauseIndex := 40417, terminalClauseIndex := 2612273, datum := { row := ⟨9, {1, 3, 6, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 12150; core 40418; terminal 2612274
  { outputClauseIndex := 12150, coreClauseIndex := 40418, terminalClauseIndex := 2612274, datum := { row := ⟨9, {1, 3, 6, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12152; core 40424; terminal 2612280
  { outputClauseIndex := 12152, coreClauseIndex := 40424, terminalClauseIndex := 2612280, datum := { row := ⟨9, {1, 3, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12153; core 40425; terminal 2612281
  { outputClauseIndex := 12153, coreClauseIndex := 40425, terminalClauseIndex := 2612281, datum := { row := ⟨9, {1, 3, 7, 8}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12155; core 40431; terminal 2612287
  { outputClauseIndex := 12155, coreClauseIndex := 40431, terminalClauseIndex := 2612287, datum := { row := ⟨9, {1, 3, 7, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 12156; core 40432; terminal 2612288
  { outputClauseIndex := 12156, coreClauseIndex := 40432, terminalClauseIndex := 2612288, datum := { row := ⟨9, {1, 3, 7, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12158; core 40438; terminal 2612294
  { outputClauseIndex := 12158, coreClauseIndex := 40438, terminalClauseIndex := 2612294, datum := { row := ⟨9, {1, 3, 8, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 12159; core 40439; terminal 2612295
  { outputClauseIndex := 12159, coreClauseIndex := 40439, terminalClauseIndex := 2612295, datum := { row := ⟨9, {1, 3, 8, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12160; core 40444; terminal 2612302
  { outputClauseIndex := 12160, coreClauseIndex := 40444, terminalClauseIndex := 2612302, datum := { row := ⟨9, {1, 4, 5, 6}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12162; core 40450; terminal 2612308
  { outputClauseIndex := 12162, coreClauseIndex := 40450, terminalClauseIndex := 2612308, datum := { row := ⟨9, {1, 4, 5, 7}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12163; core 40451; terminal 2612309
  { outputClauseIndex := 12163, coreClauseIndex := 40451, terminalClauseIndex := 2612309, datum := { row := ⟨9, {1, 4, 5, 7}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12165; core 40457; terminal 2612315
  { outputClauseIndex := 12165, coreClauseIndex := 40457, terminalClauseIndex := 2612315, datum := { row := ⟨9, {1, 4, 5, 8}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12166; core 40458; terminal 2612316
  { outputClauseIndex := 12166, coreClauseIndex := 40458, terminalClauseIndex := 2612316, datum := { row := ⟨9, {1, 4, 5, 8}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12168; core 40464; terminal 2612322
  { outputClauseIndex := 12168, coreClauseIndex := 40464, terminalClauseIndex := 2612322, datum := { row := ⟨9, {1, 4, 5, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12169; core 40465; terminal 2612323
  { outputClauseIndex := 12169, coreClauseIndex := 40465, terminalClauseIndex := 2612323, datum := { row := ⟨9, {1, 4, 5, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12171; core 40471; terminal 2612329
  { outputClauseIndex := 12171, coreClauseIndex := 40471, terminalClauseIndex := 2612329, datum := { row := ⟨9, {1, 4, 6, 7}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12172; core 40472; terminal 2612330
  { outputClauseIndex := 12172, coreClauseIndex := 40472, terminalClauseIndex := 2612330, datum := { row := ⟨9, {1, 4, 6, 7}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12174; core 40478; terminal 2612336
  { outputClauseIndex := 12174, coreClauseIndex := 40478, terminalClauseIndex := 2612336, datum := { row := ⟨9, {1, 4, 6, 8}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12175; core 40479; terminal 2612337
  { outputClauseIndex := 12175, coreClauseIndex := 40479, terminalClauseIndex := 2612337, datum := { row := ⟨9, {1, 4, 6, 8}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12177; core 40485; terminal 2612343
  { outputClauseIndex := 12177, coreClauseIndex := 40485, terminalClauseIndex := 2612343, datum := { row := ⟨9, {1, 4, 6, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12178; core 40486; terminal 2612344
  { outputClauseIndex := 12178, coreClauseIndex := 40486, terminalClauseIndex := 2612344, datum := { row := ⟨9, {1, 4, 6, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12180; core 40492; terminal 2612350
  { outputClauseIndex := 12180, coreClauseIndex := 40492, terminalClauseIndex := 2612350, datum := { row := ⟨9, {1, 4, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk020_batch_valid :
    directRowArcFiniteOccurrencesChunk020.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk020, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk020 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk020.map (·.datum)

theorem directRowArcFiniteDataChunk020_batch_valid :
    directRowArcFiniteDataChunk020.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk020, datum.Valid := by
  rw [directRowArcFiniteDataChunk020]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk020_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk020_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
