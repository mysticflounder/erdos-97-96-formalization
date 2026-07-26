/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk022 : List DirectRowArcFiniteOccurrence := [
  -- compact 12364; core 40966; terminal 2612876
  { outputClauseIndex := 12364, coreClauseIndex := 40966, terminalClauseIndex := 2612876, datum := { row := ⟨9, {4, 6, 7, 10}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12366; core 40972; terminal 2612882
  { outputClauseIndex := 12366, coreClauseIndex := 40972, terminalClauseIndex := 2612882, datum := { row := ⟨9, {4, 6, 8, 10}⟩, arc := ⟨9, .left, {2, 3}⟩ } },
  -- compact 12367; core 40973; terminal 2612883
  { outputClauseIndex := 12367, coreClauseIndex := 40973, terminalClauseIndex := 2612883, datum := { row := ⟨9, {4, 6, 8, 10}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12368; core 40978; terminal 2612889
  { outputClauseIndex := 12368, coreClauseIndex := 40978, terminalClauseIndex := 2612889, datum := { row := ⟨9, {4, 7, 8, 10}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12369; core 40979; terminal 2612890
  { outputClauseIndex := 12369, coreClauseIndex := 40979, terminalClauseIndex := 2612890, datum := { row := ⟨9, {4, 7, 8, 10}⟩, arc := ⟨9, .right, {0, 7, 8, 9, 10}⟩ } },
  -- compact 12370; core 40984; terminal 2612896
  { outputClauseIndex := 12370, coreClauseIndex := 40984, terminalClauseIndex := 2612896, datum := { row := ⟨9, {5, 6, 7, 8}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12371; core 40995; terminal 2612917
  { outputClauseIndex := 12371, coreClauseIndex := 40995, terminalClauseIndex := 2612917, datum := { row := ⟨9, {5, 7, 8, 10}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12372; core 41000; terminal 2612924
  { outputClauseIndex := 12372, coreClauseIndex := 41000, terminalClauseIndex := 2612924, datum := { row := ⟨9, {6, 7, 8, 10}⟩, arc := ⟨9, .left, {2}⟩ } },
  -- compact 12373; core 41001; terminal 2612925
  { outputClauseIndex := 12373, coreClauseIndex := 41001, terminalClauseIndex := 2612925, datum := { row := ⟨9, {6, 7, 8, 10}⟩, arc := ⟨9, .right, {0, 5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 12374; core 41005; terminal 2612931
  { outputClauseIndex := 12374, coreClauseIndex := 41005, terminalClauseIndex := 2612931, datum := { row := ⟨10, {0, 1, 2, 3}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 12375; core 41006; terminal 2612932
  { outputClauseIndex := 12375, coreClauseIndex := 41006, terminalClauseIndex := 2612932, datum := { row := ⟨10, {0, 1, 2, 3}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12377; core 41011; terminal 2612938
  { outputClauseIndex := 12377, coreClauseIndex := 41011, terminalClauseIndex := 2612938, datum := { row := ⟨10, {0, 1, 2, 4}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 12378; core 41012; terminal 2612939
  { outputClauseIndex := 12378, coreClauseIndex := 41012, terminalClauseIndex := 2612939, datum := { row := ⟨10, {0, 1, 2, 4}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12380; core 41017; terminal 2612945
  { outputClauseIndex := 12380, coreClauseIndex := 41017, terminalClauseIndex := 2612945, datum := { row := ⟨10, {0, 1, 2, 5}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 12381; core 41018; terminal 2612946
  { outputClauseIndex := 12381, coreClauseIndex := 41018, terminalClauseIndex := 2612946, datum := { row := ⟨10, {0, 1, 2, 5}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12383; core 41023; terminal 2612952
  { outputClauseIndex := 12383, coreClauseIndex := 41023, terminalClauseIndex := 2612952, datum := { row := ⟨10, {0, 1, 2, 6}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 12384; core 41024; terminal 2612953
  { outputClauseIndex := 12384, coreClauseIndex := 41024, terminalClauseIndex := 2612953, datum := { row := ⟨10, {0, 1, 2, 6}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12386; core 41029; terminal 2612959
  { outputClauseIndex := 12386, coreClauseIndex := 41029, terminalClauseIndex := 2612959, datum := { row := ⟨10, {0, 1, 2, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 12387; core 41030; terminal 2612960
  { outputClauseIndex := 12387, coreClauseIndex := 41030, terminalClauseIndex := 2612960, datum := { row := ⟨10, {0, 1, 2, 7}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12389; core 41035; terminal 2612966
  { outputClauseIndex := 12389, coreClauseIndex := 41035, terminalClauseIndex := 2612966, datum := { row := ⟨10, {0, 1, 2, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 12390; core 41036; terminal 2612967
  { outputClauseIndex := 12390, coreClauseIndex := 41036, terminalClauseIndex := 2612967, datum := { row := ⟨10, {0, 1, 2, 8}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12392; core 41041; terminal 2612973
  { outputClauseIndex := 12392, coreClauseIndex := 41041, terminalClauseIndex := 2612973, datum := { row := ⟨10, {0, 1, 2, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 12393; core 41042; terminal 2612974
  { outputClauseIndex := 12393, coreClauseIndex := 41042, terminalClauseIndex := 2612974, datum := { row := ⟨10, {0, 1, 2, 9}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12395; core 41048; terminal 2612980
  { outputClauseIndex := 12395, coreClauseIndex := 41048, terminalClauseIndex := 2612980, datum := { row := ⟨10, {0, 1, 3, 4}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 12396; core 41049; terminal 2612981
  { outputClauseIndex := 12396, coreClauseIndex := 41049, terminalClauseIndex := 2612981, datum := { row := ⟨10, {0, 1, 3, 4}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12398; core 41055; terminal 2612987
  { outputClauseIndex := 12398, coreClauseIndex := 41055, terminalClauseIndex := 2612987, datum := { row := ⟨10, {0, 1, 3, 5}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 12399; core 41056; terminal 2612988
  { outputClauseIndex := 12399, coreClauseIndex := 41056, terminalClauseIndex := 2612988, datum := { row := ⟨10, {0, 1, 3, 5}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12401; core 41062; terminal 2612994
  { outputClauseIndex := 12401, coreClauseIndex := 41062, terminalClauseIndex := 2612994, datum := { row := ⟨10, {0, 1, 3, 6}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 12402; core 41063; terminal 2612995
  { outputClauseIndex := 12402, coreClauseIndex := 41063, terminalClauseIndex := 2612995, datum := { row := ⟨10, {0, 1, 3, 6}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12404; core 41069; terminal 2613001
  { outputClauseIndex := 12404, coreClauseIndex := 41069, terminalClauseIndex := 2613001, datum := { row := ⟨10, {0, 1, 3, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 12405; core 41070; terminal 2613002
  { outputClauseIndex := 12405, coreClauseIndex := 41070, terminalClauseIndex := 2613002, datum := { row := ⟨10, {0, 1, 3, 7}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12407; core 41076; terminal 2613008
  { outputClauseIndex := 12407, coreClauseIndex := 41076, terminalClauseIndex := 2613008, datum := { row := ⟨10, {0, 1, 3, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 12408; core 41077; terminal 2613009
  { outputClauseIndex := 12408, coreClauseIndex := 41077, terminalClauseIndex := 2613009, datum := { row := ⟨10, {0, 1, 3, 8}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12410; core 41083; terminal 2613015
  { outputClauseIndex := 12410, coreClauseIndex := 41083, terminalClauseIndex := 2613015, datum := { row := ⟨10, {0, 1, 3, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 12411; core 41084; terminal 2613016
  { outputClauseIndex := 12411, coreClauseIndex := 41084, terminalClauseIndex := 2613016, datum := { row := ⟨10, {0, 1, 3, 9}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12413; core 41090; terminal 2613022
  { outputClauseIndex := 12413, coreClauseIndex := 41090, terminalClauseIndex := 2613022, datum := { row := ⟨10, {0, 1, 4, 5}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12414; core 41091; terminal 2613023
  { outputClauseIndex := 12414, coreClauseIndex := 41091, terminalClauseIndex := 2613023, datum := { row := ⟨10, {0, 1, 4, 5}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12416; core 41097; terminal 2613029
  { outputClauseIndex := 12416, coreClauseIndex := 41097, terminalClauseIndex := 2613029, datum := { row := ⟨10, {0, 1, 4, 6}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12417; core 41098; terminal 2613030
  { outputClauseIndex := 12417, coreClauseIndex := 41098, terminalClauseIndex := 2613030, datum := { row := ⟨10, {0, 1, 4, 6}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12419; core 41104; terminal 2613036
  { outputClauseIndex := 12419, coreClauseIndex := 41104, terminalClauseIndex := 2613036, datum := { row := ⟨10, {0, 1, 4, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12420; core 41105; terminal 2613037
  { outputClauseIndex := 12420, coreClauseIndex := 41105, terminalClauseIndex := 2613037, datum := { row := ⟨10, {0, 1, 4, 7}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12422; core 41111; terminal 2613043
  { outputClauseIndex := 12422, coreClauseIndex := 41111, terminalClauseIndex := 2613043, datum := { row := ⟨10, {0, 1, 4, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12423; core 41112; terminal 2613044
  { outputClauseIndex := 12423, coreClauseIndex := 41112, terminalClauseIndex := 2613044, datum := { row := ⟨10, {0, 1, 4, 8}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12425; core 41118; terminal 2613050
  { outputClauseIndex := 12425, coreClauseIndex := 41118, terminalClauseIndex := 2613050, datum := { row := ⟨10, {0, 1, 4, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12426; core 41119; terminal 2613051
  { outputClauseIndex := 12426, coreClauseIndex := 41119, terminalClauseIndex := 2613051, datum := { row := ⟨10, {0, 1, 4, 9}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12427; core 41124; terminal 2613058
  { outputClauseIndex := 12427, coreClauseIndex := 41124, terminalClauseIndex := 2613058, datum := { row := ⟨10, {0, 1, 5, 6}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12429; core 41130; terminal 2613064
  { outputClauseIndex := 12429, coreClauseIndex := 41130, terminalClauseIndex := 2613064, datum := { row := ⟨10, {0, 1, 5, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12430; core 41131; terminal 2613065
  { outputClauseIndex := 12430, coreClauseIndex := 41131, terminalClauseIndex := 2613065, datum := { row := ⟨10, {0, 1, 5, 7}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12432; core 41137; terminal 2613071
  { outputClauseIndex := 12432, coreClauseIndex := 41137, terminalClauseIndex := 2613071, datum := { row := ⟨10, {0, 1, 5, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12433; core 41138; terminal 2613072
  { outputClauseIndex := 12433, coreClauseIndex := 41138, terminalClauseIndex := 2613072, datum := { row := ⟨10, {0, 1, 5, 8}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12435; core 41144; terminal 2613078
  { outputClauseIndex := 12435, coreClauseIndex := 41144, terminalClauseIndex := 2613078, datum := { row := ⟨10, {0, 1, 5, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12436; core 41145; terminal 2613079
  { outputClauseIndex := 12436, coreClauseIndex := 41145, terminalClauseIndex := 2613079, datum := { row := ⟨10, {0, 1, 5, 9}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12438; core 41151; terminal 2613085
  { outputClauseIndex := 12438, coreClauseIndex := 41151, terminalClauseIndex := 2613085, datum := { row := ⟨10, {0, 1, 6, 7}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12439; core 41152; terminal 2613086
  { outputClauseIndex := 12439, coreClauseIndex := 41152, terminalClauseIndex := 2613086, datum := { row := ⟨10, {0, 1, 6, 7}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12441; core 41158; terminal 2613092
  { outputClauseIndex := 12441, coreClauseIndex := 41158, terminalClauseIndex := 2613092, datum := { row := ⟨10, {0, 1, 6, 8}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12442; core 41159; terminal 2613093
  { outputClauseIndex := 12442, coreClauseIndex := 41159, terminalClauseIndex := 2613093, datum := { row := ⟨10, {0, 1, 6, 8}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12444; core 41165; terminal 2613099
  { outputClauseIndex := 12444, coreClauseIndex := 41165, terminalClauseIndex := 2613099, datum := { row := ⟨10, {0, 1, 6, 9}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12445; core 41166; terminal 2613100
  { outputClauseIndex := 12445, coreClauseIndex := 41166, terminalClauseIndex := 2613100, datum := { row := ⟨10, {0, 1, 6, 9}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12446; core 41171; terminal 2613106
  { outputClauseIndex := 12446, coreClauseIndex := 41171, terminalClauseIndex := 2613106, datum := { row := ⟨10, {0, 1, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12447; core 41172; terminal 2613107
  { outputClauseIndex := 12447, coreClauseIndex := 41172, terminalClauseIndex := 2613107, datum := { row := ⟨10, {0, 1, 7, 8}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12448; core 41177; terminal 2613113
  { outputClauseIndex := 12448, coreClauseIndex := 41177, terminalClauseIndex := 2613113, datum := { row := ⟨10, {0, 1, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12449; core 41178; terminal 2613114
  { outputClauseIndex := 12449, coreClauseIndex := 41178, terminalClauseIndex := 2613114, datum := { row := ⟨10, {0, 1, 7, 9}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12450; core 41183; terminal 2613121
  { outputClauseIndex := 12450, coreClauseIndex := 41183, terminalClauseIndex := 2613121, datum := { row := ⟨10, {0, 1, 8, 9}⟩, arc := ⟨10, .right, {10}⟩ } },
  -- compact 12452; core 41189; terminal 2613127
  { outputClauseIndex := 12452, coreClauseIndex := 41189, terminalClauseIndex := 2613127, datum := { row := ⟨10, {0, 2, 3, 4}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 12453; core 41190; terminal 2613128
  { outputClauseIndex := 12453, coreClauseIndex := 41190, terminalClauseIndex := 2613128, datum := { row := ⟨10, {0, 2, 3, 4}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12455; core 41196; terminal 2613134
  { outputClauseIndex := 12455, coreClauseIndex := 41196, terminalClauseIndex := 2613134, datum := { row := ⟨10, {0, 2, 3, 5}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 12456; core 41197; terminal 2613135
  { outputClauseIndex := 12456, coreClauseIndex := 41197, terminalClauseIndex := 2613135, datum := { row := ⟨10, {0, 2, 3, 5}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12458; core 41203; terminal 2613141
  { outputClauseIndex := 12458, coreClauseIndex := 41203, terminalClauseIndex := 2613141, datum := { row := ⟨10, {0, 2, 3, 6}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 12459; core 41204; terminal 2613142
  { outputClauseIndex := 12459, coreClauseIndex := 41204, terminalClauseIndex := 2613142, datum := { row := ⟨10, {0, 2, 3, 6}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12461; core 41210; terminal 2613148
  { outputClauseIndex := 12461, coreClauseIndex := 41210, terminalClauseIndex := 2613148, datum := { row := ⟨10, {0, 2, 3, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 12462; core 41211; terminal 2613149
  { outputClauseIndex := 12462, coreClauseIndex := 41211, terminalClauseIndex := 2613149, datum := { row := ⟨10, {0, 2, 3, 7}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12464; core 41217; terminal 2613155
  { outputClauseIndex := 12464, coreClauseIndex := 41217, terminalClauseIndex := 2613155, datum := { row := ⟨10, {0, 2, 3, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 12465; core 41218; terminal 2613156
  { outputClauseIndex := 12465, coreClauseIndex := 41218, terminalClauseIndex := 2613156, datum := { row := ⟨10, {0, 2, 3, 8}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12467; core 41224; terminal 2613162
  { outputClauseIndex := 12467, coreClauseIndex := 41224, terminalClauseIndex := 2613162, datum := { row := ⟨10, {0, 2, 3, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 12468; core 41225; terminal 2613163
  { outputClauseIndex := 12468, coreClauseIndex := 41225, terminalClauseIndex := 2613163, datum := { row := ⟨10, {0, 2, 3, 9}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12470; core 41231; terminal 2613169
  { outputClauseIndex := 12470, coreClauseIndex := 41231, terminalClauseIndex := 2613169, datum := { row := ⟨10, {0, 2, 4, 5}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12471; core 41232; terminal 2613170
  { outputClauseIndex := 12471, coreClauseIndex := 41232, terminalClauseIndex := 2613170, datum := { row := ⟨10, {0, 2, 4, 5}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12473; core 41238; terminal 2613176
  { outputClauseIndex := 12473, coreClauseIndex := 41238, terminalClauseIndex := 2613176, datum := { row := ⟨10, {0, 2, 4, 6}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12474; core 41239; terminal 2613177
  { outputClauseIndex := 12474, coreClauseIndex := 41239, terminalClauseIndex := 2613177, datum := { row := ⟨10, {0, 2, 4, 6}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12476; core 41245; terminal 2613183
  { outputClauseIndex := 12476, coreClauseIndex := 41245, terminalClauseIndex := 2613183, datum := { row := ⟨10, {0, 2, 4, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12477; core 41246; terminal 2613184
  { outputClauseIndex := 12477, coreClauseIndex := 41246, terminalClauseIndex := 2613184, datum := { row := ⟨10, {0, 2, 4, 7}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12479; core 41252; terminal 2613190
  { outputClauseIndex := 12479, coreClauseIndex := 41252, terminalClauseIndex := 2613190, datum := { row := ⟨10, {0, 2, 4, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12480; core 41253; terminal 2613191
  { outputClauseIndex := 12480, coreClauseIndex := 41253, terminalClauseIndex := 2613191, datum := { row := ⟨10, {0, 2, 4, 8}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12482; core 41259; terminal 2613197
  { outputClauseIndex := 12482, coreClauseIndex := 41259, terminalClauseIndex := 2613197, datum := { row := ⟨10, {0, 2, 4, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12483; core 41260; terminal 2613198
  { outputClauseIndex := 12483, coreClauseIndex := 41260, terminalClauseIndex := 2613198, datum := { row := ⟨10, {0, 2, 4, 9}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12484; core 41265; terminal 2613205
  { outputClauseIndex := 12484, coreClauseIndex := 41265, terminalClauseIndex := 2613205, datum := { row := ⟨10, {0, 2, 5, 6}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12486; core 41271; terminal 2613211
  { outputClauseIndex := 12486, coreClauseIndex := 41271, terminalClauseIndex := 2613211, datum := { row := ⟨10, {0, 2, 5, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12487; core 41272; terminal 2613212
  { outputClauseIndex := 12487, coreClauseIndex := 41272, terminalClauseIndex := 2613212, datum := { row := ⟨10, {0, 2, 5, 7}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12489; core 41278; terminal 2613218
  { outputClauseIndex := 12489, coreClauseIndex := 41278, terminalClauseIndex := 2613218, datum := { row := ⟨10, {0, 2, 5, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12490; core 41279; terminal 2613219
  { outputClauseIndex := 12490, coreClauseIndex := 41279, terminalClauseIndex := 2613219, datum := { row := ⟨10, {0, 2, 5, 8}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12492; core 41285; terminal 2613225
  { outputClauseIndex := 12492, coreClauseIndex := 41285, terminalClauseIndex := 2613225, datum := { row := ⟨10, {0, 2, 5, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12493; core 41286; terminal 2613226
  { outputClauseIndex := 12493, coreClauseIndex := 41286, terminalClauseIndex := 2613226, datum := { row := ⟨10, {0, 2, 5, 9}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12495; core 41292; terminal 2613232
  { outputClauseIndex := 12495, coreClauseIndex := 41292, terminalClauseIndex := 2613232, datum := { row := ⟨10, {0, 2, 6, 7}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12496; core 41293; terminal 2613233
  { outputClauseIndex := 12496, coreClauseIndex := 41293, terminalClauseIndex := 2613233, datum := { row := ⟨10, {0, 2, 6, 7}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12498; core 41299; terminal 2613239
  { outputClauseIndex := 12498, coreClauseIndex := 41299, terminalClauseIndex := 2613239, datum := { row := ⟨10, {0, 2, 6, 8}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12499; core 41300; terminal 2613240
  { outputClauseIndex := 12499, coreClauseIndex := 41300, terminalClauseIndex := 2613240, datum := { row := ⟨10, {0, 2, 6, 8}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12501; core 41306; terminal 2613246
  { outputClauseIndex := 12501, coreClauseIndex := 41306, terminalClauseIndex := 2613246, datum := { row := ⟨10, {0, 2, 6, 9}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12502; core 41307; terminal 2613247
  { outputClauseIndex := 12502, coreClauseIndex := 41307, terminalClauseIndex := 2613247, datum := { row := ⟨10, {0, 2, 6, 9}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12503; core 41312; terminal 2613253
  { outputClauseIndex := 12503, coreClauseIndex := 41312, terminalClauseIndex := 2613253, datum := { row := ⟨10, {0, 2, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12504; core 41313; terminal 2613254
  { outputClauseIndex := 12504, coreClauseIndex := 41313, terminalClauseIndex := 2613254, datum := { row := ⟨10, {0, 2, 7, 8}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12505; core 41318; terminal 2613260
  { outputClauseIndex := 12505, coreClauseIndex := 41318, terminalClauseIndex := 2613260, datum := { row := ⟨10, {0, 2, 7, 9}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12506; core 41319; terminal 2613261
  { outputClauseIndex := 12506, coreClauseIndex := 41319, terminalClauseIndex := 2613261, datum := { row := ⟨10, {0, 2, 7, 9}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12507; core 41324; terminal 2613268
  { outputClauseIndex := 12507, coreClauseIndex := 41324, terminalClauseIndex := 2613268, datum := { row := ⟨10, {0, 2, 8, 9}⟩, arc := ⟨10, .right, {9, 10}⟩ } },
  -- compact 12509; core 41330; terminal 2613274
  { outputClauseIndex := 12509, coreClauseIndex := 41330, terminalClauseIndex := 2613274, datum := { row := ⟨10, {0, 3, 4, 5}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12510; core 41331; terminal 2613275
  { outputClauseIndex := 12510, coreClauseIndex := 41331, terminalClauseIndex := 2613275, datum := { row := ⟨10, {0, 3, 4, 5}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12512; core 41337; terminal 2613281
  { outputClauseIndex := 12512, coreClauseIndex := 41337, terminalClauseIndex := 2613281, datum := { row := ⟨10, {0, 3, 4, 6}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12513; core 41338; terminal 2613282
  { outputClauseIndex := 12513, coreClauseIndex := 41338, terminalClauseIndex := 2613282, datum := { row := ⟨10, {0, 3, 4, 6}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12515; core 41344; terminal 2613288
  { outputClauseIndex := 12515, coreClauseIndex := 41344, terminalClauseIndex := 2613288, datum := { row := ⟨10, {0, 3, 4, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12516; core 41345; terminal 2613289
  { outputClauseIndex := 12516, coreClauseIndex := 41345, terminalClauseIndex := 2613289, datum := { row := ⟨10, {0, 3, 4, 7}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12518; core 41351; terminal 2613295
  { outputClauseIndex := 12518, coreClauseIndex := 41351, terminalClauseIndex := 2613295, datum := { row := ⟨10, {0, 3, 4, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12519; core 41352; terminal 2613296
  { outputClauseIndex := 12519, coreClauseIndex := 41352, terminalClauseIndex := 2613296, datum := { row := ⟨10, {0, 3, 4, 8}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12521; core 41358; terminal 2613302
  { outputClauseIndex := 12521, coreClauseIndex := 41358, terminalClauseIndex := 2613302, datum := { row := ⟨10, {0, 3, 4, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4, 5}⟩ } },
  -- compact 12522; core 41359; terminal 2613303
  { outputClauseIndex := 12522, coreClauseIndex := 41359, terminalClauseIndex := 2613303, datum := { row := ⟨10, {0, 3, 4, 9}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12523; core 41364; terminal 2613310
  { outputClauseIndex := 12523, coreClauseIndex := 41364, terminalClauseIndex := 2613310, datum := { row := ⟨10, {0, 3, 5, 6}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12525; core 41370; terminal 2613316
  { outputClauseIndex := 12525, coreClauseIndex := 41370, terminalClauseIndex := 2613316, datum := { row := ⟨10, {0, 3, 5, 7}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12526; core 41371; terminal 2613317
  { outputClauseIndex := 12526, coreClauseIndex := 41371, terminalClauseIndex := 2613317, datum := { row := ⟨10, {0, 3, 5, 7}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12528; core 41377; terminal 2613323
  { outputClauseIndex := 12528, coreClauseIndex := 41377, terminalClauseIndex := 2613323, datum := { row := ⟨10, {0, 3, 5, 8}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12529; core 41378; terminal 2613324
  { outputClauseIndex := 12529, coreClauseIndex := 41378, terminalClauseIndex := 2613324, datum := { row := ⟨10, {0, 3, 5, 8}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12531; core 41384; terminal 2613330
  { outputClauseIndex := 12531, coreClauseIndex := 41384, terminalClauseIndex := 2613330, datum := { row := ⟨10, {0, 3, 5, 9}⟩, arc := ⟨10, .left, {1, 2, 3, 4}⟩ } },
  -- compact 12532; core 41385; terminal 2613331
  { outputClauseIndex := 12532, coreClauseIndex := 41385, terminalClauseIndex := 2613331, datum := { row := ⟨10, {0, 3, 5, 9}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12534; core 41391; terminal 2613337
  { outputClauseIndex := 12534, coreClauseIndex := 41391, terminalClauseIndex := 2613337, datum := { row := ⟨10, {0, 3, 6, 7}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12535; core 41392; terminal 2613338
  { outputClauseIndex := 12535, coreClauseIndex := 41392, terminalClauseIndex := 2613338, datum := { row := ⟨10, {0, 3, 6, 7}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12537; core 41398; terminal 2613344
  { outputClauseIndex := 12537, coreClauseIndex := 41398, terminalClauseIndex := 2613344, datum := { row := ⟨10, {0, 3, 6, 8}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12538; core 41399; terminal 2613345
  { outputClauseIndex := 12538, coreClauseIndex := 41399, terminalClauseIndex := 2613345, datum := { row := ⟨10, {0, 3, 6, 8}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12540; core 41405; terminal 2613351
  { outputClauseIndex := 12540, coreClauseIndex := 41405, terminalClauseIndex := 2613351, datum := { row := ⟨10, {0, 3, 6, 9}⟩, arc := ⟨10, .left, {1, 2, 3}⟩ } },
  -- compact 12541; core 41406; terminal 2613352
  { outputClauseIndex := 12541, coreClauseIndex := 41406, terminalClauseIndex := 2613352, datum := { row := ⟨10, {0, 3, 6, 9}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
  -- compact 12542; core 41411; terminal 2613358
  { outputClauseIndex := 12542, coreClauseIndex := 41411, terminalClauseIndex := 2613358, datum := { row := ⟨10, {0, 3, 7, 8}⟩, arc := ⟨10, .left, {1, 2}⟩ } },
  -- compact 12543; core 41412; terminal 2613359
  { outputClauseIndex := 12543, coreClauseIndex := 41412, terminalClauseIndex := 2613359, datum := { row := ⟨10, {0, 3, 7, 8}⟩, arc := ⟨10, .right, {8, 9, 10}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk022_batch_valid :
    directRowArcFiniteOccurrencesChunk022.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk022, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk022 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk022.map (·.datum)

theorem directRowArcFiniteDataChunk022_batch_valid :
    directRowArcFiniteDataChunk022.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk022, datum.Valid := by
  rw [directRowArcFiniteDataChunk022]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk022_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk022_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
