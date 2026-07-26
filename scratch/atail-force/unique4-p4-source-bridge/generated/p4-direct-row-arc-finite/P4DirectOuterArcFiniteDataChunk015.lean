/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk015 : List DirectRowArcFiniteOccurrence := [
  -- compact 11120; core 37439; terminal 2608381
  { outputClauseIndex := 11120, coreClauseIndex := 37439, terminalClauseIndex := 2608381, datum := { row := ⟨6, {3, 5, 9, 10}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 11121; core 37440; terminal 2608382
  { outputClauseIndex := 11121, coreClauseIndex := 37440, terminalClauseIndex := 2608382, datum := { row := ⟨6, {3, 5, 9, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 11123; core 37446; terminal 2608388
  { outputClauseIndex := 11123, coreClauseIndex := 37446, terminalClauseIndex := 2608388, datum := { row := ⟨6, {3, 7, 8, 9}⟩, arc := ⟨6, .left, {0, 5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11124; core 37447; terminal 2608389
  { outputClauseIndex := 11124, coreClauseIndex := 37447, terminalClauseIndex := 2608389, datum := { row := ⟨6, {3, 7, 8, 9}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 11126; core 37453; terminal 2608395
  { outputClauseIndex := 11126, coreClauseIndex := 37453, terminalClauseIndex := 2608395, datum := { row := ⟨6, {3, 7, 8, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11127; core 37454; terminal 2608396
  { outputClauseIndex := 11127, coreClauseIndex := 37454, terminalClauseIndex := 2608396, datum := { row := ⟨6, {3, 7, 8, 10}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 11129; core 37460; terminal 2608402
  { outputClauseIndex := 11129, coreClauseIndex := 37460, terminalClauseIndex := 2608402, datum := { row := ⟨6, {3, 7, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11130; core 37461; terminal 2608403
  { outputClauseIndex := 11130, coreClauseIndex := 37461, terminalClauseIndex := 2608403, datum := { row := ⟨6, {3, 7, 9, 10}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11131; core 37466; terminal 2608409
  { outputClauseIndex := 11131, coreClauseIndex := 37466, terminalClauseIndex := 2608409, datum := { row := ⟨6, {3, 8, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11132; core 37467; terminal 2608410
  { outputClauseIndex := 11132, coreClauseIndex := 37467, terminalClauseIndex := 2608410, datum := { row := ⟨6, {3, 8, 9, 10}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11133; core 37472; terminal 2608416
  { outputClauseIndex := 11133, coreClauseIndex := 37472, terminalClauseIndex := 2608416, datum := { row := ⟨6, {4, 5, 7, 8}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 11134; core 37473; terminal 2608417
  { outputClauseIndex := 11134, coreClauseIndex := 37473, terminalClauseIndex := 2608417, datum := { row := ⟨6, {4, 5, 7, 8}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 11135; core 37478; terminal 2608423
  { outputClauseIndex := 11135, coreClauseIndex := 37478, terminalClauseIndex := 2608423, datum := { row := ⟨6, {4, 5, 7, 9}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 11136; core 37479; terminal 2608424
  { outputClauseIndex := 11136, coreClauseIndex := 37479, terminalClauseIndex := 2608424, datum := { row := ⟨6, {4, 5, 7, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11138; core 37489; terminal 2608437
  { outputClauseIndex := 11138, coreClauseIndex := 37489, terminalClauseIndex := 2608437, datum := { row := ⟨6, {4, 5, 8, 9}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 11139; core 37490; terminal 2608438
  { outputClauseIndex := 11139, coreClauseIndex := 37490, terminalClauseIndex := 2608438, datum := { row := ⟨6, {4, 5, 8, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11141; core 37496; terminal 2608444
  { outputClauseIndex := 11141, coreClauseIndex := 37496, terminalClauseIndex := 2608444, datum := { row := ⟨6, {4, 5, 8, 10}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 11142; core 37497; terminal 2608445
  { outputClauseIndex := 11142, coreClauseIndex := 37497, terminalClauseIndex := 2608445, datum := { row := ⟨6, {4, 5, 8, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 11144; core 37503; terminal 2608451
  { outputClauseIndex := 11144, coreClauseIndex := 37503, terminalClauseIndex := 2608451, datum := { row := ⟨6, {4, 5, 9, 10}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 11145; core 37504; terminal 2608452
  { outputClauseIndex := 11145, coreClauseIndex := 37504, terminalClauseIndex := 2608452, datum := { row := ⟨6, {4, 5, 9, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 11147; core 37510; terminal 2608458
  { outputClauseIndex := 11147, coreClauseIndex := 37510, terminalClauseIndex := 2608458, datum := { row := ⟨6, {4, 7, 8, 9}⟩, arc := ⟨6, .left, {0, 5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11148; core 37511; terminal 2608459
  { outputClauseIndex := 11148, coreClauseIndex := 37511, terminalClauseIndex := 2608459, datum := { row := ⟨6, {4, 7, 8, 9}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 11150; core 37517; terminal 2608465
  { outputClauseIndex := 11150, coreClauseIndex := 37517, terminalClauseIndex := 2608465, datum := { row := ⟨6, {4, 7, 8, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11151; core 37518; terminal 2608466
  { outputClauseIndex := 11151, coreClauseIndex := 37518, terminalClauseIndex := 2608466, datum := { row := ⟨6, {4, 7, 8, 10}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 11153; core 37524; terminal 2608472
  { outputClauseIndex := 11153, coreClauseIndex := 37524, terminalClauseIndex := 2608472, datum := { row := ⟨6, {4, 7, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11154; core 37525; terminal 2608473
  { outputClauseIndex := 11154, coreClauseIndex := 37525, terminalClauseIndex := 2608473, datum := { row := ⟨6, {4, 7, 9, 10}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11155; core 37530; terminal 2608479
  { outputClauseIndex := 11155, coreClauseIndex := 37530, terminalClauseIndex := 2608479, datum := { row := ⟨6, {4, 8, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11156; core 37531; terminal 2608480
  { outputClauseIndex := 11156, coreClauseIndex := 37531, terminalClauseIndex := 2608480, datum := { row := ⟨6, {4, 8, 9, 10}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11158; core 37537; terminal 2608486
  { outputClauseIndex := 11158, coreClauseIndex := 37537, terminalClauseIndex := 2608486, datum := { row := ⟨6, {5, 7, 8, 9}⟩, arc := ⟨6, .left, {0, 5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11159; core 37538; terminal 2608487
  { outputClauseIndex := 11159, coreClauseIndex := 37538, terminalClauseIndex := 2608487, datum := { row := ⟨6, {5, 7, 8, 9}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 11161; core 37544; terminal 2608493
  { outputClauseIndex := 11161, coreClauseIndex := 37544, terminalClauseIndex := 2608493, datum := { row := ⟨6, {5, 7, 8, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11162; core 37545; terminal 2608494
  { outputClauseIndex := 11162, coreClauseIndex := 37545, terminalClauseIndex := 2608494, datum := { row := ⟨6, {5, 7, 8, 10}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 11164; core 37551; terminal 2608500
  { outputClauseIndex := 11164, coreClauseIndex := 37551, terminalClauseIndex := 2608500, datum := { row := ⟨6, {5, 7, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11165; core 37552; terminal 2608501
  { outputClauseIndex := 11165, coreClauseIndex := 37552, terminalClauseIndex := 2608501, datum := { row := ⟨6, {5, 7, 9, 10}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11167; core 37558; terminal 2608507
  { outputClauseIndex := 11167, coreClauseIndex := 37558, terminalClauseIndex := 2608507, datum := { row := ⟨6, {5, 8, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11168; core 37559; terminal 2608508
  { outputClauseIndex := 11168, coreClauseIndex := 37559, terminalClauseIndex := 2608508, datum := { row := ⟨6, {5, 8, 9, 10}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 11169; core 37563; terminal 2608514
  { outputClauseIndex := 11169, coreClauseIndex := 37563, terminalClauseIndex := 2608514, datum := { row := ⟨6, {7, 8, 9, 10}⟩, arc := ⟨6, .left, {0, 5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11171; core 37569; terminal 2608521
  { outputClauseIndex := 11171, coreClauseIndex := 37569, terminalClauseIndex := 2608521, datum := { row := ⟨7, {0, 1, 2, 3}⟩, arc := ⟨7, .left, {4, 5, 6, 7}⟩ } },
  -- compact 11172; core 37570; terminal 2608522
  { outputClauseIndex := 11172, coreClauseIndex := 37570, terminalClauseIndex := 2608522, datum := { row := ⟨7, {0, 1, 2, 3}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11174; core 37576; terminal 2608528
  { outputClauseIndex := 11174, coreClauseIndex := 37576, terminalClauseIndex := 2608528, datum := { row := ⟨7, {0, 1, 2, 4}⟩, arc := ⟨7, .left, {4, 5, 6, 7}⟩ } },
  -- compact 11175; core 37577; terminal 2608529
  { outputClauseIndex := 11175, coreClauseIndex := 37577, terminalClauseIndex := 2608529, datum := { row := ⟨7, {0, 1, 2, 4}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11177; core 37583; terminal 2608535
  { outputClauseIndex := 11177, coreClauseIndex := 37583, terminalClauseIndex := 2608535, datum := { row := ⟨7, {0, 1, 2, 5}⟩, arc := ⟨7, .left, {4, 5, 6, 7}⟩ } },
  -- compact 11178; core 37584; terminal 2608536
  { outputClauseIndex := 11178, coreClauseIndex := 37584, terminalClauseIndex := 2608536, datum := { row := ⟨7, {0, 1, 2, 5}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11180; core 37590; terminal 2608542
  { outputClauseIndex := 11180, coreClauseIndex := 37590, terminalClauseIndex := 2608542, datum := { row := ⟨7, {0, 1, 2, 6}⟩, arc := ⟨7, .left, {4, 5, 6, 7}⟩ } },
  -- compact 11181; core 37591; terminal 2608543
  { outputClauseIndex := 11181, coreClauseIndex := 37591, terminalClauseIndex := 2608543, datum := { row := ⟨7, {0, 1, 2, 6}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11183; core 37597; terminal 2608570
  { outputClauseIndex := 11183, coreClauseIndex := 37597, terminalClauseIndex := 2608570, datum := { row := ⟨7, {0, 1, 3, 4}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11184; core 37598; terminal 2608571
  { outputClauseIndex := 11184, coreClauseIndex := 37598, terminalClauseIndex := 2608571, datum := { row := ⟨7, {0, 1, 3, 4}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11186; core 37604; terminal 2608577
  { outputClauseIndex := 11186, coreClauseIndex := 37604, terminalClauseIndex := 2608577, datum := { row := ⟨7, {0, 1, 3, 5}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11187; core 37605; terminal 2608578
  { outputClauseIndex := 11187, coreClauseIndex := 37605, terminalClauseIndex := 2608578, datum := { row := ⟨7, {0, 1, 3, 5}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11189; core 37611; terminal 2608584
  { outputClauseIndex := 11189, coreClauseIndex := 37611, terminalClauseIndex := 2608584, datum := { row := ⟨7, {0, 1, 3, 6}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11190; core 37612; terminal 2608585
  { outputClauseIndex := 11190, coreClauseIndex := 37612, terminalClauseIndex := 2608585, datum := { row := ⟨7, {0, 1, 3, 6}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11192; core 37658; terminal 2608717
  { outputClauseIndex := 11192, coreClauseIndex := 37658, terminalClauseIndex := 2608717, datum := { row := ⟨7, {0, 2, 3, 4}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11193; core 37659; terminal 2608718
  { outputClauseIndex := 11193, coreClauseIndex := 37659, terminalClauseIndex := 2608718, datum := { row := ⟨7, {0, 2, 3, 4}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11195; core 37665; terminal 2608724
  { outputClauseIndex := 11195, coreClauseIndex := 37665, terminalClauseIndex := 2608724, datum := { row := ⟨7, {0, 2, 3, 5}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11196; core 37666; terminal 2608725
  { outputClauseIndex := 11196, coreClauseIndex := 37666, terminalClauseIndex := 2608725, datum := { row := ⟨7, {0, 2, 3, 5}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11198; core 37672; terminal 2608731
  { outputClauseIndex := 11198, coreClauseIndex := 37672, terminalClauseIndex := 2608731, datum := { row := ⟨7, {0, 2, 3, 6}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11199; core 37673; terminal 2608732
  { outputClauseIndex := 11199, coreClauseIndex := 37673, terminalClauseIndex := 2608732, datum := { row := ⟨7, {0, 2, 3, 6}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11200; core 37684; terminal 2608760
  { outputClauseIndex := 11200, coreClauseIndex := 37684, terminalClauseIndex := 2608760, datum := { row := ⟨7, {0, 2, 4, 5}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11201; core 37689; terminal 2608767
  { outputClauseIndex := 11201, coreClauseIndex := 37689, terminalClauseIndex := 2608767, datum := { row := ⟨7, {0, 2, 4, 6}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11202; core 37700; terminal 2608795
  { outputClauseIndex := 11202, coreClauseIndex := 37700, terminalClauseIndex := 2608795, datum := { row := ⟨7, {0, 2, 5, 6}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11204; core 37817; terminal 2609109
  { outputClauseIndex := 11204, coreClauseIndex := 37817, terminalClauseIndex := 2609109, datum := { row := ⟨7, {1, 2, 3, 4}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11205; core 37818; terminal 2609110
  { outputClauseIndex := 11205, coreClauseIndex := 37818, terminalClauseIndex := 2609110, datum := { row := ⟨7, {1, 2, 3, 4}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11207; core 37824; terminal 2609116
  { outputClauseIndex := 11207, coreClauseIndex := 37824, terminalClauseIndex := 2609116, datum := { row := ⟨7, {1, 2, 3, 5}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11208; core 37825; terminal 2609117
  { outputClauseIndex := 11208, coreClauseIndex := 37825, terminalClauseIndex := 2609117, datum := { row := ⟨7, {1, 2, 3, 5}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11210; core 37831; terminal 2609123
  { outputClauseIndex := 11210, coreClauseIndex := 37831, terminalClauseIndex := 2609123, datum := { row := ⟨7, {1, 2, 3, 6}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11211; core 37832; terminal 2609124
  { outputClauseIndex := 11211, coreClauseIndex := 37832, terminalClauseIndex := 2609124, datum := { row := ⟨7, {1, 2, 3, 6}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11213; core 37838; terminal 2609130
  { outputClauseIndex := 11213, coreClauseIndex := 37838, terminalClauseIndex := 2609130, datum := { row := ⟨7, {1, 2, 3, 8}⟩, arc := ⟨7, .left, {4, 5, 6, 7}⟩ } },
  -- compact 11214; core 37839; terminal 2609131
  { outputClauseIndex := 11214, coreClauseIndex := 37839, terminalClauseIndex := 2609131, datum := { row := ⟨7, {1, 2, 3, 8}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11216; core 37845; terminal 2609137
  { outputClauseIndex := 11216, coreClauseIndex := 37845, terminalClauseIndex := 2609137, datum := { row := ⟨7, {1, 2, 3, 9}⟩, arc := ⟨7, .left, {4, 5, 6, 7}⟩ } },
  -- compact 11217; core 37846; terminal 2609138
  { outputClauseIndex := 11217, coreClauseIndex := 37846, terminalClauseIndex := 2609138, datum := { row := ⟨7, {1, 2, 3, 9}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11219; core 37852; terminal 2609144
  { outputClauseIndex := 11219, coreClauseIndex := 37852, terminalClauseIndex := 2609144, datum := { row := ⟨7, {1, 2, 3, 10}⟩, arc := ⟨7, .left, {4, 5, 6, 7}⟩ } },
  -- compact 11220; core 37853; terminal 2609145
  { outputClauseIndex := 11220, coreClauseIndex := 37853, terminalClauseIndex := 2609145, datum := { row := ⟨7, {1, 2, 3, 10}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11221; core 37858; terminal 2609152
  { outputClauseIndex := 11221, coreClauseIndex := 37858, terminalClauseIndex := 2609152, datum := { row := ⟨7, {1, 2, 4, 5}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11222; core 37863; terminal 2609159
  { outputClauseIndex := 11222, coreClauseIndex := 37863, terminalClauseIndex := 2609159, datum := { row := ⟨7, {1, 2, 4, 6}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11224; core 37869; terminal 2609165
  { outputClauseIndex := 11224, coreClauseIndex := 37869, terminalClauseIndex := 2609165, datum := { row := ⟨7, {1, 2, 4, 8}⟩, arc := ⟨7, .left, {4, 5, 6, 7}⟩ } },
  -- compact 11225; core 37870; terminal 2609166
  { outputClauseIndex := 11225, coreClauseIndex := 37870, terminalClauseIndex := 2609166, datum := { row := ⟨7, {1, 2, 4, 8}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11227; core 37876; terminal 2609172
  { outputClauseIndex := 11227, coreClauseIndex := 37876, terminalClauseIndex := 2609172, datum := { row := ⟨7, {1, 2, 4, 9}⟩, arc := ⟨7, .left, {4, 5, 6, 7}⟩ } },
  -- compact 11228; core 37877; terminal 2609173
  { outputClauseIndex := 11228, coreClauseIndex := 37877, terminalClauseIndex := 2609173, datum := { row := ⟨7, {1, 2, 4, 9}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11230; core 37883; terminal 2609179
  { outputClauseIndex := 11230, coreClauseIndex := 37883, terminalClauseIndex := 2609179, datum := { row := ⟨7, {1, 2, 4, 10}⟩, arc := ⟨7, .left, {4, 5, 6, 7}⟩ } },
  -- compact 11231; core 37884; terminal 2609180
  { outputClauseIndex := 11231, coreClauseIndex := 37884, terminalClauseIndex := 2609180, datum := { row := ⟨7, {1, 2, 4, 10}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11232; core 37888; terminal 2609187
  { outputClauseIndex := 11232, coreClauseIndex := 37888, terminalClauseIndex := 2609187, datum := { row := ⟨7, {1, 2, 5, 6}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11234; core 37894; terminal 2609193
  { outputClauseIndex := 11234, coreClauseIndex := 37894, terminalClauseIndex := 2609193, datum := { row := ⟨7, {1, 2, 5, 8}⟩, arc := ⟨7, .left, {4, 5, 6, 7}⟩ } },
  -- compact 11235; core 37895; terminal 2609194
  { outputClauseIndex := 11235, coreClauseIndex := 37895, terminalClauseIndex := 2609194, datum := { row := ⟨7, {1, 2, 5, 8}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11237; core 37901; terminal 2609200
  { outputClauseIndex := 11237, coreClauseIndex := 37901, terminalClauseIndex := 2609200, datum := { row := ⟨7, {1, 2, 5, 9}⟩, arc := ⟨7, .left, {4, 5, 6, 7}⟩ } },
  -- compact 11238; core 37902; terminal 2609201
  { outputClauseIndex := 11238, coreClauseIndex := 37902, terminalClauseIndex := 2609201, datum := { row := ⟨7, {1, 2, 5, 9}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11240; core 37908; terminal 2609207
  { outputClauseIndex := 11240, coreClauseIndex := 37908, terminalClauseIndex := 2609207, datum := { row := ⟨7, {1, 2, 5, 10}⟩, arc := ⟨7, .left, {4, 5, 6, 7}⟩ } },
  -- compact 11241; core 37909; terminal 2609208
  { outputClauseIndex := 11241, coreClauseIndex := 37909, terminalClauseIndex := 2609208, datum := { row := ⟨7, {1, 2, 5, 10}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11243; core 37915; terminal 2609214
  { outputClauseIndex := 11243, coreClauseIndex := 37915, terminalClauseIndex := 2609214, datum := { row := ⟨7, {1, 2, 6, 8}⟩, arc := ⟨7, .left, {4, 5, 6, 7}⟩ } },
  -- compact 11244; core 37916; terminal 2609215
  { outputClauseIndex := 11244, coreClauseIndex := 37916, terminalClauseIndex := 2609215, datum := { row := ⟨7, {1, 2, 6, 8}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11246; core 37922; terminal 2609221
  { outputClauseIndex := 11246, coreClauseIndex := 37922, terminalClauseIndex := 2609221, datum := { row := ⟨7, {1, 2, 6, 9}⟩, arc := ⟨7, .left, {4, 5, 6, 7}⟩ } },
  -- compact 11247; core 37923; terminal 2609222
  { outputClauseIndex := 11247, coreClauseIndex := 37923, terminalClauseIndex := 2609222, datum := { row := ⟨7, {1, 2, 6, 9}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11249; core 37929; terminal 2609228
  { outputClauseIndex := 11249, coreClauseIndex := 37929, terminalClauseIndex := 2609228, datum := { row := ⟨7, {1, 2, 6, 10}⟩, arc := ⟨7, .left, {4, 5, 6, 7}⟩ } },
  -- compact 11250; core 37930; terminal 2609229
  { outputClauseIndex := 11250, coreClauseIndex := 37930, terminalClauseIndex := 2609229, datum := { row := ⟨7, {1, 2, 6, 10}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11252; core 37946; terminal 2609270
  { outputClauseIndex := 11252, coreClauseIndex := 37946, terminalClauseIndex := 2609270, datum := { row := ⟨7, {1, 3, 4, 8}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11253; core 37947; terminal 2609271
  { outputClauseIndex := 11253, coreClauseIndex := 37947, terminalClauseIndex := 2609271, datum := { row := ⟨7, {1, 3, 4, 8}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11255; core 37953; terminal 2609277
  { outputClauseIndex := 11255, coreClauseIndex := 37953, terminalClauseIndex := 2609277, datum := { row := ⟨7, {1, 3, 4, 9}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11256; core 37954; terminal 2609278
  { outputClauseIndex := 11256, coreClauseIndex := 37954, terminalClauseIndex := 2609278, datum := { row := ⟨7, {1, 3, 4, 9}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11258; core 37960; terminal 2609284
  { outputClauseIndex := 11258, coreClauseIndex := 37960, terminalClauseIndex := 2609284, datum := { row := ⟨7, {1, 3, 4, 10}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11259; core 37961; terminal 2609285
  { outputClauseIndex := 11259, coreClauseIndex := 37961, terminalClauseIndex := 2609285, datum := { row := ⟨7, {1, 3, 4, 10}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11261; core 37968; terminal 2609298
  { outputClauseIndex := 11261, coreClauseIndex := 37968, terminalClauseIndex := 2609298, datum := { row := ⟨7, {1, 3, 5, 8}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11262; core 37969; terminal 2609299
  { outputClauseIndex := 11262, coreClauseIndex := 37969, terminalClauseIndex := 2609299, datum := { row := ⟨7, {1, 3, 5, 8}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11264; core 37975; terminal 2609305
  { outputClauseIndex := 11264, coreClauseIndex := 37975, terminalClauseIndex := 2609305, datum := { row := ⟨7, {1, 3, 5, 9}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11265; core 37976; terminal 2609306
  { outputClauseIndex := 11265, coreClauseIndex := 37976, terminalClauseIndex := 2609306, datum := { row := ⟨7, {1, 3, 5, 9}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11267; core 37982; terminal 2609312
  { outputClauseIndex := 11267, coreClauseIndex := 37982, terminalClauseIndex := 2609312, datum := { row := ⟨7, {1, 3, 5, 10}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11268; core 37983; terminal 2609313
  { outputClauseIndex := 11268, coreClauseIndex := 37983, terminalClauseIndex := 2609313, datum := { row := ⟨7, {1, 3, 5, 10}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11270; core 37989; terminal 2609319
  { outputClauseIndex := 11270, coreClauseIndex := 37989, terminalClauseIndex := 2609319, datum := { row := ⟨7, {1, 3, 6, 8}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11271; core 37990; terminal 2609320
  { outputClauseIndex := 11271, coreClauseIndex := 37990, terminalClauseIndex := 2609320, datum := { row := ⟨7, {1, 3, 6, 8}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11273; core 37996; terminal 2609326
  { outputClauseIndex := 11273, coreClauseIndex := 37996, terminalClauseIndex := 2609326, datum := { row := ⟨7, {1, 3, 6, 9}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11274; core 37997; terminal 2609327
  { outputClauseIndex := 11274, coreClauseIndex := 37997, terminalClauseIndex := 2609327, datum := { row := ⟨7, {1, 3, 6, 9}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11276; core 38003; terminal 2609333
  { outputClauseIndex := 11276, coreClauseIndex := 38003, terminalClauseIndex := 2609333, datum := { row := ⟨7, {1, 3, 6, 10}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11277; core 38004; terminal 2609334
  { outputClauseIndex := 11277, coreClauseIndex := 38004, terminalClauseIndex := 2609334, datum := { row := ⟨7, {1, 3, 6, 10}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11278; core 38026; terminal 2609383
  { outputClauseIndex := 11278, coreClauseIndex := 38026, terminalClauseIndex := 2609383, datum := { row := ⟨7, {1, 4, 5, 10}⟩, arc := ⟨7, .right, {0, 1, 2, 10}⟩ } },
  -- compact 11280; core 38073; terminal 2609515
  { outputClauseIndex := 11280, coreClauseIndex := 38073, terminalClauseIndex := 2609515, datum := { row := ⟨7, {2, 3, 4, 8}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11281; core 38074; terminal 2609516
  { outputClauseIndex := 11281, coreClauseIndex := 38074, terminalClauseIndex := 2609516, datum := { row := ⟨7, {2, 3, 4, 8}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11283; core 38080; terminal 2609522
  { outputClauseIndex := 11283, coreClauseIndex := 38080, terminalClauseIndex := 2609522, datum := { row := ⟨7, {2, 3, 4, 9}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11284; core 38081; terminal 2609523
  { outputClauseIndex := 11284, coreClauseIndex := 38081, terminalClauseIndex := 2609523, datum := { row := ⟨7, {2, 3, 4, 9}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11286; core 38087; terminal 2609529
  { outputClauseIndex := 11286, coreClauseIndex := 38087, terminalClauseIndex := 2609529, datum := { row := ⟨7, {2, 3, 4, 10}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11287; core 38088; terminal 2609530
  { outputClauseIndex := 11287, coreClauseIndex := 38088, terminalClauseIndex := 2609530, datum := { row := ⟨7, {2, 3, 4, 10}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11289; core 38095; terminal 2609543
  { outputClauseIndex := 11289, coreClauseIndex := 38095, terminalClauseIndex := 2609543, datum := { row := ⟨7, {2, 3, 5, 8}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11290; core 38096; terminal 2609544
  { outputClauseIndex := 11290, coreClauseIndex := 38096, terminalClauseIndex := 2609544, datum := { row := ⟨7, {2, 3, 5, 8}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11292; core 38102; terminal 2609550
  { outputClauseIndex := 11292, coreClauseIndex := 38102, terminalClauseIndex := 2609550, datum := { row := ⟨7, {2, 3, 5, 9}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11293; core 38103; terminal 2609551
  { outputClauseIndex := 11293, coreClauseIndex := 38103, terminalClauseIndex := 2609551, datum := { row := ⟨7, {2, 3, 5, 9}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11295; core 38109; terminal 2609557
  { outputClauseIndex := 11295, coreClauseIndex := 38109, terminalClauseIndex := 2609557, datum := { row := ⟨7, {2, 3, 5, 10}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11296; core 38110; terminal 2609558
  { outputClauseIndex := 11296, coreClauseIndex := 38110, terminalClauseIndex := 2609558, datum := { row := ⟨7, {2, 3, 5, 10}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11298; core 38116; terminal 2609564
  { outputClauseIndex := 11298, coreClauseIndex := 38116, terminalClauseIndex := 2609564, datum := { row := ⟨7, {2, 3, 6, 8}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11299; core 38117; terminal 2609565
  { outputClauseIndex := 11299, coreClauseIndex := 38117, terminalClauseIndex := 2609565, datum := { row := ⟨7, {2, 3, 6, 8}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11301; core 38123; terminal 2609571
  { outputClauseIndex := 11301, coreClauseIndex := 38123, terminalClauseIndex := 2609571, datum := { row := ⟨7, {2, 3, 6, 9}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11302; core 38124; terminal 2609572
  { outputClauseIndex := 11302, coreClauseIndex := 38124, terminalClauseIndex := 2609572, datum := { row := ⟨7, {2, 3, 6, 9}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk015_batch_valid :
    directRowArcFiniteOccurrencesChunk015.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk015, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk015 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk015.map (·.datum)

theorem directRowArcFiniteDataChunk015_batch_valid :
    directRowArcFiniteDataChunk015.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk015, datum.Valid := by
  rw [directRowArcFiniteDataChunk015]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk015_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk015_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
