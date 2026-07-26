import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk067Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 121, bvar 125, bvar 1174, bvar 1178]),
    bnot (bands [bvar 122, bvar 123, bvar 1175, bvar 1176]),
    bnot (bands [bvar 127, bvar 128, bvar 1180, bvar 1181]),
    bnot (bands [bvar 119, bvar 120, bvar 1185, bvar 1186]),
    bnot (bands [bvar 120, bvar 125, bvar 1186, bvar 1191]),
    bnot (bands [bvar 122, bvar 123, bvar 1188, bvar 1189]),
    bnot (bands [bvar 122, bvar 125, bvar 1188, bvar 1191]),
    bnot (bands [bvar 123, bvar 125, bvar 1189, bvar 1191]),
    bnot (bands [bvar 125, bvar 131, bvar 1191, bvar 1197]),
    bnot (bands [bvar 127, bvar 128, bvar 1193, bvar 1194]),
    bnot (bands [bvar 127, bvar 129, bvar 1193, bvar 1195]),
    bnot (bands [bvar 128, bvar 129, bvar 1194, bvar 1195]),
    bnot (bands [bvar 127, bvar 129, bvar 1206, bvar 1208]),
    bnot (bands [bvar 132, bvar 135, bvar 1159, bvar 1162]),
    bnot (bands [bvar 132, bvar 136, bvar 1159, bvar 1163]),
    bnot (bands [bvar 132, bvar 137, bvar 1159, bvar 1164]),
    bnot (bands [bvar 132, bvar 138, bvar 1159, bvar 1165]),
    bnot (bands [bvar 132, bvar 139, bvar 1159, bvar 1166]),
    bnot (bands [bvar 132, bvar 142, bvar 1159, bvar 1169]),
    bnot (bands [bvar 132, bvar 143, bvar 1159, bvar 1170]),
    bnot (bands [bvar 132, bvar 144, bvar 1159, bvar 1171]),
    bnot (bands [bvar 135, bvar 136, bvar 1162, bvar 1163]),
    bnot (bands [bvar 135, bvar 137, bvar 1162, bvar 1164]),
    bnot (bands [bvar 135, bvar 138, bvar 1162, bvar 1165]),
    bnot (bands [bvar 135, bvar 142, bvar 1162, bvar 1169]),
    bnot (bands [bvar 135, bvar 143, bvar 1162, bvar 1170]),
    bnot (bands [bvar 135, bvar 144, bvar 1162, bvar 1171]),
    bnot (bands [bvar 136, bvar 138, bvar 1163, bvar 1165]),
    bnot (bands [bvar 136, bvar 142, bvar 1163, bvar 1169]),
    bnot (bands [bvar 136, bvar 143, bvar 1163, bvar 1170]),
    bnot (bands [bvar 136, bvar 144, bvar 1163, bvar 1171]),
    bnot (bands [bvar 137, bvar 142, bvar 1164, bvar 1169]),
    bnot (bands [bvar 137, bvar 144, bvar 1164, bvar 1171]),
    bnot (bands [bvar 138, bvar 142, bvar 1165, bvar 1169]),
    bnot (bands [bvar 138, bvar 143, bvar 1165, bvar 1170]),
    bnot (bands [bvar 138, bvar 144, bvar 1165, bvar 1171]),
    bnot (bands [bvar 139, bvar 143, bvar 1166, bvar 1170]),
    bnot (bands [bvar 139, bvar 144, bvar 1166, bvar 1171]),
    bnot (bands [bvar 142, bvar 144, bvar 1169, bvar 1171]),
    bnot (bands [bvar 143, bvar 144, bvar 1170, bvar 1171]),
    bnot (bands [bvar 132, bvar 135, bvar 1172, bvar 1175]),
    bnot (bands [bvar 132, bvar 136, bvar 1172, bvar 1176]),
    bnot (bands [bvar 132, bvar 137, bvar 1172, bvar 1177]),
    bnot (bands [bvar 132, bvar 138, bvar 1172, bvar 1178]),
    bnot (bands [bvar 132, bvar 139, bvar 1172, bvar 1179]),
    bnot (bands [bvar 132, bvar 143, bvar 1172, bvar 1183]),
    bnot (bands [bvar 132, bvar 144, bvar 1172, bvar 1184]),
    bnot (bands [bvar 135, bvar 136, bvar 1175, bvar 1176]),
    bnot (bands [bvar 135, bvar 137, bvar 1175, bvar 1177]),
    bnot (bands [bvar 135, bvar 138, bvar 1175, bvar 1178]),
    bnot (bands [bvar 135, bvar 139, bvar 1175, bvar 1179]),
    bnot (bands [bvar 135, bvar 143, bvar 1175, bvar 1183]),
    bnot (bands [bvar 135, bvar 144, bvar 1175, bvar 1184]),
    bnot (bands [bvar 136, bvar 138, bvar 1176, bvar 1178]),
    bnot (bands [bvar 136, bvar 139, bvar 1176, bvar 1179]),
    bnot (bands [bvar 136, bvar 143, bvar 1176, bvar 1183]),
    bnot (bands [bvar 136, bvar 144, bvar 1176, bvar 1184]),
    bnot (bands [bvar 137, bvar 143, bvar 1177, bvar 1183]),
    bnot (bands [bvar 137, bvar 144, bvar 1177, bvar 1184]),
    bnot (bands [bvar 138, bvar 143, bvar 1178, bvar 1183]),
    bnot (bands [bvar 138, bvar 144, bvar 1178, bvar 1184]),
    bnot (bands [bvar 139, bvar 143, bvar 1179, bvar 1183]),
    bnot (bands [bvar 139, bvar 144, bvar 1179, bvar 1184]),
    bnot (bands [bvar 132, bvar 133, bvar 1185, bvar 1186]) ]

def reducedUnionChunk067 : BVLogicalExpr :=
  bands reducedUnionChunk067Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
