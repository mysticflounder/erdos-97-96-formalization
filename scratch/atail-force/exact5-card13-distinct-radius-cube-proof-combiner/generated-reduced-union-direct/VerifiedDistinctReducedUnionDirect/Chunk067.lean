import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk067Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1124, bvar 1125, bvar 149, bvar 150]),
    bnot (bands [bvar 1124, bvar 1130, bvar 149, bvar 155]),
    bnot (bands [bvar 1124, bvar 1131, bvar 149, bvar 156]),
    bnot (bands [bvar 1124, bvar 1132, bvar 149, bvar 157]),
    bnot (bands [bvar 1125, bvar 1130, bvar 150, bvar 155]),
    bnot (bands [bvar 1125, bvar 1131, bvar 150, bvar 156]),
    bnot (bands [bvar 1125, bvar 1132, bvar 150, bvar 157]),
    bnot (bands [bvar 1130, bvar 1131, bvar 155, bvar 156]),
    bnot (bands [bvar 1130, bvar 1132, bvar 155, bvar 157]),
    bnot (bands [bvar 1131, bvar 1132, bvar 156, bvar 157]),
    bnot (bands [bvar 1123, bvar 1124, bvar 161, bvar 162]),
    bnot (bands [bvar 1124, bvar 1131, bvar 162, bvar 169]),
    bnot (bands [bvar 1124, bvar 1132, bvar 162, bvar 170]),
    bnot (bands [bvar 1127, bvar 1128, bvar 165, bvar 166]),
    bnot (bands [bvar 1131, bvar 1132, bvar 169, bvar 170]),
    bnot (bands [bvar 106, bvar 111, bvar 1172, bvar 1177]),
    bnot (bands [bvar 107, bvar 111, bvar 1173, bvar 1177]),
    bnot (bands [bvar 107, bvar 117, bvar 1173, bvar 1183]),
    bnot (bands [bvar 108, bvar 111, bvar 1174, bvar 1177]),
    bnot (bands [bvar 109, bvar 111, bvar 1175, bvar 1177]),
    bnot (bands [bvar 110, bvar 111, bvar 1176, bvar 1177]),
    bnot (bands [bvar 110, bvar 117, bvar 1176, bvar 1183]),
    bnot (bands [bvar 110, bvar 118, bvar 1176, bvar 1184]),
    bnot (bands [bvar 111, bvar 117, bvar 1177, bvar 1183]),
    bnot (bands [bvar 111, bvar 118, bvar 1177, bvar 1184]),
    bnot (bands [bvar 113, bvar 114, bvar 1179, bvar 1180]),
    bnot (bands [bvar 117, bvar 118, bvar 1183, bvar 1184]),
    bnot (bands [bvar 1121, bvar 1132, bvar 172, bvar 183]),
    bnot (bands [bvar 1124, bvar 1125, bvar 175, bvar 176]),
    bnot (bands [bvar 1127, bvar 1128, bvar 178, bvar 179]),
    bnot (bands [bvar 1127, bvar 1129, bvar 178, bvar 180]),
    bnot (bands [bvar 1128, bvar 1129, bvar 179, bvar 180]),
    bnot (bands [bvar 1128, bvar 1130, bvar 179, bvar 181]),
    bnot (bands [bvar 1120, bvar 1121, bvar 184, bvar 185]),
    bnot (bands [bvar 1120, bvar 1124, bvar 184, bvar 188]),
    bnot (bands [bvar 1121, bvar 1124, bvar 185, bvar 188]),
    bnot (bands [bvar 1124, bvar 1125, bvar 188, bvar 189]),
    bnot (bands [bvar 1128, bvar 1129, bvar 192, bvar 193]),
    bnot (bands [bvar 1128, bvar 1130, bvar 192, bvar 194]),
    bnot (bands [bvar 1129, bvar 1130, bvar 193, bvar 194]),
    bnot (bands [bvar 1129, bvar 1131, bvar 193, bvar 195]),
    bnot (bands [bvar 1133, bvar 1136, bvar 132, bvar 135]),
    bnot (bands [bvar 1133, bvar 1137, bvar 132, bvar 136]),
    bnot (bands [bvar 1133, bvar 1139, bvar 132, bvar 138]),
    bnot (bands [bvar 1133, bvar 1144, bvar 132, bvar 143]),
    bnot (bands [bvar 1133, bvar 1145, bvar 132, bvar 144]),
    bnot (bands [bvar 1135, bvar 1142, bvar 134, bvar 141]),
    bnot (bands [bvar 1136, bvar 1137, bvar 135, bvar 136]),
    bnot (bands [bvar 1136, bvar 1139, bvar 135, bvar 138]),
    bnot (bands [bvar 1136, bvar 1142, bvar 135, bvar 141]),
    bnot (bands [bvar 1136, bvar 1143, bvar 135, bvar 142]),
    bnot (bands [bvar 1136, bvar 1144, bvar 135, bvar 143]),
    bnot (bands [bvar 1136, bvar 1145, bvar 135, bvar 144]),
    bnot (bands [bvar 1137, bvar 1142, bvar 136, bvar 141]),
    bnot (bands [bvar 1137, bvar 1143, bvar 136, bvar 142]),
    bnot (bands [bvar 1137, bvar 1144, bvar 136, bvar 143]),
    bnot (bands [bvar 1137, bvar 1145, bvar 136, bvar 144]),
    bnot (bands [bvar 1139, bvar 1142, bvar 138, bvar 141]),
    bnot (bands [bvar 1139, bvar 1143, bvar 138, bvar 142]),
    bnot (bands [bvar 1139, bvar 1144, bvar 138, bvar 143]),
    bnot (bands [bvar 1139, bvar 1145, bvar 138, bvar 144]),
    bnot (bands [bvar 1135, bvar 1138, bvar 147, bvar 150]),
    bnot (bands [bvar 1135, bvar 1143, bvar 147, bvar 155]),
    bnot (bands [bvar 1136, bvar 1138, bvar 148, bvar 150]) ]

def reducedUnionChunk067 : BVLogicalExpr :=
  bands reducedUnionChunk067Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
