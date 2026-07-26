/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk010 : List DirectRowArcFiniteOccurrence := [
  -- compact 10178; core 35166; terminal 2606050
  { outputClauseIndex := 10178, coreClauseIndex := 35166, terminalClauseIndex := 2606050, datum := { row := ⟨5, {0, 4, 6, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10179; core 35167; terminal 2606051
  { outputClauseIndex := 10179, coreClauseIndex := 35167, terminalClauseIndex := 2606051, datum := { row := ⟨5, {0, 4, 6, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10181; core 35173; terminal 2606057
  { outputClauseIndex := 10181, coreClauseIndex := 35173, terminalClauseIndex := 2606057, datum := { row := ⟨5, {0, 4, 7, 8}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10182; core 35174; terminal 2606058
  { outputClauseIndex := 10182, coreClauseIndex := 35174, terminalClauseIndex := 2606058, datum := { row := ⟨5, {0, 4, 7, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10184; core 35180; terminal 2606064
  { outputClauseIndex := 10184, coreClauseIndex := 35180, terminalClauseIndex := 2606064, datum := { row := ⟨5, {0, 4, 7, 9}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10185; core 35181; terminal 2606065
  { outputClauseIndex := 10185, coreClauseIndex := 35181, terminalClauseIndex := 2606065, datum := { row := ⟨5, {0, 4, 7, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10187; core 35187; terminal 2606071
  { outputClauseIndex := 10187, coreClauseIndex := 35187, terminalClauseIndex := 2606071, datum := { row := ⟨5, {0, 4, 7, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10188; core 35188; terminal 2606072
  { outputClauseIndex := 10188, coreClauseIndex := 35188, terminalClauseIndex := 2606072, datum := { row := ⟨5, {0, 4, 7, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10190; core 35194; terminal 2606078
  { outputClauseIndex := 10190, coreClauseIndex := 35194, terminalClauseIndex := 2606078, datum := { row := ⟨5, {0, 4, 8, 9}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10191; core 35195; terminal 2606079
  { outputClauseIndex := 10191, coreClauseIndex := 35195, terminalClauseIndex := 2606079, datum := { row := ⟨5, {0, 4, 8, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10193; core 35201; terminal 2606085
  { outputClauseIndex := 10193, coreClauseIndex := 35201, terminalClauseIndex := 2606085, datum := { row := ⟨5, {0, 4, 8, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10194; core 35202; terminal 2606086
  { outputClauseIndex := 10194, coreClauseIndex := 35202, terminalClauseIndex := 2606086, datum := { row := ⟨5, {0, 4, 8, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10196; core 35208; terminal 2606092
  { outputClauseIndex := 10196, coreClauseIndex := 35208, terminalClauseIndex := 2606092, datum := { row := ⟨5, {0, 4, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9}⟩ } },
  -- compact 10197; core 35209; terminal 2606093
  { outputClauseIndex := 10197, coreClauseIndex := 35209, terminalClauseIndex := 2606093, datum := { row := ⟨5, {0, 4, 9, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10199; core 35215; terminal 2606099
  { outputClauseIndex := 10199, coreClauseIndex := 35215, terminalClauseIndex := 2606099, datum := { row := ⟨5, {0, 6, 7, 8}⟩, arc := ⟨5, .left, {0, 1, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10200; core 35216; terminal 2606100
  { outputClauseIndex := 10200, coreClauseIndex := 35216, terminalClauseIndex := 2606100, datum := { row := ⟨5, {0, 6, 7, 8}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10202; core 35222; terminal 2606107
  { outputClauseIndex := 10202, coreClauseIndex := 35222, terminalClauseIndex := 2606107, datum := { row := ⟨5, {0, 6, 7, 9}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10204; core 35228; terminal 2606113
  { outputClauseIndex := 10204, coreClauseIndex := 35228, terminalClauseIndex := 2606113, datum := { row := ⟨5, {0, 6, 7, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10205; core 35229; terminal 2606114
  { outputClauseIndex := 10205, coreClauseIndex := 35229, terminalClauseIndex := 2606114, datum := { row := ⟨5, {0, 6, 7, 10}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10207; core 35235; terminal 2606121
  { outputClauseIndex := 10207, coreClauseIndex := 35235, terminalClauseIndex := 2606121, datum := { row := ⟨5, {0, 6, 8, 9}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10209; core 35241; terminal 2606127
  { outputClauseIndex := 10209, coreClauseIndex := 35241, terminalClauseIndex := 2606127, datum := { row := ⟨5, {0, 6, 8, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10210; core 35242; terminal 2606128
  { outputClauseIndex := 10210, coreClauseIndex := 35242, terminalClauseIndex := 2606128, datum := { row := ⟨5, {0, 6, 8, 10}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10212; core 35248; terminal 2606134
  { outputClauseIndex := 10212, coreClauseIndex := 35248, terminalClauseIndex := 2606134, datum := { row := ⟨5, {0, 6, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10213; core 35249; terminal 2606135
  { outputClauseIndex := 10213, coreClauseIndex := 35249, terminalClauseIndex := 2606135, datum := { row := ⟨5, {0, 6, 9, 10}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10215; core 35255; terminal 2606141
  { outputClauseIndex := 10215, coreClauseIndex := 35255, terminalClauseIndex := 2606141, datum := { row := ⟨5, {0, 7, 8, 9}⟩, arc := ⟨5, .left, {0, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10216; core 35256; terminal 2606142
  { outputClauseIndex := 10216, coreClauseIndex := 35256, terminalClauseIndex := 2606142, datum := { row := ⟨5, {0, 7, 8, 9}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10218; core 35262; terminal 2606148
  { outputClauseIndex := 10218, coreClauseIndex := 35262, terminalClauseIndex := 2606148, datum := { row := ⟨5, {0, 7, 8, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10219; core 35263; terminal 2606149
  { outputClauseIndex := 10219, coreClauseIndex := 35263, terminalClauseIndex := 2606149, datum := { row := ⟨5, {0, 7, 8, 10}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10221; core 35269; terminal 2606155
  { outputClauseIndex := 10221, coreClauseIndex := 35269, terminalClauseIndex := 2606155, datum := { row := ⟨5, {0, 7, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10222; core 35270; terminal 2606156
  { outputClauseIndex := 10222, coreClauseIndex := 35270, terminalClauseIndex := 2606156, datum := { row := ⟨5, {0, 7, 9, 10}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10224; core 35276; terminal 2606162
  { outputClauseIndex := 10224, coreClauseIndex := 35276, terminalClauseIndex := 2606162, datum := { row := ⟨5, {0, 8, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10225; core 35281; terminal 2606169
  { outputClauseIndex := 10225, coreClauseIndex := 35281, terminalClauseIndex := 2606169, datum := { row := ⟨5, {1, 2, 3, 4}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10226; core 35282; terminal 2606170
  { outputClauseIndex := 10226, coreClauseIndex := 35282, terminalClauseIndex := 2606170, datum := { row := ⟨5, {1, 2, 3, 4}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4, 9, 10}⟩ } },
  -- compact 10227; core 35287; terminal 2606176
  { outputClauseIndex := 10227, coreClauseIndex := 35287, terminalClauseIndex := 2606176, datum := { row := ⟨5, {1, 2, 3, 6}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10228; core 35288; terminal 2606177
  { outputClauseIndex := 10228, coreClauseIndex := 35288, terminalClauseIndex := 2606177, datum := { row := ⟨5, {1, 2, 3, 6}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 10229; core 35293; terminal 2606183
  { outputClauseIndex := 10229, coreClauseIndex := 35293, terminalClauseIndex := 2606183, datum := { row := ⟨5, {1, 2, 3, 7}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10230; core 35294; terminal 2606184
  { outputClauseIndex := 10230, coreClauseIndex := 35294, terminalClauseIndex := 2606184, datum := { row := ⟨5, {1, 2, 3, 7}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 10231; core 35299; terminal 2606190
  { outputClauseIndex := 10231, coreClauseIndex := 35299, terminalClauseIndex := 2606190, datum := { row := ⟨5, {1, 2, 3, 8}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10232; core 35300; terminal 2606191
  { outputClauseIndex := 10232, coreClauseIndex := 35300, terminalClauseIndex := 2606191, datum := { row := ⟨5, {1, 2, 3, 8}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 10233; core 35305; terminal 2606197
  { outputClauseIndex := 10233, coreClauseIndex := 35305, terminalClauseIndex := 2606197, datum := { row := ⟨5, {1, 2, 3, 9}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10234; core 35306; terminal 2606198
  { outputClauseIndex := 10234, coreClauseIndex := 35306, terminalClauseIndex := 2606198, datum := { row := ⟨5, {1, 2, 3, 9}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 10235; core 35311; terminal 2606204
  { outputClauseIndex := 10235, coreClauseIndex := 35311, terminalClauseIndex := 2606204, datum := { row := ⟨5, {1, 2, 3, 10}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10236; core 35312; terminal 2606205
  { outputClauseIndex := 10236, coreClauseIndex := 35312, terminalClauseIndex := 2606205, datum := { row := ⟨5, {1, 2, 3, 10}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 10238; core 35318; terminal 2606211
  { outputClauseIndex := 10238, coreClauseIndex := 35318, terminalClauseIndex := 2606211, datum := { row := ⟨5, {1, 2, 4, 6}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10239; core 35319; terminal 2606212
  { outputClauseIndex := 10239, coreClauseIndex := 35319, terminalClauseIndex := 2606212, datum := { row := ⟨5, {1, 2, 4, 6}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 10241; core 35325; terminal 2606218
  { outputClauseIndex := 10241, coreClauseIndex := 35325, terminalClauseIndex := 2606218, datum := { row := ⟨5, {1, 2, 4, 7}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10242; core 35326; terminal 2606219
  { outputClauseIndex := 10242, coreClauseIndex := 35326, terminalClauseIndex := 2606219, datum := { row := ⟨5, {1, 2, 4, 7}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 10244; core 35332; terminal 2606225
  { outputClauseIndex := 10244, coreClauseIndex := 35332, terminalClauseIndex := 2606225, datum := { row := ⟨5, {1, 2, 4, 8}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10245; core 35333; terminal 2606226
  { outputClauseIndex := 10245, coreClauseIndex := 35333, terminalClauseIndex := 2606226, datum := { row := ⟨5, {1, 2, 4, 8}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 10247; core 35339; terminal 2606232
  { outputClauseIndex := 10247, coreClauseIndex := 35339, terminalClauseIndex := 2606232, datum := { row := ⟨5, {1, 2, 4, 9}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10248; core 35340; terminal 2606233
  { outputClauseIndex := 10248, coreClauseIndex := 35340, terminalClauseIndex := 2606233, datum := { row := ⟨5, {1, 2, 4, 9}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 10250; core 35346; terminal 2606239
  { outputClauseIndex := 10250, coreClauseIndex := 35346, terminalClauseIndex := 2606239, datum := { row := ⟨5, {1, 2, 4, 10}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10251; core 35347; terminal 2606240
  { outputClauseIndex := 10251, coreClauseIndex := 35347, terminalClauseIndex := 2606240, datum := { row := ⟨5, {1, 2, 4, 10}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 10253; core 35353; terminal 2606246
  { outputClauseIndex := 10253, coreClauseIndex := 35353, terminalClauseIndex := 2606246, datum := { row := ⟨5, {1, 2, 6, 7}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10254; core 35354; terminal 2606247
  { outputClauseIndex := 10254, coreClauseIndex := 35354, terminalClauseIndex := 2606247, datum := { row := ⟨5, {1, 2, 6, 7}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10256; core 35360; terminal 2606253
  { outputClauseIndex := 10256, coreClauseIndex := 35360, terminalClauseIndex := 2606253, datum := { row := ⟨5, {1, 2, 6, 8}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10257; core 35361; terminal 2606254
  { outputClauseIndex := 10257, coreClauseIndex := 35361, terminalClauseIndex := 2606254, datum := { row := ⟨5, {1, 2, 6, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10259; core 35367; terminal 2606260
  { outputClauseIndex := 10259, coreClauseIndex := 35367, terminalClauseIndex := 2606260, datum := { row := ⟨5, {1, 2, 6, 9}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10260; core 35368; terminal 2606261
  { outputClauseIndex := 10260, coreClauseIndex := 35368, terminalClauseIndex := 2606261, datum := { row := ⟨5, {1, 2, 6, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10262; core 35374; terminal 2606267
  { outputClauseIndex := 10262, coreClauseIndex := 35374, terminalClauseIndex := 2606267, datum := { row := ⟨5, {1, 2, 6, 10}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10263; core 35375; terminal 2606268
  { outputClauseIndex := 10263, coreClauseIndex := 35375, terminalClauseIndex := 2606268, datum := { row := ⟨5, {1, 2, 6, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10265; core 35381; terminal 2606274
  { outputClauseIndex := 10265, coreClauseIndex := 35381, terminalClauseIndex := 2606274, datum := { row := ⟨5, {1, 2, 7, 8}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10266; core 35382; terminal 2606275
  { outputClauseIndex := 10266, coreClauseIndex := 35382, terminalClauseIndex := 2606275, datum := { row := ⟨5, {1, 2, 7, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10268; core 35388; terminal 2606281
  { outputClauseIndex := 10268, coreClauseIndex := 35388, terminalClauseIndex := 2606281, datum := { row := ⟨5, {1, 2, 7, 9}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10269; core 35389; terminal 2606282
  { outputClauseIndex := 10269, coreClauseIndex := 35389, terminalClauseIndex := 2606282, datum := { row := ⟨5, {1, 2, 7, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10271; core 35395; terminal 2606288
  { outputClauseIndex := 10271, coreClauseIndex := 35395, terminalClauseIndex := 2606288, datum := { row := ⟨5, {1, 2, 7, 10}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10272; core 35396; terminal 2606289
  { outputClauseIndex := 10272, coreClauseIndex := 35396, terminalClauseIndex := 2606289, datum := { row := ⟨5, {1, 2, 7, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10274; core 35402; terminal 2606295
  { outputClauseIndex := 10274, coreClauseIndex := 35402, terminalClauseIndex := 2606295, datum := { row := ⟨5, {1, 2, 8, 9}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10275; core 35403; terminal 2606296
  { outputClauseIndex := 10275, coreClauseIndex := 35403, terminalClauseIndex := 2606296, datum := { row := ⟨5, {1, 2, 8, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10277; core 35409; terminal 2606302
  { outputClauseIndex := 10277, coreClauseIndex := 35409, terminalClauseIndex := 2606302, datum := { row := ⟨5, {1, 2, 8, 10}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10278; core 35410; terminal 2606303
  { outputClauseIndex := 10278, coreClauseIndex := 35410, terminalClauseIndex := 2606303, datum := { row := ⟨5, {1, 2, 8, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10280; core 35416; terminal 2606309
  { outputClauseIndex := 10280, coreClauseIndex := 35416, terminalClauseIndex := 2606309, datum := { row := ⟨5, {1, 2, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10281; core 35417; terminal 2606310
  { outputClauseIndex := 10281, coreClauseIndex := 35417, terminalClauseIndex := 2606310, datum := { row := ⟨5, {1, 2, 9, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10283; core 35423; terminal 2606316
  { outputClauseIndex := 10283, coreClauseIndex := 35423, terminalClauseIndex := 2606316, datum := { row := ⟨5, {1, 3, 4, 6}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10285; core 35429; terminal 2606323
  { outputClauseIndex := 10285, coreClauseIndex := 35429, terminalClauseIndex := 2606323, datum := { row := ⟨5, {1, 3, 4, 7}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10287; core 35435; terminal 2606330
  { outputClauseIndex := 10287, coreClauseIndex := 35435, terminalClauseIndex := 2606330, datum := { row := ⟨5, {1, 3, 4, 8}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10289; core 35441; terminal 2606337
  { outputClauseIndex := 10289, coreClauseIndex := 35441, terminalClauseIndex := 2606337, datum := { row := ⟨5, {1, 3, 4, 9}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10291; core 35447; terminal 2606344
  { outputClauseIndex := 10291, coreClauseIndex := 35447, terminalClauseIndex := 2606344, datum := { row := ⟨5, {1, 3, 4, 10}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10293; core 35453; terminal 2606351
  { outputClauseIndex := 10293, coreClauseIndex := 35453, terminalClauseIndex := 2606351, datum := { row := ⟨5, {1, 3, 6, 7}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10294; core 35454; terminal 2606352
  { outputClauseIndex := 10294, coreClauseIndex := 35454, terminalClauseIndex := 2606352, datum := { row := ⟨5, {1, 3, 6, 7}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10296; core 35460; terminal 2606358
  { outputClauseIndex := 10296, coreClauseIndex := 35460, terminalClauseIndex := 2606358, datum := { row := ⟨5, {1, 3, 6, 8}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10297; core 35461; terminal 2606359
  { outputClauseIndex := 10297, coreClauseIndex := 35461, terminalClauseIndex := 2606359, datum := { row := ⟨5, {1, 3, 6, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10299; core 35467; terminal 2606365
  { outputClauseIndex := 10299, coreClauseIndex := 35467, terminalClauseIndex := 2606365, datum := { row := ⟨5, {1, 3, 6, 9}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10300; core 35468; terminal 2606366
  { outputClauseIndex := 10300, coreClauseIndex := 35468, terminalClauseIndex := 2606366, datum := { row := ⟨5, {1, 3, 6, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10302; core 35474; terminal 2606372
  { outputClauseIndex := 10302, coreClauseIndex := 35474, terminalClauseIndex := 2606372, datum := { row := ⟨5, {1, 3, 6, 10}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10303; core 35475; terminal 2606373
  { outputClauseIndex := 10303, coreClauseIndex := 35475, terminalClauseIndex := 2606373, datum := { row := ⟨5, {1, 3, 6, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10305; core 35481; terminal 2606379
  { outputClauseIndex := 10305, coreClauseIndex := 35481, terminalClauseIndex := 2606379, datum := { row := ⟨5, {1, 3, 7, 8}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10306; core 35482; terminal 2606380
  { outputClauseIndex := 10306, coreClauseIndex := 35482, terminalClauseIndex := 2606380, datum := { row := ⟨5, {1, 3, 7, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10308; core 35488; terminal 2606386
  { outputClauseIndex := 10308, coreClauseIndex := 35488, terminalClauseIndex := 2606386, datum := { row := ⟨5, {1, 3, 7, 9}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10309; core 35489; terminal 2606387
  { outputClauseIndex := 10309, coreClauseIndex := 35489, terminalClauseIndex := 2606387, datum := { row := ⟨5, {1, 3, 7, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10311; core 35495; terminal 2606393
  { outputClauseIndex := 10311, coreClauseIndex := 35495, terminalClauseIndex := 2606393, datum := { row := ⟨5, {1, 3, 7, 10}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10312; core 35496; terminal 2606394
  { outputClauseIndex := 10312, coreClauseIndex := 35496, terminalClauseIndex := 2606394, datum := { row := ⟨5, {1, 3, 7, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10314; core 35502; terminal 2606400
  { outputClauseIndex := 10314, coreClauseIndex := 35502, terminalClauseIndex := 2606400, datum := { row := ⟨5, {1, 3, 8, 9}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10315; core 35503; terminal 2606401
  { outputClauseIndex := 10315, coreClauseIndex := 35503, terminalClauseIndex := 2606401, datum := { row := ⟨5, {1, 3, 8, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10317; core 35509; terminal 2606407
  { outputClauseIndex := 10317, coreClauseIndex := 35509, terminalClauseIndex := 2606407, datum := { row := ⟨5, {1, 3, 8, 10}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10318; core 35510; terminal 2606408
  { outputClauseIndex := 10318, coreClauseIndex := 35510, terminalClauseIndex := 2606408, datum := { row := ⟨5, {1, 3, 8, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10320; core 35516; terminal 2606414
  { outputClauseIndex := 10320, coreClauseIndex := 35516, terminalClauseIndex := 2606414, datum := { row := ⟨5, {1, 3, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10321; core 35517; terminal 2606415
  { outputClauseIndex := 10321, coreClauseIndex := 35517, terminalClauseIndex := 2606415, datum := { row := ⟨5, {1, 3, 9, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10322; core 35522; terminal 2606421
  { outputClauseIndex := 10322, coreClauseIndex := 35522, terminalClauseIndex := 2606421, datum := { row := ⟨5, {1, 4, 6, 7}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10324; core 35528; terminal 2606428
  { outputClauseIndex := 10324, coreClauseIndex := 35528, terminalClauseIndex := 2606428, datum := { row := ⟨5, {1, 4, 6, 8}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10325; core 35529; terminal 2606429
  { outputClauseIndex := 10325, coreClauseIndex := 35529, terminalClauseIndex := 2606429, datum := { row := ⟨5, {1, 4, 6, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10327; core 35535; terminal 2606435
  { outputClauseIndex := 10327, coreClauseIndex := 35535, terminalClauseIndex := 2606435, datum := { row := ⟨5, {1, 4, 6, 9}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10328; core 35536; terminal 2606436
  { outputClauseIndex := 10328, coreClauseIndex := 35536, terminalClauseIndex := 2606436, datum := { row := ⟨5, {1, 4, 6, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10330; core 35542; terminal 2606442
  { outputClauseIndex := 10330, coreClauseIndex := 35542, terminalClauseIndex := 2606442, datum := { row := ⟨5, {1, 4, 6, 10}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10331; core 35543; terminal 2606443
  { outputClauseIndex := 10331, coreClauseIndex := 35543, terminalClauseIndex := 2606443, datum := { row := ⟨5, {1, 4, 6, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10333; core 35549; terminal 2606449
  { outputClauseIndex := 10333, coreClauseIndex := 35549, terminalClauseIndex := 2606449, datum := { row := ⟨5, {1, 4, 7, 8}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10334; core 35550; terminal 2606450
  { outputClauseIndex := 10334, coreClauseIndex := 35550, terminalClauseIndex := 2606450, datum := { row := ⟨5, {1, 4, 7, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10336; core 35556; terminal 2606456
  { outputClauseIndex := 10336, coreClauseIndex := 35556, terminalClauseIndex := 2606456, datum := { row := ⟨5, {1, 4, 7, 9}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10337; core 35557; terminal 2606457
  { outputClauseIndex := 10337, coreClauseIndex := 35557, terminalClauseIndex := 2606457, datum := { row := ⟨5, {1, 4, 7, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10339; core 35563; terminal 2606463
  { outputClauseIndex := 10339, coreClauseIndex := 35563, terminalClauseIndex := 2606463, datum := { row := ⟨5, {1, 4, 7, 10}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10340; core 35564; terminal 2606464
  { outputClauseIndex := 10340, coreClauseIndex := 35564, terminalClauseIndex := 2606464, datum := { row := ⟨5, {1, 4, 7, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10342; core 35570; terminal 2606470
  { outputClauseIndex := 10342, coreClauseIndex := 35570, terminalClauseIndex := 2606470, datum := { row := ⟨5, {1, 4, 8, 9}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10343; core 35571; terminal 2606471
  { outputClauseIndex := 10343, coreClauseIndex := 35571, terminalClauseIndex := 2606471, datum := { row := ⟨5, {1, 4, 8, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10345; core 35577; terminal 2606477
  { outputClauseIndex := 10345, coreClauseIndex := 35577, terminalClauseIndex := 2606477, datum := { row := ⟨5, {1, 4, 8, 10}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10346; core 35578; terminal 2606478
  { outputClauseIndex := 10346, coreClauseIndex := 35578, terminalClauseIndex := 2606478, datum := { row := ⟨5, {1, 4, 8, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10348; core 35584; terminal 2606484
  { outputClauseIndex := 10348, coreClauseIndex := 35584, terminalClauseIndex := 2606484, datum := { row := ⟨5, {1, 4, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8}⟩ } },
  -- compact 10349; core 35585; terminal 2606485
  { outputClauseIndex := 10349, coreClauseIndex := 35585, terminalClauseIndex := 2606485, datum := { row := ⟨5, {1, 4, 9, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10351; core 35591; terminal 2606491
  { outputClauseIndex := 10351, coreClauseIndex := 35591, terminalClauseIndex := 2606491, datum := { row := ⟨5, {1, 6, 7, 8}⟩, arc := ⟨5, .left, {0, 1, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10352; core 35592; terminal 2606492
  { outputClauseIndex := 10352, coreClauseIndex := 35592, terminalClauseIndex := 2606492, datum := { row := ⟨5, {1, 6, 7, 8}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10354; core 35598; terminal 2606499
  { outputClauseIndex := 10354, coreClauseIndex := 35598, terminalClauseIndex := 2606499, datum := { row := ⟨5, {1, 6, 7, 9}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10356; core 35604; terminal 2606505
  { outputClauseIndex := 10356, coreClauseIndex := 35604, terminalClauseIndex := 2606505, datum := { row := ⟨5, {1, 6, 7, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10357; core 35605; terminal 2606506
  { outputClauseIndex := 10357, coreClauseIndex := 35605, terminalClauseIndex := 2606506, datum := { row := ⟨5, {1, 6, 7, 10}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10359; core 35611; terminal 2606513
  { outputClauseIndex := 10359, coreClauseIndex := 35611, terminalClauseIndex := 2606513, datum := { row := ⟨5, {1, 6, 8, 9}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10361; core 35617; terminal 2606519
  { outputClauseIndex := 10361, coreClauseIndex := 35617, terminalClauseIndex := 2606519, datum := { row := ⟨5, {1, 6, 8, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10362; core 35618; terminal 2606520
  { outputClauseIndex := 10362, coreClauseIndex := 35618, terminalClauseIndex := 2606520, datum := { row := ⟨5, {1, 6, 8, 10}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10364; core 35624; terminal 2606526
  { outputClauseIndex := 10364, coreClauseIndex := 35624, terminalClauseIndex := 2606526, datum := { row := ⟨5, {1, 6, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10365; core 35625; terminal 2606527
  { outputClauseIndex := 10365, coreClauseIndex := 35625, terminalClauseIndex := 2606527, datum := { row := ⟨5, {1, 6, 9, 10}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10367; core 35631; terminal 2606533
  { outputClauseIndex := 10367, coreClauseIndex := 35631, terminalClauseIndex := 2606533, datum := { row := ⟨5, {1, 7, 8, 9}⟩, arc := ⟨5, .left, {0, 6, 7, 8, 9, 10}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk010_batch_valid :
    directRowArcFiniteOccurrencesChunk010.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk010, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk010 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk010.map (·.datum)

theorem directRowArcFiniteDataChunk010_batch_valid :
    directRowArcFiniteDataChunk010.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk010, datum.Valid := by
  rw [directRowArcFiniteDataChunk010]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk010_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk010_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
