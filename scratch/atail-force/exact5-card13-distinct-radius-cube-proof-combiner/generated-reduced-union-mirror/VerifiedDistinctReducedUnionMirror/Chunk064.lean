import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk064Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1114, bvar 1115, bvar 178, bvar 179]),
    bnot (bands [bvar 1114, bvar 1116, bvar 178, bvar 180]),
    bnot (bands [bvar 1114, bvar 1117, bvar 178, bvar 181]),
    bnot (bands [bvar 1115, bvar 1116, bvar 179, bvar 180]),
    bnot (bands [bvar 1115, bvar 1117, bvar 179, bvar 181]),
    bnot (bands [bvar 1116, bvar 1117, bvar 180, bvar 181]),
    atMost [bands [bvar 93, bvar 1185], bands [bvar 94, bvar 1186], bands [bvar 95, bvar 1187], bands [bvar 96, bvar 1188], bands [bvar 97, bvar 1189], bands [bvar 98, bvar 1190], bands [bvar 99, bvar 1191], bands [bvar 100, bvar 1192], bands [bvar 101, bvar 1193], bands [bvar 102, bvar 1194], bands [bvar 103, bvar 1195], bands [bvar 104, bvar 1196], bands [bvar 105, bvar 1197]] 2,
    bnot (bands [bvar 93, bvar 94, bvar 1185, bvar 1186]),
    bnot (bands [bvar 93, bvar 97, bvar 1185, bvar 1189]),
    bnot (bands [bvar 93, bvar 105, bvar 1185, bvar 1197]),
    bnot (bands [bvar 94, bvar 97, bvar 1186, bvar 1189]),
    bnot (bands [bvar 94, bvar 105, bvar 1186, bvar 1197]),
    bnot (bands [bvar 95, bvar 97, bvar 1187, bvar 1189]),
    bnot (bands [bvar 95, bvar 105, bvar 1187, bvar 1197]),
    bnot (bands [bvar 96, bvar 97, bvar 1188, bvar 1189]),
    bnot (bands [bvar 96, bvar 105, bvar 1188, bvar 1197]),
    bnot (bands [bvar 97, bvar 105, bvar 1189, bvar 1197]),
    bnot (bands [bvar 99, bvar 100, bvar 1191, bvar 1192]),
    bnot (bands [bvar 99, bvar 101, bvar 1191, bvar 1193]),
    bnot (bands [bvar 99, bvar 102, bvar 1191, bvar 1194]),
    bnot (bands [bvar 99, bvar 103, bvar 1191, bvar 1195]),
    bnot (bands [bvar 100, bvar 101, bvar 1192, bvar 1193]),
    bnot (bands [bvar 100, bvar 102, bvar 1192, bvar 1194]),
    bnot (bands [bvar 100, bvar 103, bvar 1192, bvar 1195]),
    bnot (bands [bvar 101, bvar 102, bvar 1193, bvar 1194]),
    bnot (bands [bvar 101, bvar 103, bvar 1193, bvar 1195]),
    bnot (bands [bvar 102, bvar 103, bvar 1194, bvar 1195]),
    bnot (bands [bvar 101, bvar 103, bvar 1206, bvar 1208]),
    bnot (bands [bvar 1120, bvar 1132, bvar 119, bvar 131]),
    bnot (bands [bvar 107, bvar 115, bvar 1134, bvar 1142]),
    bnot (bands [bvar 108, bvar 110, bvar 1135, bvar 1137]),
    bnot (bands [bvar 108, bvar 111, bvar 1135, bvar 1138]),
    bnot (bands [bvar 108, bvar 115, bvar 1135, bvar 1142]),
    bnot (bands [bvar 108, bvar 116, bvar 1135, bvar 1143]),
    bnot (bands [bvar 108, bvar 117, bvar 1135, bvar 1144]),
    bnot (bands [bvar 109, bvar 110, bvar 1136, bvar 1137]),
    bnot (bands [bvar 109, bvar 111, bvar 1136, bvar 1138]),
    bnot (bands [bvar 109, bvar 115, bvar 1136, bvar 1142]),
    bnot (bands [bvar 109, bvar 116, bvar 1136, bvar 1143]),
    bnot (bands [bvar 109, bvar 118, bvar 1136, bvar 1145]),
    bnot (bands [bvar 110, bvar 111, bvar 1137, bvar 1138]),
    bnot (bands [bvar 110, bvar 115, bvar 1137, bvar 1142]),
    bnot (bands [bvar 110, bvar 116, bvar 1137, bvar 1143]),
    bnot (bands [bvar 110, bvar 117, bvar 1137, bvar 1144]),
    bnot (bands [bvar 111, bvar 115, bvar 1138, bvar 1142]),
    bnot (bands [bvar 111, bvar 116, bvar 1138, bvar 1143]),
    bnot (bands [bvar 111, bvar 117, bvar 1138, bvar 1144]),
    bnot (bands [bvar 111, bvar 118, bvar 1138, bvar 1145]),
    bnot (bands [bvar 115, bvar 116, bvar 1142, bvar 1143]),
    atMost [bands [bvar 1120, bvar 132], bands [bvar 1121, bvar 133], bands [bvar 1122, bvar 134], bands [bvar 1123, bvar 135], bands [bvar 1124, bvar 136], bands [bvar 1125, bvar 137], bands [bvar 1126, bvar 138], bands [bvar 1127, bvar 139], bands [bvar 1128, bvar 140], bands [bvar 1129, bvar 141], bands [bvar 1130, bvar 142], bands [bvar 1131, bvar 143], bands [bvar 1132, bvar 144]] 2,
    bnot (bands [bvar 1120, bvar 1123, bvar 132, bvar 135]),
    bnot (bands [bvar 1120, bvar 1124, bvar 132, bvar 136]),
    bnot (bands [bvar 1120, bvar 1125, bvar 132, bvar 137]),
    bnot (bands [bvar 1120, bvar 1129, bvar 132, bvar 141]),
    bnot (bands [bvar 1120, bvar 1131, bvar 132, bvar 143]),
    bnot (bands [bvar 1120, bvar 1132, bvar 132, bvar 144]),
    bnot (bands [bvar 1123, bvar 1124, bvar 135, bvar 136]),
    bnot (bands [bvar 1123, bvar 1125, bvar 135, bvar 137]),
    bnot (bands [bvar 1123, bvar 1129, bvar 135, bvar 141]),
    bnot (bands [bvar 1123, bvar 1130, bvar 135, bvar 142]),
    bnot (bands [bvar 1123, bvar 1131, bvar 135, bvar 143]),
    bnot (bands [bvar 1123, bvar 1132, bvar 135, bvar 144]),
    bnot (bands [bvar 1124, bvar 1129, bvar 136, bvar 141]),
    bnot (bands [bvar 1124, bvar 1130, bvar 136, bvar 142]) ]

def reducedUnionChunk064 : BVLogicalExpr :=
  bands reducedUnionChunk064Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
