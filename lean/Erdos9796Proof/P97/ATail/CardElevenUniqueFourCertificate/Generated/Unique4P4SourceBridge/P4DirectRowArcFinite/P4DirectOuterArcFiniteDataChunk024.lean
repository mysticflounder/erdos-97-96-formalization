/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk024 : List DirectRowArcFiniteOccurrence := [
  -- compact 12717; core 41883; terminal 2613890
  { outputClauseIndex := 12717, coreClauseIndex := 41883, terminalClauseIndex := 2613890, datum := { row := ⟨10, {1, 6, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12718; core 41884; terminal 2613891
  { outputClauseIndex := 12718, coreClauseIndex := 41884, terminalClauseIndex := 2613891, datum := { row := ⟨10, {1, 6, 7, 9}⟩, arc := ⟨10, .right, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12720; core 41890; terminal 2613897
  { outputClauseIndex := 12720, coreClauseIndex := 41890, terminalClauseIndex := 2613897, datum := { row := ⟨10, {1, 6, 8, 9}⟩, arc := ⟨10, .left, {1}⟩ } },
  -- compact 12721; core 41891; terminal 2613898
  { outputClauseIndex := 12721, coreClauseIndex := 41891, terminalClauseIndex := 2613898, datum := { row := ⟨10, {1, 6, 8, 9}⟩, arc := ⟨10, .right, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12722; core 41899; terminal 2613911
  { outputClauseIndex := 12722, coreClauseIndex := 41899, terminalClauseIndex := 2613911, datum := { row := ⟨10, {2, 3, 4, 5}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12723; core 41900; terminal 2613912
  { outputClauseIndex := 12723, coreClauseIndex := 41900, terminalClauseIndex := 2613912, datum := { row := ⟨10, {2, 3, 4, 5}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12724; core 41905; terminal 2613918
  { outputClauseIndex := 12724, coreClauseIndex := 41905, terminalClauseIndex := 2613918, datum := { row := ⟨10, {2, 3, 4, 6}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12725; core 41906; terminal 2613919
  { outputClauseIndex := 12725, coreClauseIndex := 41906, terminalClauseIndex := 2613919, datum := { row := ⟨10, {2, 3, 4, 6}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12727; core 41912; terminal 2613925
  { outputClauseIndex := 12727, coreClauseIndex := 41912, terminalClauseIndex := 2613925, datum := { row := ⟨10, {2, 3, 4, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12728; core 41913; terminal 2613926
  { outputClauseIndex := 12728, coreClauseIndex := 41913, terminalClauseIndex := 2613926, datum := { row := ⟨10, {2, 3, 4, 7}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12730; core 41919; terminal 2613932
  { outputClauseIndex := 12730, coreClauseIndex := 41919, terminalClauseIndex := 2613932, datum := { row := ⟨10, {2, 3, 4, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12731; core 41920; terminal 2613933
  { outputClauseIndex := 12731, coreClauseIndex := 41920, terminalClauseIndex := 2613933, datum := { row := ⟨10, {2, 3, 4, 8}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12733; core 41926; terminal 2613939
  { outputClauseIndex := 12733, coreClauseIndex := 41926, terminalClauseIndex := 2613939, datum := { row := ⟨10, {2, 3, 4, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12734; core 41927; terminal 2613940
  { outputClauseIndex := 12734, coreClauseIndex := 41927, terminalClauseIndex := 2613940, datum := { row := ⟨10, {2, 3, 4, 9}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12735; core 41932; terminal 2613947
  { outputClauseIndex := 12735, coreClauseIndex := 41932, terminalClauseIndex := 2613947, datum := { row := ⟨10, {2, 3, 5, 6}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12737; core 41938; terminal 2613953
  { outputClauseIndex := 12737, coreClauseIndex := 41938, terminalClauseIndex := 2613953, datum := { row := ⟨10, {2, 3, 5, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12738; core 41939; terminal 2613954
  { outputClauseIndex := 12738, coreClauseIndex := 41939, terminalClauseIndex := 2613954, datum := { row := ⟨10, {2, 3, 5, 7}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12740; core 41945; terminal 2613960
  { outputClauseIndex := 12740, coreClauseIndex := 41945, terminalClauseIndex := 2613960, datum := { row := ⟨10, {2, 3, 5, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12741; core 41946; terminal 2613961
  { outputClauseIndex := 12741, coreClauseIndex := 41946, terminalClauseIndex := 2613961, datum := { row := ⟨10, {2, 3, 5, 8}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12743; core 41952; terminal 2613967
  { outputClauseIndex := 12743, coreClauseIndex := 41952, terminalClauseIndex := 2613967, datum := { row := ⟨10, {2, 3, 5, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12744; core 41953; terminal 2613968
  { outputClauseIndex := 12744, coreClauseIndex := 41953, terminalClauseIndex := 2613968, datum := { row := ⟨10, {2, 3, 5, 9}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12746; core 41959; terminal 2613974
  { outputClauseIndex := 12746, coreClauseIndex := 41959, terminalClauseIndex := 2613974, datum := { row := ⟨10, {2, 3, 6, 7}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12747; core 41960; terminal 2613975
  { outputClauseIndex := 12747, coreClauseIndex := 41960, terminalClauseIndex := 2613975, datum := { row := ⟨10, {2, 3, 6, 7}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12749; core 41966; terminal 2613981
  { outputClauseIndex := 12749, coreClauseIndex := 41966, terminalClauseIndex := 2613981, datum := { row := ⟨10, {2, 3, 6, 8}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12750; core 41967; terminal 2613982
  { outputClauseIndex := 12750, coreClauseIndex := 41967, terminalClauseIndex := 2613982, datum := { row := ⟨10, {2, 3, 6, 8}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12752; core 41973; terminal 2613988
  { outputClauseIndex := 12752, coreClauseIndex := 41973, terminalClauseIndex := 2613988, datum := { row := ⟨10, {2, 3, 6, 9}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12753; core 41974; terminal 2613989
  { outputClauseIndex := 12753, coreClauseIndex := 41974, terminalClauseIndex := 2613989, datum := { row := ⟨10, {2, 3, 6, 9}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12755; core 41980; terminal 2613995
  { outputClauseIndex := 12755, coreClauseIndex := 41980, terminalClauseIndex := 2613995, datum := { row := ⟨10, {2, 3, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12756; core 41981; terminal 2613996
  { outputClauseIndex := 12756, coreClauseIndex := 41981, terminalClauseIndex := 2613996, datum := { row := ⟨10, {2, 3, 7, 8}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12758; core 41987; terminal 2614002
  { outputClauseIndex := 12758, coreClauseIndex := 41987, terminalClauseIndex := 2614002, datum := { row := ⟨10, {2, 3, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12759; core 41988; terminal 2614003
  { outputClauseIndex := 12759, coreClauseIndex := 41988, terminalClauseIndex := 2614003, datum := { row := ⟨10, {2, 3, 7, 9}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12761; core 41994; terminal 2614009
  { outputClauseIndex := 12761, coreClauseIndex := 41994, terminalClauseIndex := 2614009, datum := { row := ⟨10, {2, 3, 8, 9}⟩, arc := ⟨10, .left, {1}⟩ } },
  -- compact 12762; core 41995; terminal 2614010
  { outputClauseIndex := 12762, coreClauseIndex := 41995, terminalClauseIndex := 2614010, datum := { row := ⟨10, {2, 3, 8, 9}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12763; core 42000; terminal 2614017
  { outputClauseIndex := 12763, coreClauseIndex := 42000, terminalClauseIndex := 2614017, datum := { row := ⟨10, {2, 4, 5, 6}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12765; core 42006; terminal 2614023
  { outputClauseIndex := 12765, coreClauseIndex := 42006, terminalClauseIndex := 2614023, datum := { row := ⟨10, {2, 4, 5, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12766; core 42007; terminal 2614024
  { outputClauseIndex := 12766, coreClauseIndex := 42007, terminalClauseIndex := 2614024, datum := { row := ⟨10, {2, 4, 5, 7}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12768; core 42013; terminal 2614030
  { outputClauseIndex := 12768, coreClauseIndex := 42013, terminalClauseIndex := 2614030, datum := { row := ⟨10, {2, 4, 5, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12769; core 42014; terminal 2614031
  { outputClauseIndex := 12769, coreClauseIndex := 42014, terminalClauseIndex := 2614031, datum := { row := ⟨10, {2, 4, 5, 8}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12771; core 42020; terminal 2614037
  { outputClauseIndex := 12771, coreClauseIndex := 42020, terminalClauseIndex := 2614037, datum := { row := ⟨10, {2, 4, 5, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12772; core 42021; terminal 2614038
  { outputClauseIndex := 12772, coreClauseIndex := 42021, terminalClauseIndex := 2614038, datum := { row := ⟨10, {2, 4, 5, 9}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12774; core 42027; terminal 2614044
  { outputClauseIndex := 12774, coreClauseIndex := 42027, terminalClauseIndex := 2614044, datum := { row := ⟨10, {2, 4, 6, 7}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12775; core 42028; terminal 2614045
  { outputClauseIndex := 12775, coreClauseIndex := 42028, terminalClauseIndex := 2614045, datum := { row := ⟨10, {2, 4, 6, 7}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12777; core 42034; terminal 2614051
  { outputClauseIndex := 12777, coreClauseIndex := 42034, terminalClauseIndex := 2614051, datum := { row := ⟨10, {2, 4, 6, 8}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12778; core 42035; terminal 2614052
  { outputClauseIndex := 12778, coreClauseIndex := 42035, terminalClauseIndex := 2614052, datum := { row := ⟨10, {2, 4, 6, 8}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12780; core 42041; terminal 2614058
  { outputClauseIndex := 12780, coreClauseIndex := 42041, terminalClauseIndex := 2614058, datum := { row := ⟨10, {2, 4, 6, 9}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12781; core 42042; terminal 2614059
  { outputClauseIndex := 12781, coreClauseIndex := 42042, terminalClauseIndex := 2614059, datum := { row := ⟨10, {2, 4, 6, 9}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12783; core 42048; terminal 2614065
  { outputClauseIndex := 12783, coreClauseIndex := 42048, terminalClauseIndex := 2614065, datum := { row := ⟨10, {2, 4, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12784; core 42049; terminal 2614066
  { outputClauseIndex := 12784, coreClauseIndex := 42049, terminalClauseIndex := 2614066, datum := { row := ⟨10, {2, 4, 7, 8}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12786; core 42055; terminal 2614072
  { outputClauseIndex := 12786, coreClauseIndex := 42055, terminalClauseIndex := 2614072, datum := { row := ⟨10, {2, 4, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12787; core 42056; terminal 2614073
  { outputClauseIndex := 12787, coreClauseIndex := 42056, terminalClauseIndex := 2614073, datum := { row := ⟨10, {2, 4, 7, 9}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12789; core 42062; terminal 2614079
  { outputClauseIndex := 12789, coreClauseIndex := 42062, terminalClauseIndex := 2614079, datum := { row := ⟨10, {2, 4, 8, 9}⟩, arc := ⟨10, .left, {1}⟩ } },
  -- compact 12790; core 42063; terminal 2614080
  { outputClauseIndex := 12790, coreClauseIndex := 42063, terminalClauseIndex := 2614080, datum := { row := ⟨10, {2, 4, 8, 9}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12792; core 42080; terminal 2614107
  { outputClauseIndex := 12792, coreClauseIndex := 42080, terminalClauseIndex := 2614107, datum := { row := ⟨10, {2, 5, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12793; core 42081; terminal 2614108
  { outputClauseIndex := 12793, coreClauseIndex := 42081, terminalClauseIndex := 2614108, datum := { row := ⟨10, {2, 5, 7, 8}⟩, arc := ⟨10, .right, {6, 7, 8, 9, 10}⟩ } },
  -- compact 12795; core 42087; terminal 2614114
  { outputClauseIndex := 12795, coreClauseIndex := 42087, terminalClauseIndex := 2614114, datum := { row := ⟨10, {2, 5, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12796; core 42088; terminal 2614115
  { outputClauseIndex := 12796, coreClauseIndex := 42088, terminalClauseIndex := 2614115, datum := { row := ⟨10, {2, 5, 7, 9}⟩, arc := ⟨10, .right, {6, 7, 8, 9, 10}⟩ } },
  -- compact 12798; core 42094; terminal 2614121
  { outputClauseIndex := 12798, coreClauseIndex := 42094, terminalClauseIndex := 2614121, datum := { row := ⟨10, {2, 5, 8, 9}⟩, arc := ⟨10, .left, {1}⟩ } },
  -- compact 12799; core 42095; terminal 2614122
  { outputClauseIndex := 12799, coreClauseIndex := 42095, terminalClauseIndex := 2614122, datum := { row := ⟨10, {2, 5, 8, 9}⟩, arc := ⟨10, .right, {6, 7, 8, 9, 10}⟩ } },
  -- compact 12801; core 42101; terminal 2614128
  { outputClauseIndex := 12801, coreClauseIndex := 42101, terminalClauseIndex := 2614128, datum := { row := ⟨10, {2, 6, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12802; core 42102; terminal 2614129
  { outputClauseIndex := 12802, coreClauseIndex := 42102, terminalClauseIndex := 2614129, datum := { row := ⟨10, {2, 6, 7, 8}⟩, arc := ⟨10, .right, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12804; core 42108; terminal 2614135
  { outputClauseIndex := 12804, coreClauseIndex := 42108, terminalClauseIndex := 2614135, datum := { row := ⟨10, {2, 6, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12805; core 42109; terminal 2614136
  { outputClauseIndex := 12805, coreClauseIndex := 42109, terminalClauseIndex := 2614136, datum := { row := ⟨10, {2, 6, 7, 9}⟩, arc := ⟨10, .right, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12807; core 42115; terminal 2614142
  { outputClauseIndex := 12807, coreClauseIndex := 42115, terminalClauseIndex := 2614142, datum := { row := ⟨10, {2, 6, 8, 9}⟩, arc := ⟨10, .left, {1}⟩ } },
  -- compact 12808; core 42116; terminal 2614143
  { outputClauseIndex := 12808, coreClauseIndex := 42116, terminalClauseIndex := 2614143, datum := { row := ⟨10, {2, 6, 8, 9}⟩, arc := ⟨10, .right, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12809; core 42123; terminal 2614157
  { outputClauseIndex := 12809, coreClauseIndex := 42123, terminalClauseIndex := 2614157, datum := { row := ⟨10, {3, 4, 5, 6}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12811; core 42129; terminal 2614163
  { outputClauseIndex := 12811, coreClauseIndex := 42129, terminalClauseIndex := 2614163, datum := { row := ⟨10, {3, 4, 5, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12812; core 42130; terminal 2614164
  { outputClauseIndex := 12812, coreClauseIndex := 42130, terminalClauseIndex := 2614164, datum := { row := ⟨10, {3, 4, 5, 7}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12814; core 42136; terminal 2614170
  { outputClauseIndex := 12814, coreClauseIndex := 42136, terminalClauseIndex := 2614170, datum := { row := ⟨10, {3, 4, 5, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12815; core 42137; terminal 2614171
  { outputClauseIndex := 12815, coreClauseIndex := 42137, terminalClauseIndex := 2614171, datum := { row := ⟨10, {3, 4, 5, 8}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12817; core 42143; terminal 2614177
  { outputClauseIndex := 12817, coreClauseIndex := 42143, terminalClauseIndex := 2614177, datum := { row := ⟨10, {3, 4, 5, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12818; core 42144; terminal 2614178
  { outputClauseIndex := 12818, coreClauseIndex := 42144, terminalClauseIndex := 2614178, datum := { row := ⟨10, {3, 4, 5, 9}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12820; core 42150; terminal 2614184
  { outputClauseIndex := 12820, coreClauseIndex := 42150, terminalClauseIndex := 2614184, datum := { row := ⟨10, {3, 4, 6, 7}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12821; core 42151; terminal 2614185
  { outputClauseIndex := 12821, coreClauseIndex := 42151, terminalClauseIndex := 2614185, datum := { row := ⟨10, {3, 4, 6, 7}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12823; core 42157; terminal 2614191
  { outputClauseIndex := 12823, coreClauseIndex := 42157, terminalClauseIndex := 2614191, datum := { row := ⟨10, {3, 4, 6, 8}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12824; core 42158; terminal 2614192
  { outputClauseIndex := 12824, coreClauseIndex := 42158, terminalClauseIndex := 2614192, datum := { row := ⟨10, {3, 4, 6, 8}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12826; core 42164; terminal 2614198
  { outputClauseIndex := 12826, coreClauseIndex := 42164, terminalClauseIndex := 2614198, datum := { row := ⟨10, {3, 4, 6, 9}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12827; core 42165; terminal 2614199
  { outputClauseIndex := 12827, coreClauseIndex := 42165, terminalClauseIndex := 2614199, datum := { row := ⟨10, {3, 4, 6, 9}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12829; core 42171; terminal 2614205
  { outputClauseIndex := 12829, coreClauseIndex := 42171, terminalClauseIndex := 2614205, datum := { row := ⟨10, {3, 4, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12830; core 42172; terminal 2614206
  { outputClauseIndex := 12830, coreClauseIndex := 42172, terminalClauseIndex := 2614206, datum := { row := ⟨10, {3, 4, 7, 8}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12832; core 42178; terminal 2614212
  { outputClauseIndex := 12832, coreClauseIndex := 42178, terminalClauseIndex := 2614212, datum := { row := ⟨10, {3, 4, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12833; core 42179; terminal 2614213
  { outputClauseIndex := 12833, coreClauseIndex := 42179, terminalClauseIndex := 2614213, datum := { row := ⟨10, {3, 4, 7, 9}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12835; core 42185; terminal 2614219
  { outputClauseIndex := 12835, coreClauseIndex := 42185, terminalClauseIndex := 2614219, datum := { row := ⟨10, {3, 4, 8, 9}⟩, arc := ⟨10, .left, {1}⟩ } },
  -- compact 12836; core 42186; terminal 2614220
  { outputClauseIndex := 12836, coreClauseIndex := 42186, terminalClauseIndex := 2614220, datum := { row := ⟨10, {3, 4, 8, 9}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12838; core 42202; terminal 2614247
  { outputClauseIndex := 12838, coreClauseIndex := 42202, terminalClauseIndex := 2614247, datum := { row := ⟨10, {3, 5, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12839; core 42203; terminal 2614248
  { outputClauseIndex := 12839, coreClauseIndex := 42203, terminalClauseIndex := 2614248, datum := { row := ⟨10, {3, 5, 7, 8}⟩, arc := ⟨10, .right, {6, 7, 8, 9, 10}⟩ } },
  -- compact 12841; core 42209; terminal 2614254
  { outputClauseIndex := 12841, coreClauseIndex := 42209, terminalClauseIndex := 2614254, datum := { row := ⟨10, {3, 5, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12842; core 42210; terminal 2614255
  { outputClauseIndex := 12842, coreClauseIndex := 42210, terminalClauseIndex := 2614255, datum := { row := ⟨10, {3, 5, 7, 9}⟩, arc := ⟨10, .right, {6, 7, 8, 9, 10}⟩ } },
  -- compact 12844; core 42216; terminal 2614261
  { outputClauseIndex := 12844, coreClauseIndex := 42216, terminalClauseIndex := 2614261, datum := { row := ⟨10, {3, 5, 8, 9}⟩, arc := ⟨10, .left, {1}⟩ } },
  -- compact 12845; core 42217; terminal 2614262
  { outputClauseIndex := 12845, coreClauseIndex := 42217, terminalClauseIndex := 2614262, datum := { row := ⟨10, {3, 5, 8, 9}⟩, arc := ⟨10, .right, {6, 7, 8, 9, 10}⟩ } },
  -- compact 12847; core 42223; terminal 2614268
  { outputClauseIndex := 12847, coreClauseIndex := 42223, terminalClauseIndex := 2614268, datum := { row := ⟨10, {3, 6, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12848; core 42224; terminal 2614269
  { outputClauseIndex := 12848, coreClauseIndex := 42224, terminalClauseIndex := 2614269, datum := { row := ⟨10, {3, 6, 7, 8}⟩, arc := ⟨10, .right, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12850; core 42230; terminal 2614275
  { outputClauseIndex := 12850, coreClauseIndex := 42230, terminalClauseIndex := 2614275, datum := { row := ⟨10, {3, 6, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12851; core 42231; terminal 2614276
  { outputClauseIndex := 12851, coreClauseIndex := 42231, terminalClauseIndex := 2614276, datum := { row := ⟨10, {3, 6, 7, 9}⟩, arc := ⟨10, .right, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12853; core 42237; terminal 2614282
  { outputClauseIndex := 12853, coreClauseIndex := 42237, terminalClauseIndex := 2614282, datum := { row := ⟨10, {3, 6, 8, 9}⟩, arc := ⟨10, .left, {1}⟩ } },
  -- compact 12854; core 42238; terminal 2614283
  { outputClauseIndex := 12854, coreClauseIndex := 42238, terminalClauseIndex := 2614283, datum := { row := ⟨10, {3, 6, 8, 9}⟩, arc := ⟨10, .right, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12856; core 42259; terminal 2614317
  { outputClauseIndex := 12856, coreClauseIndex := 42259, terminalClauseIndex := 2614317, datum := { row := ⟨10, {4, 5, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12857; core 42260; terminal 2614318
  { outputClauseIndex := 12857, coreClauseIndex := 42260, terminalClauseIndex := 2614318, datum := { row := ⟨10, {4, 5, 7, 8}⟩, arc := ⟨10, .right, {6, 7, 8, 9, 10}⟩ } },
  -- compact 12859; core 42266; terminal 2614324
  { outputClauseIndex := 12859, coreClauseIndex := 42266, terminalClauseIndex := 2614324, datum := { row := ⟨10, {4, 5, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12860; core 42267; terminal 2614325
  { outputClauseIndex := 12860, coreClauseIndex := 42267, terminalClauseIndex := 2614325, datum := { row := ⟨10, {4, 5, 7, 9}⟩, arc := ⟨10, .right, {6, 7, 8, 9, 10}⟩ } },
  -- compact 12862; core 42273; terminal 2614331
  { outputClauseIndex := 12862, coreClauseIndex := 42273, terminalClauseIndex := 2614331, datum := { row := ⟨10, {4, 5, 8, 9}⟩, arc := ⟨10, .left, {1}⟩ } },
  -- compact 12863; core 42274; terminal 2614332
  { outputClauseIndex := 12863, coreClauseIndex := 42274, terminalClauseIndex := 2614332, datum := { row := ⟨10, {4, 5, 8, 9}⟩, arc := ⟨10, .right, {6, 7, 8, 9, 10}⟩ } },
  -- compact 12865; core 42280; terminal 2614338
  { outputClauseIndex := 12865, coreClauseIndex := 42280, terminalClauseIndex := 2614338, datum := { row := ⟨10, {4, 6, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12866; core 42281; terminal 2614339
  { outputClauseIndex := 12866, coreClauseIndex := 42281, terminalClauseIndex := 2614339, datum := { row := ⟨10, {4, 6, 7, 8}⟩, arc := ⟨10, .right, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12868; core 42287; terminal 2614345
  { outputClauseIndex := 12868, coreClauseIndex := 42287, terminalClauseIndex := 2614345, datum := { row := ⟨10, {4, 6, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12869; core 42288; terminal 2614346
  { outputClauseIndex := 12869, coreClauseIndex := 42288, terminalClauseIndex := 2614346, datum := { row := ⟨10, {4, 6, 7, 9}⟩, arc := ⟨10, .right, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12871; core 42294; terminal 2614352
  { outputClauseIndex := 12871, coreClauseIndex := 42294, terminalClauseIndex := 2614352, datum := { row := ⟨10, {4, 6, 8, 9}⟩, arc := ⟨10, .left, {1}⟩ } },
  -- compact 12872; core 42295; terminal 2614353
  { outputClauseIndex := 12872, coreClauseIndex := 42295, terminalClauseIndex := 2614353, datum := { row := ⟨10, {4, 6, 8, 9}⟩, arc := ⟨10, .right, {5, 6, 7, 8, 9, 10}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk024_batch_valid :
    directRowArcFiniteOccurrencesChunk024.length = 107 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk024, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk024 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk024.map (·.datum)

theorem directRowArcFiniteDataChunk024_batch_valid :
    directRowArcFiniteDataChunk024.length = 107 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk024, datum.Valid := by
  rw [directRowArcFiniteDataChunk024]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk024_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk024_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
