import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk011Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1109, bvar 1116, bvar 1122, bvar 1129]),
    bnot (bands [bvar 1109, bvar 1118, bvar 1122, bvar 1131]),
    bnot (bands [bvar 1110, bvar 1111, bvar 1123, bvar 1124]),
    bnot (bands [bvar 1110, bvar 1114, bvar 1123, bvar 1127]),
    bnot (bands [bvar 1110, bvar 1115, bvar 1123, bvar 1128]),
    bnot (bands [bvar 1110, bvar 1116, bvar 1123, bvar 1129]),
    bnot (bands [bvar 1110, bvar 1117, bvar 1123, bvar 1130]),
    bnot (bands [bvar 1110, bvar 1118, bvar 1123, bvar 1131]),
    bnot (bands [bvar 1110, bvar 1119, bvar 1123, bvar 1132]),
    bnot (bands [bvar 1111, bvar 1114, bvar 1124, bvar 1127]),
    bnot (bands [bvar 1111, bvar 1116, bvar 1124, bvar 1129]),
    bnot (bands [bvar 1111, bvar 1117, bvar 1124, bvar 1130]),
    bnot (bands [bvar 1111, bvar 1118, bvar 1124, bvar 1131]),
    bnot (bands [bvar 1111, bvar 1119, bvar 1124, bvar 1132]),
    bnot (bands [bvar 1114, bvar 1115, bvar 1127, bvar 1128]),
    bnot (bands [bvar 1114, bvar 1116, bvar 1127, bvar 1129]),
    bnot (bands [bvar 1114, bvar 1117, bvar 1127, bvar 1130]),
    bnot (bands [bvar 1114, bvar 1118, bvar 1127, bvar 1131]),
    bnot (bands [bvar 1114, bvar 1119, bvar 1127, bvar 1132]),
    bnot (bands [bvar 1115, bvar 1119, bvar 1128, bvar 1132]),
    bnot (bands [bvar 1116, bvar 1117, bvar 1129, bvar 1130]),
    bnot (bands [bvar 1116, bvar 1118, bvar 1129, bvar 1131]),
    bnot (bands [bvar 1117, bvar 1118, bvar 1130, bvar 1131]),
    bnot (bands [bvar 1117, bvar 1119, bvar 1130, bvar 1132]),
    bnot (bands [bvar 1118, bvar 1119, bvar 1131, bvar 1132]),
    bnot (bands [bvar 1107, bvar 1109, bvar 1133, bvar 1135]),
    bnot (bands [bvar 1107, bvar 1110, bvar 1133, bvar 1136]),
    bnot (bands [bvar 1107, bvar 1111, bvar 1133, bvar 1137]),
    bnot (bands [bvar 1107, bvar 1116, bvar 1133, bvar 1142]),
    bnot (bands [bvar 1107, bvar 1117, bvar 1133, bvar 1143]),
    bnot (bands [bvar 1107, bvar 1118, bvar 1133, bvar 1144]),
    bnot (bands [bvar 1107, bvar 1119, bvar 1133, bvar 1145]),
    bnot (bands [bvar 1108, bvar 1111, bvar 1134, bvar 1137]),
    bnot (bands [bvar 1108, bvar 1116, bvar 1134, bvar 1142]),
    bnot (bands [bvar 1108, bvar 1118, bvar 1134, bvar 1144]),
    bnot (bands [bvar 1108, bvar 1119, bvar 1134, bvar 1145]),
    bnot (bands [bvar 1109, bvar 1111, bvar 1135, bvar 1137]),
    bnot (bands [bvar 1109, bvar 1116, bvar 1135, bvar 1142]),
    bnot (bands [bvar 1109, bvar 1118, bvar 1135, bvar 1144]),
    bnot (bands [bvar 1109, bvar 1119, bvar 1135, bvar 1145]),
    bnot (bands [bvar 1110, bvar 1111, bvar 1136, bvar 1137]),
    bnot (bands [bvar 1110, bvar 1115, bvar 1136, bvar 1141]),
    bnot (bands [bvar 1110, bvar 1116, bvar 1136, bvar 1142]),
    bnot (bands [bvar 1110, bvar 1117, bvar 1136, bvar 1143]),
    bnot (bands [bvar 1110, bvar 1118, bvar 1136, bvar 1144]),
    bnot (bands [bvar 1110, bvar 1119, bvar 1136, bvar 1145]),
    bnot (bands [bvar 1111, bvar 1115, bvar 1137, bvar 1141]),
    bnot (bands [bvar 1111, bvar 1116, bvar 1137, bvar 1142]),
    bnot (bands [bvar 1111, bvar 1117, bvar 1137, bvar 1143]),
    bnot (bands [bvar 1111, bvar 1118, bvar 1137, bvar 1144]),
    bnot (bands [bvar 1111, bvar 1119, bvar 1137, bvar 1145]),
    bnot (bands [bvar 1115, bvar 1118, bvar 1141, bvar 1144]),
    bnot (bands [bvar 1115, bvar 1119, bvar 1141, bvar 1145]),
    bnot (bands [bvar 1116, bvar 1117, bvar 1142, bvar 1143]),
    bnot (bands [bvar 1116, bvar 1118, bvar 1142, bvar 1144]),
    bnot (bands [bvar 1116, bvar 1119, bvar 1142, bvar 1145]),
    bnot (bands [bvar 1117, bvar 1118, bvar 1143, bvar 1144]),
    bnot (bands [bvar 1117, bvar 1119, bvar 1143, bvar 1145]),
    bnot (bands [bvar 1118, bvar 1119, bvar 1144, bvar 1145]),
    bnot (bands [bvar 1107, bvar 1108, bvar 1159, bvar 1160]),
    bnot (bands [bvar 1107, bvar 1109, bvar 1159, bvar 1161]),
    bnot (bands [bvar 1107, bvar 1111, bvar 1159, bvar 1163]),
    bnot (bands [bvar 1107, bvar 1117, bvar 1159, bvar 1169]),
    bnot (bands [bvar 1107, bvar 1118, bvar 1159, bvar 1170]) ]

def reducedUnionChunk011 : BVLogicalExpr :=
  bands reducedUnionChunk011Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
