/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk023 : List DirectRowArcFiniteOccurrence := [
  -- compact 12544; core 41417; terminal 2613365
  { outputClauseIndex := 12544, coreClauseIndex := 41417, terminalClauseIndex := 2613365, datum := { row := ⟨10, {0, 3, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12545; core 41418; terminal 2613366
  { outputClauseIndex := 12545, coreClauseIndex := 41418, terminalClauseIndex := 2613366, datum := { row := ⟨10, {0, 3, 7, 9}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12546; core 41423; terminal 2613373
  { outputClauseIndex := 12546, coreClauseIndex := 41423, terminalClauseIndex := 2613373, datum := { row := ⟨10, {0, 3, 8, 9}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12547; core 41428; terminal 2613380
  { outputClauseIndex := 12547, coreClauseIndex := 41428, terminalClauseIndex := 2613380, datum := { row := ⟨10, {0, 4, 5, 6}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12549; core 41434; terminal 2613386
  { outputClauseIndex := 12549, coreClauseIndex := 41434, terminalClauseIndex := 2613386, datum := { row := ⟨10, {0, 4, 5, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12550; core 41435; terminal 2613387
  { outputClauseIndex := 12550, coreClauseIndex := 41435, terminalClauseIndex := 2613387, datum := { row := ⟨10, {0, 4, 5, 7}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12552; core 41441; terminal 2613393
  { outputClauseIndex := 12552, coreClauseIndex := 41441, terminalClauseIndex := 2613393, datum := { row := ⟨10, {0, 4, 5, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12553; core 41442; terminal 2613394
  { outputClauseIndex := 12553, coreClauseIndex := 41442, terminalClauseIndex := 2613394, datum := { row := ⟨10, {0, 4, 5, 8}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12555; core 41448; terminal 2613400
  { outputClauseIndex := 12555, coreClauseIndex := 41448, terminalClauseIndex := 2613400, datum := { row := ⟨10, {0, 4, 5, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12556; core 41449; terminal 2613401
  { outputClauseIndex := 12556, coreClauseIndex := 41449, terminalClauseIndex := 2613401, datum := { row := ⟨10, {0, 4, 5, 9}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12558; core 41455; terminal 2613407
  { outputClauseIndex := 12558, coreClauseIndex := 41455, terminalClauseIndex := 2613407, datum := { row := ⟨10, {0, 4, 6, 7}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12559; core 41456; terminal 2613408
  { outputClauseIndex := 12559, coreClauseIndex := 41456, terminalClauseIndex := 2613408, datum := { row := ⟨10, {0, 4, 6, 7}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12561; core 41462; terminal 2613414
  { outputClauseIndex := 12561, coreClauseIndex := 41462, terminalClauseIndex := 2613414, datum := { row := ⟨10, {0, 4, 6, 8}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12562; core 41463; terminal 2613415
  { outputClauseIndex := 12562, coreClauseIndex := 41463, terminalClauseIndex := 2613415, datum := { row := ⟨10, {0, 4, 6, 8}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12564; core 41469; terminal 2613421
  { outputClauseIndex := 12564, coreClauseIndex := 41469, terminalClauseIndex := 2613421, datum := { row := ⟨10, {0, 4, 6, 9}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12565; core 41470; terminal 2613422
  { outputClauseIndex := 12565, coreClauseIndex := 41470, terminalClauseIndex := 2613422, datum := { row := ⟨10, {0, 4, 6, 9}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12566; core 41475; terminal 2613428
  { outputClauseIndex := 12566, coreClauseIndex := 41475, terminalClauseIndex := 2613428, datum := { row := ⟨10, {0, 4, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12567; core 41476; terminal 2613429
  { outputClauseIndex := 12567, coreClauseIndex := 41476, terminalClauseIndex := 2613429, datum := { row := ⟨10, {0, 4, 7, 8}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12568; core 41480; terminal 2613435
  { outputClauseIndex := 12568, coreClauseIndex := 41480, terminalClauseIndex := 2613435, datum := { row := ⟨10, {0, 4, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12569; core 41481; terminal 2613436
  { outputClauseIndex := 12569, coreClauseIndex := 41481, terminalClauseIndex := 2613436, datum := { row := ⟨10, {0, 4, 7, 9}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12570; core 41486; terminal 2613443
  { outputClauseIndex := 12570, coreClauseIndex := 41486, terminalClauseIndex := 2613443, datum := { row := ⟨10, {0, 4, 8, 9}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12571; core 41501; terminal 2613470
  { outputClauseIndex := 12571, coreClauseIndex := 41501, terminalClauseIndex := 2613470, datum := { row := ⟨10, {0, 5, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12572; core 41502; terminal 2613471
  { outputClauseIndex := 12572, coreClauseIndex := 41502, terminalClauseIndex := 2613471, datum := { row := ⟨10, {0, 5, 7, 8}⟩, arc := ⟨10, .right, {6, 7, 8, 9, 10}⟩ } },
  -- compact 12573; core 41507; terminal 2613477
  { outputClauseIndex := 12573, coreClauseIndex := 41507, terminalClauseIndex := 2613477, datum := { row := ⟨10, {0, 5, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12574; core 41508; terminal 2613478
  { outputClauseIndex := 12574, coreClauseIndex := 41508, terminalClauseIndex := 2613478, datum := { row := ⟨10, {0, 5, 7, 9}⟩, arc := ⟨10, .right, {6, 7, 8, 9, 10}⟩ } },
  -- compact 12575; core 41513; terminal 2613485
  { outputClauseIndex := 12575, coreClauseIndex := 41513, terminalClauseIndex := 2613485, datum := { row := ⟨10, {0, 5, 8, 9}⟩, arc := ⟨10, .right, {6, 7, 8, 9, 10}⟩ } },
  -- compact 12576; core 41518; terminal 2613491
  { outputClauseIndex := 12576, coreClauseIndex := 41518, terminalClauseIndex := 2613491, datum := { row := ⟨10, {0, 6, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12577; core 41519; terminal 2613492
  { outputClauseIndex := 12577, coreClauseIndex := 41519, terminalClauseIndex := 2613492, datum := { row := ⟨10, {0, 6, 7, 8}⟩, arc := ⟨10, .right, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12578; core 41524; terminal 2613498
  { outputClauseIndex := 12578, coreClauseIndex := 41524, terminalClauseIndex := 2613498, datum := { row := ⟨10, {0, 6, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12579; core 41525; terminal 2613499
  { outputClauseIndex := 12579, coreClauseIndex := 41525, terminalClauseIndex := 2613499, datum := { row := ⟨10, {0, 6, 7, 9}⟩, arc := ⟨10, .right, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12580; core 41529; terminal 2613506
  { outputClauseIndex := 12580, coreClauseIndex := 41529, terminalClauseIndex := 2613506, datum := { row := ⟨10, {0, 6, 8, 9}⟩, arc := ⟨10, .right, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12581; core 41537; terminal 2613519
  { outputClauseIndex := 12581, coreClauseIndex := 41537, terminalClauseIndex := 2613519, datum := { row := ⟨10, {1, 2, 3, 4}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 12582; core 41538; terminal 2613520
  { outputClauseIndex := 12582, coreClauseIndex := 41538, terminalClauseIndex := 2613520, datum := { row := ⟨10, {1, 2, 3, 4}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12583; core 41543; terminal 2613526
  { outputClauseIndex := 12583, coreClauseIndex := 41543, terminalClauseIndex := 2613526, datum := { row := ⟨10, {1, 2, 3, 5}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 12584; core 41544; terminal 2613527
  { outputClauseIndex := 12584, coreClauseIndex := 41544, terminalClauseIndex := 2613527, datum := { row := ⟨10, {1, 2, 3, 5}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12585; core 41549; terminal 2613533
  { outputClauseIndex := 12585, coreClauseIndex := 41549, terminalClauseIndex := 2613533, datum := { row := ⟨10, {1, 2, 3, 6}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 12586; core 41550; terminal 2613534
  { outputClauseIndex := 12586, coreClauseIndex := 41550, terminalClauseIndex := 2613534, datum := { row := ⟨10, {1, 2, 3, 6}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12587; core 41555; terminal 2613540
  { outputClauseIndex := 12587, coreClauseIndex := 41555, terminalClauseIndex := 2613540, datum := { row := ⟨10, {1, 2, 3, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 12588; core 41556; terminal 2613541
  { outputClauseIndex := 12588, coreClauseIndex := 41556, terminalClauseIndex := 2613541, datum := { row := ⟨10, {1, 2, 3, 7}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12589; core 41561; terminal 2613547
  { outputClauseIndex := 12589, coreClauseIndex := 41561, terminalClauseIndex := 2613547, datum := { row := ⟨10, {1, 2, 3, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 12590; core 41562; terminal 2613548
  { outputClauseIndex := 12590, coreClauseIndex := 41562, terminalClauseIndex := 2613548, datum := { row := ⟨10, {1, 2, 3, 8}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12591; core 41567; terminal 2613554
  { outputClauseIndex := 12591, coreClauseIndex := 41567, terminalClauseIndex := 2613554, datum := { row := ⟨10, {1, 2, 3, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 12592; core 41568; terminal 2613555
  { outputClauseIndex := 12592, coreClauseIndex := 41568, terminalClauseIndex := 2613555, datum := { row := ⟨10, {1, 2, 3, 9}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12594; core 41574; terminal 2613561
  { outputClauseIndex := 12594, coreClauseIndex := 41574, terminalClauseIndex := 2613561, datum := { row := ⟨10, {1, 2, 4, 5}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12595; core 41575; terminal 2613562
  { outputClauseIndex := 12595, coreClauseIndex := 41575, terminalClauseIndex := 2613562, datum := { row := ⟨10, {1, 2, 4, 5}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12596; core 41580; terminal 2613568
  { outputClauseIndex := 12596, coreClauseIndex := 41580, terminalClauseIndex := 2613568, datum := { row := ⟨10, {1, 2, 4, 6}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12597; core 41581; terminal 2613569
  { outputClauseIndex := 12597, coreClauseIndex := 41581, terminalClauseIndex := 2613569, datum := { row := ⟨10, {1, 2, 4, 6}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12599; core 41587; terminal 2613575
  { outputClauseIndex := 12599, coreClauseIndex := 41587, terminalClauseIndex := 2613575, datum := { row := ⟨10, {1, 2, 4, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12600; core 41588; terminal 2613576
  { outputClauseIndex := 12600, coreClauseIndex := 41588, terminalClauseIndex := 2613576, datum := { row := ⟨10, {1, 2, 4, 7}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12602; core 41594; terminal 2613582
  { outputClauseIndex := 12602, coreClauseIndex := 41594, terminalClauseIndex := 2613582, datum := { row := ⟨10, {1, 2, 4, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12603; core 41595; terminal 2613583
  { outputClauseIndex := 12603, coreClauseIndex := 41595, terminalClauseIndex := 2613583, datum := { row := ⟨10, {1, 2, 4, 8}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12605; core 41601; terminal 2613589
  { outputClauseIndex := 12605, coreClauseIndex := 41601, terminalClauseIndex := 2613589, datum := { row := ⟨10, {1, 2, 4, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12606; core 41602; terminal 2613590
  { outputClauseIndex := 12606, coreClauseIndex := 41602, terminalClauseIndex := 2613590, datum := { row := ⟨10, {1, 2, 4, 9}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12607; core 41607; terminal 2613597
  { outputClauseIndex := 12607, coreClauseIndex := 41607, terminalClauseIndex := 2613597, datum := { row := ⟨10, {1, 2, 5, 6}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12609; core 41613; terminal 2613603
  { outputClauseIndex := 12609, coreClauseIndex := 41613, terminalClauseIndex := 2613603, datum := { row := ⟨10, {1, 2, 5, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12610; core 41614; terminal 2613604
  { outputClauseIndex := 12610, coreClauseIndex := 41614, terminalClauseIndex := 2613604, datum := { row := ⟨10, {1, 2, 5, 7}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12612; core 41620; terminal 2613610
  { outputClauseIndex := 12612, coreClauseIndex := 41620, terminalClauseIndex := 2613610, datum := { row := ⟨10, {1, 2, 5, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12613; core 41621; terminal 2613611
  { outputClauseIndex := 12613, coreClauseIndex := 41621, terminalClauseIndex := 2613611, datum := { row := ⟨10, {1, 2, 5, 8}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12615; core 41627; terminal 2613617
  { outputClauseIndex := 12615, coreClauseIndex := 41627, terminalClauseIndex := 2613617, datum := { row := ⟨10, {1, 2, 5, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12616; core 41628; terminal 2613618
  { outputClauseIndex := 12616, coreClauseIndex := 41628, terminalClauseIndex := 2613618, datum := { row := ⟨10, {1, 2, 5, 9}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12618; core 41634; terminal 2613624
  { outputClauseIndex := 12618, coreClauseIndex := 41634, terminalClauseIndex := 2613624, datum := { row := ⟨10, {1, 2, 6, 7}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12619; core 41635; terminal 2613625
  { outputClauseIndex := 12619, coreClauseIndex := 41635, terminalClauseIndex := 2613625, datum := { row := ⟨10, {1, 2, 6, 7}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12621; core 41641; terminal 2613631
  { outputClauseIndex := 12621, coreClauseIndex := 41641, terminalClauseIndex := 2613631, datum := { row := ⟨10, {1, 2, 6, 8}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12622; core 41642; terminal 2613632
  { outputClauseIndex := 12622, coreClauseIndex := 41642, terminalClauseIndex := 2613632, datum := { row := ⟨10, {1, 2, 6, 8}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12624; core 41648; terminal 2613638
  { outputClauseIndex := 12624, coreClauseIndex := 41648, terminalClauseIndex := 2613638, datum := { row := ⟨10, {1, 2, 6, 9}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12625; core 41649; terminal 2613639
  { outputClauseIndex := 12625, coreClauseIndex := 41649, terminalClauseIndex := 2613639, datum := { row := ⟨10, {1, 2, 6, 9}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12627; core 41655; terminal 2613645
  { outputClauseIndex := 12627, coreClauseIndex := 41655, terminalClauseIndex := 2613645, datum := { row := ⟨10, {1, 2, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12628; core 41656; terminal 2613646
  { outputClauseIndex := 12628, coreClauseIndex := 41656, terminalClauseIndex := 2613646, datum := { row := ⟨10, {1, 2, 7, 8}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12630; core 41662; terminal 2613652
  { outputClauseIndex := 12630, coreClauseIndex := 41662, terminalClauseIndex := 2613652, datum := { row := ⟨10, {1, 2, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12631; core 41663; terminal 2613653
  { outputClauseIndex := 12631, coreClauseIndex := 41663, terminalClauseIndex := 2613653, datum := { row := ⟨10, {1, 2, 7, 9}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12633; core 41669; terminal 2613659
  { outputClauseIndex := 12633, coreClauseIndex := 41669, terminalClauseIndex := 2613659, datum := { row := ⟨10, {1, 2, 8, 9}⟩, arc := ⟨10, .left, {1}⟩ } },
  -- compact 12634; core 41670; terminal 2613660
  { outputClauseIndex := 12634, coreClauseIndex := 41670, terminalClauseIndex := 2613660, datum := { row := ⟨10, {1, 2, 8, 9}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12635; core 41675; terminal 2613666
  { outputClauseIndex := 12635, coreClauseIndex := 41675, terminalClauseIndex := 2613666, datum := { row := ⟨10, {1, 3, 4, 5}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12636; core 41676; terminal 2613667
  { outputClauseIndex := 12636, coreClauseIndex := 41676, terminalClauseIndex := 2613667, datum := { row := ⟨10, {1, 3, 4, 5}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12637; core 41681; terminal 2613673
  { outputClauseIndex := 12637, coreClauseIndex := 41681, terminalClauseIndex := 2613673, datum := { row := ⟨10, {1, 3, 4, 6}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12638; core 41682; terminal 2613674
  { outputClauseIndex := 12638, coreClauseIndex := 41682, terminalClauseIndex := 2613674, datum := { row := ⟨10, {1, 3, 4, 6}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12640; core 41688; terminal 2613680
  { outputClauseIndex := 12640, coreClauseIndex := 41688, terminalClauseIndex := 2613680, datum := { row := ⟨10, {1, 3, 4, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12641; core 41689; terminal 2613681
  { outputClauseIndex := 12641, coreClauseIndex := 41689, terminalClauseIndex := 2613681, datum := { row := ⟨10, {1, 3, 4, 7}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12643; core 41695; terminal 2613687
  { outputClauseIndex := 12643, coreClauseIndex := 41695, terminalClauseIndex := 2613687, datum := { row := ⟨10, {1, 3, 4, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12644; core 41696; terminal 2613688
  { outputClauseIndex := 12644, coreClauseIndex := 41696, terminalClauseIndex := 2613688, datum := { row := ⟨10, {1, 3, 4, 8}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12646; core 41702; terminal 2613694
  { outputClauseIndex := 12646, coreClauseIndex := 41702, terminalClauseIndex := 2613694, datum := { row := ⟨10, {1, 3, 4, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12647; core 41703; terminal 2613695
  { outputClauseIndex := 12647, coreClauseIndex := 41703, terminalClauseIndex := 2613695, datum := { row := ⟨10, {1, 3, 4, 9}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12648; core 41708; terminal 2613702
  { outputClauseIndex := 12648, coreClauseIndex := 41708, terminalClauseIndex := 2613702, datum := { row := ⟨10, {1, 3, 5, 6}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12650; core 41714; terminal 2613708
  { outputClauseIndex := 12650, coreClauseIndex := 41714, terminalClauseIndex := 2613708, datum := { row := ⟨10, {1, 3, 5, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12651; core 41715; terminal 2613709
  { outputClauseIndex := 12651, coreClauseIndex := 41715, terminalClauseIndex := 2613709, datum := { row := ⟨10, {1, 3, 5, 7}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12653; core 41721; terminal 2613715
  { outputClauseIndex := 12653, coreClauseIndex := 41721, terminalClauseIndex := 2613715, datum := { row := ⟨10, {1, 3, 5, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12654; core 41722; terminal 2613716
  { outputClauseIndex := 12654, coreClauseIndex := 41722, terminalClauseIndex := 2613716, datum := { row := ⟨10, {1, 3, 5, 8}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12656; core 41728; terminal 2613722
  { outputClauseIndex := 12656, coreClauseIndex := 41728, terminalClauseIndex := 2613722, datum := { row := ⟨10, {1, 3, 5, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12657; core 41729; terminal 2613723
  { outputClauseIndex := 12657, coreClauseIndex := 41729, terminalClauseIndex := 2613723, datum := { row := ⟨10, {1, 3, 5, 9}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12659; core 41735; terminal 2613729
  { outputClauseIndex := 12659, coreClauseIndex := 41735, terminalClauseIndex := 2613729, datum := { row := ⟨10, {1, 3, 6, 7}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12660; core 41736; terminal 2613730
  { outputClauseIndex := 12660, coreClauseIndex := 41736, terminalClauseIndex := 2613730, datum := { row := ⟨10, {1, 3, 6, 7}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12662; core 41742; terminal 2613736
  { outputClauseIndex := 12662, coreClauseIndex := 41742, terminalClauseIndex := 2613736, datum := { row := ⟨10, {1, 3, 6, 8}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12663; core 41743; terminal 2613737
  { outputClauseIndex := 12663, coreClauseIndex := 41743, terminalClauseIndex := 2613737, datum := { row := ⟨10, {1, 3, 6, 8}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12665; core 41749; terminal 2613743
  { outputClauseIndex := 12665, coreClauseIndex := 41749, terminalClauseIndex := 2613743, datum := { row := ⟨10, {1, 3, 6, 9}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12666; core 41750; terminal 2613744
  { outputClauseIndex := 12666, coreClauseIndex := 41750, terminalClauseIndex := 2613744, datum := { row := ⟨10, {1, 3, 6, 9}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12668; core 41756; terminal 2613750
  { outputClauseIndex := 12668, coreClauseIndex := 41756, terminalClauseIndex := 2613750, datum := { row := ⟨10, {1, 3, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12669; core 41757; terminal 2613751
  { outputClauseIndex := 12669, coreClauseIndex := 41757, terminalClauseIndex := 2613751, datum := { row := ⟨10, {1, 3, 7, 8}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12671; core 41763; terminal 2613757
  { outputClauseIndex := 12671, coreClauseIndex := 41763, terminalClauseIndex := 2613757, datum := { row := ⟨10, {1, 3, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12672; core 41764; terminal 2613758
  { outputClauseIndex := 12672, coreClauseIndex := 41764, terminalClauseIndex := 2613758, datum := { row := ⟨10, {1, 3, 7, 9}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12674; core 41770; terminal 2613764
  { outputClauseIndex := 12674, coreClauseIndex := 41770, terminalClauseIndex := 2613764, datum := { row := ⟨10, {1, 3, 8, 9}⟩, arc := ⟨10, .left, {1}⟩ } },
  -- compact 12675; core 41771; terminal 2613765
  { outputClauseIndex := 12675, coreClauseIndex := 41771, terminalClauseIndex := 2613765, datum := { row := ⟨10, {1, 3, 8, 9}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12676; core 41775; terminal 2613772
  { outputClauseIndex := 12676, coreClauseIndex := 41775, terminalClauseIndex := 2613772, datum := { row := ⟨10, {1, 4, 5, 6}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12678; core 41781; terminal 2613778
  { outputClauseIndex := 12678, coreClauseIndex := 41781, terminalClauseIndex := 2613778, datum := { row := ⟨10, {1, 4, 5, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12679; core 41782; terminal 2613779
  { outputClauseIndex := 12679, coreClauseIndex := 41782, terminalClauseIndex := 2613779, datum := { row := ⟨10, {1, 4, 5, 7}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12681; core 41788; terminal 2613785
  { outputClauseIndex := 12681, coreClauseIndex := 41788, terminalClauseIndex := 2613785, datum := { row := ⟨10, {1, 4, 5, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12682; core 41789; terminal 2613786
  { outputClauseIndex := 12682, coreClauseIndex := 41789, terminalClauseIndex := 2613786, datum := { row := ⟨10, {1, 4, 5, 8}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12684; core 41795; terminal 2613792
  { outputClauseIndex := 12684, coreClauseIndex := 41795, terminalClauseIndex := 2613792, datum := { row := ⟨10, {1, 4, 5, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12685; core 41796; terminal 2613793
  { outputClauseIndex := 12685, coreClauseIndex := 41796, terminalClauseIndex := 2613793, datum := { row := ⟨10, {1, 4, 5, 9}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12687; core 41802; terminal 2613799
  { outputClauseIndex := 12687, coreClauseIndex := 41802, terminalClauseIndex := 2613799, datum := { row := ⟨10, {1, 4, 6, 7}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12688; core 41803; terminal 2613800
  { outputClauseIndex := 12688, coreClauseIndex := 41803, terminalClauseIndex := 2613800, datum := { row := ⟨10, {1, 4, 6, 7}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12690; core 41809; terminal 2613806
  { outputClauseIndex := 12690, coreClauseIndex := 41809, terminalClauseIndex := 2613806, datum := { row := ⟨10, {1, 4, 6, 8}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12691; core 41810; terminal 2613807
  { outputClauseIndex := 12691, coreClauseIndex := 41810, terminalClauseIndex := 2613807, datum := { row := ⟨10, {1, 4, 6, 8}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12693; core 41816; terminal 2613813
  { outputClauseIndex := 12693, coreClauseIndex := 41816, terminalClauseIndex := 2613813, datum := { row := ⟨10, {1, 4, 6, 9}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12694; core 41817; terminal 2613814
  { outputClauseIndex := 12694, coreClauseIndex := 41817, terminalClauseIndex := 2613814, datum := { row := ⟨10, {1, 4, 6, 9}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12696; core 41823; terminal 2613820
  { outputClauseIndex := 12696, coreClauseIndex := 41823, terminalClauseIndex := 2613820, datum := { row := ⟨10, {1, 4, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12697; core 41824; terminal 2613821
  { outputClauseIndex := 12697, coreClauseIndex := 41824, terminalClauseIndex := 2613821, datum := { row := ⟨10, {1, 4, 7, 8}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12699; core 41830; terminal 2613827
  { outputClauseIndex := 12699, coreClauseIndex := 41830, terminalClauseIndex := 2613827, datum := { row := ⟨10, {1, 4, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12700; core 41831; terminal 2613828
  { outputClauseIndex := 12700, coreClauseIndex := 41831, terminalClauseIndex := 2613828, datum := { row := ⟨10, {1, 4, 7, 9}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12702; core 41837; terminal 2613834
  { outputClauseIndex := 12702, coreClauseIndex := 41837, terminalClauseIndex := 2613834, datum := { row := ⟨10, {1, 4, 8, 9}⟩, arc := ⟨10, .left, {1}⟩ } },
  -- compact 12703; core 41838; terminal 2613835
  { outputClauseIndex := 12703, coreClauseIndex := 41838, terminalClauseIndex := 2613835, datum := { row := ⟨10, {1, 4, 8, 9}⟩, arc := ⟨10, .right, {7, 8, 9, 10}⟩ } },
  -- compact 12705; core 41855; terminal 2613862
  { outputClauseIndex := 12705, coreClauseIndex := 41855, terminalClauseIndex := 2613862, datum := { row := ⟨10, {1, 5, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12706; core 41856; terminal 2613863
  { outputClauseIndex := 12706, coreClauseIndex := 41856, terminalClauseIndex := 2613863, datum := { row := ⟨10, {1, 5, 7, 8}⟩, arc := ⟨10, .right, {6, 7, 8, 9, 10}⟩ } },
  -- compact 12708; core 41862; terminal 2613869
  { outputClauseIndex := 12708, coreClauseIndex := 41862, terminalClauseIndex := 2613869, datum := { row := ⟨10, {1, 5, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12709; core 41863; terminal 2613870
  { outputClauseIndex := 12709, coreClauseIndex := 41863, terminalClauseIndex := 2613870, datum := { row := ⟨10, {1, 5, 7, 9}⟩, arc := ⟨10, .right, {6, 7, 8, 9, 10}⟩ } },
  -- compact 12711; core 41869; terminal 2613876
  { outputClauseIndex := 12711, coreClauseIndex := 41869, terminalClauseIndex := 2613876, datum := { row := ⟨10, {1, 5, 8, 9}⟩, arc := ⟨10, .left, {1}⟩ } },
  -- compact 12712; core 41870; terminal 2613877
  { outputClauseIndex := 12712, coreClauseIndex := 41870, terminalClauseIndex := 2613877, datum := { row := ⟨10, {1, 5, 8, 9}⟩, arc := ⟨10, .right, {6, 7, 8, 9, 10}⟩ } },
  -- compact 12714; core 41876; terminal 2613883
  { outputClauseIndex := 12714, coreClauseIndex := 41876, terminalClauseIndex := 2613883, datum := { row := ⟨10, {1, 6, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12715; core 41877; terminal 2613884
  { outputClauseIndex := 12715, coreClauseIndex := 41877, terminalClauseIndex := 2613884, datum := { row := ⟨10, {1, 6, 7, 8}⟩, arc := ⟨10, .right, {5, 6, 7, 8, 9, 10}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk023_batch_valid :
    directRowArcFiniteOccurrencesChunk023.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk023, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk023 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk023.map (·.datum)

theorem directRowArcFiniteDataChunk023_batch_valid :
    directRowArcFiniteDataChunk023.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk023, datum.Valid := by
  rw [directRowArcFiniteDataChunk023]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk023_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk023_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
