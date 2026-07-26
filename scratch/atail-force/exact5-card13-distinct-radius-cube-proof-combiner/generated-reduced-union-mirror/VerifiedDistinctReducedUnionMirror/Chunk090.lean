import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk090Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 614, bvar 623, bvar 1160, bvar 1169]),
    bnot (bands [bvar 614, bvar 624, bvar 1160, bvar 1170]),
    bnot (bands [bvar 614, bvar 625, bvar 1160, bvar 1171]),
    bnot (bands [bvar 615, bvar 617, bvar 1161, bvar 1163]),
    bnot (bands [bvar 615, bvar 623, bvar 1161, bvar 1169]),
    bnot (bands [bvar 615, bvar 624, bvar 1161, bvar 1170]),
    bnot (bands [bvar 615, bvar 625, bvar 1161, bvar 1171]),
    bnot (bands [bvar 616, bvar 617, bvar 1162, bvar 1163]),
    bnot (bands [bvar 616, bvar 618, bvar 1162, bvar 1164]),
    bnot (bands [bvar 616, bvar 623, bvar 1162, bvar 1169]),
    bnot (bands [bvar 616, bvar 624, bvar 1162, bvar 1170]),
    bnot (bands [bvar 616, bvar 625, bvar 1162, bvar 1171]),
    bnot (bands [bvar 617, bvar 618, bvar 1163, bvar 1164]),
    bnot (bands [bvar 617, bvar 623, bvar 1163, bvar 1169]),
    bnot (bands [bvar 617, bvar 624, bvar 1163, bvar 1170]),
    bnot (bands [bvar 617, bvar 625, bvar 1163, bvar 1171]),
    bnot (bands [bvar 618, bvar 623, bvar 1164, bvar 1169]),
    bnot (bands [bvar 618, bvar 624, bvar 1164, bvar 1170]),
    bnot (bands [bvar 618, bvar 625, bvar 1164, bvar 1171]),
    bnot (bands [bvar 620, bvar 621, bvar 1166, bvar 1167]),
    bnot (bands [bvar 623, bvar 624, bvar 1169, bvar 1170]),
    bnot (bands [bvar 623, bvar 625, bvar 1169, bvar 1171]),
    bnot (bands [bvar 624, bvar 625, bvar 1170, bvar 1171]),
    bnot (bands [bvar 1121, bvar 1124, bvar 666, bvar 669]),
    bnot (bands [bvar 1122, bvar 1124, bvar 667, bvar 669]),
    bnot (bands [bvar 1123, bvar 1124, bvar 668, bvar 669]),
    bnot (bands [bvar 1124, bvar 1125, bvar 669, bvar 670]),
    bnot (bands [bvar 1124, bvar 1131, bvar 669, bvar 676]),
    bnot (bands [bvar 1124, bvar 1132, bvar 669, bvar 677]),
    bnot (bands [bvar 1127, bvar 1128, bvar 672, bvar 673]),
    bnot (bands [bvar 613, bvar 614, bvar 1172, bvar 1173]),
    bnot (bands [bvar 613, bvar 617, bvar 1172, bvar 1176]),
    bnot (bands [bvar 613, bvar 624, bvar 1172, bvar 1183]),
    bnot (bands [bvar 613, bvar 625, bvar 1172, bvar 1184]),
    bnot (bands [bvar 615, bvar 617, bvar 1174, bvar 1176]),
    bnot (bands [bvar 615, bvar 624, bvar 1174, bvar 1183]),
    bnot (bands [bvar 616, bvar 617, bvar 1175, bvar 1176]),
    bnot (bands [bvar 616, bvar 624, bvar 1175, bvar 1183]),
    bnot (bands [bvar 617, bvar 624, bvar 1176, bvar 1183]),
    bnot (bands [bvar 617, bvar 625, bvar 1176, bvar 1184]),
    bnot (bands [bvar 618, bvar 624, bvar 1177, bvar 1183]),
    bnot (bands [bvar 620, bvar 621, bvar 1179, bvar 1180]),
    bnot (bands [bvar 624, bvar 625, bvar 1183, bvar 1184]),
    bnot (bands [bvar 1120, bvar 1121, bvar 678, bvar 679]),
    bnot (bands [bvar 1120, bvar 1122, bvar 678, bvar 680]),
    bnot (bands [bvar 1120, bvar 1124, bvar 678, bvar 682]),
    bnot (bands [bvar 1121, bvar 1124, bvar 679, bvar 682]),
    bnot (bands [bvar 1121, bvar 1132, bvar 679, bvar 690]),
    bnot (bands [bvar 1122, bvar 1124, bvar 680, bvar 682]),
    bnot (bands [bvar 1122, bvar 1132, bvar 680, bvar 690]),
    bnot (bands [bvar 1123, bvar 1124, bvar 681, bvar 682]),
    bnot (bands [bvar 1123, bvar 1132, bvar 681, bvar 690]),
    bnot (bands [bvar 1124, bvar 1125, bvar 682, bvar 683]),
    bnot (bands [bvar 1124, bvar 1132, bvar 682, bvar 690]),
    bnot (bands [bvar 1125, bvar 1132, bvar 683, bvar 690]),
    bnot (bands [bvar 1127, bvar 1128, bvar 685, bvar 686]),
    bnot (bands [bvar 1127, bvar 1129, bvar 685, bvar 687]),
    bnot (bands [bvar 1127, bvar 1130, bvar 685, bvar 688]),
    bnot (bands [bvar 1128, bvar 1129, bvar 686, bvar 687]),
    bnot (bands [bvar 1128, bvar 1130, bvar 686, bvar 688]),
    bnot (bands [bvar 1129, bvar 1130, bvar 687, bvar 688]),
    bnot (bands [bvar 613, bvar 614, bvar 1185, bvar 1186]),
    bnot (bands [bvar 613, bvar 617, bvar 1185, bvar 1189]),
    bnot (bands [bvar 614, bvar 618, bvar 1186, bvar 1190]) ]

def reducedUnionChunk090 : BVLogicalExpr :=
  bands reducedUnionChunk090Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
