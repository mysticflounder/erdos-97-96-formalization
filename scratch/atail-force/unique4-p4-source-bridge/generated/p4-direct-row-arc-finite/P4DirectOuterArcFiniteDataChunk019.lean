/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk019 : List DirectRowArcFiniteOccurrence := [
  -- compact 11829; core 39594; terminal 2611378
  { outputClauseIndex := 11829, coreClauseIndex := 39594, terminalClauseIndex := 2611378, datum := { row := ⟨8, {4, 5, 7, 9}⟩, arc := ⟨8, .right, {0, 1, 7, 8, 9, 10}⟩ } },
  -- compact 11831; core 39600; terminal 2611384
  { outputClauseIndex := 11831, coreClauseIndex := 39600, terminalClauseIndex := 2611384, datum := { row := ⟨8, {4, 5, 7, 10}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
  -- compact 11832; core 39601; terminal 2611385
  { outputClauseIndex := 11832, coreClauseIndex := 39601, terminalClauseIndex := 2611385, datum := { row := ⟨8, {4, 5, 7, 10}⟩, arc := ⟨8, .right, {0, 1, 7, 8, 9, 10}⟩ } },
  -- compact 11834; core 39607; terminal 2611391
  { outputClauseIndex := 11834, coreClauseIndex := 39607, terminalClauseIndex := 2611391, datum := { row := ⟨8, {4, 5, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11835; core 39608; terminal 2611392
  { outputClauseIndex := 11835, coreClauseIndex := 39608, terminalClauseIndex := 2611392, datum := { row := ⟨8, {4, 5, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11837; core 39614; terminal 2611398
  { outputClauseIndex := 11837, coreClauseIndex := 39614, terminalClauseIndex := 2611398, datum := { row := ⟨8, {4, 6, 7, 9}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11838; core 39615; terminal 2611399
  { outputClauseIndex := 11838, coreClauseIndex := 39615, terminalClauseIndex := 2611399, datum := { row := ⟨8, {4, 6, 7, 9}⟩, arc := ⟨8, .right, {0, 1, 7, 8, 9, 10}⟩ } },
  -- compact 11840; core 39621; terminal 2611405
  { outputClauseIndex := 11840, coreClauseIndex := 39621, terminalClauseIndex := 2611405, datum := { row := ⟨8, {4, 6, 7, 10}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11841; core 39622; terminal 2611406
  { outputClauseIndex := 11841, coreClauseIndex := 39622, terminalClauseIndex := 2611406, datum := { row := ⟨8, {4, 6, 7, 10}⟩, arc := ⟨8, .right, {0, 1, 7, 8, 9, 10}⟩ } },
  -- compact 11843; core 39628; terminal 2611413
  { outputClauseIndex := 11843, coreClauseIndex := 39628, terminalClauseIndex := 2611413, datum := { row := ⟨8, {4, 6, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11844; core 39633; terminal 2611420
  { outputClauseIndex := 11844, coreClauseIndex := 39633, terminalClauseIndex := 2611420, datum := { row := ⟨8, {4, 7, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11845; core 39637; terminal 2611426
  { outputClauseIndex := 11845, coreClauseIndex := 39637, terminalClauseIndex := 2611426, datum := { row := ⟨8, {5, 6, 7, 9}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11846; core 39641; terminal 2611433
  { outputClauseIndex := 11846, coreClauseIndex := 39641, terminalClauseIndex := 2611433, datum := { row := ⟨8, {5, 6, 7, 10}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11847; core 39642; terminal 2611434
  { outputClauseIndex := 11847, coreClauseIndex := 39642, terminalClauseIndex := 2611434, datum := { row := ⟨8, {5, 6, 7, 10}⟩, arc := ⟨8, .right, {0, 1, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11848; core 39649; terminal 2611448
  { outputClauseIndex := 11848, coreClauseIndex := 39649, terminalClauseIndex := 2611448, datum := { row := ⟨8, {5, 7, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11849; core 39658; terminal 2611461
  { outputClauseIndex := 11849, coreClauseIndex := 39658, terminalClauseIndex := 2611461, datum := { row := ⟨9, {0, 1, 2, 3}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 11850; core 39659; terminal 2611462
  { outputClauseIndex := 11850, coreClauseIndex := 39659, terminalClauseIndex := 2611462, datum := { row := ⟨9, {0, 1, 2, 3}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11852; core 39665; terminal 2611468
  { outputClauseIndex := 11852, coreClauseIndex := 39665, terminalClauseIndex := 2611468, datum := { row := ⟨9, {0, 1, 2, 4}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 11853; core 39666; terminal 2611469
  { outputClauseIndex := 11853, coreClauseIndex := 39666, terminalClauseIndex := 2611469, datum := { row := ⟨9, {0, 1, 2, 4}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11855; core 39672; terminal 2611475
  { outputClauseIndex := 11855, coreClauseIndex := 39672, terminalClauseIndex := 2611475, datum := { row := ⟨9, {0, 1, 2, 5}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 11856; core 39673; terminal 2611476
  { outputClauseIndex := 11856, coreClauseIndex := 39673, terminalClauseIndex := 2611476, datum := { row := ⟨9, {0, 1, 2, 5}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11858; core 39679; terminal 2611482
  { outputClauseIndex := 11858, coreClauseIndex := 39679, terminalClauseIndex := 2611482, datum := { row := ⟨9, {0, 1, 2, 6}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 11859; core 39680; terminal 2611483
  { outputClauseIndex := 11859, coreClauseIndex := 39680, terminalClauseIndex := 2611483, datum := { row := ⟨9, {0, 1, 2, 6}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11861; core 39686; terminal 2611489
  { outputClauseIndex := 11861, coreClauseIndex := 39686, terminalClauseIndex := 2611489, datum := { row := ⟨9, {0, 1, 2, 7}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 11862; core 39687; terminal 2611490
  { outputClauseIndex := 11862, coreClauseIndex := 39687, terminalClauseIndex := 2611490, datum := { row := ⟨9, {0, 1, 2, 7}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11864; core 39693; terminal 2611496
  { outputClauseIndex := 11864, coreClauseIndex := 39693, terminalClauseIndex := 2611496, datum := { row := ⟨9, {0, 1, 2, 8}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 11865; core 39694; terminal 2611497
  { outputClauseIndex := 11865, coreClauseIndex := 39694, terminalClauseIndex := 2611497, datum := { row := ⟨9, {0, 1, 2, 8}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11867; core 39700; terminal 2611503
  { outputClauseIndex := 11867, coreClauseIndex := 39700, terminalClauseIndex := 2611503, datum := { row := ⟨9, {0, 1, 2, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11868; core 39701; terminal 2611504
  { outputClauseIndex := 11868, coreClauseIndex := 39701, terminalClauseIndex := 2611504, datum := { row := ⟨9, {0, 1, 2, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 11870; core 39707; terminal 2611510
  { outputClauseIndex := 11870, coreClauseIndex := 39707, terminalClauseIndex := 2611510, datum := { row := ⟨9, {0, 1, 3, 4}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 11871; core 39708; terminal 2611511
  { outputClauseIndex := 11871, coreClauseIndex := 39708, terminalClauseIndex := 2611511, datum := { row := ⟨9, {0, 1, 3, 4}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11873; core 39714; terminal 2611517
  { outputClauseIndex := 11873, coreClauseIndex := 39714, terminalClauseIndex := 2611517, datum := { row := ⟨9, {0, 1, 3, 5}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 11874; core 39715; terminal 2611518
  { outputClauseIndex := 11874, coreClauseIndex := 39715, terminalClauseIndex := 2611518, datum := { row := ⟨9, {0, 1, 3, 5}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11876; core 39721; terminal 2611524
  { outputClauseIndex := 11876, coreClauseIndex := 39721, terminalClauseIndex := 2611524, datum := { row := ⟨9, {0, 1, 3, 6}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 11877; core 39722; terminal 2611525
  { outputClauseIndex := 11877, coreClauseIndex := 39722, terminalClauseIndex := 2611525, datum := { row := ⟨9, {0, 1, 3, 6}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11879; core 39728; terminal 2611531
  { outputClauseIndex := 11879, coreClauseIndex := 39728, terminalClauseIndex := 2611531, datum := { row := ⟨9, {0, 1, 3, 7}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 11880; core 39729; terminal 2611532
  { outputClauseIndex := 11880, coreClauseIndex := 39729, terminalClauseIndex := 2611532, datum := { row := ⟨9, {0, 1, 3, 7}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11882; core 39735; terminal 2611538
  { outputClauseIndex := 11882, coreClauseIndex := 39735, terminalClauseIndex := 2611538, datum := { row := ⟨9, {0, 1, 3, 8}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 11883; core 39736; terminal 2611539
  { outputClauseIndex := 11883, coreClauseIndex := 39736, terminalClauseIndex := 2611539, datum := { row := ⟨9, {0, 1, 3, 8}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11885; core 39742; terminal 2611545
  { outputClauseIndex := 11885, coreClauseIndex := 39742, terminalClauseIndex := 2611545, datum := { row := ⟨9, {0, 1, 3, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11886; core 39743; terminal 2611546
  { outputClauseIndex := 11886, coreClauseIndex := 39743, terminalClauseIndex := 2611546, datum := { row := ⟨9, {0, 1, 3, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 11888; core 39749; terminal 2611552
  { outputClauseIndex := 11888, coreClauseIndex := 39749, terminalClauseIndex := 2611552, datum := { row := ⟨9, {0, 1, 4, 5}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 11889; core 39750; terminal 2611553
  { outputClauseIndex := 11889, coreClauseIndex := 39750, terminalClauseIndex := 2611553, datum := { row := ⟨9, {0, 1, 4, 5}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11891; core 39756; terminal 2611559
  { outputClauseIndex := 11891, coreClauseIndex := 39756, terminalClauseIndex := 2611559, datum := { row := ⟨9, {0, 1, 4, 6}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 11892; core 39757; terminal 2611560
  { outputClauseIndex := 11892, coreClauseIndex := 39757, terminalClauseIndex := 2611560, datum := { row := ⟨9, {0, 1, 4, 6}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11894; core 39763; terminal 2611566
  { outputClauseIndex := 11894, coreClauseIndex := 39763, terminalClauseIndex := 2611566, datum := { row := ⟨9, {0, 1, 4, 7}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 11895; core 39764; terminal 2611567
  { outputClauseIndex := 11895, coreClauseIndex := 39764, terminalClauseIndex := 2611567, datum := { row := ⟨9, {0, 1, 4, 7}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11897; core 39770; terminal 2611573
  { outputClauseIndex := 11897, coreClauseIndex := 39770, terminalClauseIndex := 2611573, datum := { row := ⟨9, {0, 1, 4, 8}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 11898; core 39771; terminal 2611574
  { outputClauseIndex := 11898, coreClauseIndex := 39771, terminalClauseIndex := 2611574, datum := { row := ⟨9, {0, 1, 4, 8}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11900; core 39777; terminal 2611580
  { outputClauseIndex := 11900, coreClauseIndex := 39777, terminalClauseIndex := 2611580, datum := { row := ⟨9, {0, 1, 4, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11901; core 39778; terminal 2611581
  { outputClauseIndex := 11901, coreClauseIndex := 39778, terminalClauseIndex := 2611581, datum := { row := ⟨9, {0, 1, 4, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 11902; core 39783; terminal 2611587
  { outputClauseIndex := 11902, coreClauseIndex := 39783, terminalClauseIndex := 2611587, datum := { row := ⟨9, {0, 1, 5, 6}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 11903; core 39784; terminal 2611588
  { outputClauseIndex := 11903, coreClauseIndex := 39784, terminalClauseIndex := 2611588, datum := { row := ⟨9, {0, 1, 5, 6}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11905; core 39790; terminal 2611594
  { outputClauseIndex := 11905, coreClauseIndex := 39790, terminalClauseIndex := 2611594, datum := { row := ⟨9, {0, 1, 5, 7}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 11906; core 39791; terminal 2611595
  { outputClauseIndex := 11906, coreClauseIndex := 39791, terminalClauseIndex := 2611595, datum := { row := ⟨9, {0, 1, 5, 7}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11908; core 39797; terminal 2611601
  { outputClauseIndex := 11908, coreClauseIndex := 39797, terminalClauseIndex := 2611601, datum := { row := ⟨9, {0, 1, 5, 8}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 11909; core 39798; terminal 2611602
  { outputClauseIndex := 11909, coreClauseIndex := 39798, terminalClauseIndex := 2611602, datum := { row := ⟨9, {0, 1, 5, 8}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11911; core 39804; terminal 2611608
  { outputClauseIndex := 11911, coreClauseIndex := 39804, terminalClauseIndex := 2611608, datum := { row := ⟨9, {0, 1, 5, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11912; core 39805; terminal 2611609
  { outputClauseIndex := 11912, coreClauseIndex := 39805, terminalClauseIndex := 2611609, datum := { row := ⟨9, {0, 1, 5, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 11914; core 39811; terminal 2611615
  { outputClauseIndex := 11914, coreClauseIndex := 39811, terminalClauseIndex := 2611615, datum := { row := ⟨9, {0, 1, 6, 7}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 11915; core 39812; terminal 2611616
  { outputClauseIndex := 11915, coreClauseIndex := 39812, terminalClauseIndex := 2611616, datum := { row := ⟨9, {0, 1, 6, 7}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11917; core 39818; terminal 2611622
  { outputClauseIndex := 11917, coreClauseIndex := 39818, terminalClauseIndex := 2611622, datum := { row := ⟨9, {0, 1, 6, 8}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 11918; core 39819; terminal 2611623
  { outputClauseIndex := 11918, coreClauseIndex := 39819, terminalClauseIndex := 2611623, datum := { row := ⟨9, {0, 1, 6, 8}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 11920; core 39825; terminal 2611629
  { outputClauseIndex := 11920, coreClauseIndex := 39825, terminalClauseIndex := 2611629, datum := { row := ⟨9, {0, 1, 6, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11921; core 39826; terminal 2611630
  { outputClauseIndex := 11921, coreClauseIndex := 39826, terminalClauseIndex := 2611630, datum := { row := ⟨9, {0, 1, 6, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 11922; core 39830; terminal 2611636
  { outputClauseIndex := 11922, coreClauseIndex := 39830, terminalClauseIndex := 2611636, datum := { row := ⟨9, {0, 1, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 11923; core 39834; terminal 2611643
  { outputClauseIndex := 11923, coreClauseIndex := 39834, terminalClauseIndex := 2611643, datum := { row := ⟨9, {0, 1, 7, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11924; core 39839; terminal 2611650
  { outputClauseIndex := 11924, coreClauseIndex := 39839, terminalClauseIndex := 2611650, datum := { row := ⟨9, {0, 1, 8, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11925; core 39840; terminal 2611651
  { outputClauseIndex := 11925, coreClauseIndex := 39840, terminalClauseIndex := 2611651, datum := { row := ⟨9, {0, 1, 8, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 11927; core 39846; terminal 2611657
  { outputClauseIndex := 11927, coreClauseIndex := 39846, terminalClauseIndex := 2611657, datum := { row := ⟨9, {0, 2, 3, 4}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 11928; core 39847; terminal 2611658
  { outputClauseIndex := 11928, coreClauseIndex := 39847, terminalClauseIndex := 2611658, datum := { row := ⟨9, {0, 2, 3, 4}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 11930; core 39853; terminal 2611664
  { outputClauseIndex := 11930, coreClauseIndex := 39853, terminalClauseIndex := 2611664, datum := { row := ⟨9, {0, 2, 3, 5}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 11931; core 39854; terminal 2611665
  { outputClauseIndex := 11931, coreClauseIndex := 39854, terminalClauseIndex := 2611665, datum := { row := ⟨9, {0, 2, 3, 5}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 11933; core 39860; terminal 2611671
  { outputClauseIndex := 11933, coreClauseIndex := 39860, terminalClauseIndex := 2611671, datum := { row := ⟨9, {0, 2, 3, 6}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 11934; core 39861; terminal 2611672
  { outputClauseIndex := 11934, coreClauseIndex := 39861, terminalClauseIndex := 2611672, datum := { row := ⟨9, {0, 2, 3, 6}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 11936; core 39867; terminal 2611678
  { outputClauseIndex := 11936, coreClauseIndex := 39867, terminalClauseIndex := 2611678, datum := { row := ⟨9, {0, 2, 3, 7}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 11937; core 39868; terminal 2611679
  { outputClauseIndex := 11937, coreClauseIndex := 39868, terminalClauseIndex := 2611679, datum := { row := ⟨9, {0, 2, 3, 7}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 11939; core 39874; terminal 2611685
  { outputClauseIndex := 11939, coreClauseIndex := 39874, terminalClauseIndex := 2611685, datum := { row := ⟨9, {0, 2, 3, 8}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 11940; core 39875; terminal 2611686
  { outputClauseIndex := 11940, coreClauseIndex := 39875, terminalClauseIndex := 2611686, datum := { row := ⟨9, {0, 2, 3, 8}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 11942; core 39881; terminal 2611692
  { outputClauseIndex := 11942, coreClauseIndex := 39881, terminalClauseIndex := 2611692, datum := { row := ⟨9, {0, 2, 3, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 11943; core 39882; terminal 2611693
  { outputClauseIndex := 11943, coreClauseIndex := 39882, terminalClauseIndex := 2611693, datum := { row := ⟨9, {0, 2, 3, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 11945; core 39888; terminal 2611699
  { outputClauseIndex := 11945, coreClauseIndex := 39888, terminalClauseIndex := 2611699, datum := { row := ⟨9, {0, 2, 4, 5}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 11946; core 39889; terminal 2611700
  { outputClauseIndex := 11946, coreClauseIndex := 39889, terminalClauseIndex := 2611700, datum := { row := ⟨9, {0, 2, 4, 5}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 11948; core 39895; terminal 2611706
  { outputClauseIndex := 11948, coreClauseIndex := 39895, terminalClauseIndex := 2611706, datum := { row := ⟨9, {0, 2, 4, 6}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 11949; core 39896; terminal 2611707
  { outputClauseIndex := 11949, coreClauseIndex := 39896, terminalClauseIndex := 2611707, datum := { row := ⟨9, {0, 2, 4, 6}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 11951; core 39902; terminal 2611713
  { outputClauseIndex := 11951, coreClauseIndex := 39902, terminalClauseIndex := 2611713, datum := { row := ⟨9, {0, 2, 4, 7}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 11952; core 39903; terminal 2611714
  { outputClauseIndex := 11952, coreClauseIndex := 39903, terminalClauseIndex := 2611714, datum := { row := ⟨9, {0, 2, 4, 7}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 11954; core 39909; terminal 2611720
  { outputClauseIndex := 11954, coreClauseIndex := 39909, terminalClauseIndex := 2611720, datum := { row := ⟨9, {0, 2, 4, 8}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 11955; core 39910; terminal 2611721
  { outputClauseIndex := 11955, coreClauseIndex := 39910, terminalClauseIndex := 2611721, datum := { row := ⟨9, {0, 2, 4, 8}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 11957; core 39916; terminal 2611727
  { outputClauseIndex := 11957, coreClauseIndex := 39916, terminalClauseIndex := 2611727, datum := { row := ⟨9, {0, 2, 4, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 11958; core 39917; terminal 2611728
  { outputClauseIndex := 11958, coreClauseIndex := 39917, terminalClauseIndex := 2611728, datum := { row := ⟨9, {0, 2, 4, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 11959; core 39922; terminal 2611734
  { outputClauseIndex := 11959, coreClauseIndex := 39922, terminalClauseIndex := 2611734, datum := { row := ⟨9, {0, 2, 5, 6}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 11960; core 39923; terminal 2611735
  { outputClauseIndex := 11960, coreClauseIndex := 39923, terminalClauseIndex := 2611735, datum := { row := ⟨9, {0, 2, 5, 6}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 11962; core 39929; terminal 2611741
  { outputClauseIndex := 11962, coreClauseIndex := 39929, terminalClauseIndex := 2611741, datum := { row := ⟨9, {0, 2, 5, 7}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 11963; core 39930; terminal 2611742
  { outputClauseIndex := 11963, coreClauseIndex := 39930, terminalClauseIndex := 2611742, datum := { row := ⟨9, {0, 2, 5, 7}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 11965; core 39936; terminal 2611748
  { outputClauseIndex := 11965, coreClauseIndex := 39936, terminalClauseIndex := 2611748, datum := { row := ⟨9, {0, 2, 5, 8}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 11966; core 39937; terminal 2611749
  { outputClauseIndex := 11966, coreClauseIndex := 39937, terminalClauseIndex := 2611749, datum := { row := ⟨9, {0, 2, 5, 8}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 11968; core 39943; terminal 2611755
  { outputClauseIndex := 11968, coreClauseIndex := 39943, terminalClauseIndex := 2611755, datum := { row := ⟨9, {0, 2, 5, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 11969; core 39944; terminal 2611756
  { outputClauseIndex := 11969, coreClauseIndex := 39944, terminalClauseIndex := 2611756, datum := { row := ⟨9, {0, 2, 5, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 11971; core 39950; terminal 2611762
  { outputClauseIndex := 11971, coreClauseIndex := 39950, terminalClauseIndex := 2611762, datum := { row := ⟨9, {0, 2, 6, 7}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 11972; core 39951; terminal 2611763
  { outputClauseIndex := 11972, coreClauseIndex := 39951, terminalClauseIndex := 2611763, datum := { row := ⟨9, {0, 2, 6, 7}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 11974; core 39957; terminal 2611769
  { outputClauseIndex := 11974, coreClauseIndex := 39957, terminalClauseIndex := 2611769, datum := { row := ⟨9, {0, 2, 6, 8}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 11975; core 39958; terminal 2611770
  { outputClauseIndex := 11975, coreClauseIndex := 39958, terminalClauseIndex := 2611770, datum := { row := ⟨9, {0, 2, 6, 8}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 11977; core 39964; terminal 2611776
  { outputClauseIndex := 11977, coreClauseIndex := 39964, terminalClauseIndex := 2611776, datum := { row := ⟨9, {0, 2, 6, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 11978; core 39965; terminal 2611777
  { outputClauseIndex := 11978, coreClauseIndex := 39965, terminalClauseIndex := 2611777, datum := { row := ⟨9, {0, 2, 6, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 11979; core 39970; terminal 2611783
  { outputClauseIndex := 11979, coreClauseIndex := 39970, terminalClauseIndex := 2611783, datum := { row := ⟨9, {0, 2, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 11980; core 39971; terminal 2611784
  { outputClauseIndex := 11980, coreClauseIndex := 39971, terminalClauseIndex := 2611784, datum := { row := ⟨9, {0, 2, 7, 8}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 11981; core 39975; terminal 2611790
  { outputClauseIndex := 11981, coreClauseIndex := 39975, terminalClauseIndex := 2611790, datum := { row := ⟨9, {0, 2, 7, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 11982; core 39976; terminal 2611791
  { outputClauseIndex := 11982, coreClauseIndex := 39976, terminalClauseIndex := 2611791, datum := { row := ⟨9, {0, 2, 7, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 11983; core 39981; terminal 2611797
  { outputClauseIndex := 11983, coreClauseIndex := 39981, terminalClauseIndex := 2611797, datum := { row := ⟨9, {0, 2, 8, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 11984; core 39982; terminal 2611798
  { outputClauseIndex := 11984, coreClauseIndex := 39982, terminalClauseIndex := 2611798, datum := { row := ⟨9, {0, 2, 8, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 11986; core 39988; terminal 2611804
  { outputClauseIndex := 11986, coreClauseIndex := 39988, terminalClauseIndex := 2611804, datum := { row := ⟨9, {0, 3, 4, 5}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 11987; core 39989; terminal 2611805
  { outputClauseIndex := 11987, coreClauseIndex := 39989, terminalClauseIndex := 2611805, datum := { row := ⟨9, {0, 3, 4, 5}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 11989; core 39995; terminal 2611811
  { outputClauseIndex := 11989, coreClauseIndex := 39995, terminalClauseIndex := 2611811, datum := { row := ⟨9, {0, 3, 4, 6}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 11990; core 39996; terminal 2611812
  { outputClauseIndex := 11990, coreClauseIndex := 39996, terminalClauseIndex := 2611812, datum := { row := ⟨9, {0, 3, 4, 6}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 11992; core 40002; terminal 2611818
  { outputClauseIndex := 11992, coreClauseIndex := 40002, terminalClauseIndex := 2611818, datum := { row := ⟨9, {0, 3, 4, 7}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 11993; core 40003; terminal 2611819
  { outputClauseIndex := 11993, coreClauseIndex := 40003, terminalClauseIndex := 2611819, datum := { row := ⟨9, {0, 3, 4, 7}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 11995; core 40009; terminal 2611825
  { outputClauseIndex := 11995, coreClauseIndex := 40009, terminalClauseIndex := 2611825, datum := { row := ⟨9, {0, 3, 4, 8}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 11996; core 40010; terminal 2611826
  { outputClauseIndex := 11996, coreClauseIndex := 40010, terminalClauseIndex := 2611826, datum := { row := ⟨9, {0, 3, 4, 8}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 11998; core 40016; terminal 2611832
  { outputClauseIndex := 11998, coreClauseIndex := 40016, terminalClauseIndex := 2611832, datum := { row := ⟨9, {0, 3, 4, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 11999; core 40017; terminal 2611833
  { outputClauseIndex := 11999, coreClauseIndex := 40017, terminalClauseIndex := 2611833, datum := { row := ⟨9, {0, 3, 4, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 12001; core 40027; terminal 2611846
  { outputClauseIndex := 12001, coreClauseIndex := 40027, terminalClauseIndex := 2611846, datum := { row := ⟨9, {0, 3, 5, 7}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12002; core 40028; terminal 2611847
  { outputClauseIndex := 12002, coreClauseIndex := 40028, terminalClauseIndex := 2611847, datum := { row := ⟨9, {0, 3, 5, 7}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12004; core 40034; terminal 2611853
  { outputClauseIndex := 12004, coreClauseIndex := 40034, terminalClauseIndex := 2611853, datum := { row := ⟨9, {0, 3, 5, 8}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12005; core 40035; terminal 2611854
  { outputClauseIndex := 12005, coreClauseIndex := 40035, terminalClauseIndex := 2611854, datum := { row := ⟨9, {0, 3, 5, 8}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12007; core 40041; terminal 2611860
  { outputClauseIndex := 12007, coreClauseIndex := 40041, terminalClauseIndex := 2611860, datum := { row := ⟨9, {0, 3, 5, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 12008; core 40042; terminal 2611861
  { outputClauseIndex := 12008, coreClauseIndex := 40042, terminalClauseIndex := 2611861, datum := { row := ⟨9, {0, 3, 5, 10}⟩, arc := ⟨9, .right, {0}⟩ } },
  -- compact 12010; core 40048; terminal 2611867
  { outputClauseIndex := 12010, coreClauseIndex := 40048, terminalClauseIndex := 2611867, datum := { row := ⟨9, {0, 3, 6, 7}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk019_batch_valid :
    directRowArcFiniteOccurrencesChunk019.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk019, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk019 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk019.map (·.datum)

theorem directRowArcFiniteDataChunk019_batch_valid :
    directRowArcFiniteDataChunk019.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk019, datum.Valid := by
  rw [directRowArcFiniteDataChunk019]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk019_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk019_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
