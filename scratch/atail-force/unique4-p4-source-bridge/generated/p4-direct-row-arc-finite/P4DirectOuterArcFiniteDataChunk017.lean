/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk017 : List DirectRowArcFiniteOccurrence := [
  -- compact 11482; core 38703; terminal 2610404
  { outputClauseIndex := 11482, coreClauseIndex := 38703, terminalClauseIndex := 2610404, datum := { row := ⟨8, {0, 3, 6, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11483; core 38704; terminal 2610405
  { outputClauseIndex := 11483, coreClauseIndex := 38704, terminalClauseIndex := 2610405, datum := { row := ⟨8, {0, 3, 6, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11485; core 38710; terminal 2610411
  { outputClauseIndex := 11485, coreClauseIndex := 38710, terminalClauseIndex := 2610411, datum := { row := ⟨8, {0, 3, 6, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11486; core 38711; terminal 2610412
  { outputClauseIndex := 11486, coreClauseIndex := 38711, terminalClauseIndex := 2610412, datum := { row := ⟨8, {0, 3, 6, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11487; core 38716; terminal 2610418
  { outputClauseIndex := 11487, coreClauseIndex := 38716, terminalClauseIndex := 2610418, datum := { row := ⟨8, {0, 3, 7, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11488; core 38717; terminal 2610419
  { outputClauseIndex := 11488, coreClauseIndex := 38717, terminalClauseIndex := 2610419, datum := { row := ⟨8, {0, 3, 7, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11489; core 38722; terminal 2610425
  { outputClauseIndex := 11489, coreClauseIndex := 38722, terminalClauseIndex := 2610425, datum := { row := ⟨8, {0, 3, 7, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11490; core 38723; terminal 2610426
  { outputClauseIndex := 11490, coreClauseIndex := 38723, terminalClauseIndex := 2610426, datum := { row := ⟨8, {0, 3, 7, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11491; core 38728; terminal 2610432
  { outputClauseIndex := 11491, coreClauseIndex := 38728, terminalClauseIndex := 2610432, datum := { row := ⟨8, {0, 3, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8, 9}⟩ } },
  -- compact 11492; core 38729; terminal 2610433
  { outputClauseIndex := 11492, coreClauseIndex := 38729, terminalClauseIndex := 2610433, datum := { row := ⟨8, {0, 3, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11494; core 38739; terminal 2610446
  { outputClauseIndex := 11494, coreClauseIndex := 38739, terminalClauseIndex := 2610446, datum := { row := ⟨8, {0, 4, 5, 7}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
  -- compact 11495; core 38740; terminal 2610447
  { outputClauseIndex := 11495, coreClauseIndex := 38740, terminalClauseIndex := 2610447, datum := { row := ⟨8, {0, 4, 5, 7}⟩, arc := ⟨8, .right, {0, 1, 7, 8, 9, 10}⟩ } },
  -- compact 11497; core 38746; terminal 2610453
  { outputClauseIndex := 11497, coreClauseIndex := 38746, terminalClauseIndex := 2610453, datum := { row := ⟨8, {0, 4, 5, 9}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11498; core 38747; terminal 2610454
  { outputClauseIndex := 11498, coreClauseIndex := 38747, terminalClauseIndex := 2610454, datum := { row := ⟨8, {0, 4, 5, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11500; core 38753; terminal 2610460
  { outputClauseIndex := 11500, coreClauseIndex := 38753, terminalClauseIndex := 2610460, datum := { row := ⟨8, {0, 4, 5, 10}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11501; core 38754; terminal 2610461
  { outputClauseIndex := 11501, coreClauseIndex := 38754, terminalClauseIndex := 2610461, datum := { row := ⟨8, {0, 4, 5, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11503; core 38760; terminal 2610467
  { outputClauseIndex := 11503, coreClauseIndex := 38760, terminalClauseIndex := 2610467, datum := { row := ⟨8, {0, 4, 6, 7}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11504; core 38761; terminal 2610468
  { outputClauseIndex := 11504, coreClauseIndex := 38761, terminalClauseIndex := 2610468, datum := { row := ⟨8, {0, 4, 6, 7}⟩, arc := ⟨8, .right, {0, 1, 7, 8, 9, 10}⟩ } },
  -- compact 11506; core 38767; terminal 2610474
  { outputClauseIndex := 11506, coreClauseIndex := 38767, terminalClauseIndex := 2610474, datum := { row := ⟨8, {0, 4, 6, 9}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11507; core 38768; terminal 2610475
  { outputClauseIndex := 11507, coreClauseIndex := 38768, terminalClauseIndex := 2610475, datum := { row := ⟨8, {0, 4, 6, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11509; core 38774; terminal 2610481
  { outputClauseIndex := 11509, coreClauseIndex := 38774, terminalClauseIndex := 2610481, datum := { row := ⟨8, {0, 4, 6, 10}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11510; core 38775; terminal 2610482
  { outputClauseIndex := 11510, coreClauseIndex := 38775, terminalClauseIndex := 2610482, datum := { row := ⟨8, {0, 4, 6, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11511; core 38780; terminal 2610488
  { outputClauseIndex := 11511, coreClauseIndex := 38780, terminalClauseIndex := 2610488, datum := { row := ⟨8, {0, 4, 7, 9}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11512; core 38781; terminal 2610489
  { outputClauseIndex := 11512, coreClauseIndex := 38781, terminalClauseIndex := 2610489, datum := { row := ⟨8, {0, 4, 7, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11513; core 38786; terminal 2610495
  { outputClauseIndex := 11513, coreClauseIndex := 38786, terminalClauseIndex := 2610495, datum := { row := ⟨8, {0, 4, 7, 10}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11514; core 38787; terminal 2610496
  { outputClauseIndex := 11514, coreClauseIndex := 38787, terminalClauseIndex := 2610496, datum := { row := ⟨8, {0, 4, 7, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11515; core 38792; terminal 2610502
  { outputClauseIndex := 11515, coreClauseIndex := 38792, terminalClauseIndex := 2610502, datum := { row := ⟨8, {0, 4, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8, 9}⟩ } },
  -- compact 11516; core 38793; terminal 2610503
  { outputClauseIndex := 11516, coreClauseIndex := 38793, terminalClauseIndex := 2610503, datum := { row := ⟨8, {0, 4, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11517; core 38798; terminal 2610509
  { outputClauseIndex := 11517, coreClauseIndex := 38798, terminalClauseIndex := 2610509, datum := { row := ⟨8, {0, 5, 6, 7}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11518; core 38799; terminal 2610510
  { outputClauseIndex := 11518, coreClauseIndex := 38799, terminalClauseIndex := 2610510, datum := { row := ⟨8, {0, 5, 6, 7}⟩, arc := ⟨8, .right, {0, 1, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11519; core 38804; terminal 2610517
  { outputClauseIndex := 11519, coreClauseIndex := 38804, terminalClauseIndex := 2610517, datum := { row := ⟨8, {0, 5, 6, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11520; core 38809; terminal 2610524
  { outputClauseIndex := 11520, coreClauseIndex := 38809, terminalClauseIndex := 2610524, datum := { row := ⟨8, {0, 5, 6, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11521; core 38814; terminal 2610530
  { outputClauseIndex := 11521, coreClauseIndex := 38814, terminalClauseIndex := 2610530, datum := { row := ⟨8, {0, 5, 7, 9}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
  -- compact 11522; core 38815; terminal 2610531
  { outputClauseIndex := 11522, coreClauseIndex := 38815, terminalClauseIndex := 2610531, datum := { row := ⟨8, {0, 5, 7, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11523; core 38820; terminal 2610537
  { outputClauseIndex := 11523, coreClauseIndex := 38820, terminalClauseIndex := 2610537, datum := { row := ⟨8, {0, 5, 7, 10}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
  -- compact 11524; core 38821; terminal 2610538
  { outputClauseIndex := 11524, coreClauseIndex := 38821, terminalClauseIndex := 2610538, datum := { row := ⟨8, {0, 5, 7, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11525; core 38826; terminal 2610544
  { outputClauseIndex := 11525, coreClauseIndex := 38826, terminalClauseIndex := 2610544, datum := { row := ⟨8, {0, 5, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8, 9}⟩ } },
  -- compact 11526; core 38827; terminal 2610545
  { outputClauseIndex := 11526, coreClauseIndex := 38827, terminalClauseIndex := 2610545, datum := { row := ⟨8, {0, 5, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11527; core 38832; terminal 2610551
  { outputClauseIndex := 11527, coreClauseIndex := 38832, terminalClauseIndex := 2610551, datum := { row := ⟨8, {0, 6, 7, 9}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11528; core 38833; terminal 2610552
  { outputClauseIndex := 11528, coreClauseIndex := 38833, terminalClauseIndex := 2610552, datum := { row := ⟨8, {0, 6, 7, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11529; core 38838; terminal 2610558
  { outputClauseIndex := 11529, coreClauseIndex := 38838, terminalClauseIndex := 2610558, datum := { row := ⟨8, {0, 6, 7, 10}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11530; core 38839; terminal 2610559
  { outputClauseIndex := 11530, coreClauseIndex := 38839, terminalClauseIndex := 2610559, datum := { row := ⟨8, {0, 6, 7, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11531; core 38844; terminal 2610565
  { outputClauseIndex := 11531, coreClauseIndex := 38844, terminalClauseIndex := 2610565, datum := { row := ⟨8, {0, 6, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8, 9}⟩ } },
  -- compact 11532; core 38845; terminal 2610566
  { outputClauseIndex := 11532, coreClauseIndex := 38845, terminalClauseIndex := 2610566, datum := { row := ⟨8, {0, 6, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11533; core 38850; terminal 2610572
  { outputClauseIndex := 11533, coreClauseIndex := 38850, terminalClauseIndex := 2610572, datum := { row := ⟨8, {0, 7, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8, 9}⟩ } },
  -- compact 11534; core 38851; terminal 2610573
  { outputClauseIndex := 11534, coreClauseIndex := 38851, terminalClauseIndex := 2610573, datum := { row := ⟨8, {0, 7, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11535; core 38856; terminal 2610579
  { outputClauseIndex := 11535, coreClauseIndex := 38856, terminalClauseIndex := 2610579, datum := { row := ⟨8, {1, 2, 3, 4}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11536; core 38857; terminal 2610580
  { outputClauseIndex := 11536, coreClauseIndex := 38857, terminalClauseIndex := 2610580, datum := { row := ⟨8, {1, 2, 3, 4}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11537; core 38862; terminal 2610586
  { outputClauseIndex := 11537, coreClauseIndex := 38862, terminalClauseIndex := 2610586, datum := { row := ⟨8, {1, 2, 3, 5}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11538; core 38863; terminal 2610587
  { outputClauseIndex := 11538, coreClauseIndex := 38863, terminalClauseIndex := 2610587, datum := { row := ⟨8, {1, 2, 3, 5}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11539; core 38868; terminal 2610593
  { outputClauseIndex := 11539, coreClauseIndex := 38868, terminalClauseIndex := 2610593, datum := { row := ⟨8, {1, 2, 3, 6}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11540; core 38869; terminal 2610594
  { outputClauseIndex := 11540, coreClauseIndex := 38869, terminalClauseIndex := 2610594, datum := { row := ⟨8, {1, 2, 3, 6}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11541; core 38874; terminal 2610600
  { outputClauseIndex := 11541, coreClauseIndex := 38874, terminalClauseIndex := 2610600, datum := { row := ⟨8, {1, 2, 3, 7}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11542; core 38875; terminal 2610601
  { outputClauseIndex := 11542, coreClauseIndex := 38875, terminalClauseIndex := 2610601, datum := { row := ⟨8, {1, 2, 3, 7}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11543; core 38880; terminal 2610607
  { outputClauseIndex := 11543, coreClauseIndex := 38880, terminalClauseIndex := 2610607, datum := { row := ⟨8, {1, 2, 3, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11544; core 38881; terminal 2610608
  { outputClauseIndex := 11544, coreClauseIndex := 38881, terminalClauseIndex := 2610608, datum := { row := ⟨8, {1, 2, 3, 9}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11545; core 38886; terminal 2610614
  { outputClauseIndex := 11545, coreClauseIndex := 38886, terminalClauseIndex := 2610614, datum := { row := ⟨8, {1, 2, 3, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11546; core 38887; terminal 2610615
  { outputClauseIndex := 11546, coreClauseIndex := 38887, terminalClauseIndex := 2610615, datum := { row := ⟨8, {1, 2, 3, 10}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11547; core 38892; terminal 2610621
  { outputClauseIndex := 11547, coreClauseIndex := 38892, terminalClauseIndex := 2610621, datum := { row := ⟨8, {1, 2, 4, 5}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11548; core 38893; terminal 2610622
  { outputClauseIndex := 11548, coreClauseIndex := 38893, terminalClauseIndex := 2610622, datum := { row := ⟨8, {1, 2, 4, 5}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11549; core 38898; terminal 2610628
  { outputClauseIndex := 11549, coreClauseIndex := 38898, terminalClauseIndex := 2610628, datum := { row := ⟨8, {1, 2, 4, 6}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11550; core 38899; terminal 2610629
  { outputClauseIndex := 11550, coreClauseIndex := 38899, terminalClauseIndex := 2610629, datum := { row := ⟨8, {1, 2, 4, 6}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11552; core 38905; terminal 2610635
  { outputClauseIndex := 11552, coreClauseIndex := 38905, terminalClauseIndex := 2610635, datum := { row := ⟨8, {1, 2, 4, 7}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11553; core 38906; terminal 2610636
  { outputClauseIndex := 11553, coreClauseIndex := 38906, terminalClauseIndex := 2610636, datum := { row := ⟨8, {1, 2, 4, 7}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11555; core 38912; terminal 2610642
  { outputClauseIndex := 11555, coreClauseIndex := 38912, terminalClauseIndex := 2610642, datum := { row := ⟨8, {1, 2, 4, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11556; core 38913; terminal 2610643
  { outputClauseIndex := 11556, coreClauseIndex := 38913, terminalClauseIndex := 2610643, datum := { row := ⟨8, {1, 2, 4, 9}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11558; core 38919; terminal 2610649
  { outputClauseIndex := 11558, coreClauseIndex := 38919, terminalClauseIndex := 2610649, datum := { row := ⟨8, {1, 2, 4, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11559; core 38920; terminal 2610650
  { outputClauseIndex := 11559, coreClauseIndex := 38920, terminalClauseIndex := 2610650, datum := { row := ⟨8, {1, 2, 4, 10}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11560; core 38924; terminal 2610657
  { outputClauseIndex := 11560, coreClauseIndex := 38924, terminalClauseIndex := 2610657, datum := { row := ⟨8, {1, 2, 5, 6}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11562; core 38930; terminal 2610663
  { outputClauseIndex := 11562, coreClauseIndex := 38930, terminalClauseIndex := 2610663, datum := { row := ⟨8, {1, 2, 5, 7}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
  -- compact 11563; core 38931; terminal 2610664
  { outputClauseIndex := 11563, coreClauseIndex := 38931, terminalClauseIndex := 2610664, datum := { row := ⟨8, {1, 2, 5, 7}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11565; core 38937; terminal 2610670
  { outputClauseIndex := 11565, coreClauseIndex := 38937, terminalClauseIndex := 2610670, datum := { row := ⟨8, {1, 2, 5, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11566; core 38938; terminal 2610671
  { outputClauseIndex := 11566, coreClauseIndex := 38938, terminalClauseIndex := 2610671, datum := { row := ⟨8, {1, 2, 5, 9}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11568; core 38944; terminal 2610677
  { outputClauseIndex := 11568, coreClauseIndex := 38944, terminalClauseIndex := 2610677, datum := { row := ⟨8, {1, 2, 5, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11569; core 38945; terminal 2610678
  { outputClauseIndex := 11569, coreClauseIndex := 38945, terminalClauseIndex := 2610678, datum := { row := ⟨8, {1, 2, 5, 10}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11571; core 38951; terminal 2610684
  { outputClauseIndex := 11571, coreClauseIndex := 38951, terminalClauseIndex := 2610684, datum := { row := ⟨8, {1, 2, 6, 7}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11572; core 38952; terminal 2610685
  { outputClauseIndex := 11572, coreClauseIndex := 38952, terminalClauseIndex := 2610685, datum := { row := ⟨8, {1, 2, 6, 7}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11574; core 38958; terminal 2610691
  { outputClauseIndex := 11574, coreClauseIndex := 38958, terminalClauseIndex := 2610691, datum := { row := ⟨8, {1, 2, 6, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11575; core 38959; terminal 2610692
  { outputClauseIndex := 11575, coreClauseIndex := 38959, terminalClauseIndex := 2610692, datum := { row := ⟨8, {1, 2, 6, 9}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11577; core 38965; terminal 2610698
  { outputClauseIndex := 11577, coreClauseIndex := 38965, terminalClauseIndex := 2610698, datum := { row := ⟨8, {1, 2, 6, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11578; core 38966; terminal 2610699
  { outputClauseIndex := 11578, coreClauseIndex := 38966, terminalClauseIndex := 2610699, datum := { row := ⟨8, {1, 2, 6, 10}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11580; core 38972; terminal 2610705
  { outputClauseIndex := 11580, coreClauseIndex := 38972, terminalClauseIndex := 2610705, datum := { row := ⟨8, {1, 2, 7, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11581; core 38973; terminal 2610706
  { outputClauseIndex := 11581, coreClauseIndex := 38973, terminalClauseIndex := 2610706, datum := { row := ⟨8, {1, 2, 7, 9}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11583; core 38979; terminal 2610712
  { outputClauseIndex := 11583, coreClauseIndex := 38979, terminalClauseIndex := 2610712, datum := { row := ⟨8, {1, 2, 7, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11584; core 38980; terminal 2610713
  { outputClauseIndex := 11584, coreClauseIndex := 38980, terminalClauseIndex := 2610713, datum := { row := ⟨8, {1, 2, 7, 10}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11586; core 38986; terminal 2610719
  { outputClauseIndex := 11586, coreClauseIndex := 38986, terminalClauseIndex := 2610719, datum := { row := ⟨8, {1, 2, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11587; core 38987; terminal 2610720
  { outputClauseIndex := 11587, coreClauseIndex := 38987, terminalClauseIndex := 2610720, datum := { row := ⟨8, {1, 2, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11589; core 38993; terminal 2610726
  { outputClauseIndex := 11589, coreClauseIndex := 38993, terminalClauseIndex := 2610726, datum := { row := ⟨8, {1, 3, 4, 5}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11590; core 38994; terminal 2610727
  { outputClauseIndex := 11590, coreClauseIndex := 38994, terminalClauseIndex := 2610727, datum := { row := ⟨8, {1, 3, 4, 5}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11591; core 38999; terminal 2610733
  { outputClauseIndex := 11591, coreClauseIndex := 38999, terminalClauseIndex := 2610733, datum := { row := ⟨8, {1, 3, 4, 6}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11592; core 39000; terminal 2610734
  { outputClauseIndex := 11592, coreClauseIndex := 39000, terminalClauseIndex := 2610734, datum := { row := ⟨8, {1, 3, 4, 6}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11594; core 39006; terminal 2610740
  { outputClauseIndex := 11594, coreClauseIndex := 39006, terminalClauseIndex := 2610740, datum := { row := ⟨8, {1, 3, 4, 7}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11595; core 39007; terminal 2610741
  { outputClauseIndex := 11595, coreClauseIndex := 39007, terminalClauseIndex := 2610741, datum := { row := ⟨8, {1, 3, 4, 7}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11597; core 39013; terminal 2610747
  { outputClauseIndex := 11597, coreClauseIndex := 39013, terminalClauseIndex := 2610747, datum := { row := ⟨8, {1, 3, 4, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11598; core 39014; terminal 2610748
  { outputClauseIndex := 11598, coreClauseIndex := 39014, terminalClauseIndex := 2610748, datum := { row := ⟨8, {1, 3, 4, 9}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11600; core 39020; terminal 2610754
  { outputClauseIndex := 11600, coreClauseIndex := 39020, terminalClauseIndex := 2610754, datum := { row := ⟨8, {1, 3, 4, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11601; core 39021; terminal 2610755
  { outputClauseIndex := 11601, coreClauseIndex := 39021, terminalClauseIndex := 2610755, datum := { row := ⟨8, {1, 3, 4, 10}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11603; core 39030; terminal 2610768
  { outputClauseIndex := 11603, coreClauseIndex := 39030, terminalClauseIndex := 2610768, datum := { row := ⟨8, {1, 3, 5, 7}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
  -- compact 11604; core 39031; terminal 2610769
  { outputClauseIndex := 11604, coreClauseIndex := 39031, terminalClauseIndex := 2610769, datum := { row := ⟨8, {1, 3, 5, 7}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11606; core 39037; terminal 2610775
  { outputClauseIndex := 11606, coreClauseIndex := 39037, terminalClauseIndex := 2610775, datum := { row := ⟨8, {1, 3, 5, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11607; core 39038; terminal 2610776
  { outputClauseIndex := 11607, coreClauseIndex := 39038, terminalClauseIndex := 2610776, datum := { row := ⟨8, {1, 3, 5, 9}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11609; core 39044; terminal 2610782
  { outputClauseIndex := 11609, coreClauseIndex := 39044, terminalClauseIndex := 2610782, datum := { row := ⟨8, {1, 3, 5, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11610; core 39045; terminal 2610783
  { outputClauseIndex := 11610, coreClauseIndex := 39045, terminalClauseIndex := 2610783, datum := { row := ⟨8, {1, 3, 5, 10}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11612; core 39051; terminal 2610789
  { outputClauseIndex := 11612, coreClauseIndex := 39051, terminalClauseIndex := 2610789, datum := { row := ⟨8, {1, 3, 6, 7}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11613; core 39052; terminal 2610790
  { outputClauseIndex := 11613, coreClauseIndex := 39052, terminalClauseIndex := 2610790, datum := { row := ⟨8, {1, 3, 6, 7}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11615; core 39058; terminal 2610796
  { outputClauseIndex := 11615, coreClauseIndex := 39058, terminalClauseIndex := 2610796, datum := { row := ⟨8, {1, 3, 6, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11616; core 39059; terminal 2610797
  { outputClauseIndex := 11616, coreClauseIndex := 39059, terminalClauseIndex := 2610797, datum := { row := ⟨8, {1, 3, 6, 9}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11618; core 39065; terminal 2610803
  { outputClauseIndex := 11618, coreClauseIndex := 39065, terminalClauseIndex := 2610803, datum := { row := ⟨8, {1, 3, 6, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11619; core 39066; terminal 2610804
  { outputClauseIndex := 11619, coreClauseIndex := 39066, terminalClauseIndex := 2610804, datum := { row := ⟨8, {1, 3, 6, 10}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11621; core 39072; terminal 2610810
  { outputClauseIndex := 11621, coreClauseIndex := 39072, terminalClauseIndex := 2610810, datum := { row := ⟨8, {1, 3, 7, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11622; core 39073; terminal 2610811
  { outputClauseIndex := 11622, coreClauseIndex := 39073, terminalClauseIndex := 2610811, datum := { row := ⟨8, {1, 3, 7, 9}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11624; core 39079; terminal 2610817
  { outputClauseIndex := 11624, coreClauseIndex := 39079, terminalClauseIndex := 2610817, datum := { row := ⟨8, {1, 3, 7, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11625; core 39080; terminal 2610818
  { outputClauseIndex := 11625, coreClauseIndex := 39080, terminalClauseIndex := 2610818, datum := { row := ⟨8, {1, 3, 7, 10}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11627; core 39086; terminal 2610824
  { outputClauseIndex := 11627, coreClauseIndex := 39086, terminalClauseIndex := 2610824, datum := { row := ⟨8, {1, 3, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11628; core 39087; terminal 2610825
  { outputClauseIndex := 11628, coreClauseIndex := 39087, terminalClauseIndex := 2610825, datum := { row := ⟨8, {1, 3, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11630; core 39097; terminal 2610838
  { outputClauseIndex := 11630, coreClauseIndex := 39097, terminalClauseIndex := 2610838, datum := { row := ⟨8, {1, 4, 5, 7}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
  -- compact 11631; core 39098; terminal 2610839
  { outputClauseIndex := 11631, coreClauseIndex := 39098, terminalClauseIndex := 2610839, datum := { row := ⟨8, {1, 4, 5, 7}⟩, arc := ⟨8, .right, {0, 1, 7, 8, 9, 10}⟩ } },
  -- compact 11633; core 39104; terminal 2610845
  { outputClauseIndex := 11633, coreClauseIndex := 39104, terminalClauseIndex := 2610845, datum := { row := ⟨8, {1, 4, 5, 9}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11634; core 39105; terminal 2610846
  { outputClauseIndex := 11634, coreClauseIndex := 39105, terminalClauseIndex := 2610846, datum := { row := ⟨8, {1, 4, 5, 9}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11636; core 39111; terminal 2610852
  { outputClauseIndex := 11636, coreClauseIndex := 39111, terminalClauseIndex := 2610852, datum := { row := ⟨8, {1, 4, 5, 10}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11637; core 39112; terminal 2610853
  { outputClauseIndex := 11637, coreClauseIndex := 39112, terminalClauseIndex := 2610853, datum := { row := ⟨8, {1, 4, 5, 10}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11639; core 39118; terminal 2610859
  { outputClauseIndex := 11639, coreClauseIndex := 39118, terminalClauseIndex := 2610859, datum := { row := ⟨8, {1, 4, 6, 7}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11640; core 39119; terminal 2610860
  { outputClauseIndex := 11640, coreClauseIndex := 39119, terminalClauseIndex := 2610860, datum := { row := ⟨8, {1, 4, 6, 7}⟩, arc := ⟨8, .right, {0, 1, 7, 8, 9, 10}⟩ } },
  -- compact 11642; core 39125; terminal 2610866
  { outputClauseIndex := 11642, coreClauseIndex := 39125, terminalClauseIndex := 2610866, datum := { row := ⟨8, {1, 4, 6, 9}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11643; core 39126; terminal 2610867
  { outputClauseIndex := 11643, coreClauseIndex := 39126, terminalClauseIndex := 2610867, datum := { row := ⟨8, {1, 4, 6, 9}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11645; core 39132; terminal 2610873
  { outputClauseIndex := 11645, coreClauseIndex := 39132, terminalClauseIndex := 2610873, datum := { row := ⟨8, {1, 4, 6, 10}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11646; core 39133; terminal 2610874
  { outputClauseIndex := 11646, coreClauseIndex := 39133, terminalClauseIndex := 2610874, datum := { row := ⟨8, {1, 4, 6, 10}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11648; core 39139; terminal 2610880
  { outputClauseIndex := 11648, coreClauseIndex := 39139, terminalClauseIndex := 2610880, datum := { row := ⟨8, {1, 4, 7, 9}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk017_batch_valid :
    directRowArcFiniteOccurrencesChunk017.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk017, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk017 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk017.map (·.datum)

theorem directRowArcFiniteDataChunk017_batch_valid :
    directRowArcFiniteDataChunk017.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk017, datum.Valid := by
  rw [directRowArcFiniteDataChunk017]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk017_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk017_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
