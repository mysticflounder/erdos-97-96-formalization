import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk014Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1129, bvar 1131, bvar 1207, bvar 1209]),
    bnot (bands [bvar 1130, bvar 1131, bvar 1208, bvar 1209]),
    bnot (bands [bvar 1133, bvar 1134, bvar 1159, bvar 1160]),
    bnot (bands [bvar 1133, bvar 1135, bvar 1159, bvar 1161]),
    bnot (bands [bvar 1133, bvar 1136, bvar 1159, bvar 1162]),
    bnot (bands [bvar 1133, bvar 1137, bvar 1159, bvar 1163]),
    bnot (bands [bvar 1133, bvar 1138, bvar 1159, bvar 1164]),
    bnot (bands [bvar 1133, bvar 1139, bvar 1159, bvar 1165]),
    bnot (bands [bvar 1133, bvar 1143, bvar 1159, bvar 1169]),
    bnot (bands [bvar 1133, bvar 1144, bvar 1159, bvar 1170]),
    bnot (bands [bvar 1133, bvar 1145, bvar 1159, bvar 1171]),
    bnot (bands [bvar 1134, bvar 1137, bvar 1160, bvar 1163]),
    bnot (bands [bvar 1134, bvar 1138, bvar 1160, bvar 1164]),
    bnot (bands [bvar 1135, bvar 1137, bvar 1161, bvar 1163]),
    bnot (bands [bvar 1135, bvar 1138, bvar 1161, bvar 1164]),
    bnot (bands [bvar 1135, bvar 1139, bvar 1161, bvar 1165]),
    bnot (bands [bvar 1136, bvar 1137, bvar 1162, bvar 1163]),
    bnot (bands [bvar 1136, bvar 1138, bvar 1162, bvar 1164]),
    bnot (bands [bvar 1137, bvar 1138, bvar 1163, bvar 1164]),
    bnot (bands [bvar 1137, bvar 1139, bvar 1163, bvar 1165]),
    bnot (bands [bvar 1137, bvar 1143, bvar 1163, bvar 1169]),
    bnot (bands [bvar 1137, bvar 1144, bvar 1163, bvar 1170]),
    bnot (bands [bvar 1137, bvar 1145, bvar 1163, bvar 1171]),
    bnot (bands [bvar 1138, bvar 1139, bvar 1164, bvar 1165]),
    bnot (bands [bvar 1138, bvar 1143, bvar 1164, bvar 1169]),
    bnot (bands [bvar 1138, bvar 1144, bvar 1164, bvar 1170]),
    bnot (bands [bvar 1138, bvar 1145, bvar 1164, bvar 1171]),
    bnot (bands [bvar 1139, bvar 1144, bvar 1165, bvar 1170]),
    bnot (bands [bvar 1139, bvar 1145, bvar 1165, bvar 1171]),
    bnot (bands [bvar 1143, bvar 1144, bvar 1169, bvar 1170]),
    bnot (bands [bvar 1143, bvar 1145, bvar 1169, bvar 1171]),
    bnot (bands [bvar 1133, bvar 1134, bvar 1172, bvar 1173]),
    bnot (bands [bvar 1133, bvar 1135, bvar 1172, bvar 1174]),
    bnot (bands [bvar 1133, bvar 1136, bvar 1172, bvar 1175]),
    bnot (bands [bvar 1133, bvar 1137, bvar 1172, bvar 1176]),
    bnot (bands [bvar 1133, bvar 1138, bvar 1172, bvar 1177]),
    bnot (bands [bvar 1133, bvar 1139, bvar 1172, bvar 1178]),
    bnot (bands [bvar 1133, bvar 1144, bvar 1172, bvar 1183]),
    bnot (bands [bvar 1133, bvar 1145, bvar 1172, bvar 1184]),
    bnot (bands [bvar 1134, bvar 1137, bvar 1173, bvar 1176]),
    bnot (bands [bvar 1134, bvar 1138, bvar 1173, bvar 1177]),
    bnot (bands [bvar 1134, bvar 1139, bvar 1173, bvar 1178]),
    bnot (bands [bvar 1134, bvar 1144, bvar 1173, bvar 1183]),
    bnot (bands [bvar 1134, bvar 1145, bvar 1173, bvar 1184]),
    bnot (bands [bvar 1135, bvar 1137, bvar 1174, bvar 1176]),
    bnot (bands [bvar 1135, bvar 1138, bvar 1174, bvar 1177]),
    bnot (bands [bvar 1135, bvar 1139, bvar 1174, bvar 1178]),
    bnot (bands [bvar 1135, bvar 1144, bvar 1174, bvar 1183]),
    bnot (bands [bvar 1136, bvar 1137, bvar 1175, bvar 1176]),
    bnot (bands [bvar 1136, bvar 1138, bvar 1175, bvar 1177]),
    bnot (bands [bvar 1136, bvar 1139, bvar 1175, bvar 1178]),
    bnot (bands [bvar 1136, bvar 1144, bvar 1175, bvar 1183]),
    bnot (bands [bvar 1136, bvar 1145, bvar 1175, bvar 1184]),
    bnot (bands [bvar 1137, bvar 1138, bvar 1176, bvar 1177]),
    bnot (bands [bvar 1137, bvar 1139, bvar 1176, bvar 1178]),
    bnot (bands [bvar 1137, bvar 1144, bvar 1176, bvar 1183]),
    bnot (bands [bvar 1137, bvar 1145, bvar 1176, bvar 1184]),
    bnot (bands [bvar 1138, bvar 1139, bvar 1177, bvar 1178]),
    bnot (bands [bvar 1138, bvar 1144, bvar 1177, bvar 1183]),
    bnot (bands [bvar 1138, bvar 1145, bvar 1177, bvar 1184]),
    bnot (bands [bvar 1139, bvar 1144, bvar 1178, bvar 1183]),
    bnot (bands [bvar 1139, bvar 1145, bvar 1178, bvar 1184]),
    bnot (bands [bvar 1141, bvar 1142, bvar 1180, bvar 1181]),
    bnot (bands [bvar 1144, bvar 1145, bvar 1183, bvar 1184]) ]

def reducedUnionChunk014 : BVLogicalExpr :=
  bands reducedUnionChunk014Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
