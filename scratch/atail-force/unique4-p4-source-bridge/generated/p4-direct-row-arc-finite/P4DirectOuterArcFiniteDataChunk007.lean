/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk007 : List DirectRowArcFiniteOccurrence := [
  -- compact 9614; core 33219; terminal 2603412
  { outputClauseIndex := 9614, coreClauseIndex := 33219, terminalClauseIndex := 2603412, datum := { row := ⟨3, {1, 4, 6, 7}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9616; core 33225; terminal 2603418
  { outputClauseIndex := 9616, coreClauseIndex := 33225, terminalClauseIndex := 2603418, datum := { row := ⟨3, {1, 4, 6, 8}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9617; core 33226; terminal 2603419
  { outputClauseIndex := 9617, coreClauseIndex := 33226, terminalClauseIndex := 2603419, datum := { row := ⟨3, {1, 4, 6, 8}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9619; core 33232; terminal 2603425
  { outputClauseIndex := 9619, coreClauseIndex := 33232, terminalClauseIndex := 2603425, datum := { row := ⟨3, {1, 4, 6, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9620; core 33233; terminal 2603426
  { outputClauseIndex := 9620, coreClauseIndex := 33233, terminalClauseIndex := 2603426, datum := { row := ⟨3, {1, 4, 6, 9}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9622; core 33239; terminal 2603432
  { outputClauseIndex := 9622, coreClauseIndex := 33239, terminalClauseIndex := 2603432, datum := { row := ⟨3, {1, 4, 6, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9623; core 33240; terminal 2603433
  { outputClauseIndex := 9623, coreClauseIndex := 33240, terminalClauseIndex := 2603433, datum := { row := ⟨3, {1, 4, 6, 10}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9625; core 33246; terminal 2603439
  { outputClauseIndex := 9625, coreClauseIndex := 33246, terminalClauseIndex := 2603439, datum := { row := ⟨3, {1, 4, 7, 8}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9626; core 33247; terminal 2603440
  { outputClauseIndex := 9626, coreClauseIndex := 33247, terminalClauseIndex := 2603440, datum := { row := ⟨3, {1, 4, 7, 8}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9628; core 33253; terminal 2603446
  { outputClauseIndex := 9628, coreClauseIndex := 33253, terminalClauseIndex := 2603446, datum := { row := ⟨3, {1, 4, 7, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9629; core 33254; terminal 2603447
  { outputClauseIndex := 9629, coreClauseIndex := 33254, terminalClauseIndex := 2603447, datum := { row := ⟨3, {1, 4, 7, 9}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9631; core 33260; terminal 2603453
  { outputClauseIndex := 9631, coreClauseIndex := 33260, terminalClauseIndex := 2603453, datum := { row := ⟨3, {1, 4, 7, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9632; core 33261; terminal 2603454
  { outputClauseIndex := 9632, coreClauseIndex := 33261, terminalClauseIndex := 2603454, datum := { row := ⟨3, {1, 4, 7, 10}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9634; core 33267; terminal 2603460
  { outputClauseIndex := 9634, coreClauseIndex := 33267, terminalClauseIndex := 2603460, datum := { row := ⟨3, {1, 4, 8, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9635; core 33268; terminal 2603461
  { outputClauseIndex := 9635, coreClauseIndex := 33268, terminalClauseIndex := 2603461, datum := { row := ⟨3, {1, 4, 8, 9}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9637; core 33274; terminal 2603467
  { outputClauseIndex := 9637, coreClauseIndex := 33274, terminalClauseIndex := 2603467, datum := { row := ⟨3, {1, 4, 8, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9638; core 33275; terminal 2603468
  { outputClauseIndex := 9638, coreClauseIndex := 33275, terminalClauseIndex := 2603468, datum := { row := ⟨3, {1, 4, 8, 10}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9640; core 33281; terminal 2603474
  { outputClauseIndex := 9640, coreClauseIndex := 33281, terminalClauseIndex := 2603474, datum := { row := ⟨3, {1, 4, 9, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9641; core 33282; terminal 2603475
  { outputClauseIndex := 9641, coreClauseIndex := 33282, terminalClauseIndex := 2603475, datum := { row := ⟨3, {1, 4, 9, 10}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9642; core 33295; terminal 2603495
  { outputClauseIndex := 9642, coreClauseIndex := 33295, terminalClauseIndex := 2603495, datum := { row := ⟨3, {1, 5, 6, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9643; core 33300; terminal 2603502
  { outputClauseIndex := 9643, coreClauseIndex := 33300, terminalClauseIndex := 2603502, datum := { row := ⟨3, {1, 5, 6, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9645; core 33306; terminal 2603509
  { outputClauseIndex := 9645, coreClauseIndex := 33306, terminalClauseIndex := 2603509, datum := { row := ⟨3, {1, 5, 7, 8}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9646; core 33307; terminal 2603510
  { outputClauseIndex := 9646, coreClauseIndex := 33307, terminalClauseIndex := 2603510, datum := { row := ⟨3, {1, 5, 7, 8}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9648; core 33313; terminal 2603516
  { outputClauseIndex := 9648, coreClauseIndex := 33313, terminalClauseIndex := 2603516, datum := { row := ⟨3, {1, 5, 7, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9649; core 33314; terminal 2603517
  { outputClauseIndex := 9649, coreClauseIndex := 33314, terminalClauseIndex := 2603517, datum := { row := ⟨3, {1, 5, 7, 9}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9651; core 33320; terminal 2603523
  { outputClauseIndex := 9651, coreClauseIndex := 33320, terminalClauseIndex := 2603523, datum := { row := ⟨3, {1, 5, 7, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9652; core 33321; terminal 2603524
  { outputClauseIndex := 9652, coreClauseIndex := 33321, terminalClauseIndex := 2603524, datum := { row := ⟨3, {1, 5, 7, 10}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9654; core 33327; terminal 2603530
  { outputClauseIndex := 9654, coreClauseIndex := 33327, terminalClauseIndex := 2603530, datum := { row := ⟨3, {1, 5, 8, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9655; core 33328; terminal 2603531
  { outputClauseIndex := 9655, coreClauseIndex := 33328, terminalClauseIndex := 2603531, datum := { row := ⟨3, {1, 5, 8, 9}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9657; core 33334; terminal 2603537
  { outputClauseIndex := 9657, coreClauseIndex := 33334, terminalClauseIndex := 2603537, datum := { row := ⟨3, {1, 5, 8, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9658; core 33335; terminal 2603538
  { outputClauseIndex := 9658, coreClauseIndex := 33335, terminalClauseIndex := 2603538, datum := { row := ⟨3, {1, 5, 8, 10}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9660; core 33341; terminal 2603544
  { outputClauseIndex := 9660, coreClauseIndex := 33341, terminalClauseIndex := 2603544, datum := { row := ⟨3, {1, 5, 9, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9661; core 33342; terminal 2603545
  { outputClauseIndex := 9661, coreClauseIndex := 33342, terminalClauseIndex := 2603545, datum := { row := ⟨3, {1, 5, 9, 10}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9663; core 33348; terminal 2603551
  { outputClauseIndex := 9663, coreClauseIndex := 33348, terminalClauseIndex := 2603551, datum := { row := ⟨3, {1, 6, 7, 8}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9664; core 33349; terminal 2603552
  { outputClauseIndex := 9664, coreClauseIndex := 33349, terminalClauseIndex := 2603552, datum := { row := ⟨3, {1, 6, 7, 8}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9666; core 33355; terminal 2603558
  { outputClauseIndex := 9666, coreClauseIndex := 33355, terminalClauseIndex := 2603558, datum := { row := ⟨3, {1, 6, 7, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9667; core 33356; terminal 2603559
  { outputClauseIndex := 9667, coreClauseIndex := 33356, terminalClauseIndex := 2603559, datum := { row := ⟨3, {1, 6, 7, 9}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9669; core 33362; terminal 2603565
  { outputClauseIndex := 9669, coreClauseIndex := 33362, terminalClauseIndex := 2603565, datum := { row := ⟨3, {1, 6, 7, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9670; core 33363; terminal 2603566
  { outputClauseIndex := 9670, coreClauseIndex := 33363, terminalClauseIndex := 2603566, datum := { row := ⟨3, {1, 6, 7, 10}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9672; core 33369; terminal 2603572
  { outputClauseIndex := 9672, coreClauseIndex := 33369, terminalClauseIndex := 2603572, datum := { row := ⟨3, {1, 6, 8, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9673; core 33370; terminal 2603573
  { outputClauseIndex := 9673, coreClauseIndex := 33370, terminalClauseIndex := 2603573, datum := { row := ⟨3, {1, 6, 8, 9}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9675; core 33376; terminal 2603579
  { outputClauseIndex := 9675, coreClauseIndex := 33376, terminalClauseIndex := 2603579, datum := { row := ⟨3, {1, 6, 8, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9676; core 33377; terminal 2603580
  { outputClauseIndex := 9676, coreClauseIndex := 33377, terminalClauseIndex := 2603580, datum := { row := ⟨3, {1, 6, 8, 10}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9678; core 33383; terminal 2603586
  { outputClauseIndex := 9678, coreClauseIndex := 33383, terminalClauseIndex := 2603586, datum := { row := ⟨3, {1, 6, 9, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9679; core 33384; terminal 2603587
  { outputClauseIndex := 9679, coreClauseIndex := 33384, terminalClauseIndex := 2603587, datum := { row := ⟨3, {1, 6, 9, 10}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9681; core 33390; terminal 2603593
  { outputClauseIndex := 9681, coreClauseIndex := 33390, terminalClauseIndex := 2603593, datum := { row := ⟨3, {1, 7, 8, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9682; core 33391; terminal 2603594
  { outputClauseIndex := 9682, coreClauseIndex := 33391, terminalClauseIndex := 2603594, datum := { row := ⟨3, {1, 7, 8, 9}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9684; core 33397; terminal 2603600
  { outputClauseIndex := 9684, coreClauseIndex := 33397, terminalClauseIndex := 2603600, datum := { row := ⟨3, {1, 7, 8, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9685; core 33398; terminal 2603601
  { outputClauseIndex := 9685, coreClauseIndex := 33398, terminalClauseIndex := 2603601, datum := { row := ⟨3, {1, 7, 8, 10}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9687; core 33404; terminal 2603607
  { outputClauseIndex := 9687, coreClauseIndex := 33404, terminalClauseIndex := 2603607, datum := { row := ⟨3, {1, 7, 9, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9688; core 33405; terminal 2603608
  { outputClauseIndex := 9688, coreClauseIndex := 33405, terminalClauseIndex := 2603608, datum := { row := ⟨3, {1, 7, 9, 10}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9689; core 33410; terminal 2603614
  { outputClauseIndex := 9689, coreClauseIndex := 33410, terminalClauseIndex := 2603614, datum := { row := ⟨3, {1, 8, 9, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9690; core 33411; terminal 2603615
  { outputClauseIndex := 9690, coreClauseIndex := 33411, terminalClauseIndex := 2603615, datum := { row := ⟨3, {1, 8, 9, 10}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9692; core 33419; terminal 2603628
  { outputClauseIndex := 9692, coreClauseIndex := 33419, terminalClauseIndex := 2603628, datum := { row := ⟨3, {2, 4, 5, 7}⟩, arc := ⟨3, .left, {0, 1, 2, 8, 9, 10}⟩ } },
  -- compact 9693; core 33420; terminal 2603629
  { outputClauseIndex := 9693, coreClauseIndex := 33420, terminalClauseIndex := 2603629, datum := { row := ⟨3, {2, 4, 5, 7}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9695; core 33426; terminal 2603635
  { outputClauseIndex := 9695, coreClauseIndex := 33426, terminalClauseIndex := 2603635, datum := { row := ⟨3, {2, 4, 5, 8}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9696; core 33427; terminal 2603636
  { outputClauseIndex := 9696, coreClauseIndex := 33427, terminalClauseIndex := 2603636, datum := { row := ⟨3, {2, 4, 5, 8}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9698; core 33433; terminal 2603642
  { outputClauseIndex := 9698, coreClauseIndex := 33433, terminalClauseIndex := 2603642, datum := { row := ⟨3, {2, 4, 5, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9699; core 33434; terminal 2603643
  { outputClauseIndex := 9699, coreClauseIndex := 33434, terminalClauseIndex := 2603643, datum := { row := ⟨3, {2, 4, 5, 9}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9701; core 33440; terminal 2603649
  { outputClauseIndex := 9701, coreClauseIndex := 33440, terminalClauseIndex := 2603649, datum := { row := ⟨3, {2, 4, 5, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9702; core 33441; terminal 2603650
  { outputClauseIndex := 9702, coreClauseIndex := 33441, terminalClauseIndex := 2603650, datum := { row := ⟨3, {2, 4, 5, 10}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9704; core 33447; terminal 2603656
  { outputClauseIndex := 9704, coreClauseIndex := 33447, terminalClauseIndex := 2603656, datum := { row := ⟨3, {2, 4, 6, 7}⟩, arc := ⟨3, .left, {0, 1, 2, 8, 9, 10}⟩ } },
  -- compact 9705; core 33448; terminal 2603657
  { outputClauseIndex := 9705, coreClauseIndex := 33448, terminalClauseIndex := 2603657, datum := { row := ⟨3, {2, 4, 6, 7}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9707; core 33454; terminal 2603663
  { outputClauseIndex := 9707, coreClauseIndex := 33454, terminalClauseIndex := 2603663, datum := { row := ⟨3, {2, 4, 6, 8}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9708; core 33455; terminal 2603664
  { outputClauseIndex := 9708, coreClauseIndex := 33455, terminalClauseIndex := 2603664, datum := { row := ⟨3, {2, 4, 6, 8}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9710; core 33461; terminal 2603670
  { outputClauseIndex := 9710, coreClauseIndex := 33461, terminalClauseIndex := 2603670, datum := { row := ⟨3, {2, 4, 6, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9711; core 33462; terminal 2603671
  { outputClauseIndex := 9711, coreClauseIndex := 33462, terminalClauseIndex := 2603671, datum := { row := ⟨3, {2, 4, 6, 9}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9713; core 33468; terminal 2603677
  { outputClauseIndex := 9713, coreClauseIndex := 33468, terminalClauseIndex := 2603677, datum := { row := ⟨3, {2, 4, 6, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9714; core 33469; terminal 2603678
  { outputClauseIndex := 9714, coreClauseIndex := 33469, terminalClauseIndex := 2603678, datum := { row := ⟨3, {2, 4, 6, 10}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9716; core 33475; terminal 2603684
  { outputClauseIndex := 9716, coreClauseIndex := 33475, terminalClauseIndex := 2603684, datum := { row := ⟨3, {2, 4, 7, 8}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9717; core 33476; terminal 2603685
  { outputClauseIndex := 9717, coreClauseIndex := 33476, terminalClauseIndex := 2603685, datum := { row := ⟨3, {2, 4, 7, 8}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9719; core 33482; terminal 2603691
  { outputClauseIndex := 9719, coreClauseIndex := 33482, terminalClauseIndex := 2603691, datum := { row := ⟨3, {2, 4, 7, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9720; core 33483; terminal 2603692
  { outputClauseIndex := 9720, coreClauseIndex := 33483, terminalClauseIndex := 2603692, datum := { row := ⟨3, {2, 4, 7, 9}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9722; core 33489; terminal 2603698
  { outputClauseIndex := 9722, coreClauseIndex := 33489, terminalClauseIndex := 2603698, datum := { row := ⟨3, {2, 4, 7, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9723; core 33490; terminal 2603699
  { outputClauseIndex := 9723, coreClauseIndex := 33490, terminalClauseIndex := 2603699, datum := { row := ⟨3, {2, 4, 7, 10}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9725; core 33496; terminal 2603705
  { outputClauseIndex := 9725, coreClauseIndex := 33496, terminalClauseIndex := 2603705, datum := { row := ⟨3, {2, 4, 8, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9726; core 33497; terminal 2603706
  { outputClauseIndex := 9726, coreClauseIndex := 33497, terminalClauseIndex := 2603706, datum := { row := ⟨3, {2, 4, 8, 9}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9728; core 33503; terminal 2603712
  { outputClauseIndex := 9728, coreClauseIndex := 33503, terminalClauseIndex := 2603712, datum := { row := ⟨3, {2, 4, 8, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9729; core 33504; terminal 2603713
  { outputClauseIndex := 9729, coreClauseIndex := 33504, terminalClauseIndex := 2603713, datum := { row := ⟨3, {2, 4, 8, 10}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9731; core 33510; terminal 2603719
  { outputClauseIndex := 9731, coreClauseIndex := 33510, terminalClauseIndex := 2603719, datum := { row := ⟨3, {2, 4, 9, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9732; core 33511; terminal 2603720
  { outputClauseIndex := 9732, coreClauseIndex := 33511, terminalClauseIndex := 2603720, datum := { row := ⟨3, {2, 4, 9, 10}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9733; core 33524; terminal 2603740
  { outputClauseIndex := 9733, coreClauseIndex := 33524, terminalClauseIndex := 2603740, datum := { row := ⟨3, {2, 5, 6, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9734; core 33529; terminal 2603747
  { outputClauseIndex := 9734, coreClauseIndex := 33529, terminalClauseIndex := 2603747, datum := { row := ⟨3, {2, 5, 6, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9736; core 33535; terminal 2603754
  { outputClauseIndex := 9736, coreClauseIndex := 33535, terminalClauseIndex := 2603754, datum := { row := ⟨3, {2, 5, 7, 8}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9737; core 33536; terminal 2603755
  { outputClauseIndex := 9737, coreClauseIndex := 33536, terminalClauseIndex := 2603755, datum := { row := ⟨3, {2, 5, 7, 8}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9739; core 33542; terminal 2603761
  { outputClauseIndex := 9739, coreClauseIndex := 33542, terminalClauseIndex := 2603761, datum := { row := ⟨3, {2, 5, 7, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9740; core 33543; terminal 2603762
  { outputClauseIndex := 9740, coreClauseIndex := 33543, terminalClauseIndex := 2603762, datum := { row := ⟨3, {2, 5, 7, 9}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9742; core 33549; terminal 2603768
  { outputClauseIndex := 9742, coreClauseIndex := 33549, terminalClauseIndex := 2603768, datum := { row := ⟨3, {2, 5, 7, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9743; core 33550; terminal 2603769
  { outputClauseIndex := 9743, coreClauseIndex := 33550, terminalClauseIndex := 2603769, datum := { row := ⟨3, {2, 5, 7, 10}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9745; core 33556; terminal 2603775
  { outputClauseIndex := 9745, coreClauseIndex := 33556, terminalClauseIndex := 2603775, datum := { row := ⟨3, {2, 5, 8, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9746; core 33557; terminal 2603776
  { outputClauseIndex := 9746, coreClauseIndex := 33557, terminalClauseIndex := 2603776, datum := { row := ⟨3, {2, 5, 8, 9}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9748; core 33563; terminal 2603782
  { outputClauseIndex := 9748, coreClauseIndex := 33563, terminalClauseIndex := 2603782, datum := { row := ⟨3, {2, 5, 8, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9749; core 33564; terminal 2603783
  { outputClauseIndex := 9749, coreClauseIndex := 33564, terminalClauseIndex := 2603783, datum := { row := ⟨3, {2, 5, 8, 10}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9751; core 33570; terminal 2603789
  { outputClauseIndex := 9751, coreClauseIndex := 33570, terminalClauseIndex := 2603789, datum := { row := ⟨3, {2, 5, 9, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9752; core 33571; terminal 2603790
  { outputClauseIndex := 9752, coreClauseIndex := 33571, terminalClauseIndex := 2603790, datum := { row := ⟨3, {2, 5, 9, 10}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9754; core 33577; terminal 2603796
  { outputClauseIndex := 9754, coreClauseIndex := 33577, terminalClauseIndex := 2603796, datum := { row := ⟨3, {2, 6, 7, 8}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9755; core 33578; terminal 2603797
  { outputClauseIndex := 9755, coreClauseIndex := 33578, terminalClauseIndex := 2603797, datum := { row := ⟨3, {2, 6, 7, 8}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9757; core 33584; terminal 2603803
  { outputClauseIndex := 9757, coreClauseIndex := 33584, terminalClauseIndex := 2603803, datum := { row := ⟨3, {2, 6, 7, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9758; core 33585; terminal 2603804
  { outputClauseIndex := 9758, coreClauseIndex := 33585, terminalClauseIndex := 2603804, datum := { row := ⟨3, {2, 6, 7, 9}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9760; core 33591; terminal 2603810
  { outputClauseIndex := 9760, coreClauseIndex := 33591, terminalClauseIndex := 2603810, datum := { row := ⟨3, {2, 6, 7, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9761; core 33592; terminal 2603811
  { outputClauseIndex := 9761, coreClauseIndex := 33592, terminalClauseIndex := 2603811, datum := { row := ⟨3, {2, 6, 7, 10}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9763; core 33598; terminal 2603817
  { outputClauseIndex := 9763, coreClauseIndex := 33598, terminalClauseIndex := 2603817, datum := { row := ⟨3, {2, 6, 8, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9764; core 33599; terminal 2603818
  { outputClauseIndex := 9764, coreClauseIndex := 33599, terminalClauseIndex := 2603818, datum := { row := ⟨3, {2, 6, 8, 9}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9766; core 33605; terminal 2603824
  { outputClauseIndex := 9766, coreClauseIndex := 33605, terminalClauseIndex := 2603824, datum := { row := ⟨3, {2, 6, 8, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9767; core 33606; terminal 2603825
  { outputClauseIndex := 9767, coreClauseIndex := 33606, terminalClauseIndex := 2603825, datum := { row := ⟨3, {2, 6, 8, 10}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9769; core 33612; terminal 2603831
  { outputClauseIndex := 9769, coreClauseIndex := 33612, terminalClauseIndex := 2603831, datum := { row := ⟨3, {2, 6, 9, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9770; core 33613; terminal 2603832
  { outputClauseIndex := 9770, coreClauseIndex := 33613, terminalClauseIndex := 2603832, datum := { row := ⟨3, {2, 6, 9, 10}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9772; core 33619; terminal 2603838
  { outputClauseIndex := 9772, coreClauseIndex := 33619, terminalClauseIndex := 2603838, datum := { row := ⟨3, {2, 7, 8, 9}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9773; core 33620; terminal 2603839
  { outputClauseIndex := 9773, coreClauseIndex := 33620, terminalClauseIndex := 2603839, datum := { row := ⟨3, {2, 7, 8, 9}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9775; core 33626; terminal 2603845
  { outputClauseIndex := 9775, coreClauseIndex := 33626, terminalClauseIndex := 2603845, datum := { row := ⟨3, {2, 7, 8, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9776; core 33627; terminal 2603846
  { outputClauseIndex := 9776, coreClauseIndex := 33627, terminalClauseIndex := 2603846, datum := { row := ⟨3, {2, 7, 8, 10}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9778; core 33633; terminal 2603852
  { outputClauseIndex := 9778, coreClauseIndex := 33633, terminalClauseIndex := 2603852, datum := { row := ⟨3, {2, 7, 9, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9779; core 33634; terminal 2603853
  { outputClauseIndex := 9779, coreClauseIndex := 33634, terminalClauseIndex := 2603853, datum := { row := ⟨3, {2, 7, 9, 10}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9780; core 33639; terminal 2603859
  { outputClauseIndex := 9780, coreClauseIndex := 33639, terminalClauseIndex := 2603859, datum := { row := ⟨3, {2, 8, 9, 10}⟩, arc := ⟨3, .left, {8, 9, 10}⟩ } },
  -- compact 9781; core 33640; terminal 2603860
  { outputClauseIndex := 9781, coreClauseIndex := 33640, terminalClauseIndex := 2603860, datum := { row := ⟨3, {2, 8, 9, 10}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9783; core 33658; terminal 2603894
  { outputClauseIndex := 9783, coreClauseIndex := 33658, terminalClauseIndex := 2603894, datum := { row := ⟨3, {4, 5, 7, 8}⟩, arc := ⟨3, .left, {0, 1, 2, 8, 9, 10}⟩ } },
  -- compact 9784; core 33659; terminal 2603895
  { outputClauseIndex := 9784, coreClauseIndex := 33659, terminalClauseIndex := 2603895, datum := { row := ⟨3, {4, 5, 7, 8}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9786; core 33665; terminal 2603901
  { outputClauseIndex := 9786, coreClauseIndex := 33665, terminalClauseIndex := 2603901, datum := { row := ⟨3, {4, 5, 7, 9}⟩, arc := ⟨3, .left, {0, 1, 2, 8, 9, 10}⟩ } },
  -- compact 9787; core 33666; terminal 2603902
  { outputClauseIndex := 9787, coreClauseIndex := 33666, terminalClauseIndex := 2603902, datum := { row := ⟨3, {4, 5, 7, 9}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9789; core 33672; terminal 2603908
  { outputClauseIndex := 9789, coreClauseIndex := 33672, terminalClauseIndex := 2603908, datum := { row := ⟨3, {4, 5, 7, 10}⟩, arc := ⟨3, .left, {0, 1, 2, 8, 9, 10}⟩ } },
  -- compact 9790; core 33673; terminal 2603909
  { outputClauseIndex := 9790, coreClauseIndex := 33673, terminalClauseIndex := 2603909, datum := { row := ⟨3, {4, 5, 7, 10}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9792; core 33679; terminal 2603915
  { outputClauseIndex := 9792, coreClauseIndex := 33679, terminalClauseIndex := 2603915, datum := { row := ⟨3, {4, 5, 8, 9}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9793; core 33680; terminal 2603916
  { outputClauseIndex := 9793, coreClauseIndex := 33680, terminalClauseIndex := 2603916, datum := { row := ⟨3, {4, 5, 8, 9}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9795; core 33686; terminal 2603922
  { outputClauseIndex := 9795, coreClauseIndex := 33686, terminalClauseIndex := 2603922, datum := { row := ⟨3, {4, 5, 8, 10}⟩, arc := ⟨3, .left, {0, 1, 8, 9, 10}⟩ } },
  -- compact 9796; core 33687; terminal 2603923
  { outputClauseIndex := 9796, coreClauseIndex := 33687, terminalClauseIndex := 2603923, datum := { row := ⟨3, {4, 5, 8, 10}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9798; core 33693; terminal 2603929
  { outputClauseIndex := 9798, coreClauseIndex := 33693, terminalClauseIndex := 2603929, datum := { row := ⟨3, {4, 5, 9, 10}⟩, arc := ⟨3, .left, {0, 8, 9, 10}⟩ } },
  -- compact 9799; core 33694; terminal 2603930
  { outputClauseIndex := 9799, coreClauseIndex := 33694, terminalClauseIndex := 2603930, datum := { row := ⟨3, {4, 5, 9, 10}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9801; core 33700; terminal 2603936
  { outputClauseIndex := 9801, coreClauseIndex := 33700, terminalClauseIndex := 2603936, datum := { row := ⟨3, {4, 6, 7, 8}⟩, arc := ⟨3, .left, {0, 1, 2, 8, 9, 10}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk007_batch_valid :
    directRowArcFiniteOccurrencesChunk007.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk007, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk007 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk007.map (·.datum)

theorem directRowArcFiniteDataChunk007_batch_valid :
    directRowArcFiniteDataChunk007.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk007, datum.Valid := by
  rw [directRowArcFiniteDataChunk007]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk007_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk007_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
