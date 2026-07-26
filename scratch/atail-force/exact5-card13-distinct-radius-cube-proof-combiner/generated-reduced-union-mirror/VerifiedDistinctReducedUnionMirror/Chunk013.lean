import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk013Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1111, bvar 1119, bvar 1124, bvar 1132]),
    bnot (bands [bvar 1114, bvar 1115, bvar 1127, bvar 1128]),
    bnot (bands [bvar 1114, bvar 1116, bvar 1127, bvar 1129]),
    bnot (bands [bvar 1114, bvar 1117, bvar 1127, bvar 1130]),
    bnot (bands [bvar 1114, bvar 1118, bvar 1127, bvar 1131]),
    bnot (bands [bvar 1114, bvar 1119, bvar 1127, bvar 1132]),
    bnot (bands [bvar 1115, bvar 1116, bvar 1128, bvar 1129]),
    bnot (bands [bvar 1115, bvar 1117, bvar 1128, bvar 1130]),
    bnot (bands [bvar 1115, bvar 1118, bvar 1128, bvar 1131]),
    bnot (bands [bvar 1115, bvar 1119, bvar 1128, bvar 1132]),
    bnot (bands [bvar 1116, bvar 1117, bvar 1129, bvar 1130]),
    bnot (bands [bvar 1117, bvar 1118, bvar 1130, bvar 1131]),
    bnot (bands [bvar 1117, bvar 1119, bvar 1130, bvar 1132]),
    bnot (bands [bvar 1118, bvar 1119, bvar 1131, bvar 1132]),
    bnot (bands [bvar 1107, bvar 1111, bvar 1133, bvar 1137]),
    bnot (bands [bvar 1107, bvar 1117, bvar 1133, bvar 1143]),
    bnot (bands [bvar 1108, bvar 1117, bvar 1134, bvar 1143]),
    bnot (bands [bvar 1110, bvar 1111, bvar 1136, bvar 1137]),
    bnot (bands [bvar 1110, bvar 1115, bvar 1136, bvar 1141]),
    bnot (bands [bvar 1110, bvar 1119, bvar 1136, bvar 1145]),
    bnot (bands [bvar 1111, bvar 1115, bvar 1137, bvar 1141]),
    bnot (bands [bvar 1111, bvar 1118, bvar 1137, bvar 1144]),
    bnot (bands [bvar 1111, bvar 1119, bvar 1137, bvar 1145]),
    bnot (bands [bvar 1115, bvar 1116, bvar 1141, bvar 1142]),
    bnot (bands [bvar 1115, bvar 1117, bvar 1141, bvar 1143]),
    bnot (bands [bvar 1115, bvar 1118, bvar 1141, bvar 1144]),
    bnot (bands [bvar 1115, bvar 1119, bvar 1141, bvar 1145]),
    bnot (bands [bvar 1116, bvar 1117, bvar 1142, bvar 1143]),
    bnot (bands [bvar 1117, bvar 1118, bvar 1143, bvar 1144]),
    bnot (bands [bvar 1117, bvar 1119, bvar 1143, bvar 1145]),
    bnot (bands [bvar 1118, bvar 1119, bvar 1144, bvar 1145]),
    bnot (bands [bvar 1110, bvar 1111, bvar 1162, bvar 1163]),
    bnot (bands [bvar 1110, bvar 1117, bvar 1162, bvar 1169]),
    bnot (bands [bvar 1110, bvar 1119, bvar 1162, bvar 1171]),
    bnot (bands [bvar 1111, bvar 1117, bvar 1163, bvar 1169]),
    bnot (bands [bvar 1111, bvar 1119, bvar 1163, bvar 1171]),
    bnot (bands [bvar 1113, bvar 1114, bvar 1165, bvar 1166]),
    bnot (bands [bvar 1113, bvar 1115, bvar 1165, bvar 1167]),
    bnot (bands [bvar 1114, bvar 1115, bvar 1166, bvar 1167]),
    bnot (bands [bvar 1117, bvar 1118, bvar 1169, bvar 1170]),
    bnot (bands [bvar 1111, bvar 1119, bvar 1176, bvar 1184]),
    bnot (bands [bvar 1114, bvar 1116, bvar 1179, bvar 1181]),
    bnot (bands [bvar 1114, bvar 1115, bvar 1192, bvar 1193]),
    bnot (bands [bvar 1108, bvar 1111, bvar 1199, bvar 1202]),
    bnot (bands [bvar 1113, bvar 1114, bvar 1204, bvar 1205]),
    bnot (bands [bvar 1113, bvar 1115, bvar 1204, bvar 1206]),
    bnot (bands [bvar 1113, bvar 1116, bvar 1204, bvar 1207]),
    bnot (bands [bvar 1113, bvar 1117, bvar 1204, bvar 1208]),
    bnot (bands [bvar 1114, bvar 1115, bvar 1205, bvar 1206]),
    bnot (bands [bvar 1116, bvar 1117, bvar 1207, bvar 1208]),
    bnot (bands [bvar 1116, bvar 1118, bvar 1207, bvar 1209]),
    bnot (bands [bvar 1117, bvar 1118, bvar 1208, bvar 1209]),
    bnot (bands [bvar 1120, bvar 1124, bvar 1133, bvar 1137]),
    bnot (bands [bvar 1120, bvar 1131, bvar 1133, bvar 1144]),
    bnot (bands [bvar 1121, bvar 1124, bvar 1134, bvar 1137]),
    bnot (bands [bvar 1121, bvar 1128, bvar 1134, bvar 1141]),
    bnot (bands [bvar 1122, bvar 1124, bvar 1135, bvar 1137]),
    bnot (bands [bvar 1122, bvar 1128, bvar 1135, bvar 1141]),
    bnot (bands [bvar 1123, bvar 1124, bvar 1136, bvar 1137]),
    bnot (bands [bvar 1123, bvar 1125, bvar 1136, bvar 1138]),
    bnot (bands [bvar 1123, bvar 1128, bvar 1136, bvar 1141]),
    bnot (bands [bvar 1123, bvar 1129, bvar 1136, bvar 1142]),
    bnot (bands [bvar 1124, bvar 1125, bvar 1137, bvar 1138]),
    bnot (bands [bvar 1124, bvar 1128, bvar 1137, bvar 1141]) ]

def reducedUnionChunk013 : BVLogicalExpr :=
  bands reducedUnionChunk013Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
