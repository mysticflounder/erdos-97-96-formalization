import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk057Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 63, bvar 66, bvar 1103, bvar 1106]),
    bnot (bands [bvar 64, bvar 65, bvar 1104, bvar 1105]),
    bnot (bands [bvar 64, bvar 66, bvar 1104, bvar 1106]),
    bnot (bands [bvar 65, bvar 66, bvar 1105, bvar 1106]),
    bnot (bands [bvar 55, bvar 60, bvar 1108, bvar 1113]),
    bnot (bands [bvar 55, bvar 62, bvar 1108, bvar 1115]),
    bnot (bands [bvar 55, bvar 63, bvar 1108, bvar 1116]),
    bnot (bands [bvar 55, bvar 64, bvar 1108, bvar 1117]),
    bnot (bands [bvar 55, bvar 65, bvar 1108, bvar 1118]),
    bnot (bands [bvar 55, bvar 66, bvar 1108, bvar 1119]),
    bnot (bands [bvar 60, bvar 62, bvar 1113, bvar 1115]),
    bnot (bands [bvar 60, bvar 66, bvar 1113, bvar 1119]),
    bnot (bands [bvar 62, bvar 63, bvar 1115, bvar 1116]),
    bnot (bands [bvar 62, bvar 64, bvar 1115, bvar 1117]),
    bnot (bands [bvar 62, bvar 65, bvar 1115, bvar 1118]),
    bnot (bands [bvar 65, bvar 66, bvar 1118, bvar 1119]),
    bnot (bands [bvar 55, bvar 61, bvar 1121, bvar 1127]),
    bnot (bands [bvar 55, bvar 62, bvar 1121, bvar 1128]),
    bnot (bands [bvar 55, bvar 63, bvar 1121, bvar 1129]),
    bnot (bands [bvar 55, bvar 64, bvar 1121, bvar 1130]),
    bnot (bands [bvar 55, bvar 65, bvar 1121, bvar 1131]),
    bnot (bands [bvar 55, bvar 66, bvar 1121, bvar 1132]),
    bnot (bands [bvar 57, bvar 59, bvar 1123, bvar 1125]),
    bnot (bands [bvar 61, bvar 62, bvar 1127, bvar 1128]),
    bnot (bands [bvar 61, bvar 63, bvar 1127, bvar 1129]),
    bnot (bands [bvar 61, bvar 64, bvar 1127, bvar 1130]),
    bnot (bands [bvar 62, bvar 63, bvar 1128, bvar 1129]),
    bnot (bands [bvar 62, bvar 65, bvar 1128, bvar 1131]),
    bnot (bands [bvar 62, bvar 66, bvar 1128, bvar 1132]),
    bnot (bands [bvar 63, bvar 65, bvar 1129, bvar 1131]),
    bnot (bands [bvar 64, bvar 66, bvar 1130, bvar 1132]),
    bnot (bands [bvar 55, bvar 62, bvar 1134, bvar 1141]),
    bnot (bands [bvar 55, bvar 63, bvar 1134, bvar 1142]),
    bnot (bands [bvar 55, bvar 64, bvar 1134, bvar 1143]),
    bnot (bands [bvar 55, bvar 65, bvar 1134, bvar 1144]),
    bnot (bands [bvar 55, bvar 66, bvar 1134, bvar 1145]),
    bnot (bands [bvar 57, bvar 59, bvar 1136, bvar 1138]),
    bnot (bands [bvar 57, bvar 60, bvar 1136, bvar 1139]),
    bnot (bands [bvar 62, bvar 63, bvar 1141, bvar 1142]),
    bnot (bands [bvar 62, bvar 64, bvar 1141, bvar 1143]),
    bnot (bands [bvar 62, bvar 65, bvar 1141, bvar 1144]),
    bnot (bands [bvar 62, bvar 66, bvar 1141, bvar 1145]),
    bnot (bands [bvar 63, bvar 64, bvar 1142, bvar 1143]),
    bnot (bands [bvar 63, bvar 66, bvar 1142, bvar 1145]),
    bnot (bands [bvar 64, bvar 65, bvar 1143, bvar 1144]),
    bnot (bands [bvar 55, bvar 64, bvar 1160, bvar 1169]),
    bnot (bands [bvar 55, bvar 65, bvar 1160, bvar 1170]),
    bnot (bands [bvar 55, bvar 66, bvar 1160, bvar 1171]),
    bnot (bands [bvar 57, bvar 59, bvar 1162, bvar 1164]),
    bnot (bands [bvar 57, bvar 60, bvar 1162, bvar 1165]),
    bnot (bands [bvar 57, bvar 61, bvar 1162, bvar 1166]),
    bnot (bands [bvar 57, bvar 62, bvar 1162, bvar 1167]),
    bnot (bands [bvar 64, bvar 66, bvar 1169, bvar 1171]),
    bnot (bands [bvar 55, bvar 65, bvar 1173, bvar 1183]),
    bnot (bands [bvar 55, bvar 66, bvar 1173, bvar 1184]),
    bnot (bands [bvar 57, bvar 59, bvar 1175, bvar 1177]),
    bnot (bands [bvar 57, bvar 60, bvar 1175, bvar 1178]),
    bnot (bands [bvar 57, bvar 61, bvar 1175, bvar 1179]),
    bnot (bands [bvar 57, bvar 62, bvar 1175, bvar 1180]),
    bnot (bands [bvar 57, bvar 63, bvar 1175, bvar 1181]),
    bnot (bands [bvar 60, bvar 63, bvar 1178, bvar 1181]),
    bnot (bands [bvar 62, bvar 63, bvar 1180, bvar 1181]),
    bnot (bands [bvar 65, bvar 66, bvar 1183, bvar 1184]),
    bnot (bands [bvar 55, bvar 66, bvar 1186, bvar 1197]) ]

def reducedUnionChunk057 : BVLogicalExpr :=
  bands reducedUnionChunk057Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
