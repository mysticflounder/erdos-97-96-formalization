import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk133Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 2, bvar 9, bvar 1135, bvar 1142]),
    bnot (bands [bvar 2, bvar 10, bvar 1135, bvar 1143]),
    bnot (bands [bvar 2, bvar 12, bvar 1135, bvar 1145]),
    bnot (bands [bvar 3, bvar 8, bvar 1136, bvar 1141]),
    bnot (bands [bvar 3, bvar 9, bvar 1136, bvar 1142]),
    bnot (bands [bvar 3, bvar 10, bvar 1136, bvar 1143]),
    bnot (bands [bvar 3, bvar 11, bvar 1136, bvar 1144]),
    bnot (bands [bvar 3, bvar 12, bvar 1136, bvar 1145]),
    bnot (bands [bvar 8, bvar 9, bvar 1141, bvar 1142]),
    bnot (bands [bvar 8, bvar 10, bvar 1141, bvar 1143]),
    bnot (bands [bvar 8, bvar 11, bvar 1141, bvar 1144]),
    bnot (bands [bvar 8, bvar 12, bvar 1141, bvar 1145]),
    bnot (bands [bvar 9, bvar 10, bvar 1142, bvar 1143]),
    bnot (bands [bvar 9, bvar 11, bvar 1142, bvar 1144]),
    bnot (bands [bvar 9, bvar 12, bvar 1142, bvar 1145]),
    bnot (bands [bvar 10, bvar 11, bvar 1143, bvar 1144]),
    bnot (bands [bvar 10, bvar 12, bvar 1143, bvar 1145]),
    bnot (bands [bvar 11, bvar 12, bvar 1144, bvar 1145]),
    bnot (bands [bvar 0, bvar 10, bvar 1159, bvar 1169]),
    bnot (bands [bvar 0, bvar 11, bvar 1159, bvar 1170]),
    bnot (bands [bvar 0, bvar 12, bvar 1159, bvar 1171]),
    bnot (bands [bvar 1, bvar 10, bvar 1160, bvar 1169]),
    bnot (bands [bvar 1, bvar 11, bvar 1160, bvar 1170]),
    bnot (bands [bvar 1, bvar 12, bvar 1160, bvar 1171]),
    bnot (bands [bvar 2, bvar 10, bvar 1161, bvar 1169]),
    bnot (bands [bvar 2, bvar 11, bvar 1161, bvar 1170]),
    bnot (bands [bvar 2, bvar 12, bvar 1161, bvar 1171]),
    bnot (bands [bvar 3, bvar 10, bvar 1162, bvar 1169]),
    bnot (bands [bvar 3, bvar 11, bvar 1162, bvar 1170]),
    bnot (bands [bvar 3, bvar 12, bvar 1162, bvar 1171]),
    bnot (bands [bvar 5, bvar 7, bvar 1164, bvar 1166]),
    bnot (bands [bvar 10, bvar 12, bvar 1169, bvar 1171]),
    bnot (bands [bvar 11, bvar 12, bvar 1170, bvar 1171]),
    bnot (bands [bvar 0, bvar 12, bvar 1172, bvar 1184]),
    bnot (bands [bvar 1, bvar 11, bvar 1173, bvar 1183]),
    bnot (bands [bvar 1, bvar 12, bvar 1173, bvar 1184]),
    bnot (bands [bvar 2, bvar 12, bvar 1174, bvar 1184]),
    bnot (bands [bvar 3, bvar 12, bvar 1175, bvar 1184]),
    bnot (bands [bvar 5, bvar 9, bvar 1177, bvar 1181]),
    bnot (bands [bvar 6, bvar 9, bvar 1178, bvar 1181]),
    bnot (bands [bvar 7, bvar 9, bvar 1179, bvar 1181]),
    bnot (bands [bvar 8, bvar 9, bvar 1180, bvar 1181]),
    bnot (bands [bvar 11, bvar 12, bvar 1183, bvar 1184]),
    bnot (bands [bvar 0, bvar 12, bvar 1185, bvar 1197]),
    bnot (bands [bvar 2, bvar 12, bvar 1187, bvar 1197]),
    bnot (bands [bvar 5, bvar 9, bvar 1190, bvar 1194]),
    bnot (bands [bvar 5, bvar 10, bvar 1190, bvar 1195]),
    bnot (bands [bvar 6, bvar 9, bvar 1191, bvar 1194]),
    bnot (bands [bvar 6, bvar 10, bvar 1191, bvar 1195]),
    bnot (bands [bvar 7, bvar 8, bvar 1192, bvar 1193]),
    bnot (bands [bvar 7, bvar 9, bvar 1192, bvar 1194]),
    bnot (bands [bvar 7, bvar 10, bvar 1192, bvar 1195]),
    bnot (bands [bvar 8, bvar 9, bvar 1193, bvar 1194]),
    bnot (bands [bvar 8, bvar 10, bvar 1193, bvar 1195]),
    bnot (bands [bvar 9, bvar 10, bvar 1194, bvar 1195]),
    bnot (bands [bvar 5, bvar 10, bvar 1203, bvar 1208]),
    bnot (bands [bvar 5, bvar 11, bvar 1203, bvar 1209]),
    bnot (bands [bvar 6, bvar 9, bvar 1204, bvar 1207]),
    bnot (bands [bvar 6, bvar 10, bvar 1204, bvar 1208]),
    bnot (bands [bvar 8, bvar 10, bvar 1206, bvar 1208]),
    bnot (bands [bvar 9, bvar 11, bvar 1207, bvar 1209]),
    bnot (bands [bvar 10, bvar 11, bvar 1208, bvar 1209]),
    bnot (bands [bvar 0, bvar 10, bvar 1107, bvar 1117]),
    bnot (bands [bvar 0, bvar 11, bvar 1107, bvar 1118]) ]

def reducedUnionChunk133 : BVLogicalExpr :=
  bands reducedUnionChunk133Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
