/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk006 : List DirectRowArcFiniteOccurrence := [
  -- compact 9426; core 32737; terminal 2602893
  { outputClauseIndex := 9426, coreClauseIndex := 32737, terminalClauseIndex := 2602893, datum := { row := ⟨3, {0, 2, 5, 8}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9427; core 32738; terminal 2602894
  { outputClauseIndex := 9427, coreClauseIndex := 32738, terminalClauseIndex := 2602894, datum := { row := ⟨3, {0, 2, 5, 8}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9429; core 32744; terminal 2602900
  { outputClauseIndex := 9429, coreClauseIndex := 32744, terminalClauseIndex := 2602900, datum := { row := ⟨3, {0, 2, 5, 9}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9430; core 32745; terminal 2602901
  { outputClauseIndex := 9430, coreClauseIndex := 32745, terminalClauseIndex := 2602901, datum := { row := ⟨3, {0, 2, 5, 9}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9432; core 32751; terminal 2602907
  { outputClauseIndex := 9432, coreClauseIndex := 32751, terminalClauseIndex := 2602907, datum := { row := ⟨3, {0, 2, 5, 10}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9433; core 32752; terminal 2602908
  { outputClauseIndex := 9433, coreClauseIndex := 32752, terminalClauseIndex := 2602908, datum := { row := ⟨3, {0, 2, 5, 10}⟩, arc := ⟨3, .right, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9435; core 32758; terminal 2602914
  { outputClauseIndex := 9435, coreClauseIndex := 32758, terminalClauseIndex := 2602914, datum := { row := ⟨3, {0, 2, 6, 7}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9436; core 32759; terminal 2602915
  { outputClauseIndex := 9436, coreClauseIndex := 32759, terminalClauseIndex := 2602915, datum := { row := ⟨3, {0, 2, 6, 7}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9438; core 32765; terminal 2602921
  { outputClauseIndex := 9438, coreClauseIndex := 32765, terminalClauseIndex := 2602921, datum := { row := ⟨3, {0, 2, 6, 8}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9439; core 32766; terminal 2602922
  { outputClauseIndex := 9439, coreClauseIndex := 32766, terminalClauseIndex := 2602922, datum := { row := ⟨3, {0, 2, 6, 8}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9441; core 32772; terminal 2602928
  { outputClauseIndex := 9441, coreClauseIndex := 32772, terminalClauseIndex := 2602928, datum := { row := ⟨3, {0, 2, 6, 9}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9442; core 32773; terminal 2602929
  { outputClauseIndex := 9442, coreClauseIndex := 32773, terminalClauseIndex := 2602929, datum := { row := ⟨3, {0, 2, 6, 9}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9444; core 32779; terminal 2602935
  { outputClauseIndex := 9444, coreClauseIndex := 32779, terminalClauseIndex := 2602935, datum := { row := ⟨3, {0, 2, 6, 10}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9445; core 32780; terminal 2602936
  { outputClauseIndex := 9445, coreClauseIndex := 32780, terminalClauseIndex := 2602936, datum := { row := ⟨3, {0, 2, 6, 10}⟩, arc := ⟨3, .right, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9447; core 32786; terminal 2602942
  { outputClauseIndex := 9447, coreClauseIndex := 32786, terminalClauseIndex := 2602942, datum := { row := ⟨3, {0, 2, 7, 8}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9448; core 32787; terminal 2602943
  { outputClauseIndex := 9448, coreClauseIndex := 32787, terminalClauseIndex := 2602943, datum := { row := ⟨3, {0, 2, 7, 8}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9450; core 32793; terminal 2602949
  { outputClauseIndex := 9450, coreClauseIndex := 32793, terminalClauseIndex := 2602949, datum := { row := ⟨3, {0, 2, 7, 9}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9451; core 32794; terminal 2602950
  { outputClauseIndex := 9451, coreClauseIndex := 32794, terminalClauseIndex := 2602950, datum := { row := ⟨3, {0, 2, 7, 9}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9453; core 32800; terminal 2602956
  { outputClauseIndex := 9453, coreClauseIndex := 32800, terminalClauseIndex := 2602956, datum := { row := ⟨3, {0, 2, 7, 10}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9454; core 32801; terminal 2602957
  { outputClauseIndex := 9454, coreClauseIndex := 32801, terminalClauseIndex := 2602957, datum := { row := ⟨3, {0, 2, 7, 10}⟩, arc := ⟨3, .right, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9456; core 32807; terminal 2602963
  { outputClauseIndex := 9456, coreClauseIndex := 32807, terminalClauseIndex := 2602963, datum := { row := ⟨3, {0, 2, 8, 9}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9457; core 32808; terminal 2602964
  { outputClauseIndex := 9457, coreClauseIndex := 32808, terminalClauseIndex := 2602964, datum := { row := ⟨3, {0, 2, 8, 9}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9459; core 32814; terminal 2602970
  { outputClauseIndex := 9459, coreClauseIndex := 32814, terminalClauseIndex := 2602970, datum := { row := ⟨3, {0, 2, 8, 10}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9460; core 32815; terminal 2602971
  { outputClauseIndex := 9460, coreClauseIndex := 32815, terminalClauseIndex := 2602971, datum := { row := ⟨3, {0, 2, 8, 10}⟩, arc := ⟨3, .right, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9462; core 32821; terminal 2602977
  { outputClauseIndex := 9462, coreClauseIndex := 32821, terminalClauseIndex := 2602977, datum := { row := ⟨3, {0, 2, 9, 10}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9463; core 32822; terminal 2602978
  { outputClauseIndex := 9463, coreClauseIndex := 32822, terminalClauseIndex := 2602978, datum := { row := ⟨3, {0, 2, 9, 10}⟩, arc := ⟨3, .right, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9465; core 32831; terminal 2602991
  { outputClauseIndex := 9465, coreClauseIndex := 32831, terminalClauseIndex := 2602991, datum := { row := ⟨3, {0, 4, 5, 7}⟩, arc := ⟨3, .left, {0, 1, 2, 8, 9, 10}⟩ } },
  -- compact 9466; core 32832; terminal 2602992
  { outputClauseIndex := 9466, coreClauseIndex := 32832, terminalClauseIndex := 2602992, datum := { row := ⟨3, {0, 4, 5, 7}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9468; core 32838; terminal 2602998
  { outputClauseIndex := 9468, coreClauseIndex := 32838, terminalClauseIndex := 2602998, datum := { row := ⟨3, {0, 4, 5, 8}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9469; core 32839; terminal 2602999
  { outputClauseIndex := 9469, coreClauseIndex := 32839, terminalClauseIndex := 2602999, datum := { row := ⟨3, {0, 4, 5, 8}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9471; core 32845; terminal 2603005
  { outputClauseIndex := 9471, coreClauseIndex := 32845, terminalClauseIndex := 2603005, datum := { row := ⟨3, {0, 4, 5, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9472; core 32846; terminal 2603006
  { outputClauseIndex := 9472, coreClauseIndex := 32846, terminalClauseIndex := 2603006, datum := { row := ⟨3, {0, 4, 5, 9}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9474; core 32852; terminal 2603012
  { outputClauseIndex := 9474, coreClauseIndex := 32852, terminalClauseIndex := 2603012, datum := { row := ⟨3, {0, 4, 5, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9475; core 32853; terminal 2603013
  { outputClauseIndex := 9475, coreClauseIndex := 32853, terminalClauseIndex := 2603013, datum := { row := ⟨3, {0, 4, 5, 10}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9477; core 32859; terminal 2603019
  { outputClauseIndex := 9477, coreClauseIndex := 32859, terminalClauseIndex := 2603019, datum := { row := ⟨3, {0, 4, 6, 7}⟩, arc := ⟨3, .left, {0, 1, 2, 8, 9, 10}⟩ } },
  -- compact 9478; core 32860; terminal 2603020
  { outputClauseIndex := 9478, coreClauseIndex := 32860, terminalClauseIndex := 2603020, datum := { row := ⟨3, {0, 4, 6, 7}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9480; core 32866; terminal 2603026
  { outputClauseIndex := 9480, coreClauseIndex := 32866, terminalClauseIndex := 2603026, datum := { row := ⟨3, {0, 4, 6, 8}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9481; core 32867; terminal 2603027
  { outputClauseIndex := 9481, coreClauseIndex := 32867, terminalClauseIndex := 2603027, datum := { row := ⟨3, {0, 4, 6, 8}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9483; core 32873; terminal 2603033
  { outputClauseIndex := 9483, coreClauseIndex := 32873, terminalClauseIndex := 2603033, datum := { row := ⟨3, {0, 4, 6, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9484; core 32874; terminal 2603034
  { outputClauseIndex := 9484, coreClauseIndex := 32874, terminalClauseIndex := 2603034, datum := { row := ⟨3, {0, 4, 6, 9}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9486; core 32880; terminal 2603040
  { outputClauseIndex := 9486, coreClauseIndex := 32880, terminalClauseIndex := 2603040, datum := { row := ⟨3, {0, 4, 6, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9487; core 32881; terminal 2603041
  { outputClauseIndex := 9487, coreClauseIndex := 32881, terminalClauseIndex := 2603041, datum := { row := ⟨3, {0, 4, 6, 10}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9489; core 32887; terminal 2603047
  { outputClauseIndex := 9489, coreClauseIndex := 32887, terminalClauseIndex := 2603047, datum := { row := ⟨3, {0, 4, 7, 8}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9490; core 32888; terminal 2603048
  { outputClauseIndex := 9490, coreClauseIndex := 32888, terminalClauseIndex := 2603048, datum := { row := ⟨3, {0, 4, 7, 8}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9492; core 32894; terminal 2603054
  { outputClauseIndex := 9492, coreClauseIndex := 32894, terminalClauseIndex := 2603054, datum := { row := ⟨3, {0, 4, 7, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9493; core 32895; terminal 2603055
  { outputClauseIndex := 9493, coreClauseIndex := 32895, terminalClauseIndex := 2603055, datum := { row := ⟨3, {0, 4, 7, 9}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9495; core 32901; terminal 2603061
  { outputClauseIndex := 9495, coreClauseIndex := 32901, terminalClauseIndex := 2603061, datum := { row := ⟨3, {0, 4, 7, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9496; core 32902; terminal 2603062
  { outputClauseIndex := 9496, coreClauseIndex := 32902, terminalClauseIndex := 2603062, datum := { row := ⟨3, {0, 4, 7, 10}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9498; core 32908; terminal 2603068
  { outputClauseIndex := 9498, coreClauseIndex := 32908, terminalClauseIndex := 2603068, datum := { row := ⟨3, {0, 4, 8, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9499; core 32909; terminal 2603069
  { outputClauseIndex := 9499, coreClauseIndex := 32909, terminalClauseIndex := 2603069, datum := { row := ⟨3, {0, 4, 8, 9}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9501; core 32915; terminal 2603075
  { outputClauseIndex := 9501, coreClauseIndex := 32915, terminalClauseIndex := 2603075, datum := { row := ⟨3, {0, 4, 8, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9502; core 32916; terminal 2603076
  { outputClauseIndex := 9502, coreClauseIndex := 32916, terminalClauseIndex := 2603076, datum := { row := ⟨3, {0, 4, 8, 10}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9504; core 32922; terminal 2603082
  { outputClauseIndex := 9504, coreClauseIndex := 32922, terminalClauseIndex := 2603082, datum := { row := ⟨3, {0, 4, 9, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9505; core 32923; terminal 2603083
  { outputClauseIndex := 9505, coreClauseIndex := 32923, terminalClauseIndex := 2603083, datum := { row := ⟨3, {0, 4, 9, 10}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9506; core 32936; terminal 2603103
  { outputClauseIndex := 9506, coreClauseIndex := 32936, terminalClauseIndex := 2603103, datum := { row := ⟨3, {0, 5, 6, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9507; core 32941; terminal 2603110
  { outputClauseIndex := 9507, coreClauseIndex := 32941, terminalClauseIndex := 2603110, datum := { row := ⟨3, {0, 5, 6, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9509; core 32947; terminal 2603117
  { outputClauseIndex := 9509, coreClauseIndex := 32947, terminalClauseIndex := 2603117, datum := { row := ⟨3, {0, 5, 7, 8}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9510; core 32948; terminal 2603118
  { outputClauseIndex := 9510, coreClauseIndex := 32948, terminalClauseIndex := 2603118, datum := { row := ⟨3, {0, 5, 7, 8}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9512; core 32954; terminal 2603124
  { outputClauseIndex := 9512, coreClauseIndex := 32954, terminalClauseIndex := 2603124, datum := { row := ⟨3, {0, 5, 7, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9513; core 32955; terminal 2603125
  { outputClauseIndex := 9513, coreClauseIndex := 32955, terminalClauseIndex := 2603125, datum := { row := ⟨3, {0, 5, 7, 9}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9515; core 32961; terminal 2603131
  { outputClauseIndex := 9515, coreClauseIndex := 32961, terminalClauseIndex := 2603131, datum := { row := ⟨3, {0, 5, 7, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9516; core 32962; terminal 2603132
  { outputClauseIndex := 9516, coreClauseIndex := 32962, terminalClauseIndex := 2603132, datum := { row := ⟨3, {0, 5, 7, 10}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9518; core 32968; terminal 2603138
  { outputClauseIndex := 9518, coreClauseIndex := 32968, terminalClauseIndex := 2603138, datum := { row := ⟨3, {0, 5, 8, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9519; core 32969; terminal 2603139
  { outputClauseIndex := 9519, coreClauseIndex := 32969, terminalClauseIndex := 2603139, datum := { row := ⟨3, {0, 5, 8, 9}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9521; core 32975; terminal 2603145
  { outputClauseIndex := 9521, coreClauseIndex := 32975, terminalClauseIndex := 2603145, datum := { row := ⟨3, {0, 5, 8, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9522; core 32976; terminal 2603146
  { outputClauseIndex := 9522, coreClauseIndex := 32976, terminalClauseIndex := 2603146, datum := { row := ⟨3, {0, 5, 8, 10}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9524; core 32982; terminal 2603152
  { outputClauseIndex := 9524, coreClauseIndex := 32982, terminalClauseIndex := 2603152, datum := { row := ⟨3, {0, 5, 9, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9525; core 32983; terminal 2603153
  { outputClauseIndex := 9525, coreClauseIndex := 32983, terminalClauseIndex := 2603153, datum := { row := ⟨3, {0, 5, 9, 10}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9527; core 32989; terminal 2603159
  { outputClauseIndex := 9527, coreClauseIndex := 32989, terminalClauseIndex := 2603159, datum := { row := ⟨3, {0, 6, 7, 8}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9528; core 32990; terminal 2603160
  { outputClauseIndex := 9528, coreClauseIndex := 32990, terminalClauseIndex := 2603160, datum := { row := ⟨3, {0, 6, 7, 8}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9530; core 32996; terminal 2603166
  { outputClauseIndex := 9530, coreClauseIndex := 32996, terminalClauseIndex := 2603166, datum := { row := ⟨3, {0, 6, 7, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9531; core 32997; terminal 2603167
  { outputClauseIndex := 9531, coreClauseIndex := 32997, terminalClauseIndex := 2603167, datum := { row := ⟨3, {0, 6, 7, 9}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9533; core 33003; terminal 2603173
  { outputClauseIndex := 9533, coreClauseIndex := 33003, terminalClauseIndex := 2603173, datum := { row := ⟨3, {0, 6, 7, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9534; core 33004; terminal 2603174
  { outputClauseIndex := 9534, coreClauseIndex := 33004, terminalClauseIndex := 2603174, datum := { row := ⟨3, {0, 6, 7, 10}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9536; core 33010; terminal 2603180
  { outputClauseIndex := 9536, coreClauseIndex := 33010, terminalClauseIndex := 2603180, datum := { row := ⟨3, {0, 6, 8, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9537; core 33011; terminal 2603181
  { outputClauseIndex := 9537, coreClauseIndex := 33011, terminalClauseIndex := 2603181, datum := { row := ⟨3, {0, 6, 8, 9}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9539; core 33017; terminal 2603187
  { outputClauseIndex := 9539, coreClauseIndex := 33017, terminalClauseIndex := 2603187, datum := { row := ⟨3, {0, 6, 8, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9540; core 33018; terminal 2603188
  { outputClauseIndex := 9540, coreClauseIndex := 33018, terminalClauseIndex := 2603188, datum := { row := ⟨3, {0, 6, 8, 10}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9542; core 33024; terminal 2603194
  { outputClauseIndex := 9542, coreClauseIndex := 33024, terminalClauseIndex := 2603194, datum := { row := ⟨3, {0, 6, 9, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9543; core 33025; terminal 2603195
  { outputClauseIndex := 9543, coreClauseIndex := 33025, terminalClauseIndex := 2603195, datum := { row := ⟨3, {0, 6, 9, 10}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9545; core 33031; terminal 2603201
  { outputClauseIndex := 9545, coreClauseIndex := 33031, terminalClauseIndex := 2603201, datum := { row := ⟨3, {0, 7, 8, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9546; core 33032; terminal 2603202
  { outputClauseIndex := 9546, coreClauseIndex := 33032, terminalClauseIndex := 2603202, datum := { row := ⟨3, {0, 7, 8, 9}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9548; core 33038; terminal 2603208
  { outputClauseIndex := 9548, coreClauseIndex := 33038, terminalClauseIndex := 2603208, datum := { row := ⟨3, {0, 7, 8, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9549; core 33039; terminal 2603209
  { outputClauseIndex := 9549, coreClauseIndex := 33039, terminalClauseIndex := 2603209, datum := { row := ⟨3, {0, 7, 8, 10}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9551; core 33045; terminal 2603215
  { outputClauseIndex := 9551, coreClauseIndex := 33045, terminalClauseIndex := 2603215, datum := { row := ⟨3, {0, 7, 9, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9552; core 33046; terminal 2603216
  { outputClauseIndex := 9552, coreClauseIndex := 33046, terminalClauseIndex := 2603216, datum := { row := ⟨3, {0, 7, 9, 10}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9553; core 33051; terminal 2603222
  { outputClauseIndex := 9553, coreClauseIndex := 33051, terminalClauseIndex := 2603222, datum := { row := ⟨3, {0, 8, 9, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9554; core 33052; terminal 2603223
  { outputClauseIndex := 9554, coreClauseIndex := 33052, terminalClauseIndex := 2603223, datum := { row := ⟨3, {0, 8, 9, 10}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9555; core 33057; terminal 2603230
  { outputClauseIndex := 9555, coreClauseIndex := 33057, terminalClauseIndex := 2603230, datum := { row := ⟨3, {1, 2, 4, 5}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9556; core 33062; terminal 2603237
  { outputClauseIndex := 9556, coreClauseIndex := 33062, terminalClauseIndex := 2603237, datum := { row := ⟨3, {1, 2, 4, 6}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9557; core 33067; terminal 2603244
  { outputClauseIndex := 9557, coreClauseIndex := 33067, terminalClauseIndex := 2603244, datum := { row := ⟨3, {1, 2, 4, 7}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9558; core 33072; terminal 2603251
  { outputClauseIndex := 9558, coreClauseIndex := 33072, terminalClauseIndex := 2603251, datum := { row := ⟨3, {1, 2, 4, 8}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9559; core 33081; terminal 2603265
  { outputClauseIndex := 9559, coreClauseIndex := 33081, terminalClauseIndex := 2603265, datum := { row := ⟨3, {1, 2, 4, 10}⟩, arc := ⟨3, .right, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9560; core 33086; terminal 2603271
  { outputClauseIndex := 9560, coreClauseIndex := 33086, terminalClauseIndex := 2603271, datum := { row := ⟨3, {1, 2, 5, 6}⟩, arc := ⟨3, .left, {8}⟩ } },
  -- compact 9562; core 33092; terminal 2603278
  { outputClauseIndex := 9562, coreClauseIndex := 33092, terminalClauseIndex := 2603278, datum := { row := ⟨3, {1, 2, 5, 7}⟩, arc := ⟨3, .left, {8}⟩ } },
  -- compact 9563; core 33093; terminal 2603279
  { outputClauseIndex := 9563, coreClauseIndex := 33093, terminalClauseIndex := 2603279, datum := { row := ⟨3, {1, 2, 5, 7}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9565; core 33099; terminal 2603285
  { outputClauseIndex := 9565, coreClauseIndex := 33099, terminalClauseIndex := 2603285, datum := { row := ⟨3, {1, 2, 5, 8}⟩, arc := ⟨3, .left, {8}⟩ } },
  -- compact 9566; core 33100; terminal 2603286
  { outputClauseIndex := 9566, coreClauseIndex := 33100, terminalClauseIndex := 2603286, datum := { row := ⟨3, {1, 2, 5, 8}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9568; core 33106; terminal 2603292
  { outputClauseIndex := 9568, coreClauseIndex := 33106, terminalClauseIndex := 2603292, datum := { row := ⟨3, {1, 2, 5, 9}⟩, arc := ⟨3, .left, {8}⟩ } },
  -- compact 9570; core 33112; terminal 2603299
  { outputClauseIndex := 9570, coreClauseIndex := 33112, terminalClauseIndex := 2603299, datum := { row := ⟨3, {1, 2, 5, 10}⟩, arc := ⟨3, .left, {8}⟩ } },
  -- compact 9571; core 33113; terminal 2603300
  { outputClauseIndex := 9571, coreClauseIndex := 33113, terminalClauseIndex := 2603300, datum := { row := ⟨3, {1, 2, 5, 10}⟩, arc := ⟨3, .right, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9573; core 33119; terminal 2603306
  { outputClauseIndex := 9573, coreClauseIndex := 33119, terminalClauseIndex := 2603306, datum := { row := ⟨3, {1, 2, 6, 7}⟩, arc := ⟨3, .left, {8}⟩ } },
  -- compact 9574; core 33120; terminal 2603307
  { outputClauseIndex := 9574, coreClauseIndex := 33120, terminalClauseIndex := 2603307, datum := { row := ⟨3, {1, 2, 6, 7}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9576; core 33126; terminal 2603313
  { outputClauseIndex := 9576, coreClauseIndex := 33126, terminalClauseIndex := 2603313, datum := { row := ⟨3, {1, 2, 6, 8}⟩, arc := ⟨3, .left, {8}⟩ } },
  -- compact 9577; core 33127; terminal 2603314
  { outputClauseIndex := 9577, coreClauseIndex := 33127, terminalClauseIndex := 2603314, datum := { row := ⟨3, {1, 2, 6, 8}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9579; core 33133; terminal 2603320
  { outputClauseIndex := 9579, coreClauseIndex := 33133, terminalClauseIndex := 2603320, datum := { row := ⟨3, {1, 2, 6, 9}⟩, arc := ⟨3, .left, {8}⟩ } },
  -- compact 9580; core 33134; terminal 2603321
  { outputClauseIndex := 9580, coreClauseIndex := 33134, terminalClauseIndex := 2603321, datum := { row := ⟨3, {1, 2, 6, 9}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9582; core 33140; terminal 2603327
  { outputClauseIndex := 9582, coreClauseIndex := 33140, terminalClauseIndex := 2603327, datum := { row := ⟨3, {1, 2, 6, 10}⟩, arc := ⟨3, .left, {8}⟩ } },
  -- compact 9583; core 33141; terminal 2603328
  { outputClauseIndex := 9583, coreClauseIndex := 33141, terminalClauseIndex := 2603328, datum := { row := ⟨3, {1, 2, 6, 10}⟩, arc := ⟨3, .right, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9585; core 33147; terminal 2603334
  { outputClauseIndex := 9585, coreClauseIndex := 33147, terminalClauseIndex := 2603334, datum := { row := ⟨3, {1, 2, 7, 8}⟩, arc := ⟨3, .left, {8}⟩ } },
  -- compact 9586; core 33148; terminal 2603335
  { outputClauseIndex := 9586, coreClauseIndex := 33148, terminalClauseIndex := 2603335, datum := { row := ⟨3, {1, 2, 7, 8}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9588; core 33154; terminal 2603341
  { outputClauseIndex := 9588, coreClauseIndex := 33154, terminalClauseIndex := 2603341, datum := { row := ⟨3, {1, 2, 7, 9}⟩, arc := ⟨3, .left, {8}⟩ } },
  -- compact 9590; core 33160; terminal 2603348
  { outputClauseIndex := 9590, coreClauseIndex := 33160, terminalClauseIndex := 2603348, datum := { row := ⟨3, {1, 2, 7, 10}⟩, arc := ⟨3, .left, {8}⟩ } },
  -- compact 9591; core 33161; terminal 2603349
  { outputClauseIndex := 9591, coreClauseIndex := 33161, terminalClauseIndex := 2603349, datum := { row := ⟨3, {1, 2, 7, 10}⟩, arc := ⟨3, .right, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9593; core 33167; terminal 2603355
  { outputClauseIndex := 9593, coreClauseIndex := 33167, terminalClauseIndex := 2603355, datum := { row := ⟨3, {1, 2, 8, 9}⟩, arc := ⟨3, .left, {8}⟩ } },
  -- compact 9595; core 33173; terminal 2603362
  { outputClauseIndex := 9595, coreClauseIndex := 33173, terminalClauseIndex := 2603362, datum := { row := ⟨3, {1, 2, 8, 10}⟩, arc := ⟨3, .left, {8}⟩ } },
  -- compact 9596; core 33174; terminal 2603363
  { outputClauseIndex := 9596, coreClauseIndex := 33174, terminalClauseIndex := 2603363, datum := { row := ⟨3, {1, 2, 8, 10}⟩, arc := ⟨3, .right, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9598; core 33180; terminal 2603369
  { outputClauseIndex := 9598, coreClauseIndex := 33180, terminalClauseIndex := 2603369, datum := { row := ⟨3, {1, 2, 9, 10}⟩, arc := ⟨3, .left, {8}⟩ } },
  -- compact 9599; core 33181; terminal 2603370
  { outputClauseIndex := 9599, coreClauseIndex := 33181, terminalClauseIndex := 2603370, datum := { row := ⟨3, {1, 2, 9, 10}⟩, arc := ⟨3, .right, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9601; core 33190; terminal 2603383
  { outputClauseIndex := 9601, coreClauseIndex := 33190, terminalClauseIndex := 2603383, datum := { row := ⟨3, {1, 4, 5, 7}⟩, arc := ⟨3, .left, {0, 1, 2, 8, 9, 10}⟩ } },
  -- compact 9602; core 33191; terminal 2603384
  { outputClauseIndex := 9602, coreClauseIndex := 33191, terminalClauseIndex := 2603384, datum := { row := ⟨3, {1, 4, 5, 7}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9604; core 33197; terminal 2603390
  { outputClauseIndex := 9604, coreClauseIndex := 33197, terminalClauseIndex := 2603390, datum := { row := ⟨3, {1, 4, 5, 8}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9605; core 33198; terminal 2603391
  { outputClauseIndex := 9605, coreClauseIndex := 33198, terminalClauseIndex := 2603391, datum := { row := ⟨3, {1, 4, 5, 8}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9607; core 33204; terminal 2603397
  { outputClauseIndex := 9607, coreClauseIndex := 33204, terminalClauseIndex := 2603397, datum := { row := ⟨3, {1, 4, 5, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9608; core 33205; terminal 2603398
  { outputClauseIndex := 9608, coreClauseIndex := 33205, terminalClauseIndex := 2603398, datum := { row := ⟨3, {1, 4, 5, 9}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9610; core 33211; terminal 2603404
  { outputClauseIndex := 9610, coreClauseIndex := 33211, terminalClauseIndex := 2603404, datum := { row := ⟨3, {1, 4, 5, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9611; core 33212; terminal 2603405
  { outputClauseIndex := 9611, coreClauseIndex := 33212, terminalClauseIndex := 2603405, datum := { row := ⟨3, {1, 4, 5, 10}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9613; core 33218; terminal 2603411
  { outputClauseIndex := 9613, coreClauseIndex := 33218, terminalClauseIndex := 2603411, datum := { row := ⟨3, {1, 4, 6, 7}⟩, arc := ⟨3, .left, {0, 1, 2, 8, 9, 10}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk006_batch_valid :
    directRowArcFiniteOccurrencesChunk006.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk006, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk006 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk006.map (·.datum)

theorem directRowArcFiniteDataChunk006_batch_valid :
    directRowArcFiniteDataChunk006.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk006, datum.Valid := by
  rw [directRowArcFiniteDataChunk006]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk006_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk006_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
