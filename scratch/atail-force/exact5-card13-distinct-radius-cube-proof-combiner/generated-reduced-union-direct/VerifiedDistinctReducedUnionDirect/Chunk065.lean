import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk065Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1118, bvar 1119, bvar 156, bvar 157]),
    bnot (bands [bvar 93, bvar 96, bvar 1159, bvar 1162]),
    bnot (bands [bvar 93, bvar 104, bvar 1159, bvar 1170]),
    bnot (bands [bvar 95, bvar 105, bvar 1161, bvar 1171]),
    bnot (bands [bvar 96, bvar 104, bvar 1162, bvar 1170]),
    bnot (bands [bvar 96, bvar 105, bvar 1162, bvar 1171]),
    bnot (bands [bvar 97, bvar 103, bvar 1163, bvar 1169]),
    bnot (bands [bvar 97, bvar 104, bvar 1163, bvar 1170]),
    bnot (bands [bvar 99, bvar 100, bvar 1165, bvar 1166]),
    bnot (bands [bvar 100, bvar 101, bvar 1166, bvar 1167]),
    bnot (bands [bvar 103, bvar 104, bvar 1169, bvar 1170]),
    bnot (bands [bvar 93, bvar 94, bvar 1172, bvar 1173]),
    bnot (bands [bvar 93, bvar 95, bvar 1172, bvar 1174]),
    bnot (bands [bvar 93, bvar 96, bvar 1172, bvar 1175]),
    bnot (bands [bvar 93, bvar 97, bvar 1172, bvar 1176]),
    bnot (bands [bvar 93, bvar 104, bvar 1172, bvar 1183]),
    bnot (bands [bvar 94, bvar 97, bvar 1173, bvar 1176]),
    bnot (bands [bvar 94, bvar 104, bvar 1173, bvar 1183]),
    bnot (bands [bvar 95, bvar 97, bvar 1174, bvar 1176]),
    bnot (bands [bvar 95, bvar 104, bvar 1174, bvar 1183]),
    bnot (bands [bvar 96, bvar 97, bvar 1175, bvar 1176]),
    bnot (bands [bvar 96, bvar 104, bvar 1175, bvar 1183]),
    bnot (bands [bvar 97, bvar 104, bvar 1176, bvar 1183]),
    bnot (bands [bvar 97, bvar 105, bvar 1176, bvar 1184]),
    bnot (bands [bvar 99, bvar 101, bvar 1178, bvar 1180]),
    bnot (bands [bvar 99, bvar 102, bvar 1178, bvar 1181]),
    bnot (bands [bvar 100, bvar 101, bvar 1179, bvar 1180]),
    bnot (bands [bvar 100, bvar 102, bvar 1179, bvar 1181]),
    bnot (bands [bvar 101, bvar 102, bvar 1180, bvar 1181]),
    bnot (bands [bvar 104, bvar 105, bvar 1183, bvar 1184]),
    atMost [bands [bvar 1107, bvar 171], bands [bvar 1108, bvar 172], bands [bvar 1109, bvar 173], bands [bvar 1110, bvar 174], bands [bvar 1111, bvar 175], bands [bvar 1112, bvar 176], bands [bvar 1113, bvar 177], bands [bvar 1114, bvar 178], bands [bvar 1115, bvar 179], bands [bvar 1116, bvar 180], bands [bvar 1117, bvar 181], bands [bvar 1118, bvar 182], bands [bvar 1119, bvar 183]] 2,
    bnot (bands [bvar 1107, bvar 1108, bvar 171, bvar 172]),
    bnot (bands [bvar 1107, bvar 1111, bvar 171, bvar 175]),
    bnot (bands [bvar 1108, bvar 1111, bvar 172, bvar 175]),
    bnot (bands [bvar 1109, bvar 1111, bvar 173, bvar 175]),
    bnot (bands [bvar 1110, bvar 1111, bvar 174, bvar 175]),
    bnot (bands [bvar 1110, bvar 1119, bvar 174, bvar 183]),
    bnot (bands [bvar 1111, bvar 1119, bvar 175, bvar 183]),
    bnot (bands [bvar 1113, bvar 1114, bvar 177, bvar 178]),
    bnot (bands [bvar 1113, bvar 1115, bvar 177, bvar 179]),
    bnot (bands [bvar 1113, bvar 1116, bvar 177, bvar 180]),
    bnot (bands [bvar 1113, bvar 1117, bvar 177, bvar 181]),
    bnot (bands [bvar 1114, bvar 1115, bvar 178, bvar 179]),
    bnot (bands [bvar 1114, bvar 1116, bvar 178, bvar 180]),
    bnot (bands [bvar 1114, bvar 1117, bvar 178, bvar 181]),
    bnot (bands [bvar 1115, bvar 1116, bvar 179, bvar 180]),
    bnot (bands [bvar 1115, bvar 1117, bvar 179, bvar 181]),
    bnot (bands [bvar 1116, bvar 1117, bvar 180, bvar 181]),
    bnot (bands [bvar 94, bvar 105, bvar 1186, bvar 1197]),
    bnot (bands [bvar 99, bvar 101, bvar 1191, bvar 1193]),
    bnot (bands [bvar 100, bvar 101, bvar 1192, bvar 1193]),
    bnot (bands [bvar 101, bvar 102, bvar 1193, bvar 1194]),
    bnot (bands [bvar 93, bvar 95, bvar 1198, bvar 1200]),
    bnot (bands [bvar 99, bvar 100, bvar 1204, bvar 1205]),
    bnot (bands [bvar 99, bvar 101, bvar 1204, bvar 1206]),
    bnot (bands [bvar 100, bvar 101, bvar 1205, bvar 1206]),
    bnot (bands [bvar 101, bvar 104, bvar 1206, bvar 1209]),
    bnot (bands [bvar 1120, bvar 1132, bvar 119, bvar 131]),
    bnot (bands [bvar 1121, bvar 1129, bvar 120, bvar 128]),
    bnot (bands [bvar 1122, bvar 1129, bvar 121, bvar 128]),
    bnot (bands [bvar 1122, bvar 1132, bvar 121, bvar 131]),
    bnot (bands [bvar 1123, bvar 1124, bvar 122, bvar 123]),
    bnot (bands [bvar 1123, bvar 1125, bvar 122, bvar 124]),
    bnot (bands [bvar 1123, bvar 1128, bvar 122, bvar 127]) ]

def reducedUnionChunk065 : BVLogicalExpr :=
  bands reducedUnionChunk065Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
