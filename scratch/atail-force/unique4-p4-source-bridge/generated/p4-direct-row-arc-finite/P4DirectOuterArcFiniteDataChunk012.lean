/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk012 : List DirectRowArcFiniteOccurrence := [
  -- compact 10555; core 36087; terminal 2607003
  { outputClauseIndex := 10555, coreClauseIndex := 36087, terminalClauseIndex := 2607003, datum := { row := ⟨5, {4, 7, 9, 10}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10556; core 36092; terminal 2607009
  { outputClauseIndex := 10556, coreClauseIndex := 36092, terminalClauseIndex := 2607009, datum := { row := ⟨5, {4, 8, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10558; core 36098; terminal 2607016
  { outputClauseIndex := 10558, coreClauseIndex := 36098, terminalClauseIndex := 2607016, datum := { row := ⟨5, {6, 7, 8, 9}⟩, arc := ⟨5, .left, {0, 1, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10559; core 36099; terminal 2607017
  { outputClauseIndex := 10559, coreClauseIndex := 36099, terminalClauseIndex := 2607017, datum := { row := ⟨5, {6, 7, 8, 9}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10561; core 36105; terminal 2607023
  { outputClauseIndex := 10561, coreClauseIndex := 36105, terminalClauseIndex := 2607023, datum := { row := ⟨5, {6, 7, 8, 10}⟩, arc := ⟨5, .left, {0, 1, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10562; core 36106; terminal 2607024
  { outputClauseIndex := 10562, coreClauseIndex := 36106, terminalClauseIndex := 2607024, datum := { row := ⟨5, {6, 7, 8, 10}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10564; core 36112; terminal 2607030
  { outputClauseIndex := 10564, coreClauseIndex := 36112, terminalClauseIndex := 2607030, datum := { row := ⟨5, {6, 7, 9, 10}⟩, arc := ⟨5, .left, {0, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10565; core 36113; terminal 2607031
  { outputClauseIndex := 10565, coreClauseIndex := 36113, terminalClauseIndex := 2607031, datum := { row := ⟨5, {6, 7, 9, 10}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10566; core 36118; terminal 2607037
  { outputClauseIndex := 10566, coreClauseIndex := 36118, terminalClauseIndex := 2607037, datum := { row := ⟨5, {6, 8, 9, 10}⟩, arc := ⟨5, .left, {0, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10567; core 36119; terminal 2607038
  { outputClauseIndex := 10567, coreClauseIndex := 36119, terminalClauseIndex := 2607038, datum := { row := ⟨5, {6, 8, 9, 10}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10568; core 36124; terminal 2607044
  { outputClauseIndex := 10568, coreClauseIndex := 36124, terminalClauseIndex := 2607044, datum := { row := ⟨5, {7, 8, 9, 10}⟩, arc := ⟨5, .left, {0, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10569; core 36125; terminal 2607045
  { outputClauseIndex := 10569, coreClauseIndex := 36125, terminalClauseIndex := 2607045, datum := { row := ⟨5, {7, 8, 9, 10}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10571; core 36131; terminal 2607051
  { outputClauseIndex := 10571, coreClauseIndex := 36131, terminalClauseIndex := 2607051, datum := { row := ⟨6, {0, 1, 2, 3}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10572; core 36132; terminal 2607052
  { outputClauseIndex := 10572, coreClauseIndex := 36132, terminalClauseIndex := 2607052, datum := { row := ⟨6, {0, 1, 2, 3}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10574; core 36138; terminal 2607058
  { outputClauseIndex := 10574, coreClauseIndex := 36138, terminalClauseIndex := 2607058, datum := { row := ⟨6, {0, 1, 2, 4}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10575; core 36139; terminal 2607059
  { outputClauseIndex := 10575, coreClauseIndex := 36139, terminalClauseIndex := 2607059, datum := { row := ⟨6, {0, 1, 2, 4}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10577; core 36145; terminal 2607065
  { outputClauseIndex := 10577, coreClauseIndex := 36145, terminalClauseIndex := 2607065, datum := { row := ⟨6, {0, 1, 2, 5}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10578; core 36146; terminal 2607066
  { outputClauseIndex := 10578, coreClauseIndex := 36146, terminalClauseIndex := 2607066, datum := { row := ⟨6, {0, 1, 2, 5}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10580; core 36152; terminal 2607072
  { outputClauseIndex := 10580, coreClauseIndex := 36152, terminalClauseIndex := 2607072, datum := { row := ⟨6, {0, 1, 2, 7}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10581; core 36153; terminal 2607073
  { outputClauseIndex := 10581, coreClauseIndex := 36153, terminalClauseIndex := 2607073, datum := { row := ⟨6, {0, 1, 2, 7}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10583; core 36159; terminal 2607079
  { outputClauseIndex := 10583, coreClauseIndex := 36159, terminalClauseIndex := 2607079, datum := { row := ⟨6, {0, 1, 2, 8}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10584; core 36160; terminal 2607080
  { outputClauseIndex := 10584, coreClauseIndex := 36160, terminalClauseIndex := 2607080, datum := { row := ⟨6, {0, 1, 2, 8}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10586; core 36166; terminal 2607086
  { outputClauseIndex := 10586, coreClauseIndex := 36166, terminalClauseIndex := 2607086, datum := { row := ⟨6, {0, 1, 2, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10587; core 36167; terminal 2607087
  { outputClauseIndex := 10587, coreClauseIndex := 36167, terminalClauseIndex := 2607087, datum := { row := ⟨6, {0, 1, 2, 9}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10589; core 36173; terminal 2607093
  { outputClauseIndex := 10589, coreClauseIndex := 36173, terminalClauseIndex := 2607093, datum := { row := ⟨6, {0, 1, 2, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10590; core 36174; terminal 2607094
  { outputClauseIndex := 10590, coreClauseIndex := 36174, terminalClauseIndex := 2607094, datum := { row := ⟨6, {0, 1, 2, 10}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10592; core 36180; terminal 2607100
  { outputClauseIndex := 10592, coreClauseIndex := 36180, terminalClauseIndex := 2607100, datum := { row := ⟨6, {0, 1, 3, 4}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10593; core 36181; terminal 2607101
  { outputClauseIndex := 10593, coreClauseIndex := 36181, terminalClauseIndex := 2607101, datum := { row := ⟨6, {0, 1, 3, 4}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10595; core 36187; terminal 2607107
  { outputClauseIndex := 10595, coreClauseIndex := 36187, terminalClauseIndex := 2607107, datum := { row := ⟨6, {0, 1, 3, 5}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10596; core 36188; terminal 2607108
  { outputClauseIndex := 10596, coreClauseIndex := 36188, terminalClauseIndex := 2607108, datum := { row := ⟨6, {0, 1, 3, 5}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10598; core 36194; terminal 2607114
  { outputClauseIndex := 10598, coreClauseIndex := 36194, terminalClauseIndex := 2607114, datum := { row := ⟨6, {0, 1, 3, 7}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10599; core 36195; terminal 2607115
  { outputClauseIndex := 10599, coreClauseIndex := 36195, terminalClauseIndex := 2607115, datum := { row := ⟨6, {0, 1, 3, 7}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10601; core 36201; terminal 2607121
  { outputClauseIndex := 10601, coreClauseIndex := 36201, terminalClauseIndex := 2607121, datum := { row := ⟨6, {0, 1, 3, 8}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10602; core 36202; terminal 2607122
  { outputClauseIndex := 10602, coreClauseIndex := 36202, terminalClauseIndex := 2607122, datum := { row := ⟨6, {0, 1, 3, 8}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10604; core 36208; terminal 2607128
  { outputClauseIndex := 10604, coreClauseIndex := 36208, terminalClauseIndex := 2607128, datum := { row := ⟨6, {0, 1, 3, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10605; core 36209; terminal 2607129
  { outputClauseIndex := 10605, coreClauseIndex := 36209, terminalClauseIndex := 2607129, datum := { row := ⟨6, {0, 1, 3, 9}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10607; core 36215; terminal 2607135
  { outputClauseIndex := 10607, coreClauseIndex := 36215, terminalClauseIndex := 2607135, datum := { row := ⟨6, {0, 1, 3, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10608; core 36216; terminal 2607136
  { outputClauseIndex := 10608, coreClauseIndex := 36216, terminalClauseIndex := 2607136, datum := { row := ⟨6, {0, 1, 3, 10}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10610; core 36222; terminal 2607142
  { outputClauseIndex := 10610, coreClauseIndex := 36222, terminalClauseIndex := 2607142, datum := { row := ⟨6, {0, 1, 4, 5}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 10611; core 36223; terminal 2607143
  { outputClauseIndex := 10611, coreClauseIndex := 36223, terminalClauseIndex := 2607143, datum := { row := ⟨6, {0, 1, 4, 5}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10613; core 36229; terminal 2607149
  { outputClauseIndex := 10613, coreClauseIndex := 36229, terminalClauseIndex := 2607149, datum := { row := ⟨6, {0, 1, 4, 7}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10614; core 36230; terminal 2607150
  { outputClauseIndex := 10614, coreClauseIndex := 36230, terminalClauseIndex := 2607150, datum := { row := ⟨6, {0, 1, 4, 7}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10616; core 36236; terminal 2607156
  { outputClauseIndex := 10616, coreClauseIndex := 36236, terminalClauseIndex := 2607156, datum := { row := ⟨6, {0, 1, 4, 8}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10617; core 36237; terminal 2607157
  { outputClauseIndex := 10617, coreClauseIndex := 36237, terminalClauseIndex := 2607157, datum := { row := ⟨6, {0, 1, 4, 8}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10619; core 36243; terminal 2607163
  { outputClauseIndex := 10619, coreClauseIndex := 36243, terminalClauseIndex := 2607163, datum := { row := ⟨6, {0, 1, 4, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10620; core 36244; terminal 2607164
  { outputClauseIndex := 10620, coreClauseIndex := 36244, terminalClauseIndex := 2607164, datum := { row := ⟨6, {0, 1, 4, 9}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10622; core 36250; terminal 2607170
  { outputClauseIndex := 10622, coreClauseIndex := 36250, terminalClauseIndex := 2607170, datum := { row := ⟨6, {0, 1, 4, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10623; core 36251; terminal 2607171
  { outputClauseIndex := 10623, coreClauseIndex := 36251, terminalClauseIndex := 2607171, datum := { row := ⟨6, {0, 1, 4, 10}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10625; core 36257; terminal 2607177
  { outputClauseIndex := 10625, coreClauseIndex := 36257, terminalClauseIndex := 2607177, datum := { row := ⟨6, {0, 1, 5, 7}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10626; core 36258; terminal 2607178
  { outputClauseIndex := 10626, coreClauseIndex := 36258, terminalClauseIndex := 2607178, datum := { row := ⟨6, {0, 1, 5, 7}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10628; core 36264; terminal 2607184
  { outputClauseIndex := 10628, coreClauseIndex := 36264, terminalClauseIndex := 2607184, datum := { row := ⟨6, {0, 1, 5, 8}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10629; core 36265; terminal 2607185
  { outputClauseIndex := 10629, coreClauseIndex := 36265, terminalClauseIndex := 2607185, datum := { row := ⟨6, {0, 1, 5, 8}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10631; core 36271; terminal 2607191
  { outputClauseIndex := 10631, coreClauseIndex := 36271, terminalClauseIndex := 2607191, datum := { row := ⟨6, {0, 1, 5, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10632; core 36272; terminal 2607192
  { outputClauseIndex := 10632, coreClauseIndex := 36272, terminalClauseIndex := 2607192, datum := { row := ⟨6, {0, 1, 5, 9}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10634; core 36278; terminal 2607198
  { outputClauseIndex := 10634, coreClauseIndex := 36278, terminalClauseIndex := 2607198, datum := { row := ⟨6, {0, 1, 5, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10635; core 36279; terminal 2607199
  { outputClauseIndex := 10635, coreClauseIndex := 36279, terminalClauseIndex := 2607199, datum := { row := ⟨6, {0, 1, 5, 10}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10637; core 36285; terminal 2607205
  { outputClauseIndex := 10637, coreClauseIndex := 36285, terminalClauseIndex := 2607205, datum := { row := ⟨6, {0, 1, 7, 8}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10638; core 36286; terminal 2607206
  { outputClauseIndex := 10638, coreClauseIndex := 36286, terminalClauseIndex := 2607206, datum := { row := ⟨6, {0, 1, 7, 8}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 10640; core 36292; terminal 2607212
  { outputClauseIndex := 10640, coreClauseIndex := 36292, terminalClauseIndex := 2607212, datum := { row := ⟨6, {0, 1, 7, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10641; core 36293; terminal 2607213
  { outputClauseIndex := 10641, coreClauseIndex := 36293, terminalClauseIndex := 2607213, datum := { row := ⟨6, {0, 1, 7, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10643; core 36299; terminal 2607219
  { outputClauseIndex := 10643, coreClauseIndex := 36299, terminalClauseIndex := 2607219, datum := { row := ⟨6, {0, 1, 7, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10644; core 36300; terminal 2607220
  { outputClauseIndex := 10644, coreClauseIndex := 36300, terminalClauseIndex := 2607220, datum := { row := ⟨6, {0, 1, 7, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10646; core 36306; terminal 2607226
  { outputClauseIndex := 10646, coreClauseIndex := 36306, terminalClauseIndex := 2607226, datum := { row := ⟨6, {0, 1, 8, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10647; core 36307; terminal 2607227
  { outputClauseIndex := 10647, coreClauseIndex := 36307, terminalClauseIndex := 2607227, datum := { row := ⟨6, {0, 1, 8, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10649; core 36313; terminal 2607233
  { outputClauseIndex := 10649, coreClauseIndex := 36313, terminalClauseIndex := 2607233, datum := { row := ⟨6, {0, 1, 8, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10650; core 36314; terminal 2607234
  { outputClauseIndex := 10650, coreClauseIndex := 36314, terminalClauseIndex := 2607234, datum := { row := ⟨6, {0, 1, 8, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10652; core 36320; terminal 2607240
  { outputClauseIndex := 10652, coreClauseIndex := 36320, terminalClauseIndex := 2607240, datum := { row := ⟨6, {0, 1, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10653; core 36321; terminal 2607241
  { outputClauseIndex := 10653, coreClauseIndex := 36321, terminalClauseIndex := 2607241, datum := { row := ⟨6, {0, 1, 9, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10655; core 36327; terminal 2607247
  { outputClauseIndex := 10655, coreClauseIndex := 36327, terminalClauseIndex := 2607247, datum := { row := ⟨6, {0, 2, 3, 4}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10656; core 36328; terminal 2607248
  { outputClauseIndex := 10656, coreClauseIndex := 36328, terminalClauseIndex := 2607248, datum := { row := ⟨6, {0, 2, 3, 4}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 10658; core 36334; terminal 2607254
  { outputClauseIndex := 10658, coreClauseIndex := 36334, terminalClauseIndex := 2607254, datum := { row := ⟨6, {0, 2, 3, 5}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10659; core 36335; terminal 2607255
  { outputClauseIndex := 10659, coreClauseIndex := 36335, terminalClauseIndex := 2607255, datum := { row := ⟨6, {0, 2, 3, 5}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 10661; core 36341; terminal 2607261
  { outputClauseIndex := 10661, coreClauseIndex := 36341, terminalClauseIndex := 2607261, datum := { row := ⟨6, {0, 2, 3, 7}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10662; core 36342; terminal 2607262
  { outputClauseIndex := 10662, coreClauseIndex := 36342, terminalClauseIndex := 2607262, datum := { row := ⟨6, {0, 2, 3, 7}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10664; core 36348; terminal 2607268
  { outputClauseIndex := 10664, coreClauseIndex := 36348, terminalClauseIndex := 2607268, datum := { row := ⟨6, {0, 2, 3, 8}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10665; core 36349; terminal 2607269
  { outputClauseIndex := 10665, coreClauseIndex := 36349, terminalClauseIndex := 2607269, datum := { row := ⟨6, {0, 2, 3, 8}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10667; core 36355; terminal 2607275
  { outputClauseIndex := 10667, coreClauseIndex := 36355, terminalClauseIndex := 2607275, datum := { row := ⟨6, {0, 2, 3, 9}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10668; core 36356; terminal 2607276
  { outputClauseIndex := 10668, coreClauseIndex := 36356, terminalClauseIndex := 2607276, datum := { row := ⟨6, {0, 2, 3, 9}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10670; core 36362; terminal 2607282
  { outputClauseIndex := 10670, coreClauseIndex := 36362, terminalClauseIndex := 2607282, datum := { row := ⟨6, {0, 2, 3, 10}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10671; core 36363; terminal 2607283
  { outputClauseIndex := 10671, coreClauseIndex := 36363, terminalClauseIndex := 2607283, datum := { row := ⟨6, {0, 2, 3, 10}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10673; core 36369; terminal 2607289
  { outputClauseIndex := 10673, coreClauseIndex := 36369, terminalClauseIndex := 2607289, datum := { row := ⟨6, {0, 2, 4, 5}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 10674; core 36370; terminal 2607290
  { outputClauseIndex := 10674, coreClauseIndex := 36370, terminalClauseIndex := 2607290, datum := { row := ⟨6, {0, 2, 4, 5}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 10676; core 36376; terminal 2607296
  { outputClauseIndex := 10676, coreClauseIndex := 36376, terminalClauseIndex := 2607296, datum := { row := ⟨6, {0, 2, 4, 7}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10677; core 36377; terminal 2607297
  { outputClauseIndex := 10677, coreClauseIndex := 36377, terminalClauseIndex := 2607297, datum := { row := ⟨6, {0, 2, 4, 7}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10679; core 36383; terminal 2607303
  { outputClauseIndex := 10679, coreClauseIndex := 36383, terminalClauseIndex := 2607303, datum := { row := ⟨6, {0, 2, 4, 8}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10680; core 36384; terminal 2607304
  { outputClauseIndex := 10680, coreClauseIndex := 36384, terminalClauseIndex := 2607304, datum := { row := ⟨6, {0, 2, 4, 8}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10682; core 36390; terminal 2607310
  { outputClauseIndex := 10682, coreClauseIndex := 36390, terminalClauseIndex := 2607310, datum := { row := ⟨6, {0, 2, 4, 9}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10683; core 36391; terminal 2607311
  { outputClauseIndex := 10683, coreClauseIndex := 36391, terminalClauseIndex := 2607311, datum := { row := ⟨6, {0, 2, 4, 9}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10685; core 36397; terminal 2607317
  { outputClauseIndex := 10685, coreClauseIndex := 36397, terminalClauseIndex := 2607317, datum := { row := ⟨6, {0, 2, 4, 10}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10686; core 36398; terminal 2607318
  { outputClauseIndex := 10686, coreClauseIndex := 36398, terminalClauseIndex := 2607318, datum := { row := ⟨6, {0, 2, 4, 10}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10688; core 36404; terminal 2607324
  { outputClauseIndex := 10688, coreClauseIndex := 36404, terminalClauseIndex := 2607324, datum := { row := ⟨6, {0, 2, 5, 7}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10689; core 36405; terminal 2607325
  { outputClauseIndex := 10689, coreClauseIndex := 36405, terminalClauseIndex := 2607325, datum := { row := ⟨6, {0, 2, 5, 7}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10691; core 36411; terminal 2607331
  { outputClauseIndex := 10691, coreClauseIndex := 36411, terminalClauseIndex := 2607331, datum := { row := ⟨6, {0, 2, 5, 8}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10692; core 36412; terminal 2607332
  { outputClauseIndex := 10692, coreClauseIndex := 36412, terminalClauseIndex := 2607332, datum := { row := ⟨6, {0, 2, 5, 8}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10694; core 36418; terminal 2607338
  { outputClauseIndex := 10694, coreClauseIndex := 36418, terminalClauseIndex := 2607338, datum := { row := ⟨6, {0, 2, 5, 9}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10695; core 36419; terminal 2607339
  { outputClauseIndex := 10695, coreClauseIndex := 36419, terminalClauseIndex := 2607339, datum := { row := ⟨6, {0, 2, 5, 9}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10697; core 36425; terminal 2607345
  { outputClauseIndex := 10697, coreClauseIndex := 36425, terminalClauseIndex := 2607345, datum := { row := ⟨6, {0, 2, 5, 10}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10698; core 36426; terminal 2607346
  { outputClauseIndex := 10698, coreClauseIndex := 36426, terminalClauseIndex := 2607346, datum := { row := ⟨6, {0, 2, 5, 10}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10700; core 36432; terminal 2607352
  { outputClauseIndex := 10700, coreClauseIndex := 36432, terminalClauseIndex := 2607352, datum := { row := ⟨6, {0, 2, 7, 8}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10701; core 36433; terminal 2607353
  { outputClauseIndex := 10701, coreClauseIndex := 36433, terminalClauseIndex := 2607353, datum := { row := ⟨6, {0, 2, 7, 8}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 10703; core 36439; terminal 2607359
  { outputClauseIndex := 10703, coreClauseIndex := 36439, terminalClauseIndex := 2607359, datum := { row := ⟨6, {0, 2, 7, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10704; core 36440; terminal 2607360
  { outputClauseIndex := 10704, coreClauseIndex := 36440, terminalClauseIndex := 2607360, datum := { row := ⟨6, {0, 2, 7, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10706; core 36446; terminal 2607366
  { outputClauseIndex := 10706, coreClauseIndex := 36446, terminalClauseIndex := 2607366, datum := { row := ⟨6, {0, 2, 7, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10707; core 36447; terminal 2607367
  { outputClauseIndex := 10707, coreClauseIndex := 36447, terminalClauseIndex := 2607367, datum := { row := ⟨6, {0, 2, 7, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10709; core 36453; terminal 2607373
  { outputClauseIndex := 10709, coreClauseIndex := 36453, terminalClauseIndex := 2607373, datum := { row := ⟨6, {0, 2, 8, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10710; core 36454; terminal 2607374
  { outputClauseIndex := 10710, coreClauseIndex := 36454, terminalClauseIndex := 2607374, datum := { row := ⟨6, {0, 2, 8, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10712; core 36460; terminal 2607380
  { outputClauseIndex := 10712, coreClauseIndex := 36460, terminalClauseIndex := 2607380, datum := { row := ⟨6, {0, 2, 8, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10713; core 36461; terminal 2607381
  { outputClauseIndex := 10713, coreClauseIndex := 36461, terminalClauseIndex := 2607381, datum := { row := ⟨6, {0, 2, 8, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10715; core 36467; terminal 2607387
  { outputClauseIndex := 10715, coreClauseIndex := 36467, terminalClauseIndex := 2607387, datum := { row := ⟨6, {0, 2, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10716; core 36468; terminal 2607388
  { outputClauseIndex := 10716, coreClauseIndex := 36468, terminalClauseIndex := 2607388, datum := { row := ⟨6, {0, 2, 9, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10718; core 36474; terminal 2607394
  { outputClauseIndex := 10718, coreClauseIndex := 36474, terminalClauseIndex := 2607394, datum := { row := ⟨6, {0, 3, 4, 5}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 10719; core 36475; terminal 2607395
  { outputClauseIndex := 10719, coreClauseIndex := 36475, terminalClauseIndex := 2607395, datum := { row := ⟨6, {0, 3, 4, 5}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 8, 9, 10}⟩ } },
  -- compact 10721; core 36481; terminal 2607401
  { outputClauseIndex := 10721, coreClauseIndex := 36481, terminalClauseIndex := 2607401, datum := { row := ⟨6, {0, 3, 4, 7}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10722; core 36482; terminal 2607402
  { outputClauseIndex := 10722, coreClauseIndex := 36482, terminalClauseIndex := 2607402, datum := { row := ⟨6, {0, 3, 4, 7}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10724; core 36488; terminal 2607408
  { outputClauseIndex := 10724, coreClauseIndex := 36488, terminalClauseIndex := 2607408, datum := { row := ⟨6, {0, 3, 4, 8}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10725; core 36489; terminal 2607409
  { outputClauseIndex := 10725, coreClauseIndex := 36489, terminalClauseIndex := 2607409, datum := { row := ⟨6, {0, 3, 4, 8}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10727; core 36495; terminal 2607415
  { outputClauseIndex := 10727, coreClauseIndex := 36495, terminalClauseIndex := 2607415, datum := { row := ⟨6, {0, 3, 4, 9}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10728; core 36496; terminal 2607416
  { outputClauseIndex := 10728, coreClauseIndex := 36496, terminalClauseIndex := 2607416, datum := { row := ⟨6, {0, 3, 4, 9}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10730; core 36502; terminal 2607422
  { outputClauseIndex := 10730, coreClauseIndex := 36502, terminalClauseIndex := 2607422, datum := { row := ⟨6, {0, 3, 4, 10}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10731; core 36503; terminal 2607423
  { outputClauseIndex := 10731, coreClauseIndex := 36503, terminalClauseIndex := 2607423, datum := { row := ⟨6, {0, 3, 4, 10}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10733; core 36509; terminal 2607429
  { outputClauseIndex := 10733, coreClauseIndex := 36509, terminalClauseIndex := 2607429, datum := { row := ⟨6, {0, 3, 5, 7}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10734; core 36510; terminal 2607430
  { outputClauseIndex := 10734, coreClauseIndex := 36510, terminalClauseIndex := 2607430, datum := { row := ⟨6, {0, 3, 5, 7}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10736; core 36516; terminal 2607436
  { outputClauseIndex := 10736, coreClauseIndex := 36516, terminalClauseIndex := 2607436, datum := { row := ⟨6, {0, 3, 5, 8}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10737; core 36517; terminal 2607437
  { outputClauseIndex := 10737, coreClauseIndex := 36517, terminalClauseIndex := 2607437, datum := { row := ⟨6, {0, 3, 5, 8}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10739; core 36523; terminal 2607443
  { outputClauseIndex := 10739, coreClauseIndex := 36523, terminalClauseIndex := 2607443, datum := { row := ⟨6, {0, 3, 5, 9}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10740; core 36524; terminal 2607444
  { outputClauseIndex := 10740, coreClauseIndex := 36524, terminalClauseIndex := 2607444, datum := { row := ⟨6, {0, 3, 5, 9}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10742; core 36530; terminal 2607450
  { outputClauseIndex := 10742, coreClauseIndex := 36530, terminalClauseIndex := 2607450, datum := { row := ⟨6, {0, 3, 5, 10}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10743; core 36531; terminal 2607451
  { outputClauseIndex := 10743, coreClauseIndex := 36531, terminalClauseIndex := 2607451, datum := { row := ⟨6, {0, 3, 5, 10}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk012_batch_valid :
    directRowArcFiniteOccurrencesChunk012.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk012, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk012 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk012.map (·.datum)

theorem directRowArcFiniteDataChunk012_batch_valid :
    directRowArcFiniteDataChunk012.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk012, datum.Valid := by
  rw [directRowArcFiniteDataChunk012]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk012_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk012_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
