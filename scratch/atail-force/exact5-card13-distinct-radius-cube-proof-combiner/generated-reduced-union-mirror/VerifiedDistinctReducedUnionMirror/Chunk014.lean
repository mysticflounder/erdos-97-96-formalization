import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk014Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1124, bvar 1129, bvar 1137, bvar 1142]),
    bnot (bands [bvar 1124, bvar 1130, bvar 1137, bvar 1143]),
    bnot (bands [bvar 1124, bvar 1131, bvar 1137, bvar 1144]),
    bnot (bands [bvar 1124, bvar 1132, bvar 1137, bvar 1145]),
    bnot (bands [bvar 1125, bvar 1128, bvar 1138, bvar 1141]),
    bnot (bands [bvar 1125, bvar 1129, bvar 1138, bvar 1142]),
    bnot (bands [bvar 1125, bvar 1130, bvar 1138, bvar 1143]),
    bnot (bands [bvar 1125, bvar 1131, bvar 1138, bvar 1144]),
    bnot (bands [bvar 1125, bvar 1132, bvar 1138, bvar 1145]),
    bnot (bands [bvar 1128, bvar 1129, bvar 1141, bvar 1142]),
    bnot (bands [bvar 1128, bvar 1130, bvar 1141, bvar 1143]),
    bnot (bands [bvar 1128, bvar 1131, bvar 1141, bvar 1144]),
    bnot (bands [bvar 1128, bvar 1132, bvar 1141, bvar 1145]),
    bnot (bands [bvar 1129, bvar 1130, bvar 1142, bvar 1143]),
    bnot (bands [bvar 1129, bvar 1131, bvar 1142, bvar 1144]),
    bnot (bands [bvar 1129, bvar 1132, bvar 1142, bvar 1145]),
    bnot (bands [bvar 1130, bvar 1131, bvar 1143, bvar 1144]),
    bnot (bands [bvar 1130, bvar 1132, bvar 1143, bvar 1145]),
    bnot (bands [bvar 1131, bvar 1132, bvar 1144, bvar 1145]),
    bnot (bands [bvar 1120, bvar 1121, bvar 1159, bvar 1160]),
    bnot (bands [bvar 1120, bvar 1122, bvar 1159, bvar 1161]),
    bnot (bands [bvar 1120, bvar 1123, bvar 1159, bvar 1162]),
    bnot (bands [bvar 1120, bvar 1124, bvar 1159, bvar 1163]),
    bnot (bands [bvar 1120, bvar 1125, bvar 1159, bvar 1164]),
    bnot (bands [bvar 1120, bvar 1130, bvar 1159, bvar 1169]),
    bnot (bands [bvar 1120, bvar 1131, bvar 1159, bvar 1170]),
    bnot (bands [bvar 1121, bvar 1124, bvar 1160, bvar 1163]),
    bnot (bands [bvar 1121, bvar 1125, bvar 1160, bvar 1164]),
    bnot (bands [bvar 1121, bvar 1131, bvar 1160, bvar 1170]),
    bnot (bands [bvar 1121, bvar 1132, bvar 1160, bvar 1171]),
    bnot (bands [bvar 1122, bvar 1124, bvar 1161, bvar 1163]),
    bnot (bands [bvar 1122, bvar 1125, bvar 1161, bvar 1164]),
    bnot (bands [bvar 1122, bvar 1131, bvar 1161, bvar 1170]),
    bnot (bands [bvar 1122, bvar 1132, bvar 1161, bvar 1171]),
    bnot (bands [bvar 1123, bvar 1124, bvar 1162, bvar 1163]),
    bnot (bands [bvar 1123, bvar 1125, bvar 1162, bvar 1164]),
    bnot (bands [bvar 1123, bvar 1131, bvar 1162, bvar 1170]),
    bnot (bands [bvar 1123, bvar 1132, bvar 1162, bvar 1171]),
    bnot (bands [bvar 1124, bvar 1125, bvar 1163, bvar 1164]),
    bnot (bands [bvar 1124, bvar 1130, bvar 1163, bvar 1169]),
    bnot (bands [bvar 1124, bvar 1131, bvar 1163, bvar 1170]),
    bnot (bands [bvar 1124, bvar 1132, bvar 1163, bvar 1171]),
    bnot (bands [bvar 1125, bvar 1130, bvar 1164, bvar 1169]),
    bnot (bands [bvar 1125, bvar 1131, bvar 1164, bvar 1170]),
    bnot (bands [bvar 1125, bvar 1132, bvar 1164, bvar 1171]),
    bnot (bands [bvar 1127, bvar 1128, bvar 1166, bvar 1167]),
    bnot (bands [bvar 1130, bvar 1131, bvar 1169, bvar 1170]),
    bnot (bands [bvar 1130, bvar 1132, bvar 1169, bvar 1171]),
    bnot (bands [bvar 1131, bvar 1132, bvar 1170, bvar 1171]),
    bnot (bands [bvar 1120, bvar 1124, bvar 1172, bvar 1176]),
    bnot (bands [bvar 1123, bvar 1132, bvar 1175, bvar 1184]),
    bnot (bands [bvar 1124, bvar 1125, bvar 1176, bvar 1177]),
    bnot (bands [bvar 1124, bvar 1131, bvar 1176, bvar 1183]),
    bnot (bands [bvar 1124, bvar 1132, bvar 1176, bvar 1184]),
    bnot (bands [bvar 1125, bvar 1132, bvar 1177, bvar 1184]),
    bnot (bands [bvar 1127, bvar 1128, bvar 1179, bvar 1180]),
    bnot (bands [bvar 1121, bvar 1124, bvar 1186, bvar 1189]),
    bnot (bands [bvar 1122, bvar 1124, bvar 1187, bvar 1189]),
    bnot (bands [bvar 1122, bvar 1125, bvar 1187, bvar 1190]),
    bnot (bands [bvar 1123, bvar 1124, bvar 1188, bvar 1189]),
    bnot (bands [bvar 1123, bvar 1125, bvar 1188, bvar 1190]),
    bnot (bands [bvar 1124, bvar 1125, bvar 1189, bvar 1190]),
    bnot (bands [bvar 1124, bvar 1132, bvar 1189, bvar 1197]),
    bnot (bands [bvar 1125, bvar 1132, bvar 1190, bvar 1197]) ]

def reducedUnionChunk014 : BVLogicalExpr :=
  bands reducedUnionChunk014Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
