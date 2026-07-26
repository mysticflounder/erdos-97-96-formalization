import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk069Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 149, bvar 156, bvar 1176, bvar 1183]),
    bnot (bands [bvar 149, bvar 157, bvar 1176, bvar 1184]),
    bnot (bands [bvar 150, bvar 151, bvar 1177, bvar 1178]),
    bnot (bands [bvar 150, bvar 153, bvar 1177, bvar 1180]),
    bnot (bands [bvar 150, bvar 156, bvar 1177, bvar 1183]),
    bnot (bands [bvar 150, bvar 157, bvar 1177, bvar 1184]),
    bnot (bands [bvar 151, bvar 152, bvar 1178, bvar 1179]),
    bnot (bands [bvar 151, bvar 153, bvar 1178, bvar 1180]),
    bnot (bands [bvar 151, bvar 156, bvar 1178, bvar 1183]),
    bnot (bands [bvar 151, bvar 157, bvar 1178, bvar 1184]),
    bnot (bands [bvar 152, bvar 153, bvar 1179, bvar 1180]),
    bnot (bands [bvar 152, bvar 156, bvar 1179, bvar 1183]),
    bnot (bands [bvar 152, bvar 157, bvar 1179, bvar 1184]),
    bnot (bands [bvar 153, bvar 156, bvar 1180, bvar 1183]),
    bnot (bands [bvar 153, bvar 157, bvar 1180, bvar 1184]),
    bnot (bands [bvar 156, bvar 157, bvar 1183, bvar 1184]),
    bnot (bands [bvar 1159, bvar 1164, bvar 171, bvar 176]),
    bnot (bands [bvar 1159, bvar 1165, bvar 171, bvar 177]),
    bnot (bands [bvar 1159, bvar 1166, bvar 171, bvar 178]),
    bnot (bands [bvar 1159, bvar 1171, bvar 171, bvar 183]),
    bnot (bands [bvar 1160, bvar 1163, bvar 172, bvar 175]),
    bnot (bands [bvar 1162, bvar 1163, bvar 174, bvar 175]),
    bnot (bands [bvar 1163, bvar 1164, bvar 175, bvar 176]),
    bnot (bands [bvar 1163, bvar 1165, bvar 175, bvar 177]),
    bnot (bands [bvar 1163, bvar 1167, bvar 175, bvar 179]),
    bnot (bands [bvar 1163, bvar 1171, bvar 175, bvar 183]),
    bnot (bands [bvar 1164, bvar 1165, bvar 176, bvar 177]),
    bnot (bands [bvar 1164, bvar 1166, bvar 176, bvar 178]),
    bnot (bands [bvar 1164, bvar 1167, bvar 176, bvar 179]),
    bnot (bands [bvar 1164, bvar 1171, bvar 176, bvar 183]),
    bnot (bands [bvar 1165, bvar 1167, bvar 177, bvar 179]),
    bnot (bands [bvar 1165, bvar 1171, bvar 177, bvar 183]),
    bnot (bands [bvar 1166, bvar 1171, bvar 178, bvar 183]),
    bnot (bands [bvar 145, bvar 146, bvar 1185, bvar 1186]),
    bnot (bands [bvar 145, bvar 147, bvar 1185, bvar 1187]),
    bnot (bands [bvar 145, bvar 148, bvar 1185, bvar 1188]),
    bnot (bands [bvar 145, bvar 149, bvar 1185, bvar 1189]),
    bnot (bands [bvar 145, bvar 151, bvar 1185, bvar 1191]),
    bnot (bands [bvar 145, bvar 152, bvar 1185, bvar 1192]),
    bnot (bands [bvar 145, bvar 153, bvar 1185, bvar 1193]),
    bnot (bands [bvar 146, bvar 149, bvar 1186, bvar 1189]),
    bnot (bands [bvar 146, bvar 150, bvar 1186, bvar 1190]),
    bnot (bands [bvar 146, bvar 151, bvar 1186, bvar 1191]),
    bnot (bands [bvar 146, bvar 152, bvar 1186, bvar 1192]),
    bnot (bands [bvar 146, bvar 153, bvar 1186, bvar 1193]),
    bnot (bands [bvar 146, bvar 157, bvar 1186, bvar 1197]),
    bnot (bands [bvar 147, bvar 149, bvar 1187, bvar 1189]),
    bnot (bands [bvar 147, bvar 151, bvar 1187, bvar 1191]),
    bnot (bands [bvar 147, bvar 152, bvar 1187, bvar 1192]),
    bnot (bands [bvar 147, bvar 153, bvar 1187, bvar 1193]),
    bnot (bands [bvar 147, bvar 157, bvar 1187, bvar 1197]),
    bnot (bands [bvar 148, bvar 149, bvar 1188, bvar 1189]),
    bnot (bands [bvar 148, bvar 151, bvar 1188, bvar 1191]),
    bnot (bands [bvar 148, bvar 152, bvar 1188, bvar 1192]),
    bnot (bands [bvar 148, bvar 153, bvar 1188, bvar 1193]),
    bnot (bands [bvar 148, bvar 157, bvar 1188, bvar 1197]),
    bnot (bands [bvar 149, bvar 150, bvar 1189, bvar 1190]),
    bnot (bands [bvar 149, bvar 151, bvar 1189, bvar 1191]),
    bnot (bands [bvar 149, bvar 152, bvar 1189, bvar 1192]),
    bnot (bands [bvar 149, bvar 153, bvar 1189, bvar 1193]),
    bnot (bands [bvar 149, bvar 157, bvar 1189, bvar 1197]),
    bnot (bands [bvar 150, bvar 151, bvar 1190, bvar 1191]),
    bnot (bands [bvar 150, bvar 152, bvar 1190, bvar 1192]),
    bnot (bands [bvar 150, bvar 153, bvar 1190, bvar 1193]) ]

def reducedUnionChunk069 : BVLogicalExpr :=
  bands reducedUnionChunk069Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
