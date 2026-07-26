/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk021 : List DirectRowArcFiniteOccurrence := [
  -- compact 12181; core 40493; terminal 2612351
  { outputClauseIndex := 12181, coreClauseIndex := 40493, terminalClauseIndex := 2612351, datum := { row := ⟨9, {1, 4, 7, 8}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12183; core 40499; terminal 2612357
  { outputClauseIndex := 12183, coreClauseIndex := 40499, terminalClauseIndex := 2612357, datum := { row := ⟨9, {1, 4, 7, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12184; core 40500; terminal 2612358
  { outputClauseIndex := 12184, coreClauseIndex := 40500, terminalClauseIndex := 2612358, datum := { row := ⟨9, {1, 4, 7, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12186; core 40506; terminal 2612364
  { outputClauseIndex := 12186, coreClauseIndex := 40506, terminalClauseIndex := 2612364, datum := { row := ⟨9, {1, 4, 8, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12187; core 40507; terminal 2612365
  { outputClauseIndex := 12187, coreClauseIndex := 40507, terminalClauseIndex := 2612365, datum := { row := ⟨9, {1, 4, 8, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12188; core 40512; terminal 2612372
  { outputClauseIndex := 12188, coreClauseIndex := 40512, terminalClauseIndex := 2612372, datum := { row := ⟨9, {1, 5, 6, 7}⟩, arc := ⟨9, .right, {0, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12189; core 40520; terminal 2612385
  { outputClauseIndex := 12189, coreClauseIndex := 40520, terminalClauseIndex := 2612385, datum := { row := ⟨9, {1, 5, 6, 10}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12191; core 40526; terminal 2612392
  { outputClauseIndex := 12191, coreClauseIndex := 40526, terminalClauseIndex := 2612392, datum := { row := ⟨9, {1, 5, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12192; core 40527; terminal 2612393
  { outputClauseIndex := 12192, coreClauseIndex := 40527, terminalClauseIndex := 2612393, datum := { row := ⟨9, {1, 5, 7, 8}⟩, arc := ⟨9, .right, {0, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12194; core 40533; terminal 2612399
  { outputClauseIndex := 12194, coreClauseIndex := 40533, terminalClauseIndex := 2612399, datum := { row := ⟨9, {1, 5, 7, 10}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12195; core 40534; terminal 2612400
  { outputClauseIndex := 12195, coreClauseIndex := 40534, terminalClauseIndex := 2612400, datum := { row := ⟨9, {1, 5, 7, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12197; core 40540; terminal 2612406
  { outputClauseIndex := 12197, coreClauseIndex := 40540, terminalClauseIndex := 2612406, datum := { row := ⟨9, {1, 5, 8, 10}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12198; core 40541; terminal 2612407
  { outputClauseIndex := 12198, coreClauseIndex := 40541, terminalClauseIndex := 2612407, datum := { row := ⟨9, {1, 5, 8, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12200; core 40547; terminal 2612413
  { outputClauseIndex := 12200, coreClauseIndex := 40547, terminalClauseIndex := 2612413, datum := { row := ⟨9, {1, 6, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12201; core 40548; terminal 2612414
  { outputClauseIndex := 12201, coreClauseIndex := 40548, terminalClauseIndex := 2612414, datum := { row := ⟨9, {1, 6, 7, 8}⟩, arc := ⟨9, .right, {0, 5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12203; core 40554; terminal 2612420
  { outputClauseIndex := 12203, coreClauseIndex := 40554, terminalClauseIndex := 2612420, datum := { row := ⟨9, {1, 6, 7, 10}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12204; core 40555; terminal 2612421
  { outputClauseIndex := 12204, coreClauseIndex := 40555, terminalClauseIndex := 2612421, datum := { row := ⟨9, {1, 6, 7, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12206; core 40561; terminal 2612427
  { outputClauseIndex := 12206, coreClauseIndex := 40561, terminalClauseIndex := 2612427, datum := { row := ⟨9, {1, 6, 8, 10}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12207; core 40562; terminal 2612428
  { outputClauseIndex := 12207, coreClauseIndex := 40562, terminalClauseIndex := 2612428, datum := { row := ⟨9, {1, 6, 8, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12208; core 40567; terminal 2612434
  { outputClauseIndex := 12208, coreClauseIndex := 40567, terminalClauseIndex := 2612434, datum := { row := ⟨9, {1, 7, 8, 10}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12209; core 40568; terminal 2612435
  { outputClauseIndex := 12209, coreClauseIndex := 40568, terminalClauseIndex := 2612435, datum := { row := ⟨9, {1, 7, 8, 10}⟩, arc := ⟨9, .right, {0, 10}⟩ } },
  -- compact 12210; core 40573; terminal 2612441
  { outputClauseIndex := 12210, coreClauseIndex := 40573, terminalClauseIndex := 2612441, datum := { row := ⟨9, {2, 3, 4, 5}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12211; core 40574; terminal 2612442
  { outputClauseIndex := 12211, coreClauseIndex := 40574, terminalClauseIndex := 2612442, datum := { row := ⟨9, {2, 3, 4, 5}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12212; core 40579; terminal 2612448
  { outputClauseIndex := 12212, coreClauseIndex := 40579, terminalClauseIndex := 2612448, datum := { row := ⟨9, {2, 3, 4, 6}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12213; core 40580; terminal 2612449
  { outputClauseIndex := 12213, coreClauseIndex := 40580, terminalClauseIndex := 2612449, datum := { row := ⟨9, {2, 3, 4, 6}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12215; core 40586; terminal 2612455
  { outputClauseIndex := 12215, coreClauseIndex := 40586, terminalClauseIndex := 2612455, datum := { row := ⟨9, {2, 3, 4, 7}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12216; core 40587; terminal 2612456
  { outputClauseIndex := 12216, coreClauseIndex := 40587, terminalClauseIndex := 2612456, datum := { row := ⟨9, {2, 3, 4, 7}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12218; core 40593; terminal 2612462
  { outputClauseIndex := 12218, coreClauseIndex := 40593, terminalClauseIndex := 2612462, datum := { row := ⟨9, {2, 3, 4, 8}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12219; core 40594; terminal 2612463
  { outputClauseIndex := 12219, coreClauseIndex := 40594, terminalClauseIndex := 2612463, datum := { row := ⟨9, {2, 3, 4, 8}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12221; core 40600; terminal 2612469
  { outputClauseIndex := 12221, coreClauseIndex := 40600, terminalClauseIndex := 2612469, datum := { row := ⟨9, {2, 3, 4, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 12222; core 40601; terminal 2612470
  { outputClauseIndex := 12222, coreClauseIndex := 40601, terminalClauseIndex := 2612470, datum := { row := ⟨9, {2, 3, 4, 10}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12223; core 40605; terminal 2612477
  { outputClauseIndex := 12223, coreClauseIndex := 40605, terminalClauseIndex := 2612477, datum := { row := ⟨9, {2, 3, 5, 6}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12225; core 40611; terminal 2612483
  { outputClauseIndex := 12225, coreClauseIndex := 40611, terminalClauseIndex := 2612483, datum := { row := ⟨9, {2, 3, 5, 7}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12226; core 40612; terminal 2612484
  { outputClauseIndex := 12226, coreClauseIndex := 40612, terminalClauseIndex := 2612484, datum := { row := ⟨9, {2, 3, 5, 7}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12228; core 40618; terminal 2612490
  { outputClauseIndex := 12228, coreClauseIndex := 40618, terminalClauseIndex := 2612490, datum := { row := ⟨9, {2, 3, 5, 8}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12229; core 40619; terminal 2612491
  { outputClauseIndex := 12229, coreClauseIndex := 40619, terminalClauseIndex := 2612491, datum := { row := ⟨9, {2, 3, 5, 8}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12231; core 40625; terminal 2612497
  { outputClauseIndex := 12231, coreClauseIndex := 40625, terminalClauseIndex := 2612497, datum := { row := ⟨9, {2, 3, 5, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 12232; core 40626; terminal 2612498
  { outputClauseIndex := 12232, coreClauseIndex := 40626, terminalClauseIndex := 2612498, datum := { row := ⟨9, {2, 3, 5, 10}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12234; core 40632; terminal 2612504
  { outputClauseIndex := 12234, coreClauseIndex := 40632, terminalClauseIndex := 2612504, datum := { row := ⟨9, {2, 3, 6, 7}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12235; core 40633; terminal 2612505
  { outputClauseIndex := 12235, coreClauseIndex := 40633, terminalClauseIndex := 2612505, datum := { row := ⟨9, {2, 3, 6, 7}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12237; core 40639; terminal 2612511
  { outputClauseIndex := 12237, coreClauseIndex := 40639, terminalClauseIndex := 2612511, datum := { row := ⟨9, {2, 3, 6, 8}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12238; core 40640; terminal 2612512
  { outputClauseIndex := 12238, coreClauseIndex := 40640, terminalClauseIndex := 2612512, datum := { row := ⟨9, {2, 3, 6, 8}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12240; core 40646; terminal 2612518
  { outputClauseIndex := 12240, coreClauseIndex := 40646, terminalClauseIndex := 2612518, datum := { row := ⟨9, {2, 3, 6, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 12241; core 40647; terminal 2612519
  { outputClauseIndex := 12241, coreClauseIndex := 40647, terminalClauseIndex := 2612519, datum := { row := ⟨9, {2, 3, 6, 10}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12243; core 40653; terminal 2612525
  { outputClauseIndex := 12243, coreClauseIndex := 40653, terminalClauseIndex := 2612525, datum := { row := ⟨9, {2, 3, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12244; core 40654; terminal 2612526
  { outputClauseIndex := 12244, coreClauseIndex := 40654, terminalClauseIndex := 2612526, datum := { row := ⟨9, {2, 3, 7, 8}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12246; core 40660; terminal 2612532
  { outputClauseIndex := 12246, coreClauseIndex := 40660, terminalClauseIndex := 2612532, datum := { row := ⟨9, {2, 3, 7, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 12247; core 40661; terminal 2612533
  { outputClauseIndex := 12247, coreClauseIndex := 40661, terminalClauseIndex := 2612533, datum := { row := ⟨9, {2, 3, 7, 10}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12249; core 40667; terminal 2612539
  { outputClauseIndex := 12249, coreClauseIndex := 40667, terminalClauseIndex := 2612539, datum := { row := ⟨9, {2, 3, 8, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5, 6}⟩ } },
  -- compact 12250; core 40668; terminal 2612540
  { outputClauseIndex := 12250, coreClauseIndex := 40668, terminalClauseIndex := 2612540, datum := { row := ⟨9, {2, 3, 8, 10}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12251; core 40673; terminal 2612547
  { outputClauseIndex := 12251, coreClauseIndex := 40673, terminalClauseIndex := 2612547, datum := { row := ⟨9, {2, 4, 5, 6}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12253; core 40679; terminal 2612553
  { outputClauseIndex := 12253, coreClauseIndex := 40679, terminalClauseIndex := 2612553, datum := { row := ⟨9, {2, 4, 5, 7}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12254; core 40680; terminal 2612554
  { outputClauseIndex := 12254, coreClauseIndex := 40680, terminalClauseIndex := 2612554, datum := { row := ⟨9, {2, 4, 5, 7}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12256; core 40686; terminal 2612560
  { outputClauseIndex := 12256, coreClauseIndex := 40686, terminalClauseIndex := 2612560, datum := { row := ⟨9, {2, 4, 5, 8}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12257; core 40687; terminal 2612561
  { outputClauseIndex := 12257, coreClauseIndex := 40687, terminalClauseIndex := 2612561, datum := { row := ⟨9, {2, 4, 5, 8}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12259; core 40693; terminal 2612567
  { outputClauseIndex := 12259, coreClauseIndex := 40693, terminalClauseIndex := 2612567, datum := { row := ⟨9, {2, 4, 5, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12260; core 40694; terminal 2612568
  { outputClauseIndex := 12260, coreClauseIndex := 40694, terminalClauseIndex := 2612568, datum := { row := ⟨9, {2, 4, 5, 10}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12262; core 40700; terminal 2612574
  { outputClauseIndex := 12262, coreClauseIndex := 40700, terminalClauseIndex := 2612574, datum := { row := ⟨9, {2, 4, 6, 7}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12263; core 40701; terminal 2612575
  { outputClauseIndex := 12263, coreClauseIndex := 40701, terminalClauseIndex := 2612575, datum := { row := ⟨9, {2, 4, 6, 7}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12265; core 40707; terminal 2612581
  { outputClauseIndex := 12265, coreClauseIndex := 40707, terminalClauseIndex := 2612581, datum := { row := ⟨9, {2, 4, 6, 8}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12266; core 40708; terminal 2612582
  { outputClauseIndex := 12266, coreClauseIndex := 40708, terminalClauseIndex := 2612582, datum := { row := ⟨9, {2, 4, 6, 8}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12268; core 40714; terminal 2612588
  { outputClauseIndex := 12268, coreClauseIndex := 40714, terminalClauseIndex := 2612588, datum := { row := ⟨9, {2, 4, 6, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12269; core 40715; terminal 2612589
  { outputClauseIndex := 12269, coreClauseIndex := 40715, terminalClauseIndex := 2612589, datum := { row := ⟨9, {2, 4, 6, 10}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12271; core 40721; terminal 2612595
  { outputClauseIndex := 12271, coreClauseIndex := 40721, terminalClauseIndex := 2612595, datum := { row := ⟨9, {2, 4, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12272; core 40722; terminal 2612596
  { outputClauseIndex := 12272, coreClauseIndex := 40722, terminalClauseIndex := 2612596, datum := { row := ⟨9, {2, 4, 7, 8}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12274; core 40728; terminal 2612602
  { outputClauseIndex := 12274, coreClauseIndex := 40728, terminalClauseIndex := 2612602, datum := { row := ⟨9, {2, 4, 7, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12275; core 40729; terminal 2612603
  { outputClauseIndex := 12275, coreClauseIndex := 40729, terminalClauseIndex := 2612603, datum := { row := ⟨9, {2, 4, 7, 10}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12277; core 40735; terminal 2612609
  { outputClauseIndex := 12277, coreClauseIndex := 40735, terminalClauseIndex := 2612609, datum := { row := ⟨9, {2, 4, 8, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12278; core 40736; terminal 2612610
  { outputClauseIndex := 12278, coreClauseIndex := 40736, terminalClauseIndex := 2612610, datum := { row := ⟨9, {2, 4, 8, 10}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12279; core 40746; terminal 2612630
  { outputClauseIndex := 12279, coreClauseIndex := 40746, terminalClauseIndex := 2612630, datum := { row := ⟨9, {2, 5, 6, 10}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12280; core 40747; terminal 2612631
  { outputClauseIndex := 12280, coreClauseIndex := 40747, terminalClauseIndex := 2612631, datum := { row := ⟨9, {2, 5, 6, 10}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12282; core 40753; terminal 2612637
  { outputClauseIndex := 12282, coreClauseIndex := 40753, terminalClauseIndex := 2612637, datum := { row := ⟨9, {2, 5, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12283; core 40754; terminal 2612638
  { outputClauseIndex := 12283, coreClauseIndex := 40754, terminalClauseIndex := 2612638, datum := { row := ⟨9, {2, 5, 7, 8}⟩, arc := ⟨9, .right, {0, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12285; core 40760; terminal 2612644
  { outputClauseIndex := 12285, coreClauseIndex := 40760, terminalClauseIndex := 2612644, datum := { row := ⟨9, {2, 5, 7, 10}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12286; core 40761; terminal 2612645
  { outputClauseIndex := 12286, coreClauseIndex := 40761, terminalClauseIndex := 2612645, datum := { row := ⟨9, {2, 5, 7, 10}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12288; core 40767; terminal 2612651
  { outputClauseIndex := 12288, coreClauseIndex := 40767, terminalClauseIndex := 2612651, datum := { row := ⟨9, {2, 5, 8, 10}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12289; core 40768; terminal 2612652
  { outputClauseIndex := 12289, coreClauseIndex := 40768, terminalClauseIndex := 2612652, datum := { row := ⟨9, {2, 5, 8, 10}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12291; core 40774; terminal 2612658
  { outputClauseIndex := 12291, coreClauseIndex := 40774, terminalClauseIndex := 2612658, datum := { row := ⟨9, {2, 6, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12292; core 40775; terminal 2612659
  { outputClauseIndex := 12292, coreClauseIndex := 40775, terminalClauseIndex := 2612659, datum := { row := ⟨9, {2, 6, 7, 8}⟩, arc := ⟨9, .right, {0, 5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12294; core 40781; terminal 2612665
  { outputClauseIndex := 12294, coreClauseIndex := 40781, terminalClauseIndex := 2612665, datum := { row := ⟨9, {2, 6, 7, 10}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12295; core 40782; terminal 2612666
  { outputClauseIndex := 12295, coreClauseIndex := 40782, terminalClauseIndex := 2612666, datum := { row := ⟨9, {2, 6, 7, 10}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12297; core 40788; terminal 2612672
  { outputClauseIndex := 12297, coreClauseIndex := 40788, terminalClauseIndex := 2612672, datum := { row := ⟨9, {2, 6, 8, 10}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12298; core 40789; terminal 2612673
  { outputClauseIndex := 12298, coreClauseIndex := 40789, terminalClauseIndex := 2612673, datum := { row := ⟨9, {2, 6, 8, 10}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12299; core 40794; terminal 2612679
  { outputClauseIndex := 12299, coreClauseIndex := 40794, terminalClauseIndex := 2612679, datum := { row := ⟨9, {2, 7, 8, 10}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12300; core 40795; terminal 2612680
  { outputClauseIndex := 12300, coreClauseIndex := 40795, terminalClauseIndex := 2612680, datum := { row := ⟨9, {2, 7, 8, 10}⟩, arc := ⟨9, .right, {0, 9, 10}⟩ } },
  -- compact 12301; core 40800; terminal 2612687
  { outputClauseIndex := 12301, coreClauseIndex := 40800, terminalClauseIndex := 2612687, datum := { row := ⟨9, {3, 4, 5, 6}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12303; core 40806; terminal 2612693
  { outputClauseIndex := 12303, coreClauseIndex := 40806, terminalClauseIndex := 2612693, datum := { row := ⟨9, {3, 4, 5, 7}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12304; core 40807; terminal 2612694
  { outputClauseIndex := 12304, coreClauseIndex := 40807, terminalClauseIndex := 2612694, datum := { row := ⟨9, {3, 4, 5, 7}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12306; core 40813; terminal 2612700
  { outputClauseIndex := 12306, coreClauseIndex := 40813, terminalClauseIndex := 2612700, datum := { row := ⟨9, {3, 4, 5, 8}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12307; core 40814; terminal 2612701
  { outputClauseIndex := 12307, coreClauseIndex := 40814, terminalClauseIndex := 2612701, datum := { row := ⟨9, {3, 4, 5, 8}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12309; core 40820; terminal 2612707
  { outputClauseIndex := 12309, coreClauseIndex := 40820, terminalClauseIndex := 2612707, datum := { row := ⟨9, {3, 4, 5, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12310; core 40821; terminal 2612708
  { outputClauseIndex := 12310, coreClauseIndex := 40821, terminalClauseIndex := 2612708, datum := { row := ⟨9, {3, 4, 5, 10}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12312; core 40827; terminal 2612714
  { outputClauseIndex := 12312, coreClauseIndex := 40827, terminalClauseIndex := 2612714, datum := { row := ⟨9, {3, 4, 6, 7}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12313; core 40828; terminal 2612715
  { outputClauseIndex := 12313, coreClauseIndex := 40828, terminalClauseIndex := 2612715, datum := { row := ⟨9, {3, 4, 6, 7}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12315; core 40834; terminal 2612721
  { outputClauseIndex := 12315, coreClauseIndex := 40834, terminalClauseIndex := 2612721, datum := { row := ⟨9, {3, 4, 6, 8}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12316; core 40835; terminal 2612722
  { outputClauseIndex := 12316, coreClauseIndex := 40835, terminalClauseIndex := 2612722, datum := { row := ⟨9, {3, 4, 6, 8}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12318; core 40841; terminal 2612728
  { outputClauseIndex := 12318, coreClauseIndex := 40841, terminalClauseIndex := 2612728, datum := { row := ⟨9, {3, 4, 6, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12319; core 40842; terminal 2612729
  { outputClauseIndex := 12319, coreClauseIndex := 40842, terminalClauseIndex := 2612729, datum := { row := ⟨9, {3, 4, 6, 10}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12321; core 40848; terminal 2612735
  { outputClauseIndex := 12321, coreClauseIndex := 40848, terminalClauseIndex := 2612735, datum := { row := ⟨9, {3, 4, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12322; core 40849; terminal 2612736
  { outputClauseIndex := 12322, coreClauseIndex := 40849, terminalClauseIndex := 2612736, datum := { row := ⟨9, {3, 4, 7, 8}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12324; core 40855; terminal 2612742
  { outputClauseIndex := 12324, coreClauseIndex := 40855, terminalClauseIndex := 2612742, datum := { row := ⟨9, {3, 4, 7, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12325; core 40856; terminal 2612743
  { outputClauseIndex := 12325, coreClauseIndex := 40856, terminalClauseIndex := 2612743, datum := { row := ⟨9, {3, 4, 7, 10}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12327; core 40862; terminal 2612749
  { outputClauseIndex := 12327, coreClauseIndex := 40862, terminalClauseIndex := 2612749, datum := { row := ⟨9, {3, 4, 8, 10}⟩, arc := ⟨9, .left, {2, 3, 4, 5}⟩ } },
  -- compact 12328; core 40863; terminal 2612750
  { outputClauseIndex := 12328, coreClauseIndex := 40863, terminalClauseIndex := 2612750, datum := { row := ⟨9, {3, 4, 8, 10}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12330; core 40880; terminal 2612777
  { outputClauseIndex := 12330, coreClauseIndex := 40880, terminalClauseIndex := 2612777, datum := { row := ⟨9, {3, 5, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12331; core 40881; terminal 2612778
  { outputClauseIndex := 12331, coreClauseIndex := 40881, terminalClauseIndex := 2612778, datum := { row := ⟨9, {3, 5, 7, 8}⟩, arc := ⟨9, .right, {0, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12333; core 40887; terminal 2612784
  { outputClauseIndex := 12333, coreClauseIndex := 40887, terminalClauseIndex := 2612784, datum := { row := ⟨9, {3, 5, 7, 10}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12334; core 40888; terminal 2612785
  { outputClauseIndex := 12334, coreClauseIndex := 40888, terminalClauseIndex := 2612785, datum := { row := ⟨9, {3, 5, 7, 10}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12336; core 40894; terminal 2612791
  { outputClauseIndex := 12336, coreClauseIndex := 40894, terminalClauseIndex := 2612791, datum := { row := ⟨9, {3, 5, 8, 10}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12337; core 40895; terminal 2612792
  { outputClauseIndex := 12337, coreClauseIndex := 40895, terminalClauseIndex := 2612792, datum := { row := ⟨9, {3, 5, 8, 10}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12339; core 40901; terminal 2612798
  { outputClauseIndex := 12339, coreClauseIndex := 40901, terminalClauseIndex := 2612798, datum := { row := ⟨9, {3, 6, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12340; core 40902; terminal 2612799
  { outputClauseIndex := 12340, coreClauseIndex := 40902, terminalClauseIndex := 2612799, datum := { row := ⟨9, {3, 6, 7, 8}⟩, arc := ⟨9, .right, {0, 5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12342; core 40908; terminal 2612805
  { outputClauseIndex := 12342, coreClauseIndex := 40908, terminalClauseIndex := 2612805, datum := { row := ⟨9, {3, 6, 7, 10}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12343; core 40909; terminal 2612806
  { outputClauseIndex := 12343, coreClauseIndex := 40909, terminalClauseIndex := 2612806, datum := { row := ⟨9, {3, 6, 7, 10}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12345; core 40915; terminal 2612812
  { outputClauseIndex := 12345, coreClauseIndex := 40915, terminalClauseIndex := 2612812, datum := { row := ⟨9, {3, 6, 8, 10}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12346; core 40916; terminal 2612813
  { outputClauseIndex := 12346, coreClauseIndex := 40916, terminalClauseIndex := 2612813, datum := { row := ⟨9, {3, 6, 8, 10}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12347; core 40921; terminal 2612819
  { outputClauseIndex := 12347, coreClauseIndex := 40921, terminalClauseIndex := 2612819, datum := { row := ⟨9, {3, 7, 8, 10}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12348; core 40922; terminal 2612820
  { outputClauseIndex := 12348, coreClauseIndex := 40922, terminalClauseIndex := 2612820, datum := { row := ⟨9, {3, 7, 8, 10}⟩, arc := ⟨9, .right, {0, 8, 9, 10}⟩ } },
  -- compact 12349; core 40931; terminal 2612841
  { outputClauseIndex := 12349, coreClauseIndex := 40931, terminalClauseIndex := 2612841, datum := { row := ⟨9, {4, 5, 6, 10}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12351; core 40937; terminal 2612847
  { outputClauseIndex := 12351, coreClauseIndex := 40937, terminalClauseIndex := 2612847, datum := { row := ⟨9, {4, 5, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12352; core 40938; terminal 2612848
  { outputClauseIndex := 12352, coreClauseIndex := 40938, terminalClauseIndex := 2612848, datum := { row := ⟨9, {4, 5, 7, 8}⟩, arc := ⟨9, .right, {0, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12354; core 40944; terminal 2612854
  { outputClauseIndex := 12354, coreClauseIndex := 40944, terminalClauseIndex := 2612854, datum := { row := ⟨9, {4, 5, 7, 10}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12355; core 40945; terminal 2612855
  { outputClauseIndex := 12355, coreClauseIndex := 40945, terminalClauseIndex := 2612855, datum := { row := ⟨9, {4, 5, 7, 10}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12357; core 40951; terminal 2612861
  { outputClauseIndex := 12357, coreClauseIndex := 40951, terminalClauseIndex := 2612861, datum := { row := ⟨9, {4, 5, 8, 10}⟩, arc := ⟨9, .left, {2, 3, 4}⟩ } },
  -- compact 12358; core 40952; terminal 2612862
  { outputClauseIndex := 12358, coreClauseIndex := 40952, terminalClauseIndex := 2612862, datum := { row := ⟨9, {4, 5, 8, 10}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12360; core 40958; terminal 2612868
  { outputClauseIndex := 12360, coreClauseIndex := 40958, terminalClauseIndex := 2612868, datum := { row := ⟨9, {4, 6, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12361; core 40959; terminal 2612869
  { outputClauseIndex := 12361, coreClauseIndex := 40959, terminalClauseIndex := 2612869, datum := { row := ⟨9, {4, 6, 7, 8}⟩, arc := ⟨9, .right, {0, 5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12363; core 40965; terminal 2612875
  { outputClauseIndex := 12363, coreClauseIndex := 40965, terminalClauseIndex := 2612875, datum := { row := ⟨9, {4, 6, 7, 10}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk021_batch_valid :
    directRowArcFiniteOccurrencesChunk021.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk021, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk021 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk021.map (·.datum)

theorem directRowArcFiniteDataChunk021_batch_valid :
    directRowArcFiniteDataChunk021.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk021, datum.Valid := by
  rw [directRowArcFiniteDataChunk021]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk021_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk021_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
