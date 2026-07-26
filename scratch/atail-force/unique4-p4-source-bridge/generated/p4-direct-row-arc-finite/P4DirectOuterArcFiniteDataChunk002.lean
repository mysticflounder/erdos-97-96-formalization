/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk002 : List DirectRowArcFiniteOccurrence := [
  -- compact 8740; core 30880; terminal 2600745
  { outputClauseIndex := 8740, coreClauseIndex := 30880, terminalClauseIndex := 2600745, datum := { row := ⟨1, {3, 4, 7, 8}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8742; core 30886; terminal 2600751
  { outputClauseIndex := 8742, coreClauseIndex := 30886, terminalClauseIndex := 2600751, datum := { row := ⟨1, {3, 4, 7, 9}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8743; core 30887; terminal 2600752
  { outputClauseIndex := 8743, coreClauseIndex := 30887, terminalClauseIndex := 2600752, datum := { row := ⟨1, {3, 4, 7, 9}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8744; core 30892; terminal 2600758
  { outputClauseIndex := 8744, coreClauseIndex := 30892, terminalClauseIndex := 2600758, datum := { row := ⟨1, {3, 4, 7, 10}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8745; core 30893; terminal 2600759
  { outputClauseIndex := 8745, coreClauseIndex := 30893, terminalClauseIndex := 2600759, datum := { row := ⟨1, {3, 4, 7, 10}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8746; core 30898; terminal 2600765
  { outputClauseIndex := 8746, coreClauseIndex := 30898, terminalClauseIndex := 2600765, datum := { row := ⟨1, {3, 4, 8, 9}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8747; core 30899; terminal 2600766
  { outputClauseIndex := 8747, coreClauseIndex := 30899, terminalClauseIndex := 2600766, datum := { row := ⟨1, {3, 4, 8, 9}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8749; core 30905; terminal 2600772
  { outputClauseIndex := 8749, coreClauseIndex := 30905, terminalClauseIndex := 2600772, datum := { row := ⟨1, {3, 4, 8, 10}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8750; core 30906; terminal 2600773
  { outputClauseIndex := 8750, coreClauseIndex := 30906, terminalClauseIndex := 2600773, datum := { row := ⟨1, {3, 4, 8, 10}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8751; core 30911; terminal 2600779
  { outputClauseIndex := 8751, coreClauseIndex := 30911, terminalClauseIndex := 2600779, datum := { row := ⟨1, {3, 4, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8752; core 30912; terminal 2600780
  { outputClauseIndex := 8752, coreClauseIndex := 30912, terminalClauseIndex := 2600780, datum := { row := ⟨1, {3, 4, 9, 10}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8753; core 30916; terminal 2600787
  { outputClauseIndex := 8753, coreClauseIndex := 30916, terminalClauseIndex := 2600787, datum := { row := ⟨1, {3, 5, 6, 7}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8754; core 30920; terminal 2600794
  { outputClauseIndex := 8754, coreClauseIndex := 30920, terminalClauseIndex := 2600794, datum := { row := ⟨1, {3, 5, 6, 8}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8755; core 30924; terminal 2600801
  { outputClauseIndex := 8755, coreClauseIndex := 30924, terminalClauseIndex := 2600801, datum := { row := ⟨1, {3, 5, 6, 9}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8756; core 30928; terminal 2600808
  { outputClauseIndex := 8756, coreClauseIndex := 30928, terminalClauseIndex := 2600808, datum := { row := ⟨1, {3, 5, 6, 10}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8757; core 30932; terminal 2600814
  { outputClauseIndex := 8757, coreClauseIndex := 30932, terminalClauseIndex := 2600814, datum := { row := ⟨1, {3, 5, 7, 8}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8758; core 30933; terminal 2600815
  { outputClauseIndex := 8758, coreClauseIndex := 30933, terminalClauseIndex := 2600815, datum := { row := ⟨1, {3, 5, 7, 8}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8760; core 30939; terminal 2600821
  { outputClauseIndex := 8760, coreClauseIndex := 30939, terminalClauseIndex := 2600821, datum := { row := ⟨1, {3, 5, 7, 9}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8761; core 30940; terminal 2600822
  { outputClauseIndex := 8761, coreClauseIndex := 30940, terminalClauseIndex := 2600822, datum := { row := ⟨1, {3, 5, 7, 9}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8762; core 30945; terminal 2600828
  { outputClauseIndex := 8762, coreClauseIndex := 30945, terminalClauseIndex := 2600828, datum := { row := ⟨1, {3, 5, 7, 10}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8763; core 30946; terminal 2600829
  { outputClauseIndex := 8763, coreClauseIndex := 30946, terminalClauseIndex := 2600829, datum := { row := ⟨1, {3, 5, 7, 10}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8765; core 30952; terminal 2600835
  { outputClauseIndex := 8765, coreClauseIndex := 30952, terminalClauseIndex := 2600835, datum := { row := ⟨1, {3, 5, 8, 9}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8766; core 30953; terminal 2600836
  { outputClauseIndex := 8766, coreClauseIndex := 30953, terminalClauseIndex := 2600836, datum := { row := ⟨1, {3, 5, 8, 9}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8767; core 30958; terminal 2600842
  { outputClauseIndex := 8767, coreClauseIndex := 30958, terminalClauseIndex := 2600842, datum := { row := ⟨1, {3, 5, 8, 10}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8768; core 30959; terminal 2600843
  { outputClauseIndex := 8768, coreClauseIndex := 30959, terminalClauseIndex := 2600843, datum := { row := ⟨1, {3, 5, 8, 10}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8770; core 30965; terminal 2600849
  { outputClauseIndex := 8770, coreClauseIndex := 30965, terminalClauseIndex := 2600849, datum := { row := ⟨1, {3, 5, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8771; core 30966; terminal 2600850
  { outputClauseIndex := 8771, coreClauseIndex := 30966, terminalClauseIndex := 2600850, datum := { row := ⟨1, {3, 5, 9, 10}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8773; core 30971; terminal 2600856
  { outputClauseIndex := 8773, coreClauseIndex := 30971, terminalClauseIndex := 2600856, datum := { row := ⟨1, {3, 6, 7, 8}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8774; core 30972; terminal 2600857
  { outputClauseIndex := 8774, coreClauseIndex := 30972, terminalClauseIndex := 2600857, datum := { row := ⟨1, {3, 6, 7, 8}⟩, arc := ⟨1, .right, {5, 6, 7, 8}⟩ } },
  -- compact 8776; core 30977; terminal 2600863
  { outputClauseIndex := 8776, coreClauseIndex := 30977, terminalClauseIndex := 2600863, datum := { row := ⟨1, {3, 6, 7, 9}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8777; core 30978; terminal 2600864
  { outputClauseIndex := 8777, coreClauseIndex := 30978, terminalClauseIndex := 2600864, datum := { row := ⟨1, {3, 6, 7, 9}⟩, arc := ⟨1, .right, {5, 6, 7, 8}⟩ } },
  -- compact 8779; core 30984; terminal 2600870
  { outputClauseIndex := 8779, coreClauseIndex := 30984, terminalClauseIndex := 2600870, datum := { row := ⟨1, {3, 6, 7, 10}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8780; core 30985; terminal 2600871
  { outputClauseIndex := 8780, coreClauseIndex := 30985, terminalClauseIndex := 2600871, datum := { row := ⟨1, {3, 6, 7, 10}⟩, arc := ⟨1, .right, {5, 6, 7, 8}⟩ } },
  -- compact 8782; core 30991; terminal 2600877
  { outputClauseIndex := 8782, coreClauseIndex := 30991, terminalClauseIndex := 2600877, datum := { row := ⟨1, {3, 6, 8, 9}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8783; core 30992; terminal 2600878
  { outputClauseIndex := 8783, coreClauseIndex := 30992, terminalClauseIndex := 2600878, datum := { row := ⟨1, {3, 6, 8, 9}⟩, arc := ⟨1, .right, {5, 6, 7, 8}⟩ } },
  -- compact 8785; core 30998; terminal 2600884
  { outputClauseIndex := 8785, coreClauseIndex := 30998, terminalClauseIndex := 2600884, datum := { row := ⟨1, {3, 6, 8, 10}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8786; core 30999; terminal 2600885
  { outputClauseIndex := 8786, coreClauseIndex := 30999, terminalClauseIndex := 2600885, datum := { row := ⟨1, {3, 6, 8, 10}⟩, arc := ⟨1, .right, {5, 6, 7, 8}⟩ } },
  -- compact 8787; core 31004; terminal 2600891
  { outputClauseIndex := 8787, coreClauseIndex := 31004, terminalClauseIndex := 2600891, datum := { row := ⟨1, {3, 6, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8788; core 31005; terminal 2600892
  { outputClauseIndex := 8788, coreClauseIndex := 31005, terminalClauseIndex := 2600892, datum := { row := ⟨1, {3, 6, 9, 10}⟩, arc := ⟨1, .right, {5, 6, 7, 8}⟩ } },
  -- compact 8789; core 31010; terminal 2600898
  { outputClauseIndex := 8789, coreClauseIndex := 31010, terminalClauseIndex := 2600898, datum := { row := ⟨1, {3, 7, 8, 9}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8790; core 31015; terminal 2600905
  { outputClauseIndex := 8790, coreClauseIndex := 31015, terminalClauseIndex := 2600905, datum := { row := ⟨1, {3, 7, 8, 10}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8791; core 31020; terminal 2600912
  { outputClauseIndex := 8791, coreClauseIndex := 31020, terminalClauseIndex := 2600912, datum := { row := ⟨1, {3, 7, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8792; core 31025; terminal 2600919
  { outputClauseIndex := 8792, coreClauseIndex := 31025, terminalClauseIndex := 2600919, datum := { row := ⟨1, {3, 8, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8793; core 31029; terminal 2600927
  { outputClauseIndex := 8793, coreClauseIndex := 31029, terminalClauseIndex := 2600927, datum := { row := ⟨1, {4, 5, 6, 7}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8794; core 31033; terminal 2600934
  { outputClauseIndex := 8794, coreClauseIndex := 31033, terminalClauseIndex := 2600934, datum := { row := ⟨1, {4, 5, 6, 8}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8795; core 31037; terminal 2600941
  { outputClauseIndex := 8795, coreClauseIndex := 31037, terminalClauseIndex := 2600941, datum := { row := ⟨1, {4, 5, 6, 9}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8796; core 31041; terminal 2600948
  { outputClauseIndex := 8796, coreClauseIndex := 31041, terminalClauseIndex := 2600948, datum := { row := ⟨1, {4, 5, 6, 10}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8797; core 31045; terminal 2600954
  { outputClauseIndex := 8797, coreClauseIndex := 31045, terminalClauseIndex := 2600954, datum := { row := ⟨1, {4, 5, 7, 8}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8798; core 31046; terminal 2600955
  { outputClauseIndex := 8798, coreClauseIndex := 31046, terminalClauseIndex := 2600955, datum := { row := ⟨1, {4, 5, 7, 8}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8799; core 31051; terminal 2600961
  { outputClauseIndex := 8799, coreClauseIndex := 31051, terminalClauseIndex := 2600961, datum := { row := ⟨1, {4, 5, 7, 9}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8800; core 31052; terminal 2600962
  { outputClauseIndex := 8800, coreClauseIndex := 31052, terminalClauseIndex := 2600962, datum := { row := ⟨1, {4, 5, 7, 9}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8801; core 31057; terminal 2600968
  { outputClauseIndex := 8801, coreClauseIndex := 31057, terminalClauseIndex := 2600968, datum := { row := ⟨1, {4, 5, 7, 10}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8802; core 31058; terminal 2600969
  { outputClauseIndex := 8802, coreClauseIndex := 31058, terminalClauseIndex := 2600969, datum := { row := ⟨1, {4, 5, 7, 10}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8803; core 31063; terminal 2600975
  { outputClauseIndex := 8803, coreClauseIndex := 31063, terminalClauseIndex := 2600975, datum := { row := ⟨1, {4, 5, 8, 9}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8804; core 31064; terminal 2600976
  { outputClauseIndex := 8804, coreClauseIndex := 31064, terminalClauseIndex := 2600976, datum := { row := ⟨1, {4, 5, 8, 9}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8805; core 31069; terminal 2600982
  { outputClauseIndex := 8805, coreClauseIndex := 31069, terminalClauseIndex := 2600982, datum := { row := ⟨1, {4, 5, 8, 10}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8806; core 31070; terminal 2600983
  { outputClauseIndex := 8806, coreClauseIndex := 31070, terminalClauseIndex := 2600983, datum := { row := ⟨1, {4, 5, 8, 10}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8808; core 31076; terminal 2600989
  { outputClauseIndex := 8808, coreClauseIndex := 31076, terminalClauseIndex := 2600989, datum := { row := ⟨1, {4, 5, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8809; core 31077; terminal 2600990
  { outputClauseIndex := 8809, coreClauseIndex := 31077, terminalClauseIndex := 2600990, datum := { row := ⟨1, {4, 5, 9, 10}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8810; core 31081; terminal 2600996
  { outputClauseIndex := 8810, coreClauseIndex := 31081, terminalClauseIndex := 2600996, datum := { row := ⟨1, {4, 6, 7, 8}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8811; core 31082; terminal 2600997
  { outputClauseIndex := 8811, coreClauseIndex := 31082, terminalClauseIndex := 2600997, datum := { row := ⟨1, {4, 6, 7, 8}⟩, arc := ⟨1, .right, {5, 6, 7, 8}⟩ } },
  -- compact 8812; core 31087; terminal 2601003
  { outputClauseIndex := 8812, coreClauseIndex := 31087, terminalClauseIndex := 2601003, datum := { row := ⟨1, {4, 6, 7, 9}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8813; core 31088; terminal 2601004
  { outputClauseIndex := 8813, coreClauseIndex := 31088, terminalClauseIndex := 2601004, datum := { row := ⟨1, {4, 6, 7, 9}⟩, arc := ⟨1, .right, {5, 6, 7, 8}⟩ } },
  -- compact 8814; core 31093; terminal 2601010
  { outputClauseIndex := 8814, coreClauseIndex := 31093, terminalClauseIndex := 2601010, datum := { row := ⟨1, {4, 6, 7, 10}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8815; core 31094; terminal 2601011
  { outputClauseIndex := 8815, coreClauseIndex := 31094, terminalClauseIndex := 2601011, datum := { row := ⟨1, {4, 6, 7, 10}⟩, arc := ⟨1, .right, {5, 6, 7, 8}⟩ } },
  -- compact 8816; core 31099; terminal 2601017
  { outputClauseIndex := 8816, coreClauseIndex := 31099, terminalClauseIndex := 2601017, datum := { row := ⟨1, {4, 6, 8, 9}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8817; core 31100; terminal 2601018
  { outputClauseIndex := 8817, coreClauseIndex := 31100, terminalClauseIndex := 2601018, datum := { row := ⟨1, {4, 6, 8, 9}⟩, arc := ⟨1, .right, {5, 6, 7, 8}⟩ } },
  -- compact 8818; core 31105; terminal 2601024
  { outputClauseIndex := 8818, coreClauseIndex := 31105, terminalClauseIndex := 2601024, datum := { row := ⟨1, {4, 6, 8, 10}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8819; core 31106; terminal 2601025
  { outputClauseIndex := 8819, coreClauseIndex := 31106, terminalClauseIndex := 2601025, datum := { row := ⟨1, {4, 6, 8, 10}⟩, arc := ⟨1, .right, {5, 6, 7, 8}⟩ } },
  -- compact 8821; core 31112; terminal 2601031
  { outputClauseIndex := 8821, coreClauseIndex := 31112, terminalClauseIndex := 2601031, datum := { row := ⟨1, {4, 6, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8822; core 31113; terminal 2601032
  { outputClauseIndex := 8822, coreClauseIndex := 31113, terminalClauseIndex := 2601032, datum := { row := ⟨1, {4, 6, 9, 10}⟩, arc := ⟨1, .right, {5, 6, 7, 8}⟩ } },
  -- compact 8823; core 31118; terminal 2601038
  { outputClauseIndex := 8823, coreClauseIndex := 31118, terminalClauseIndex := 2601038, datum := { row := ⟨1, {4, 7, 8, 9}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8824; core 31123; terminal 2601045
  { outputClauseIndex := 8824, coreClauseIndex := 31123, terminalClauseIndex := 2601045, datum := { row := ⟨1, {4, 7, 8, 10}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8826; core 31129; terminal 2601052
  { outputClauseIndex := 8826, coreClauseIndex := 31129, terminalClauseIndex := 2601052, datum := { row := ⟨1, {4, 7, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8827; core 31134; terminal 2601059
  { outputClauseIndex := 8827, coreClauseIndex := 31134, terminalClauseIndex := 2601059, datum := { row := ⟨1, {4, 8, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8828; core 31138; terminal 2601066
  { outputClauseIndex := 8828, coreClauseIndex := 31138, terminalClauseIndex := 2601066, datum := { row := ⟨1, {5, 6, 7, 8}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8829; core 31142; terminal 2601073
  { outputClauseIndex := 8829, coreClauseIndex := 31142, terminalClauseIndex := 2601073, datum := { row := ⟨1, {5, 6, 7, 9}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8830; core 31146; terminal 2601080
  { outputClauseIndex := 8830, coreClauseIndex := 31146, terminalClauseIndex := 2601080, datum := { row := ⟨1, {5, 6, 7, 10}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8831; core 31150; terminal 2601087
  { outputClauseIndex := 8831, coreClauseIndex := 31150, terminalClauseIndex := 2601087, datum := { row := ⟨1, {5, 6, 8, 9}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8832; core 31154; terminal 2601094
  { outputClauseIndex := 8832, coreClauseIndex := 31154, terminalClauseIndex := 2601094, datum := { row := ⟨1, {5, 6, 8, 10}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8833; core 31158; terminal 2601101
  { outputClauseIndex := 8833, coreClauseIndex := 31158, terminalClauseIndex := 2601101, datum := { row := ⟨1, {5, 6, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8834; core 31163; terminal 2601108
  { outputClauseIndex := 8834, coreClauseIndex := 31163, terminalClauseIndex := 2601108, datum := { row := ⟨1, {5, 7, 8, 9}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8835; core 31168; terminal 2601115
  { outputClauseIndex := 8835, coreClauseIndex := 31168, terminalClauseIndex := 2601115, datum := { row := ⟨1, {5, 7, 8, 10}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8836; core 31173; terminal 2601122
  { outputClauseIndex := 8836, coreClauseIndex := 31173, terminalClauseIndex := 2601122, datum := { row := ⟨1, {5, 7, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8837; core 31178; terminal 2601129
  { outputClauseIndex := 8837, coreClauseIndex := 31178, terminalClauseIndex := 2601129, datum := { row := ⟨1, {5, 8, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8838; core 31183; terminal 2601136
  { outputClauseIndex := 8838, coreClauseIndex := 31183, terminalClauseIndex := 2601136, datum := { row := ⟨1, {6, 7, 8, 9}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8839; core 31188; terminal 2601143
  { outputClauseIndex := 8839, coreClauseIndex := 31188, terminalClauseIndex := 2601143, datum := { row := ⟨1, {6, 7, 8, 10}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8840; core 31193; terminal 2601150
  { outputClauseIndex := 8840, coreClauseIndex := 31193, terminalClauseIndex := 2601150, datum := { row := ⟨1, {6, 7, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8841; core 31198; terminal 2601157
  { outputClauseIndex := 8841, coreClauseIndex := 31198, terminalClauseIndex := 2601157, datum := { row := ⟨1, {6, 8, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8842; core 31202; terminal 2601164
  { outputClauseIndex := 8842, coreClauseIndex := 31202, terminalClauseIndex := 2601164, datum := { row := ⟨1, {7, 8, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8843; core 31211; terminal 2601179
  { outputClauseIndex := 8843, coreClauseIndex := 31211, terminalClauseIndex := 2601179, datum := { row := ⟨2, {0, 1, 3, 5}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 8844; core 31216; terminal 2601186
  { outputClauseIndex := 8844, coreClauseIndex := 31216, terminalClauseIndex := 2601186, datum := { row := ⟨2, {0, 1, 3, 6}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 8845; core 31221; terminal 2601193
  { outputClauseIndex := 8845, coreClauseIndex := 31221, terminalClauseIndex := 2601193, datum := { row := ⟨2, {0, 1, 3, 7}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 8846; core 31226; terminal 2601200
  { outputClauseIndex := 8846, coreClauseIndex := 31226, terminalClauseIndex := 2601200, datum := { row := ⟨2, {0, 1, 3, 8}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 8847; core 31231; terminal 2601207
  { outputClauseIndex := 8847, coreClauseIndex := 31231, terminalClauseIndex := 2601207, datum := { row := ⟨2, {0, 1, 3, 9}⟩, arc := ⟨2, .right, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 8848; core 31235; terminal 2601213
  { outputClauseIndex := 8848, coreClauseIndex := 31235, terminalClauseIndex := 2601213, datum := { row := ⟨2, {0, 1, 3, 10}⟩, arc := ⟨2, .left, {9}⟩ } },
  -- compact 8849; core 31236; terminal 2601214
  { outputClauseIndex := 8849, coreClauseIndex := 31236, terminalClauseIndex := 2601214, datum := { row := ⟨2, {0, 1, 3, 10}⟩, arc := ⟨2, .right, {1, 2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 8850; core 31241; terminal 2601221
  { outputClauseIndex := 8850, coreClauseIndex := 31241, terminalClauseIndex := 2601221, datum := { row := ⟨2, {0, 1, 4, 5}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 8851; core 31246; terminal 2601228
  { outputClauseIndex := 8851, coreClauseIndex := 31246, terminalClauseIndex := 2601228, datum := { row := ⟨2, {0, 1, 4, 6}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 8852; core 31251; terminal 2601235
  { outputClauseIndex := 8852, coreClauseIndex := 31251, terminalClauseIndex := 2601235, datum := { row := ⟨2, {0, 1, 4, 7}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 8853; core 31256; terminal 2601242
  { outputClauseIndex := 8853, coreClauseIndex := 31256, terminalClauseIndex := 2601242, datum := { row := ⟨2, {0, 1, 4, 8}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 8854; core 31261; terminal 2601249
  { outputClauseIndex := 8854, coreClauseIndex := 31261, terminalClauseIndex := 2601249, datum := { row := ⟨2, {0, 1, 4, 9}⟩, arc := ⟨2, .right, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 8855; core 31265; terminal 2601255
  { outputClauseIndex := 8855, coreClauseIndex := 31265, terminalClauseIndex := 2601255, datum := { row := ⟨2, {0, 1, 4, 10}⟩, arc := ⟨2, .left, {9}⟩ } },
  -- compact 8856; core 31266; terminal 2601256
  { outputClauseIndex := 8856, coreClauseIndex := 31266, terminalClauseIndex := 2601256, datum := { row := ⟨2, {0, 1, 4, 10}⟩, arc := ⟨2, .right, {1, 2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 8857; core 31271; terminal 2601262
  { outputClauseIndex := 8857, coreClauseIndex := 31271, terminalClauseIndex := 2601262, datum := { row := ⟨2, {0, 1, 5, 6}⟩, arc := ⟨2, .left, {9}⟩ } },
  -- compact 8859; core 31277; terminal 2601269
  { outputClauseIndex := 8859, coreClauseIndex := 31277, terminalClauseIndex := 2601269, datum := { row := ⟨2, {0, 1, 5, 7}⟩, arc := ⟨2, .left, {9}⟩ } },
  -- compact 8860; core 31278; terminal 2601270
  { outputClauseIndex := 8860, coreClauseIndex := 31278, terminalClauseIndex := 2601270, datum := { row := ⟨2, {0, 1, 5, 7}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 8862; core 31284; terminal 2601276
  { outputClauseIndex := 8862, coreClauseIndex := 31284, terminalClauseIndex := 2601276, datum := { row := ⟨2, {0, 1, 5, 8}⟩, arc := ⟨2, .left, {9}⟩ } },
  -- compact 8863; core 31285; terminal 2601277
  { outputClauseIndex := 8863, coreClauseIndex := 31285, terminalClauseIndex := 2601277, datum := { row := ⟨2, {0, 1, 5, 8}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 8865; core 31291; terminal 2601283
  { outputClauseIndex := 8865, coreClauseIndex := 31291, terminalClauseIndex := 2601283, datum := { row := ⟨2, {0, 1, 5, 9}⟩, arc := ⟨2, .left, {9}⟩ } },
  -- compact 8866; core 31292; terminal 2601284
  { outputClauseIndex := 8866, coreClauseIndex := 31292, terminalClauseIndex := 2601284, datum := { row := ⟨2, {0, 1, 5, 9}⟩, arc := ⟨2, .right, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 8868; core 31297; terminal 2601290
  { outputClauseIndex := 8868, coreClauseIndex := 31297, terminalClauseIndex := 2601290, datum := { row := ⟨2, {0, 1, 5, 10}⟩, arc := ⟨2, .left, {9}⟩ } },
  -- compact 8869; core 31298; terminal 2601291
  { outputClauseIndex := 8869, coreClauseIndex := 31298, terminalClauseIndex := 2601291, datum := { row := ⟨2, {0, 1, 5, 10}⟩, arc := ⟨2, .right, {1, 2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 8871; core 31304; terminal 2601297
  { outputClauseIndex := 8871, coreClauseIndex := 31304, terminalClauseIndex := 2601297, datum := { row := ⟨2, {0, 1, 6, 7}⟩, arc := ⟨2, .left, {9}⟩ } },
  -- compact 8872; core 31305; terminal 2601298
  { outputClauseIndex := 8872, coreClauseIndex := 31305, terminalClauseIndex := 2601298, datum := { row := ⟨2, {0, 1, 6, 7}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 8874; core 31311; terminal 2601304
  { outputClauseIndex := 8874, coreClauseIndex := 31311, terminalClauseIndex := 2601304, datum := { row := ⟨2, {0, 1, 6, 8}⟩, arc := ⟨2, .left, {9}⟩ } },
  -- compact 8875; core 31312; terminal 2601305
  { outputClauseIndex := 8875, coreClauseIndex := 31312, terminalClauseIndex := 2601305, datum := { row := ⟨2, {0, 1, 6, 8}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 8877; core 31318; terminal 2601311
  { outputClauseIndex := 8877, coreClauseIndex := 31318, terminalClauseIndex := 2601311, datum := { row := ⟨2, {0, 1, 6, 9}⟩, arc := ⟨2, .left, {9}⟩ } },
  -- compact 8878; core 31319; terminal 2601312
  { outputClauseIndex := 8878, coreClauseIndex := 31319, terminalClauseIndex := 2601312, datum := { row := ⟨2, {0, 1, 6, 9}⟩, arc := ⟨2, .right, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 8880; core 31324; terminal 2601318
  { outputClauseIndex := 8880, coreClauseIndex := 31324, terminalClauseIndex := 2601318, datum := { row := ⟨2, {0, 1, 6, 10}⟩, arc := ⟨2, .left, {9}⟩ } },
  -- compact 8881; core 31325; terminal 2601319
  { outputClauseIndex := 8881, coreClauseIndex := 31325, terminalClauseIndex := 2601319, datum := { row := ⟨2, {0, 1, 6, 10}⟩, arc := ⟨2, .right, {1, 2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 8883; core 31331; terminal 2601325
  { outputClauseIndex := 8883, coreClauseIndex := 31331, terminalClauseIndex := 2601325, datum := { row := ⟨2, {0, 1, 7, 8}⟩, arc := ⟨2, .left, {9}⟩ } },
  -- compact 8884; core 31332; terminal 2601326
  { outputClauseIndex := 8884, coreClauseIndex := 31332, terminalClauseIndex := 2601326, datum := { row := ⟨2, {0, 1, 7, 8}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 8886; core 31338; terminal 2601332
  { outputClauseIndex := 8886, coreClauseIndex := 31338, terminalClauseIndex := 2601332, datum := { row := ⟨2, {0, 1, 7, 9}⟩, arc := ⟨2, .left, {9}⟩ } },
  -- compact 8887; core 31339; terminal 2601333
  { outputClauseIndex := 8887, coreClauseIndex := 31339, terminalClauseIndex := 2601333, datum := { row := ⟨2, {0, 1, 7, 9}⟩, arc := ⟨2, .right, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 8889; core 31344; terminal 2601339
  { outputClauseIndex := 8889, coreClauseIndex := 31344, terminalClauseIndex := 2601339, datum := { row := ⟨2, {0, 1, 7, 10}⟩, arc := ⟨2, .left, {9}⟩ } },
  -- compact 8890; core 31345; terminal 2601340
  { outputClauseIndex := 8890, coreClauseIndex := 31345, terminalClauseIndex := 2601340, datum := { row := ⟨2, {0, 1, 7, 10}⟩, arc := ⟨2, .right, {1, 2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 8892; core 31351; terminal 2601346
  { outputClauseIndex := 8892, coreClauseIndex := 31351, terminalClauseIndex := 2601346, datum := { row := ⟨2, {0, 1, 8, 9}⟩, arc := ⟨2, .left, {9}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk002_batch_valid :
    directRowArcFiniteOccurrencesChunk002.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk002, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk002 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk002.map (·.datum)

theorem directRowArcFiniteDataChunk002_batch_valid :
    directRowArcFiniteDataChunk002.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk002, datum.Valid := by
  rw [directRowArcFiniteDataChunk002]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk002_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk002_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
