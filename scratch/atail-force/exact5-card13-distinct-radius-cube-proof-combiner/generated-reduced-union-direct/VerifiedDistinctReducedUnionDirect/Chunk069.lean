import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk069Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 121, bvar 124, bvar 1174, bvar 1177]),
    bnot (bands [bvar 121, bvar 130, bvar 1174, bvar 1183]),
    bnot (bands [bvar 121, bvar 131, bvar 1174, bvar 1184]),
    bnot (bands [bvar 122, bvar 123, bvar 1175, bvar 1176]),
    bnot (bands [bvar 122, bvar 124, bvar 1175, bvar 1177]),
    bnot (bands [bvar 122, bvar 130, bvar 1175, bvar 1183]),
    bnot (bands [bvar 122, bvar 131, bvar 1175, bvar 1184]),
    bnot (bands [bvar 123, bvar 124, bvar 1176, bvar 1177]),
    bnot (bands [bvar 123, bvar 125, bvar 1176, bvar 1178]),
    bnot (bands [bvar 123, bvar 130, bvar 1176, bvar 1183]),
    bnot (bands [bvar 123, bvar 131, bvar 1176, bvar 1184]),
    bnot (bands [bvar 124, bvar 125, bvar 1177, bvar 1178]),
    bnot (bands [bvar 124, bvar 130, bvar 1177, bvar 1183]),
    bnot (bands [bvar 124, bvar 131, bvar 1177, bvar 1184]),
    bnot (bands [bvar 125, bvar 130, bvar 1178, bvar 1183]),
    bnot (bands [bvar 125, bvar 131, bvar 1178, bvar 1184]),
    bnot (bands [bvar 127, bvar 128, bvar 1180, bvar 1181]),
    bnot (bands [bvar 130, bvar 131, bvar 1183, bvar 1184]),
    bnot (bands [bvar 1133, bvar 1137, bvar 171, bvar 175]),
    bnot (bands [bvar 1133, bvar 1139, bvar 171, bvar 177]),
    bnot (bands [bvar 1134, bvar 1137, bvar 172, bvar 175]),
    bnot (bands [bvar 1134, bvar 1139, bvar 172, bvar 177]),
    bnot (bands [bvar 1135, bvar 1139, bvar 173, bvar 177]),
    bnot (bands [bvar 1136, bvar 1137, bvar 174, bvar 175]),
    bnot (bands [bvar 1136, bvar 1138, bvar 174, bvar 176]),
    bnot (bands [bvar 1136, bvar 1139, bvar 174, bvar 177]),
    bnot (bands [bvar 1136, bvar 1145, bvar 174, bvar 183]),
    bnot (bands [bvar 1137, bvar 1138, bvar 175, bvar 176]),
    bnot (bands [bvar 1137, bvar 1139, bvar 175, bvar 177]),
    bnot (bands [bvar 1137, bvar 1145, bvar 175, bvar 183]),
    bnot (bands [bvar 1138, bvar 1139, bvar 176, bvar 177]),
    bnot (bands [bvar 1139, bvar 1145, bvar 177, bvar 183]),
    bnot (bands [bvar 120, bvar 123, bvar 1186, bvar 1189]),
    bnot (bands [bvar 1137, bvar 1138, bvar 188, bvar 189]),
    bnot (bands [bvar 1141, bvar 1142, bvar 192, bvar 193]),
    bnot (bands [bvar 1141, bvar 1143, bvar 192, bvar 194]),
    bnot (bands [bvar 1141, bvar 1144, bvar 192, bvar 195]),
    bnot (bands [bvar 132, bvar 135, bvar 1159, bvar 1162]),
    bnot (bands [bvar 132, bvar 137, bvar 1159, bvar 1164]),
    bnot (bands [bvar 132, bvar 138, bvar 1159, bvar 1165]),
    bnot (bands [bvar 135, bvar 137, bvar 1162, bvar 1164]),
    bnot (bands [bvar 135, bvar 138, bvar 1162, bvar 1165]),
    bnot (bands [bvar 135, bvar 143, bvar 1162, bvar 1170]),
    bnot (bands [bvar 135, bvar 144, bvar 1162, bvar 1171]),
    bnot (bands [bvar 137, bvar 143, bvar 1164, bvar 1170]),
    bnot (bands [bvar 137, bvar 144, bvar 1164, bvar 1171]),
    bnot (bands [bvar 132, bvar 135, bvar 1172, bvar 1175]),
    bnot (bands [bvar 132, bvar 136, bvar 1172, bvar 1176]),
    bnot (bands [bvar 132, bvar 137, bvar 1172, bvar 1177]),
    bnot (bands [bvar 132, bvar 138, bvar 1172, bvar 1178]),
    bnot (bands [bvar 132, bvar 139, bvar 1172, bvar 1179]),
    bnot (bands [bvar 132, bvar 143, bvar 1172, bvar 1183]),
    bnot (bands [bvar 133, bvar 135, bvar 1173, bvar 1175]),
    bnot (bands [bvar 135, bvar 136, bvar 1175, bvar 1176]),
    bnot (bands [bvar 135, bvar 137, bvar 1175, bvar 1177]),
    bnot (bands [bvar 135, bvar 138, bvar 1175, bvar 1178]),
    bnot (bands [bvar 135, bvar 139, bvar 1175, bvar 1179]),
    bnot (bands [bvar 135, bvar 143, bvar 1175, bvar 1183]),
    bnot (bands [bvar 135, bvar 144, bvar 1175, bvar 1184]),
    bnot (bands [bvar 136, bvar 143, bvar 1176, bvar 1183]),
    bnot (bands [bvar 138, bvar 143, bvar 1178, bvar 1183]),
    bnot (bands [bvar 138, bvar 144, bvar 1178, bvar 1184]),
    bnot (bands [bvar 139, bvar 143, bvar 1179, bvar 1183]),
    bnot (bands [bvar 139, bvar 144, bvar 1179, bvar 1184]) ]

def reducedUnionChunk069 : BVLogicalExpr :=
  bands reducedUnionChunk069Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
