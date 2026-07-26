import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk088Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 600, bvar 604, bvar 1172, bvar 1176]),
    bnot (bands [bvar 601, bvar 612, bvar 1173, bvar 1184]),
    bnot (bands [bvar 602, bvar 604, bvar 1174, bvar 1176]),
    bnot (bands [bvar 602, bvar 612, bvar 1174, bvar 1184]),
    bnot (bands [bvar 603, bvar 604, bvar 1175, bvar 1176]),
    bnot (bands [bvar 603, bvar 611, bvar 1175, bvar 1183]),
    bnot (bands [bvar 604, bvar 612, bvar 1176, bvar 1184]),
    bnot (bands [bvar 607, bvar 609, bvar 1179, bvar 1181]),
    bnot (bands [bvar 611, bvar 612, bvar 1183, bvar 1184]),
    atMost [bands [bvar 1107, bvar 678], bands [bvar 1108, bvar 679], bands [bvar 1109, bvar 680], bands [bvar 1110, bvar 681], bands [bvar 1111, bvar 682], bands [bvar 1112, bvar 683], bands [bvar 1113, bvar 684], bands [bvar 1114, bvar 685], bands [bvar 1115, bvar 686], bands [bvar 1116, bvar 687], bands [bvar 1117, bvar 688], bands [bvar 1118, bvar 689], bands [bvar 1119, bvar 690]] 2,
    bnot (bands [bvar 1107, bvar 1111, bvar 678, bvar 682]),
    bnot (bands [bvar 1110, bvar 1111, bvar 681, bvar 682]),
    bnot (bands [bvar 1111, bvar 1119, bvar 682, bvar 690]),
    bnot (bands [bvar 1113, bvar 1114, bvar 684, bvar 685]),
    bnot (bands [bvar 1113, bvar 1115, bvar 684, bvar 686]),
    bnot (bands [bvar 1113, bvar 1116, bvar 684, bvar 687]),
    bnot (bands [bvar 1113, bvar 1117, bvar 684, bvar 688]),
    bnot (bands [bvar 1114, bvar 1115, bvar 685, bvar 686]),
    bnot (bands [bvar 1114, bvar 1116, bvar 685, bvar 687]),
    bnot (bands [bvar 1114, bvar 1117, bvar 685, bvar 688]),
    bnot (bands [bvar 1115, bvar 1116, bvar 686, bvar 687]),
    bnot (bands [bvar 1115, bvar 1117, bvar 686, bvar 688]),
    bnot (bands [bvar 1116, bvar 1117, bvar 687, bvar 688]),
    atMost [bands [bvar 600, bvar 1185], bands [bvar 601, bvar 1186], bands [bvar 602, bvar 1187], bands [bvar 603, bvar 1188], bands [bvar 604, bvar 1189], bands [bvar 605, bvar 1190], bands [bvar 606, bvar 1191], bands [bvar 607, bvar 1192], bands [bvar 608, bvar 1193], bands [bvar 609, bvar 1194], bands [bvar 610, bvar 1195], bands [bvar 611, bvar 1196], bands [bvar 612, bvar 1197]] 2,
    bnot (bands [bvar 600, bvar 602, bvar 1185, bvar 1187]),
    bnot (bands [bvar 600, bvar 604, bvar 1185, bvar 1189]),
    bnot (bands [bvar 600, bvar 612, bvar 1185, bvar 1197]),
    bnot (bands [bvar 601, bvar 604, bvar 1186, bvar 1189]),
    bnot (bands [bvar 602, bvar 604, bvar 1187, bvar 1189]),
    bnot (bands [bvar 603, bvar 604, bvar 1188, bvar 1189]),
    bnot (bands [bvar 603, bvar 612, bvar 1188, bvar 1197]),
    bnot (bands [bvar 604, bvar 612, bvar 1189, bvar 1197]),
    bnot (bands [bvar 606, bvar 607, bvar 1191, bvar 1192]),
    bnot (bands [bvar 606, bvar 608, bvar 1191, bvar 1193]),
    bnot (bands [bvar 606, bvar 609, bvar 1191, bvar 1194]),
    bnot (bands [bvar 606, bvar 610, bvar 1191, bvar 1195]),
    bnot (bands [bvar 607, bvar 608, bvar 1192, bvar 1193]),
    bnot (bands [bvar 607, bvar 609, bvar 1192, bvar 1194]),
    bnot (bands [bvar 607, bvar 610, bvar 1192, bvar 1195]),
    bnot (bands [bvar 608, bvar 609, bvar 1193, bvar 1194]),
    bnot (bands [bvar 608, bvar 610, bvar 1193, bvar 1195]),
    bnot (bands [bvar 609, bvar 610, bvar 1194, bvar 1195]),
    bnot (bands [bvar 603, bvar 604, bvar 1201, bvar 1202]),
    bnot (bands [bvar 607, bvar 609, bvar 1205, bvar 1207]),
    bnot (bands [bvar 608, bvar 609, bvar 1206, bvar 1207]),
    bnot (bands [bvar 1121, bvar 1124, bvar 627, bvar 630]),
    bnot (bands [bvar 1122, bvar 1125, bvar 628, bvar 631]),
    bnot (bands [bvar 1123, bvar 1124, bvar 629, bvar 630]),
    bnot (bands [bvar 1123, bvar 1125, bvar 629, bvar 631]),
    bnot (bands [bvar 1123, bvar 1128, bvar 629, bvar 634]),
    bnot (bands [bvar 1123, bvar 1130, bvar 629, bvar 636]),
    bnot (bands [bvar 1123, bvar 1132, bvar 629, bvar 638]),
    bnot (bands [bvar 1124, bvar 1128, bvar 630, bvar 634]),
    bnot (bands [bvar 1124, bvar 1130, bvar 630, bvar 636]),
    bnot (bands [bvar 1124, bvar 1131, bvar 630, bvar 637]),
    bnot (bands [bvar 1124, bvar 1132, bvar 630, bvar 638]),
    bnot (bands [bvar 1125, bvar 1129, bvar 631, bvar 635]),
    bnot (bands [bvar 1125, bvar 1130, bvar 631, bvar 636]),
    bnot (bands [bvar 1125, bvar 1131, bvar 631, bvar 637]),
    bnot (bands [bvar 1125, bvar 1132, bvar 631, bvar 638]),
    bnot (bands [bvar 1129, bvar 1130, bvar 635, bvar 636]),
    bnot (bands [bvar 1129, bvar 1132, bvar 635, bvar 638]),
    bnot (bands [bvar 1130, bvar 1132, bvar 636, bvar 638]),
    bnot (bands [bvar 1131, bvar 1132, bvar 637, bvar 638]) ]

def reducedUnionChunk088 : BVLogicalExpr :=
  bands reducedUnionChunk088Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
