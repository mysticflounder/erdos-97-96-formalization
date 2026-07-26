import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk070Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 132, bvar 135, bvar 1185, bvar 1188]),
    bnot (bands [bvar 132, bvar 136, bvar 1185, bvar 1189]),
    bnot (bands [bvar 132, bvar 137, bvar 1185, bvar 1190]),
    bnot (bands [bvar 132, bvar 138, bvar 1185, bvar 1191]),
    bnot (bands [bvar 132, bvar 139, bvar 1185, bvar 1192]),
    bnot (bands [bvar 135, bvar 136, bvar 1188, bvar 1189]),
    bnot (bands [bvar 135, bvar 137, bvar 1188, bvar 1190]),
    bnot (bands [bvar 135, bvar 138, bvar 1188, bvar 1191]),
    bnot (bands [bvar 135, bvar 139, bvar 1188, bvar 1192]),
    bnot (bands [bvar 135, bvar 144, bvar 1188, bvar 1197]),
    bnot (bands [bvar 136, bvar 144, bvar 1189, bvar 1197]),
    bnot (bands [bvar 138, bvar 144, bvar 1191, bvar 1197]),
    bnot (bands [bvar 139, bvar 144, bvar 1192, bvar 1197]),
    bnot (bands [bvar 132, bvar 135, bvar 1198, bvar 1201]),
    bnot (bands [bvar 132, bvar 136, bvar 1198, bvar 1202]),
    bnot (bands [bvar 132, bvar 137, bvar 1198, bvar 1203]),
    bnot (bands [bvar 132, bvar 138, bvar 1198, bvar 1204]),
    bnot (bands [bvar 132, bvar 139, bvar 1198, bvar 1205]),
    bnot (bands [bvar 135, bvar 136, bvar 1201, bvar 1202]),
    bnot (bands [bvar 135, bvar 138, bvar 1201, bvar 1204]),
    bnot (bands [bvar 145, bvar 146, bvar 1172, bvar 1173]),
    bnot (bands [bvar 145, bvar 147, bvar 1172, bvar 1174]),
    bnot (bands [bvar 145, bvar 148, bvar 1172, bvar 1175]),
    bnot (bands [bvar 145, bvar 149, bvar 1172, bvar 1176]),
    bnot (bands [bvar 145, bvar 150, bvar 1172, bvar 1177]),
    bnot (bands [bvar 145, bvar 151, bvar 1172, bvar 1178]),
    bnot (bands [bvar 145, bvar 152, bvar 1172, bvar 1179]),
    bnot (bands [bvar 145, bvar 153, bvar 1172, bvar 1180]),
    bnot (bands [bvar 145, bvar 156, bvar 1172, bvar 1183]),
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
    bnot (bands [bvar 147, bvar 156, bvar 1174, bvar 1183]),
    bnot (bands [bvar 147, bvar 157, bvar 1174, bvar 1184]),
    bnot (bands [bvar 148, bvar 149, bvar 1175, bvar 1176]),
    bnot (bands [bvar 148, bvar 150, bvar 1175, bvar 1177]),
    bnot (bands [bvar 148, bvar 151, bvar 1175, bvar 1178]),
    bnot (bands [bvar 148, bvar 152, bvar 1175, bvar 1179]),
    bnot (bands [bvar 148, bvar 153, bvar 1175, bvar 1180]),
    bnot (bands [bvar 148, bvar 156, bvar 1175, bvar 1183]),
    bnot (bands [bvar 148, bvar 157, bvar 1175, bvar 1184]),
    bnot (bands [bvar 149, bvar 150, bvar 1176, bvar 1177]),
    bnot (bands [bvar 149, bvar 151, bvar 1176, bvar 1178]),
    bnot (bands [bvar 149, bvar 152, bvar 1176, bvar 1179]),
    bnot (bands [bvar 149, bvar 153, bvar 1176, bvar 1180]),
    bnot (bands [bvar 149, bvar 156, bvar 1176, bvar 1183]),
    bnot (bands [bvar 149, bvar 157, bvar 1176, bvar 1184]),
    bnot (bands [bvar 150, bvar 151, bvar 1177, bvar 1178]),
    bnot (bands [bvar 150, bvar 152, bvar 1177, bvar 1179]),
    bnot (bands [bvar 150, bvar 153, bvar 1177, bvar 1180]),
    bnot (bands [bvar 150, bvar 156, bvar 1177, bvar 1183]),
    bnot (bands [bvar 150, bvar 157, bvar 1177, bvar 1184]),
    bnot (bands [bvar 151, bvar 152, bvar 1178, bvar 1179]),
    bnot (bands [bvar 151, bvar 153, bvar 1178, bvar 1180]),
    bnot (bands [bvar 151, bvar 156, bvar 1178, bvar 1183]) ]

def reducedUnionChunk070 : BVLogicalExpr :=
  bands reducedUnionChunk070Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
