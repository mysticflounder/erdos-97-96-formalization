/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk009 : List DirectRowArcFiniteOccurrence := [
  -- compact 9986; core 34714; terminal 2605595
  { outputClauseIndex := 9986, coreClauseIndex := 34714, terminalClauseIndex := 2605595, datum := { row := ⟨5, {0, 1, 2, 6}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 9987; core 34715; terminal 2605596
  { outputClauseIndex := 9987, coreClauseIndex := 34715, terminalClauseIndex := 2605596, datum := { row := ⟨5, {0, 1, 2, 6}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 9989; core 34721; terminal 2605602
  { outputClauseIndex := 9989, coreClauseIndex := 34721, terminalClauseIndex := 2605602, datum := { row := ⟨5, {0, 1, 2, 7}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 9990; core 34722; terminal 2605603
  { outputClauseIndex := 9990, coreClauseIndex := 34722, terminalClauseIndex := 2605603, datum := { row := ⟨5, {0, 1, 2, 7}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 9992; core 34728; terminal 2605609
  { outputClauseIndex := 9992, coreClauseIndex := 34728, terminalClauseIndex := 2605609, datum := { row := ⟨5, {0, 1, 2, 8}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 9993; core 34729; terminal 2605610
  { outputClauseIndex := 9993, coreClauseIndex := 34729, terminalClauseIndex := 2605610, datum := { row := ⟨5, {0, 1, 2, 8}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 9995; core 34735; terminal 2605616
  { outputClauseIndex := 9995, coreClauseIndex := 34735, terminalClauseIndex := 2605616, datum := { row := ⟨5, {0, 1, 2, 9}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 9996; core 34736; terminal 2605617
  { outputClauseIndex := 9996, coreClauseIndex := 34736, terminalClauseIndex := 2605617, datum := { row := ⟨5, {0, 1, 2, 9}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 9998; core 34742; terminal 2605623
  { outputClauseIndex := 9998, coreClauseIndex := 34742, terminalClauseIndex := 2605623, datum := { row := ⟨5, {0, 1, 2, 10}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 9999; core 34743; terminal 2605624
  { outputClauseIndex := 9999, coreClauseIndex := 34743, terminalClauseIndex := 2605624, datum := { row := ⟨5, {0, 1, 2, 10}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10001; core 34749; terminal 2605630
  { outputClauseIndex := 10001, coreClauseIndex := 34749, terminalClauseIndex := 2605630, datum := { row := ⟨5, {0, 1, 3, 4}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10003; core 34755; terminal 2605637
  { outputClauseIndex := 10003, coreClauseIndex := 34755, terminalClauseIndex := 2605637, datum := { row := ⟨5, {0, 1, 3, 6}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10004; core 34756; terminal 2605638
  { outputClauseIndex := 10004, coreClauseIndex := 34756, terminalClauseIndex := 2605638, datum := { row := ⟨5, {0, 1, 3, 6}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10006; core 34762; terminal 2605644
  { outputClauseIndex := 10006, coreClauseIndex := 34762, terminalClauseIndex := 2605644, datum := { row := ⟨5, {0, 1, 3, 7}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10007; core 34763; terminal 2605645
  { outputClauseIndex := 10007, coreClauseIndex := 34763, terminalClauseIndex := 2605645, datum := { row := ⟨5, {0, 1, 3, 7}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10009; core 34769; terminal 2605651
  { outputClauseIndex := 10009, coreClauseIndex := 34769, terminalClauseIndex := 2605651, datum := { row := ⟨5, {0, 1, 3, 8}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10010; core 34770; terminal 2605652
  { outputClauseIndex := 10010, coreClauseIndex := 34770, terminalClauseIndex := 2605652, datum := { row := ⟨5, {0, 1, 3, 8}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10012; core 34776; terminal 2605658
  { outputClauseIndex := 10012, coreClauseIndex := 34776, terminalClauseIndex := 2605658, datum := { row := ⟨5, {0, 1, 3, 9}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10013; core 34777; terminal 2605659
  { outputClauseIndex := 10013, coreClauseIndex := 34777, terminalClauseIndex := 2605659, datum := { row := ⟨5, {0, 1, 3, 9}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10015; core 34783; terminal 2605665
  { outputClauseIndex := 10015, coreClauseIndex := 34783, terminalClauseIndex := 2605665, datum := { row := ⟨5, {0, 1, 3, 10}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10016; core 34784; terminal 2605666
  { outputClauseIndex := 10016, coreClauseIndex := 34784, terminalClauseIndex := 2605666, datum := { row := ⟨5, {0, 1, 3, 10}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10018; core 34790; terminal 2605672
  { outputClauseIndex := 10018, coreClauseIndex := 34790, terminalClauseIndex := 2605672, datum := { row := ⟨5, {0, 1, 4, 6}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10019; core 34791; terminal 2605673
  { outputClauseIndex := 10019, coreClauseIndex := 34791, terminalClauseIndex := 2605673, datum := { row := ⟨5, {0, 1, 4, 6}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10021; core 34797; terminal 2605679
  { outputClauseIndex := 10021, coreClauseIndex := 34797, terminalClauseIndex := 2605679, datum := { row := ⟨5, {0, 1, 4, 7}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10022; core 34798; terminal 2605680
  { outputClauseIndex := 10022, coreClauseIndex := 34798, terminalClauseIndex := 2605680, datum := { row := ⟨5, {0, 1, 4, 7}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10024; core 34804; terminal 2605686
  { outputClauseIndex := 10024, coreClauseIndex := 34804, terminalClauseIndex := 2605686, datum := { row := ⟨5, {0, 1, 4, 8}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10025; core 34805; terminal 2605687
  { outputClauseIndex := 10025, coreClauseIndex := 34805, terminalClauseIndex := 2605687, datum := { row := ⟨5, {0, 1, 4, 8}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10027; core 34811; terminal 2605693
  { outputClauseIndex := 10027, coreClauseIndex := 34811, terminalClauseIndex := 2605693, datum := { row := ⟨5, {0, 1, 4, 9}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10028; core 34812; terminal 2605694
  { outputClauseIndex := 10028, coreClauseIndex := 34812, terminalClauseIndex := 2605694, datum := { row := ⟨5, {0, 1, 4, 9}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10030; core 34818; terminal 2605700
  { outputClauseIndex := 10030, coreClauseIndex := 34818, terminalClauseIndex := 2605700, datum := { row := ⟨5, {0, 1, 4, 10}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10031; core 34819; terminal 2605701
  { outputClauseIndex := 10031, coreClauseIndex := 34819, terminalClauseIndex := 2605701, datum := { row := ⟨5, {0, 1, 4, 10}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10033; core 34825; terminal 2605707
  { outputClauseIndex := 10033, coreClauseIndex := 34825, terminalClauseIndex := 2605707, datum := { row := ⟨5, {0, 1, 6, 7}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10034; core 34826; terminal 2605708
  { outputClauseIndex := 10034, coreClauseIndex := 34826, terminalClauseIndex := 2605708, datum := { row := ⟨5, {0, 1, 6, 7}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10036; core 34832; terminal 2605714
  { outputClauseIndex := 10036, coreClauseIndex := 34832, terminalClauseIndex := 2605714, datum := { row := ⟨5, {0, 1, 6, 8}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10037; core 34833; terminal 2605715
  { outputClauseIndex := 10037, coreClauseIndex := 34833, terminalClauseIndex := 2605715, datum := { row := ⟨5, {0, 1, 6, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10039; core 34839; terminal 2605721
  { outputClauseIndex := 10039, coreClauseIndex := 34839, terminalClauseIndex := 2605721, datum := { row := ⟨5, {0, 1, 6, 9}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10040; core 34840; terminal 2605722
  { outputClauseIndex := 10040, coreClauseIndex := 34840, terminalClauseIndex := 2605722, datum := { row := ⟨5, {0, 1, 6, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10042; core 34846; terminal 2605728
  { outputClauseIndex := 10042, coreClauseIndex := 34846, terminalClauseIndex := 2605728, datum := { row := ⟨5, {0, 1, 6, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10043; core 34847; terminal 2605729
  { outputClauseIndex := 10043, coreClauseIndex := 34847, terminalClauseIndex := 2605729, datum := { row := ⟨5, {0, 1, 6, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10045; core 34853; terminal 2605735
  { outputClauseIndex := 10045, coreClauseIndex := 34853, terminalClauseIndex := 2605735, datum := { row := ⟨5, {0, 1, 7, 8}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10046; core 34854; terminal 2605736
  { outputClauseIndex := 10046, coreClauseIndex := 34854, terminalClauseIndex := 2605736, datum := { row := ⟨5, {0, 1, 7, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10048; core 34860; terminal 2605742
  { outputClauseIndex := 10048, coreClauseIndex := 34860, terminalClauseIndex := 2605742, datum := { row := ⟨5, {0, 1, 7, 9}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10049; core 34861; terminal 2605743
  { outputClauseIndex := 10049, coreClauseIndex := 34861, terminalClauseIndex := 2605743, datum := { row := ⟨5, {0, 1, 7, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10051; core 34867; terminal 2605749
  { outputClauseIndex := 10051, coreClauseIndex := 34867, terminalClauseIndex := 2605749, datum := { row := ⟨5, {0, 1, 7, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10052; core 34868; terminal 2605750
  { outputClauseIndex := 10052, coreClauseIndex := 34868, terminalClauseIndex := 2605750, datum := { row := ⟨5, {0, 1, 7, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10054; core 34874; terminal 2605756
  { outputClauseIndex := 10054, coreClauseIndex := 34874, terminalClauseIndex := 2605756, datum := { row := ⟨5, {0, 1, 8, 9}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10055; core 34875; terminal 2605757
  { outputClauseIndex := 10055, coreClauseIndex := 34875, terminalClauseIndex := 2605757, datum := { row := ⟨5, {0, 1, 8, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10057; core 34881; terminal 2605763
  { outputClauseIndex := 10057, coreClauseIndex := 34881, terminalClauseIndex := 2605763, datum := { row := ⟨5, {0, 1, 8, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10058; core 34882; terminal 2605764
  { outputClauseIndex := 10058, coreClauseIndex := 34882, terminalClauseIndex := 2605764, datum := { row := ⟨5, {0, 1, 8, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10060; core 34888; terminal 2605770
  { outputClauseIndex := 10060, coreClauseIndex := 34888, terminalClauseIndex := 2605770, datum := { row := ⟨5, {0, 1, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10061; core 34889; terminal 2605771
  { outputClauseIndex := 10061, coreClauseIndex := 34889, terminalClauseIndex := 2605771, datum := { row := ⟨5, {0, 1, 9, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10063; core 34895; terminal 2605777
  { outputClauseIndex := 10063, coreClauseIndex := 34895, terminalClauseIndex := 2605777, datum := { row := ⟨5, {0, 2, 3, 4}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10064; core 34896; terminal 2605778
  { outputClauseIndex := 10064, coreClauseIndex := 34896, terminalClauseIndex := 2605778, datum := { row := ⟨5, {0, 2, 3, 4}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4, 9, 10}⟩ } },
  -- compact 10066; core 34902; terminal 2605784
  { outputClauseIndex := 10066, coreClauseIndex := 34902, terminalClauseIndex := 2605784, datum := { row := ⟨5, {0, 2, 3, 6}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10067; core 34903; terminal 2605785
  { outputClauseIndex := 10067, coreClauseIndex := 34903, terminalClauseIndex := 2605785, datum := { row := ⟨5, {0, 2, 3, 6}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10069; core 34909; terminal 2605791
  { outputClauseIndex := 10069, coreClauseIndex := 34909, terminalClauseIndex := 2605791, datum := { row := ⟨5, {0, 2, 3, 7}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10070; core 34910; terminal 2605792
  { outputClauseIndex := 10070, coreClauseIndex := 34910, terminalClauseIndex := 2605792, datum := { row := ⟨5, {0, 2, 3, 7}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10072; core 34916; terminal 2605798
  { outputClauseIndex := 10072, coreClauseIndex := 34916, terminalClauseIndex := 2605798, datum := { row := ⟨5, {0, 2, 3, 8}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10073; core 34917; terminal 2605799
  { outputClauseIndex := 10073, coreClauseIndex := 34917, terminalClauseIndex := 2605799, datum := { row := ⟨5, {0, 2, 3, 8}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10075; core 34923; terminal 2605805
  { outputClauseIndex := 10075, coreClauseIndex := 34923, terminalClauseIndex := 2605805, datum := { row := ⟨5, {0, 2, 3, 9}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10076; core 34924; terminal 2605806
  { outputClauseIndex := 10076, coreClauseIndex := 34924, terminalClauseIndex := 2605806, datum := { row := ⟨5, {0, 2, 3, 9}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10078; core 34930; terminal 2605812
  { outputClauseIndex := 10078, coreClauseIndex := 34930, terminalClauseIndex := 2605812, datum := { row := ⟨5, {0, 2, 3, 10}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10079; core 34931; terminal 2605813
  { outputClauseIndex := 10079, coreClauseIndex := 34931, terminalClauseIndex := 2605813, datum := { row := ⟨5, {0, 2, 3, 10}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10081; core 34937; terminal 2605819
  { outputClauseIndex := 10081, coreClauseIndex := 34937, terminalClauseIndex := 2605819, datum := { row := ⟨5, {0, 2, 4, 6}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10082; core 34938; terminal 2605820
  { outputClauseIndex := 10082, coreClauseIndex := 34938, terminalClauseIndex := 2605820, datum := { row := ⟨5, {0, 2, 4, 6}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10084; core 34944; terminal 2605826
  { outputClauseIndex := 10084, coreClauseIndex := 34944, terminalClauseIndex := 2605826, datum := { row := ⟨5, {0, 2, 4, 7}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10085; core 34945; terminal 2605827
  { outputClauseIndex := 10085, coreClauseIndex := 34945, terminalClauseIndex := 2605827, datum := { row := ⟨5, {0, 2, 4, 7}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10087; core 34951; terminal 2605833
  { outputClauseIndex := 10087, coreClauseIndex := 34951, terminalClauseIndex := 2605833, datum := { row := ⟨5, {0, 2, 4, 8}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10088; core 34952; terminal 2605834
  { outputClauseIndex := 10088, coreClauseIndex := 34952, terminalClauseIndex := 2605834, datum := { row := ⟨5, {0, 2, 4, 8}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10090; core 34958; terminal 2605840
  { outputClauseIndex := 10090, coreClauseIndex := 34958, terminalClauseIndex := 2605840, datum := { row := ⟨5, {0, 2, 4, 9}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10091; core 34959; terminal 2605841
  { outputClauseIndex := 10091, coreClauseIndex := 34959, terminalClauseIndex := 2605841, datum := { row := ⟨5, {0, 2, 4, 9}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10093; core 34965; terminal 2605847
  { outputClauseIndex := 10093, coreClauseIndex := 34965, terminalClauseIndex := 2605847, datum := { row := ⟨5, {0, 2, 4, 10}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10094; core 34966; terminal 2605848
  { outputClauseIndex := 10094, coreClauseIndex := 34966, terminalClauseIndex := 2605848, datum := { row := ⟨5, {0, 2, 4, 10}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10096; core 34972; terminal 2605854
  { outputClauseIndex := 10096, coreClauseIndex := 34972, terminalClauseIndex := 2605854, datum := { row := ⟨5, {0, 2, 6, 7}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10097; core 34973; terminal 2605855
  { outputClauseIndex := 10097, coreClauseIndex := 34973, terminalClauseIndex := 2605855, datum := { row := ⟨5, {0, 2, 6, 7}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10099; core 34979; terminal 2605861
  { outputClauseIndex := 10099, coreClauseIndex := 34979, terminalClauseIndex := 2605861, datum := { row := ⟨5, {0, 2, 6, 8}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10100; core 34980; terminal 2605862
  { outputClauseIndex := 10100, coreClauseIndex := 34980, terminalClauseIndex := 2605862, datum := { row := ⟨5, {0, 2, 6, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10102; core 34986; terminal 2605868
  { outputClauseIndex := 10102, coreClauseIndex := 34986, terminalClauseIndex := 2605868, datum := { row := ⟨5, {0, 2, 6, 9}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10103; core 34987; terminal 2605869
  { outputClauseIndex := 10103, coreClauseIndex := 34987, terminalClauseIndex := 2605869, datum := { row := ⟨5, {0, 2, 6, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10105; core 34993; terminal 2605875
  { outputClauseIndex := 10105, coreClauseIndex := 34993, terminalClauseIndex := 2605875, datum := { row := ⟨5, {0, 2, 6, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10106; core 34994; terminal 2605876
  { outputClauseIndex := 10106, coreClauseIndex := 34994, terminalClauseIndex := 2605876, datum := { row := ⟨5, {0, 2, 6, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10108; core 35000; terminal 2605882
  { outputClauseIndex := 10108, coreClauseIndex := 35000, terminalClauseIndex := 2605882, datum := { row := ⟨5, {0, 2, 7, 8}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10109; core 35001; terminal 2605883
  { outputClauseIndex := 10109, coreClauseIndex := 35001, terminalClauseIndex := 2605883, datum := { row := ⟨5, {0, 2, 7, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10111; core 35007; terminal 2605889
  { outputClauseIndex := 10111, coreClauseIndex := 35007, terminalClauseIndex := 2605889, datum := { row := ⟨5, {0, 2, 7, 9}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10112; core 35008; terminal 2605890
  { outputClauseIndex := 10112, coreClauseIndex := 35008, terminalClauseIndex := 2605890, datum := { row := ⟨5, {0, 2, 7, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10114; core 35014; terminal 2605896
  { outputClauseIndex := 10114, coreClauseIndex := 35014, terminalClauseIndex := 2605896, datum := { row := ⟨5, {0, 2, 7, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10115; core 35015; terminal 2605897
  { outputClauseIndex := 10115, coreClauseIndex := 35015, terminalClauseIndex := 2605897, datum := { row := ⟨5, {0, 2, 7, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10117; core 35021; terminal 2605903
  { outputClauseIndex := 10117, coreClauseIndex := 35021, terminalClauseIndex := 2605903, datum := { row := ⟨5, {0, 2, 8, 9}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10118; core 35022; terminal 2605904
  { outputClauseIndex := 10118, coreClauseIndex := 35022, terminalClauseIndex := 2605904, datum := { row := ⟨5, {0, 2, 8, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10120; core 35028; terminal 2605910
  { outputClauseIndex := 10120, coreClauseIndex := 35028, terminalClauseIndex := 2605910, datum := { row := ⟨5, {0, 2, 8, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10121; core 35029; terminal 2605911
  { outputClauseIndex := 10121, coreClauseIndex := 35029, terminalClauseIndex := 2605911, datum := { row := ⟨5, {0, 2, 8, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10123; core 35035; terminal 2605917
  { outputClauseIndex := 10123, coreClauseIndex := 35035, terminalClauseIndex := 2605917, datum := { row := ⟨5, {0, 2, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10124; core 35036; terminal 2605918
  { outputClauseIndex := 10124, coreClauseIndex := 35036, terminalClauseIndex := 2605918, datum := { row := ⟨5, {0, 2, 9, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10126; core 35042; terminal 2605924
  { outputClauseIndex := 10126, coreClauseIndex := 35042, terminalClauseIndex := 2605924, datum := { row := ⟨5, {0, 3, 4, 6}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10127; core 35043; terminal 2605925
  { outputClauseIndex := 10127, coreClauseIndex := 35043, terminalClauseIndex := 2605925, datum := { row := ⟨5, {0, 3, 4, 6}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10129; core 35049; terminal 2605931
  { outputClauseIndex := 10129, coreClauseIndex := 35049, terminalClauseIndex := 2605931, datum := { row := ⟨5, {0, 3, 4, 7}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10130; core 35050; terminal 2605932
  { outputClauseIndex := 10130, coreClauseIndex := 35050, terminalClauseIndex := 2605932, datum := { row := ⟨5, {0, 3, 4, 7}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10132; core 35056; terminal 2605938
  { outputClauseIndex := 10132, coreClauseIndex := 35056, terminalClauseIndex := 2605938, datum := { row := ⟨5, {0, 3, 4, 8}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10133; core 35057; terminal 2605939
  { outputClauseIndex := 10133, coreClauseIndex := 35057, terminalClauseIndex := 2605939, datum := { row := ⟨5, {0, 3, 4, 8}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10135; core 35063; terminal 2605945
  { outputClauseIndex := 10135, coreClauseIndex := 35063, terminalClauseIndex := 2605945, datum := { row := ⟨5, {0, 3, 4, 9}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10136; core 35064; terminal 2605946
  { outputClauseIndex := 10136, coreClauseIndex := 35064, terminalClauseIndex := 2605946, datum := { row := ⟨5, {0, 3, 4, 9}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10138; core 35070; terminal 2605952
  { outputClauseIndex := 10138, coreClauseIndex := 35070, terminalClauseIndex := 2605952, datum := { row := ⟨5, {0, 3, 4, 10}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10139; core 35071; terminal 2605953
  { outputClauseIndex := 10139, coreClauseIndex := 35071, terminalClauseIndex := 2605953, datum := { row := ⟨5, {0, 3, 4, 10}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4}⟩ } },
  -- compact 10141; core 35077; terminal 2605959
  { outputClauseIndex := 10141, coreClauseIndex := 35077, terminalClauseIndex := 2605959, datum := { row := ⟨5, {0, 3, 6, 7}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10142; core 35078; terminal 2605960
  { outputClauseIndex := 10142, coreClauseIndex := 35078, terminalClauseIndex := 2605960, datum := { row := ⟨5, {0, 3, 6, 7}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10144; core 35084; terminal 2605966
  { outputClauseIndex := 10144, coreClauseIndex := 35084, terminalClauseIndex := 2605966, datum := { row := ⟨5, {0, 3, 6, 8}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10145; core 35085; terminal 2605967
  { outputClauseIndex := 10145, coreClauseIndex := 35085, terminalClauseIndex := 2605967, datum := { row := ⟨5, {0, 3, 6, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10147; core 35091; terminal 2605973
  { outputClauseIndex := 10147, coreClauseIndex := 35091, terminalClauseIndex := 2605973, datum := { row := ⟨5, {0, 3, 6, 9}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10148; core 35092; terminal 2605974
  { outputClauseIndex := 10148, coreClauseIndex := 35092, terminalClauseIndex := 2605974, datum := { row := ⟨5, {0, 3, 6, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10150; core 35098; terminal 2605980
  { outputClauseIndex := 10150, coreClauseIndex := 35098, terminalClauseIndex := 2605980, datum := { row := ⟨5, {0, 3, 6, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10151; core 35099; terminal 2605981
  { outputClauseIndex := 10151, coreClauseIndex := 35099, terminalClauseIndex := 2605981, datum := { row := ⟨5, {0, 3, 6, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10153; core 35105; terminal 2605987
  { outputClauseIndex := 10153, coreClauseIndex := 35105, terminalClauseIndex := 2605987, datum := { row := ⟨5, {0, 3, 7, 8}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10154; core 35106; terminal 2605988
  { outputClauseIndex := 10154, coreClauseIndex := 35106, terminalClauseIndex := 2605988, datum := { row := ⟨5, {0, 3, 7, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10156; core 35112; terminal 2605994
  { outputClauseIndex := 10156, coreClauseIndex := 35112, terminalClauseIndex := 2605994, datum := { row := ⟨5, {0, 3, 7, 9}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10157; core 35113; terminal 2605995
  { outputClauseIndex := 10157, coreClauseIndex := 35113, terminalClauseIndex := 2605995, datum := { row := ⟨5, {0, 3, 7, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10159; core 35119; terminal 2606001
  { outputClauseIndex := 10159, coreClauseIndex := 35119, terminalClauseIndex := 2606001, datum := { row := ⟨5, {0, 3, 7, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10160; core 35120; terminal 2606002
  { outputClauseIndex := 10160, coreClauseIndex := 35120, terminalClauseIndex := 2606002, datum := { row := ⟨5, {0, 3, 7, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10162; core 35126; terminal 2606008
  { outputClauseIndex := 10162, coreClauseIndex := 35126, terminalClauseIndex := 2606008, datum := { row := ⟨5, {0, 3, 8, 9}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10163; core 35127; terminal 2606009
  { outputClauseIndex := 10163, coreClauseIndex := 35127, terminalClauseIndex := 2606009, datum := { row := ⟨5, {0, 3, 8, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10165; core 35133; terminal 2606015
  { outputClauseIndex := 10165, coreClauseIndex := 35133, terminalClauseIndex := 2606015, datum := { row := ⟨5, {0, 3, 8, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10166; core 35134; terminal 2606016
  { outputClauseIndex := 10166, coreClauseIndex := 35134, terminalClauseIndex := 2606016, datum := { row := ⟨5, {0, 3, 8, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10168; core 35140; terminal 2606022
  { outputClauseIndex := 10168, coreClauseIndex := 35140, terminalClauseIndex := 2606022, datum := { row := ⟨5, {0, 3, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10169; core 35141; terminal 2606023
  { outputClauseIndex := 10169, coreClauseIndex := 35141, terminalClauseIndex := 2606023, datum := { row := ⟨5, {0, 3, 9, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10170; core 35146; terminal 2606029
  { outputClauseIndex := 10170, coreClauseIndex := 35146, terminalClauseIndex := 2606029, datum := { row := ⟨5, {0, 4, 6, 7}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10172; core 35152; terminal 2606036
  { outputClauseIndex := 10172, coreClauseIndex := 35152, terminalClauseIndex := 2606036, datum := { row := ⟨5, {0, 4, 6, 8}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10173; core 35153; terminal 2606037
  { outputClauseIndex := 10173, coreClauseIndex := 35153, terminalClauseIndex := 2606037, datum := { row := ⟨5, {0, 4, 6, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10175; core 35159; terminal 2606043
  { outputClauseIndex := 10175, coreClauseIndex := 35159, terminalClauseIndex := 2606043, datum := { row := ⟨5, {0, 4, 6, 9}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10176; core 35160; terminal 2606044
  { outputClauseIndex := 10176, coreClauseIndex := 35160, terminalClauseIndex := 2606044, datum := { row := ⟨5, {0, 4, 6, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk009_batch_valid :
    directRowArcFiniteOccurrencesChunk009.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk009, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk009 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk009.map (·.datum)

theorem directRowArcFiniteDataChunk009_batch_valid :
    directRowArcFiniteDataChunk009.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk009, datum.Valid := by
  rw [directRowArcFiniteDataChunk009]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk009_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk009_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
