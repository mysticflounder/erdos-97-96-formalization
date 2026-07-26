/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk018 : List DirectRowArcFiniteOccurrence := [
  -- compact 11649; core 39140; terminal 2610881
  { outputClauseIndex := 11649, coreClauseIndex := 39140, terminalClauseIndex := 2610881, datum := { row := ⟨8, {1, 4, 7, 9}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11651; core 39146; terminal 2610887
  { outputClauseIndex := 11651, coreClauseIndex := 39146, terminalClauseIndex := 2610887, datum := { row := ⟨8, {1, 4, 7, 10}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11652; core 39147; terminal 2610888
  { outputClauseIndex := 11652, coreClauseIndex := 39147, terminalClauseIndex := 2610888, datum := { row := ⟨8, {1, 4, 7, 10}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11654; core 39153; terminal 2610894
  { outputClauseIndex := 11654, coreClauseIndex := 39153, terminalClauseIndex := 2610894, datum := { row := ⟨8, {1, 4, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11655; core 39154; terminal 2610895
  { outputClauseIndex := 11655, coreClauseIndex := 39154, terminalClauseIndex := 2610895, datum := { row := ⟨8, {1, 4, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11656; core 39159; terminal 2610901
  { outputClauseIndex := 11656, coreClauseIndex := 39159, terminalClauseIndex := 2610901, datum := { row := ⟨8, {1, 5, 6, 7}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11657; core 39160; terminal 2610902
  { outputClauseIndex := 11657, coreClauseIndex := 39160, terminalClauseIndex := 2610902, datum := { row := ⟨8, {1, 5, 6, 7}⟩, arc := ⟨8, .right, {0, 1, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11658; core 39164; terminal 2610909
  { outputClauseIndex := 11658, coreClauseIndex := 39164, terminalClauseIndex := 2610909, datum := { row := ⟨8, {1, 5, 6, 9}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11659; core 39168; terminal 2610916
  { outputClauseIndex := 11659, coreClauseIndex := 39168, terminalClauseIndex := 2610916, datum := { row := ⟨8, {1, 5, 6, 10}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11661; core 39174; terminal 2610922
  { outputClauseIndex := 11661, coreClauseIndex := 39174, terminalClauseIndex := 2610922, datum := { row := ⟨8, {1, 5, 7, 9}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
  -- compact 11662; core 39175; terminal 2610923
  { outputClauseIndex := 11662, coreClauseIndex := 39175, terminalClauseIndex := 2610923, datum := { row := ⟨8, {1, 5, 7, 9}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11664; core 39181; terminal 2610929
  { outputClauseIndex := 11664, coreClauseIndex := 39181, terminalClauseIndex := 2610929, datum := { row := ⟨8, {1, 5, 7, 10}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
  -- compact 11665; core 39182; terminal 2610930
  { outputClauseIndex := 11665, coreClauseIndex := 39182, terminalClauseIndex := 2610930, datum := { row := ⟨8, {1, 5, 7, 10}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11667; core 39188; terminal 2610936
  { outputClauseIndex := 11667, coreClauseIndex := 39188, terminalClauseIndex := 2610936, datum := { row := ⟨8, {1, 5, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11668; core 39189; terminal 2610937
  { outputClauseIndex := 11668, coreClauseIndex := 39189, terminalClauseIndex := 2610937, datum := { row := ⟨8, {1, 5, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11670; core 39195; terminal 2610943
  { outputClauseIndex := 11670, coreClauseIndex := 39195, terminalClauseIndex := 2610943, datum := { row := ⟨8, {1, 6, 7, 9}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11671; core 39196; terminal 2610944
  { outputClauseIndex := 11671, coreClauseIndex := 39196, terminalClauseIndex := 2610944, datum := { row := ⟨8, {1, 6, 7, 9}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11673; core 39202; terminal 2610950
  { outputClauseIndex := 11673, coreClauseIndex := 39202, terminalClauseIndex := 2610950, datum := { row := ⟨8, {1, 6, 7, 10}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11674; core 39203; terminal 2610951
  { outputClauseIndex := 11674, coreClauseIndex := 39203, terminalClauseIndex := 2610951, datum := { row := ⟨8, {1, 6, 7, 10}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11676; core 39209; terminal 2610957
  { outputClauseIndex := 11676, coreClauseIndex := 39209, terminalClauseIndex := 2610957, datum := { row := ⟨8, {1, 6, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11677; core 39210; terminal 2610958
  { outputClauseIndex := 11677, coreClauseIndex := 39210, terminalClauseIndex := 2610958, datum := { row := ⟨8, {1, 6, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11678; core 39215; terminal 2610964
  { outputClauseIndex := 11678, coreClauseIndex := 39215, terminalClauseIndex := 2610964, datum := { row := ⟨8, {1, 7, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11679; core 39216; terminal 2610965
  { outputClauseIndex := 11679, coreClauseIndex := 39216, terminalClauseIndex := 2610965, datum := { row := ⟨8, {1, 7, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11681; core 39222; terminal 2610971
  { outputClauseIndex := 11681, coreClauseIndex := 39222, terminalClauseIndex := 2610971, datum := { row := ⟨8, {2, 3, 4, 5}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11682; core 39223; terminal 2610972
  { outputClauseIndex := 11682, coreClauseIndex := 39223, terminalClauseIndex := 2610972, datum := { row := ⟨8, {2, 3, 4, 5}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11683; core 39228; terminal 2610978
  { outputClauseIndex := 11683, coreClauseIndex := 39228, terminalClauseIndex := 2610978, datum := { row := ⟨8, {2, 3, 4, 6}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11684; core 39229; terminal 2610979
  { outputClauseIndex := 11684, coreClauseIndex := 39229, terminalClauseIndex := 2610979, datum := { row := ⟨8, {2, 3, 4, 6}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11686; core 39235; terminal 2610985
  { outputClauseIndex := 11686, coreClauseIndex := 39235, terminalClauseIndex := 2610985, datum := { row := ⟨8, {2, 3, 4, 7}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11687; core 39236; terminal 2610986
  { outputClauseIndex := 11687, coreClauseIndex := 39236, terminalClauseIndex := 2610986, datum := { row := ⟨8, {2, 3, 4, 7}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11689; core 39242; terminal 2610992
  { outputClauseIndex := 11689, coreClauseIndex := 39242, terminalClauseIndex := 2610992, datum := { row := ⟨8, {2, 3, 4, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11690; core 39243; terminal 2610993
  { outputClauseIndex := 11690, coreClauseIndex := 39243, terminalClauseIndex := 2610993, datum := { row := ⟨8, {2, 3, 4, 9}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11692; core 39249; terminal 2610999
  { outputClauseIndex := 11692, coreClauseIndex := 39249, terminalClauseIndex := 2610999, datum := { row := ⟨8, {2, 3, 4, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11693; core 39250; terminal 2611000
  { outputClauseIndex := 11693, coreClauseIndex := 39250, terminalClauseIndex := 2611000, datum := { row := ⟨8, {2, 3, 4, 10}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11695; core 39259; terminal 2611013
  { outputClauseIndex := 11695, coreClauseIndex := 39259, terminalClauseIndex := 2611013, datum := { row := ⟨8, {2, 3, 5, 7}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
  -- compact 11696; core 39260; terminal 2611014
  { outputClauseIndex := 11696, coreClauseIndex := 39260, terminalClauseIndex := 2611014, datum := { row := ⟨8, {2, 3, 5, 7}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11698; core 39266; terminal 2611020
  { outputClauseIndex := 11698, coreClauseIndex := 39266, terminalClauseIndex := 2611020, datum := { row := ⟨8, {2, 3, 5, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11699; core 39267; terminal 2611021
  { outputClauseIndex := 11699, coreClauseIndex := 39267, terminalClauseIndex := 2611021, datum := { row := ⟨8, {2, 3, 5, 9}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11701; core 39273; terminal 2611027
  { outputClauseIndex := 11701, coreClauseIndex := 39273, terminalClauseIndex := 2611027, datum := { row := ⟨8, {2, 3, 5, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11702; core 39274; terminal 2611028
  { outputClauseIndex := 11702, coreClauseIndex := 39274, terminalClauseIndex := 2611028, datum := { row := ⟨8, {2, 3, 5, 10}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11704; core 39280; terminal 2611034
  { outputClauseIndex := 11704, coreClauseIndex := 39280, terminalClauseIndex := 2611034, datum := { row := ⟨8, {2, 3, 6, 7}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11705; core 39281; terminal 2611035
  { outputClauseIndex := 11705, coreClauseIndex := 39281, terminalClauseIndex := 2611035, datum := { row := ⟨8, {2, 3, 6, 7}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11707; core 39287; terminal 2611041
  { outputClauseIndex := 11707, coreClauseIndex := 39287, terminalClauseIndex := 2611041, datum := { row := ⟨8, {2, 3, 6, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11708; core 39288; terminal 2611042
  { outputClauseIndex := 11708, coreClauseIndex := 39288, terminalClauseIndex := 2611042, datum := { row := ⟨8, {2, 3, 6, 9}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11710; core 39294; terminal 2611048
  { outputClauseIndex := 11710, coreClauseIndex := 39294, terminalClauseIndex := 2611048, datum := { row := ⟨8, {2, 3, 6, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11711; core 39295; terminal 2611049
  { outputClauseIndex := 11711, coreClauseIndex := 39295, terminalClauseIndex := 2611049, datum := { row := ⟨8, {2, 3, 6, 10}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11713; core 39301; terminal 2611055
  { outputClauseIndex := 11713, coreClauseIndex := 39301, terminalClauseIndex := 2611055, datum := { row := ⟨8, {2, 3, 7, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11714; core 39302; terminal 2611056
  { outputClauseIndex := 11714, coreClauseIndex := 39302, terminalClauseIndex := 2611056, datum := { row := ⟨8, {2, 3, 7, 9}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11716; core 39308; terminal 2611062
  { outputClauseIndex := 11716, coreClauseIndex := 39308, terminalClauseIndex := 2611062, datum := { row := ⟨8, {2, 3, 7, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11717; core 39309; terminal 2611063
  { outputClauseIndex := 11717, coreClauseIndex := 39309, terminalClauseIndex := 2611063, datum := { row := ⟨8, {2, 3, 7, 10}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11719; core 39315; terminal 2611069
  { outputClauseIndex := 11719, coreClauseIndex := 39315, terminalClauseIndex := 2611069, datum := { row := ⟨8, {2, 3, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11720; core 39316; terminal 2611070
  { outputClauseIndex := 11720, coreClauseIndex := 39316, terminalClauseIndex := 2611070, datum := { row := ⟨8, {2, 3, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11721; core 39321; terminal 2611077
  { outputClauseIndex := 11721, coreClauseIndex := 39321, terminalClauseIndex := 2611077, datum := { row := ⟨8, {2, 4, 5, 6}⟩, arc := ⟨8, .right, {0, 1, 7, 8, 9, 10}⟩ } },
  -- compact 11723; core 39327; terminal 2611083
  { outputClauseIndex := 11723, coreClauseIndex := 39327, terminalClauseIndex := 2611083, datum := { row := ⟨8, {2, 4, 5, 7}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
  -- compact 11724; core 39328; terminal 2611084
  { outputClauseIndex := 11724, coreClauseIndex := 39328, terminalClauseIndex := 2611084, datum := { row := ⟨8, {2, 4, 5, 7}⟩, arc := ⟨8, .right, {0, 1, 7, 8, 9, 10}⟩ } },
  -- compact 11726; core 39334; terminal 2611090
  { outputClauseIndex := 11726, coreClauseIndex := 39334, terminalClauseIndex := 2611090, datum := { row := ⟨8, {2, 4, 5, 9}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11727; core 39335; terminal 2611091
  { outputClauseIndex := 11727, coreClauseIndex := 39335, terminalClauseIndex := 2611091, datum := { row := ⟨8, {2, 4, 5, 9}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11729; core 39341; terminal 2611097
  { outputClauseIndex := 11729, coreClauseIndex := 39341, terminalClauseIndex := 2611097, datum := { row := ⟨8, {2, 4, 5, 10}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11730; core 39342; terminal 2611098
  { outputClauseIndex := 11730, coreClauseIndex := 39342, terminalClauseIndex := 2611098, datum := { row := ⟨8, {2, 4, 5, 10}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11732; core 39348; terminal 2611104
  { outputClauseIndex := 11732, coreClauseIndex := 39348, terminalClauseIndex := 2611104, datum := { row := ⟨8, {2, 4, 6, 7}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11733; core 39349; terminal 2611105
  { outputClauseIndex := 11733, coreClauseIndex := 39349, terminalClauseIndex := 2611105, datum := { row := ⟨8, {2, 4, 6, 7}⟩, arc := ⟨8, .right, {0, 1, 7, 8, 9, 10}⟩ } },
  -- compact 11735; core 39355; terminal 2611111
  { outputClauseIndex := 11735, coreClauseIndex := 39355, terminalClauseIndex := 2611111, datum := { row := ⟨8, {2, 4, 6, 9}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11736; core 39356; terminal 2611112
  { outputClauseIndex := 11736, coreClauseIndex := 39356, terminalClauseIndex := 2611112, datum := { row := ⟨8, {2, 4, 6, 9}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11738; core 39362; terminal 2611118
  { outputClauseIndex := 11738, coreClauseIndex := 39362, terminalClauseIndex := 2611118, datum := { row := ⟨8, {2, 4, 6, 10}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11739; core 39363; terminal 2611119
  { outputClauseIndex := 11739, coreClauseIndex := 39363, terminalClauseIndex := 2611119, datum := { row := ⟨8, {2, 4, 6, 10}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11741; core 39369; terminal 2611125
  { outputClauseIndex := 11741, coreClauseIndex := 39369, terminalClauseIndex := 2611125, datum := { row := ⟨8, {2, 4, 7, 9}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11742; core 39370; terminal 2611126
  { outputClauseIndex := 11742, coreClauseIndex := 39370, terminalClauseIndex := 2611126, datum := { row := ⟨8, {2, 4, 7, 9}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11744; core 39376; terminal 2611132
  { outputClauseIndex := 11744, coreClauseIndex := 39376, terminalClauseIndex := 2611132, datum := { row := ⟨8, {2, 4, 7, 10}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11745; core 39377; terminal 2611133
  { outputClauseIndex := 11745, coreClauseIndex := 39377, terminalClauseIndex := 2611133, datum := { row := ⟨8, {2, 4, 7, 10}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11747; core 39383; terminal 2611139
  { outputClauseIndex := 11747, coreClauseIndex := 39383, terminalClauseIndex := 2611139, datum := { row := ⟨8, {2, 4, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11748; core 39384; terminal 2611140
  { outputClauseIndex := 11748, coreClauseIndex := 39384, terminalClauseIndex := 2611140, datum := { row := ⟨8, {2, 4, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11749; core 39388; terminal 2611146
  { outputClauseIndex := 11749, coreClauseIndex := 39388, terminalClauseIndex := 2611146, datum := { row := ⟨8, {2, 5, 6, 7}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11750; core 39389; terminal 2611147
  { outputClauseIndex := 11750, coreClauseIndex := 39389, terminalClauseIndex := 2611147, datum := { row := ⟨8, {2, 5, 6, 7}⟩, arc := ⟨8, .right, {0, 1, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11751; core 39393; terminal 2611154
  { outputClauseIndex := 11751, coreClauseIndex := 39393, terminalClauseIndex := 2611154, datum := { row := ⟨8, {2, 5, 6, 9}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11752; core 39397; terminal 2611161
  { outputClauseIndex := 11752, coreClauseIndex := 39397, terminalClauseIndex := 2611161, datum := { row := ⟨8, {2, 5, 6, 10}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11754; core 39403; terminal 2611167
  { outputClauseIndex := 11754, coreClauseIndex := 39403, terminalClauseIndex := 2611167, datum := { row := ⟨8, {2, 5, 7, 9}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
  -- compact 11755; core 39404; terminal 2611168
  { outputClauseIndex := 11755, coreClauseIndex := 39404, terminalClauseIndex := 2611168, datum := { row := ⟨8, {2, 5, 7, 9}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11757; core 39410; terminal 2611174
  { outputClauseIndex := 11757, coreClauseIndex := 39410, terminalClauseIndex := 2611174, datum := { row := ⟨8, {2, 5, 7, 10}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
  -- compact 11758; core 39411; terminal 2611175
  { outputClauseIndex := 11758, coreClauseIndex := 39411, terminalClauseIndex := 2611175, datum := { row := ⟨8, {2, 5, 7, 10}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11760; core 39417; terminal 2611181
  { outputClauseIndex := 11760, coreClauseIndex := 39417, terminalClauseIndex := 2611181, datum := { row := ⟨8, {2, 5, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11761; core 39418; terminal 2611182
  { outputClauseIndex := 11761, coreClauseIndex := 39418, terminalClauseIndex := 2611182, datum := { row := ⟨8, {2, 5, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11763; core 39424; terminal 2611188
  { outputClauseIndex := 11763, coreClauseIndex := 39424, terminalClauseIndex := 2611188, datum := { row := ⟨8, {2, 6, 7, 9}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11764; core 39425; terminal 2611189
  { outputClauseIndex := 11764, coreClauseIndex := 39425, terminalClauseIndex := 2611189, datum := { row := ⟨8, {2, 6, 7, 9}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11766; core 39431; terminal 2611195
  { outputClauseIndex := 11766, coreClauseIndex := 39431, terminalClauseIndex := 2611195, datum := { row := ⟨8, {2, 6, 7, 10}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11767; core 39432; terminal 2611196
  { outputClauseIndex := 11767, coreClauseIndex := 39432, terminalClauseIndex := 2611196, datum := { row := ⟨8, {2, 6, 7, 10}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11769; core 39438; terminal 2611202
  { outputClauseIndex := 11769, coreClauseIndex := 39438, terminalClauseIndex := 2611202, datum := { row := ⟨8, {2, 6, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11770; core 39439; terminal 2611203
  { outputClauseIndex := 11770, coreClauseIndex := 39439, terminalClauseIndex := 2611203, datum := { row := ⟨8, {2, 6, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11771; core 39444; terminal 2611209
  { outputClauseIndex := 11771, coreClauseIndex := 39444, terminalClauseIndex := 2611209, datum := { row := ⟨8, {2, 7, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11772; core 39445; terminal 2611210
  { outputClauseIndex := 11772, coreClauseIndex := 39445, terminalClauseIndex := 2611210, datum := { row := ⟨8, {2, 7, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11773; core 39449; terminal 2611217
  { outputClauseIndex := 11773, coreClauseIndex := 39449, terminalClauseIndex := 2611217, datum := { row := ⟨8, {3, 4, 5, 6}⟩, arc := ⟨8, .right, {0, 1, 7, 8, 9, 10}⟩ } },
  -- compact 11775; core 39455; terminal 2611223
  { outputClauseIndex := 11775, coreClauseIndex := 39455, terminalClauseIndex := 2611223, datum := { row := ⟨8, {3, 4, 5, 7}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
  -- compact 11776; core 39456; terminal 2611224
  { outputClauseIndex := 11776, coreClauseIndex := 39456, terminalClauseIndex := 2611224, datum := { row := ⟨8, {3, 4, 5, 7}⟩, arc := ⟨8, .right, {0, 1, 7, 8, 9, 10}⟩ } },
  -- compact 11778; core 39462; terminal 2611230
  { outputClauseIndex := 11778, coreClauseIndex := 39462, terminalClauseIndex := 2611230, datum := { row := ⟨8, {3, 4, 5, 9}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11779; core 39463; terminal 2611231
  { outputClauseIndex := 11779, coreClauseIndex := 39463, terminalClauseIndex := 2611231, datum := { row := ⟨8, {3, 4, 5, 9}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11781; core 39469; terminal 2611237
  { outputClauseIndex := 11781, coreClauseIndex := 39469, terminalClauseIndex := 2611237, datum := { row := ⟨8, {3, 4, 5, 10}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11782; core 39470; terminal 2611238
  { outputClauseIndex := 11782, coreClauseIndex := 39470, terminalClauseIndex := 2611238, datum := { row := ⟨8, {3, 4, 5, 10}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11784; core 39476; terminal 2611244
  { outputClauseIndex := 11784, coreClauseIndex := 39476, terminalClauseIndex := 2611244, datum := { row := ⟨8, {3, 4, 6, 7}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11785; core 39477; terminal 2611245
  { outputClauseIndex := 11785, coreClauseIndex := 39477, terminalClauseIndex := 2611245, datum := { row := ⟨8, {3, 4, 6, 7}⟩, arc := ⟨8, .right, {0, 1, 7, 8, 9, 10}⟩ } },
  -- compact 11787; core 39483; terminal 2611251
  { outputClauseIndex := 11787, coreClauseIndex := 39483, terminalClauseIndex := 2611251, datum := { row := ⟨8, {3, 4, 6, 9}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11788; core 39484; terminal 2611252
  { outputClauseIndex := 11788, coreClauseIndex := 39484, terminalClauseIndex := 2611252, datum := { row := ⟨8, {3, 4, 6, 9}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11790; core 39490; terminal 2611258
  { outputClauseIndex := 11790, coreClauseIndex := 39490, terminalClauseIndex := 2611258, datum := { row := ⟨8, {3, 4, 6, 10}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11791; core 39491; terminal 2611259
  { outputClauseIndex := 11791, coreClauseIndex := 39491, terminalClauseIndex := 2611259, datum := { row := ⟨8, {3, 4, 6, 10}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11793; core 39497; terminal 2611265
  { outputClauseIndex := 11793, coreClauseIndex := 39497, terminalClauseIndex := 2611265, datum := { row := ⟨8, {3, 4, 7, 9}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11794; core 39498; terminal 2611266
  { outputClauseIndex := 11794, coreClauseIndex := 39498, terminalClauseIndex := 2611266, datum := { row := ⟨8, {3, 4, 7, 9}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11796; core 39504; terminal 2611272
  { outputClauseIndex := 11796, coreClauseIndex := 39504, terminalClauseIndex := 2611272, datum := { row := ⟨8, {3, 4, 7, 10}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11797; core 39505; terminal 2611273
  { outputClauseIndex := 11797, coreClauseIndex := 39505, terminalClauseIndex := 2611273, datum := { row := ⟨8, {3, 4, 7, 10}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11799; core 39511; terminal 2611279
  { outputClauseIndex := 11799, coreClauseIndex := 39511, terminalClauseIndex := 2611279, datum := { row := ⟨8, {3, 4, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11800; core 39512; terminal 2611280
  { outputClauseIndex := 11800, coreClauseIndex := 39512, terminalClauseIndex := 2611280, datum := { row := ⟨8, {3, 4, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11801; core 39517; terminal 2611286
  { outputClauseIndex := 11801, coreClauseIndex := 39517, terminalClauseIndex := 2611286, datum := { row := ⟨8, {3, 5, 6, 7}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11802; core 39518; terminal 2611287
  { outputClauseIndex := 11802, coreClauseIndex := 39518, terminalClauseIndex := 2611287, datum := { row := ⟨8, {3, 5, 6, 7}⟩, arc := ⟨8, .right, {0, 1, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11804; core 39532; terminal 2611307
  { outputClauseIndex := 11804, coreClauseIndex := 39532, terminalClauseIndex := 2611307, datum := { row := ⟨8, {3, 5, 7, 9}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
  -- compact 11805; core 39533; terminal 2611308
  { outputClauseIndex := 11805, coreClauseIndex := 39533, terminalClauseIndex := 2611308, datum := { row := ⟨8, {3, 5, 7, 9}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11807; core 39539; terminal 2611314
  { outputClauseIndex := 11807, coreClauseIndex := 39539, terminalClauseIndex := 2611314, datum := { row := ⟨8, {3, 5, 7, 10}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
  -- compact 11808; core 39540; terminal 2611315
  { outputClauseIndex := 11808, coreClauseIndex := 39540, terminalClauseIndex := 2611315, datum := { row := ⟨8, {3, 5, 7, 10}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11810; core 39546; terminal 2611321
  { outputClauseIndex := 11810, coreClauseIndex := 39546, terminalClauseIndex := 2611321, datum := { row := ⟨8, {3, 5, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11811; core 39547; terminal 2611322
  { outputClauseIndex := 11811, coreClauseIndex := 39547, terminalClauseIndex := 2611322, datum := { row := ⟨8, {3, 5, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11813; core 39553; terminal 2611328
  { outputClauseIndex := 11813, coreClauseIndex := 39553, terminalClauseIndex := 2611328, datum := { row := ⟨8, {3, 6, 7, 9}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11814; core 39554; terminal 2611329
  { outputClauseIndex := 11814, coreClauseIndex := 39554, terminalClauseIndex := 2611329, datum := { row := ⟨8, {3, 6, 7, 9}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11816; core 39560; terminal 2611335
  { outputClauseIndex := 11816, coreClauseIndex := 39560, terminalClauseIndex := 2611335, datum := { row := ⟨8, {3, 6, 7, 10}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11817; core 39561; terminal 2611336
  { outputClauseIndex := 11817, coreClauseIndex := 39561, terminalClauseIndex := 2611336, datum := { row := ⟨8, {3, 6, 7, 10}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11819; core 39567; terminal 2611342
  { outputClauseIndex := 11819, coreClauseIndex := 39567, terminalClauseIndex := 2611342, datum := { row := ⟨8, {3, 6, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11820; core 39568; terminal 2611343
  { outputClauseIndex := 11820, coreClauseIndex := 39568, terminalClauseIndex := 2611343, datum := { row := ⟨8, {3, 6, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11821; core 39573; terminal 2611349
  { outputClauseIndex := 11821, coreClauseIndex := 39573, terminalClauseIndex := 2611349, datum := { row := ⟨8, {3, 7, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11822; core 39574; terminal 2611350
  { outputClauseIndex := 11822, coreClauseIndex := 39574, terminalClauseIndex := 2611350, datum := { row := ⟨8, {3, 7, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11823; core 39578; terminal 2611356
  { outputClauseIndex := 11823, coreClauseIndex := 39578, terminalClauseIndex := 2611356, datum := { row := ⟨8, {4, 5, 6, 7}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11824; core 39579; terminal 2611357
  { outputClauseIndex := 11824, coreClauseIndex := 39579, terminalClauseIndex := 2611357, datum := { row := ⟨8, {4, 5, 6, 7}⟩, arc := ⟨8, .right, {0, 1, 6, 7, 8, 9, 10}⟩ } },
  -- compact 11825; core 39583; terminal 2611364
  { outputClauseIndex := 11825, coreClauseIndex := 39583, terminalClauseIndex := 2611364, datum := { row := ⟨8, {4, 5, 6, 9}⟩, arc := ⟨8, .right, {0, 1, 7, 8, 9, 10}⟩ } },
  -- compact 11826; core 39587; terminal 2611371
  { outputClauseIndex := 11826, coreClauseIndex := 39587, terminalClauseIndex := 2611371, datum := { row := ⟨8, {4, 5, 6, 10}⟩, arc := ⟨8, .right, {0, 1, 7, 8, 9, 10}⟩ } },
  -- compact 11828; core 39593; terminal 2611377
  { outputClauseIndex := 11828, coreClauseIndex := 39593, terminalClauseIndex := 2611377, datum := { row := ⟨8, {4, 5, 7, 9}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk018_batch_valid :
    directRowArcFiniteOccurrencesChunk018.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk018, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk018 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk018.map (·.datum)

theorem directRowArcFiniteDataChunk018_batch_valid :
    directRowArcFiniteDataChunk018.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk018, datum.Valid := by
  rw [directRowArcFiniteDataChunk018]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk018_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk018_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
