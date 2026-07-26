import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk068Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 132, bvar 135, bvar 1185, bvar 1188]),
    bnot (bands [bvar 132, bvar 136, bvar 1185, bvar 1189]),
    bnot (bands [bvar 132, bvar 137, bvar 1185, bvar 1190]),
    bnot (bands [bvar 132, bvar 138, bvar 1185, bvar 1191]),
    bnot (bands [bvar 132, bvar 139, bvar 1185, bvar 1192]),
    bnot (bands [bvar 132, bvar 144, bvar 1185, bvar 1197]),
    bnot (bands [bvar 133, bvar 137, bvar 1186, bvar 1190]),
    bnot (bands [bvar 134, bvar 137, bvar 1187, bvar 1190]),
    bnot (bands [bvar 135, bvar 136, bvar 1188, bvar 1189]),
    bnot (bands [bvar 135, bvar 137, bvar 1188, bvar 1190]),
    bnot (bands [bvar 135, bvar 138, bvar 1188, bvar 1191]),
    bnot (bands [bvar 135, bvar 139, bvar 1188, bvar 1192]),
    bnot (bands [bvar 135, bvar 144, bvar 1188, bvar 1197]),
    bnot (bands [bvar 136, bvar 139, bvar 1189, bvar 1192]),
    bnot (bands [bvar 136, bvar 144, bvar 1189, bvar 1197]),
    bnot (bands [bvar 137, bvar 144, bvar 1190, bvar 1197]),
    bnot (bands [bvar 138, bvar 144, bvar 1191, bvar 1197]),
    bnot (bands [bvar 139, bvar 144, bvar 1192, bvar 1197]),
    bnot (bands [bvar 141, bvar 142, bvar 1194, bvar 1195]),
    bnot (bands [bvar 132, bvar 135, bvar 1198, bvar 1201]),
    bnot (bands [bvar 132, bvar 136, bvar 1198, bvar 1202]),
    bnot (bands [bvar 132, bvar 137, bvar 1198, bvar 1203]),
    bnot (bands [bvar 132, bvar 138, bvar 1198, bvar 1204]),
    bnot (bands [bvar 132, bvar 139, bvar 1198, bvar 1205]),
    bnot (bands [bvar 135, bvar 136, bvar 1201, bvar 1202]),
    bnot (bands [bvar 135, bvar 137, bvar 1201, bvar 1203]),
    bnot (bands [bvar 135, bvar 138, bvar 1201, bvar 1204]),
    bnot (bands [bvar 1159, bvar 1164, bvar 158, bvar 163]),
    bnot (bands [bvar 1159, bvar 1167, bvar 158, bvar 166]),
    bnot (bands [bvar 1160, bvar 1167, bvar 159, bvar 166]),
    bnot (bands [bvar 1161, bvar 1163, bvar 160, bvar 162]),
    bnot (bands [bvar 1161, bvar 1164, bvar 160, bvar 163]),
    bnot (bands [bvar 1163, bvar 1164, bvar 162, bvar 163]),
    bnot (bands [bvar 1163, bvar 1166, bvar 162, bvar 165]),
    bnot (bands [bvar 1164, bvar 1167, bvar 163, bvar 166]),
    bnot (bands [bvar 1164, bvar 1170, bvar 163, bvar 169]),
    bnot (bands [bvar 1164, bvar 1171, bvar 163, bvar 170]),
    bnot (bands [bvar 145, bvar 146, bvar 1172, bvar 1173]),
    bnot (bands [bvar 145, bvar 147, bvar 1172, bvar 1174]),
    bnot (bands [bvar 145, bvar 149, bvar 1172, bvar 1176]),
    bnot (bands [bvar 145, bvar 150, bvar 1172, bvar 1177]),
    bnot (bands [bvar 145, bvar 151, bvar 1172, bvar 1178]),
    bnot (bands [bvar 145, bvar 152, bvar 1172, bvar 1179]),
    bnot (bands [bvar 145, bvar 153, bvar 1172, bvar 1180]),
    bnot (bands [bvar 145, bvar 156, bvar 1172, bvar 1183]),
    bnot (bands [bvar 145, bvar 157, bvar 1172, bvar 1184]),
    bnot (bands [bvar 146, bvar 149, bvar 1173, bvar 1176]),
    bnot (bands [bvar 146, bvar 150, bvar 1173, bvar 1177]),
    bnot (bands [bvar 146, bvar 151, bvar 1173, bvar 1178]),
    bnot (bands [bvar 146, bvar 152, bvar 1173, bvar 1179]),
    bnot (bands [bvar 146, bvar 153, bvar 1173, bvar 1180]),
    bnot (bands [bvar 146, bvar 156, bvar 1173, bvar 1183]),
    bnot (bands [bvar 146, bvar 157, bvar 1173, bvar 1184]),
    bnot (bands [bvar 147, bvar 149, bvar 1174, bvar 1176]),
    bnot (bands [bvar 147, bvar 150, bvar 1174, bvar 1177]),
    bnot (bands [bvar 147, bvar 151, bvar 1174, bvar 1178]),
    bnot (bands [bvar 147, bvar 152, bvar 1174, bvar 1179]),
    bnot (bands [bvar 147, bvar 153, bvar 1174, bvar 1180]),
    bnot (bands [bvar 148, bvar 149, bvar 1175, bvar 1176]),
    bnot (bands [bvar 148, bvar 152, bvar 1175, bvar 1179]),
    bnot (bands [bvar 149, bvar 150, bvar 1176, bvar 1177]),
    bnot (bands [bvar 149, bvar 151, bvar 1176, bvar 1178]),
    bnot (bands [bvar 149, bvar 152, bvar 1176, bvar 1179]),
    bnot (bands [bvar 149, bvar 153, bvar 1176, bvar 1180]) ]

def reducedUnionChunk068 : BVLogicalExpr :=
  bands reducedUnionChunk068Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
