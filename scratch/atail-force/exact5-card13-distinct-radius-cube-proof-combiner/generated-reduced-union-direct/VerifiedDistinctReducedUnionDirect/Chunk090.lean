import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk090Assertions : List BVLogicalExpr :=
  [ atMost [bands [bvar 1120, bvar 665], bands [bvar 1121, bvar 666], bands [bvar 1122, bvar 667], bands [bvar 1123, bvar 668], bands [bvar 1124, bvar 669], bands [bvar 1125, bvar 670], bands [bvar 1126, bvar 671], bands [bvar 1127, bvar 672], bands [bvar 1128, bvar 673], bands [bvar 1129, bvar 674], bands [bvar 1130, bvar 675], bands [bvar 1131, bvar 676], bands [bvar 1132, bvar 677]] 2,
    bnot (bands [bvar 1120, bvar 1121, bvar 665, bvar 666]),
    bnot (bands [bvar 1120, bvar 1124, bvar 665, bvar 669]),
    bnot (bands [bvar 1120, bvar 1125, bvar 665, bvar 670]),
    bnot (bands [bvar 1120, bvar 1132, bvar 665, bvar 677]),
    bnot (bands [bvar 1121, bvar 1124, bvar 666, bvar 669]),
    bnot (bands [bvar 1121, bvar 1125, bvar 666, bvar 670]),
    bnot (bands [bvar 1121, bvar 1132, bvar 666, bvar 677]),
    bnot (bands [bvar 1122, bvar 1124, bvar 667, bvar 669]),
    bnot (bands [bvar 1122, bvar 1125, bvar 667, bvar 670]),
    bnot (bands [bvar 1123, bvar 1124, bvar 668, bvar 669]),
    bnot (bands [bvar 1123, bvar 1125, bvar 668, bvar 670]),
    bnot (bands [bvar 1123, bvar 1132, bvar 668, bvar 677]),
    bnot (bands [bvar 1124, bvar 1125, bvar 669, bvar 670]),
    bnot (bands [bvar 1124, bvar 1131, bvar 669, bvar 676]),
    bnot (bands [bvar 1124, bvar 1132, bvar 669, bvar 677]),
    bnot (bands [bvar 1125, bvar 1131, bvar 670, bvar 676]),
    bnot (bands [bvar 1125, bvar 1132, bvar 670, bvar 677]),
    bnot (bands [bvar 1127, bvar 1128, bvar 672, bvar 673]),
    bnot (bands [bvar 1127, bvar 1129, bvar 672, bvar 674]),
    bnot (bands [bvar 1131, bvar 1132, bvar 676, bvar 677]),
    atMost [bands [bvar 613, bvar 1172], bands [bvar 614, bvar 1173], bands [bvar 615, bvar 1174], bands [bvar 616, bvar 1175], bands [bvar 617, bvar 1176], bands [bvar 618, bvar 1177], bands [bvar 619, bvar 1178], bands [bvar 620, bvar 1179], bands [bvar 621, bvar 1180], bands [bvar 622, bvar 1181], bands [bvar 623, bvar 1182], bands [bvar 624, bvar 1183], bands [bvar 625, bvar 1184]] 2,
    bnot (bands [bvar 613, bvar 614, bvar 1172, bvar 1173]),
    bnot (bands [bvar 613, bvar 615, bvar 1172, bvar 1174]),
    bnot (bands [bvar 613, bvar 616, bvar 1172, bvar 1175]),
    bnot (bands [bvar 613, bvar 617, bvar 1172, bvar 1176]),
    bnot (bands [bvar 613, bvar 618, bvar 1172, bvar 1177]),
    bnot (bands [bvar 613, bvar 624, bvar 1172, bvar 1183]),
    bnot (bands [bvar 613, bvar 625, bvar 1172, bvar 1184]),
    bnot (bands [bvar 614, bvar 617, bvar 1173, bvar 1176]),
    bnot (bands [bvar 614, bvar 618, bvar 1173, bvar 1177]),
    bnot (bands [bvar 614, bvar 624, bvar 1173, bvar 1183]),
    bnot (bands [bvar 614, bvar 625, bvar 1173, bvar 1184]),
    bnot (bands [bvar 615, bvar 617, bvar 1174, bvar 1176]),
    bnot (bands [bvar 615, bvar 618, bvar 1174, bvar 1177]),
    bnot (bands [bvar 615, bvar 624, bvar 1174, bvar 1183]),
    bnot (bands [bvar 616, bvar 617, bvar 1175, bvar 1176]),
    bnot (bands [bvar 616, bvar 618, bvar 1175, bvar 1177]),
    bnot (bands [bvar 616, bvar 624, bvar 1175, bvar 1183]),
    bnot (bands [bvar 616, bvar 625, bvar 1175, bvar 1184]),
    bnot (bands [bvar 617, bvar 618, bvar 1176, bvar 1177]),
    bnot (bands [bvar 617, bvar 624, bvar 1176, bvar 1183]),
    bnot (bands [bvar 617, bvar 625, bvar 1176, bvar 1184]),
    bnot (bands [bvar 618, bvar 624, bvar 1177, bvar 1183]),
    bnot (bands [bvar 618, bvar 625, bvar 1177, bvar 1184]),
    bnot (bands [bvar 620, bvar 621, bvar 1179, bvar 1180]),
    bnot (bands [bvar 620, bvar 622, bvar 1179, bvar 1181]),
    bnot (bands [bvar 624, bvar 625, bvar 1183, bvar 1184]),
    atMost [bands [bvar 1120, bvar 678], bands [bvar 1121, bvar 679], bands [bvar 1122, bvar 680], bands [bvar 1123, bvar 681], bands [bvar 1124, bvar 682], bands [bvar 1125, bvar 683], bands [bvar 1126, bvar 684], bands [bvar 1127, bvar 685], bands [bvar 1128, bvar 686], bands [bvar 1129, bvar 687], bands [bvar 1130, bvar 688], bands [bvar 1131, bvar 689], bands [bvar 1132, bvar 690]] 2,
    bnot (bands [bvar 1120, bvar 1124, bvar 678, bvar 682]),
    bnot (bands [bvar 1121, bvar 1124, bvar 679, bvar 682]),
    bnot (bands [bvar 1121, bvar 1132, bvar 679, bvar 690]),
    bnot (bands [bvar 1122, bvar 1124, bvar 680, bvar 682]),
    bnot (bands [bvar 1122, bvar 1132, bvar 680, bvar 690]),
    bnot (bands [bvar 1123, bvar 1124, bvar 681, bvar 682]),
    bnot (bands [bvar 1124, bvar 1125, bvar 682, bvar 683]),
    bnot (bands [bvar 1124, bvar 1132, bvar 682, bvar 690]),
    bnot (bands [bvar 1125, bvar 1132, bvar 683, bvar 690]),
    bnot (bands [bvar 1127, bvar 1128, bvar 685, bvar 686]),
    bnot (bands [bvar 1127, bvar 1129, bvar 685, bvar 687]),
    bnot (bands [bvar 1127, bvar 1130, bvar 685, bvar 688]),
    bnot (bands [bvar 1128, bvar 1129, bvar 686, bvar 687]),
    bnot (bands [bvar 1128, bvar 1130, bvar 686, bvar 688]),
    bnot (bands [bvar 1129, bvar 1130, bvar 687, bvar 688]) ]

def reducedUnionChunk090 : BVLogicalExpr :=
  bands reducedUnionChunk090Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
