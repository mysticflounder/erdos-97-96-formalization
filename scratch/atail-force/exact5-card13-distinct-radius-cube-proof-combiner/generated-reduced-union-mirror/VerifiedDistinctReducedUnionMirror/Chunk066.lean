import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk066Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1122, bvar 1125, bvar 173, bvar 176]),
    bnot (bands [bvar 1122, bvar 1132, bvar 173, bvar 183]),
    bnot (bands [bvar 1123, bvar 1124, bvar 174, bvar 175]),
    bnot (bands [bvar 1123, bvar 1125, bvar 174, bvar 176]),
    bnot (bands [bvar 1123, bvar 1132, bvar 174, bvar 183]),
    bnot (bands [bvar 1124, bvar 1125, bvar 175, bvar 176]),
    bnot (bands [bvar 1124, bvar 1132, bvar 175, bvar 183]),
    bnot (bands [bvar 1125, bvar 1132, bvar 176, bvar 183]),
    bnot (bands [bvar 1127, bvar 1128, bvar 178, bvar 179]),
    bnot (bands [bvar 1127, bvar 1130, bvar 178, bvar 181]),
    bnot (bands [bvar 1128, bvar 1129, bvar 179, bvar 180]),
    bnot (bands [bvar 1128, bvar 1130, bvar 179, bvar 181]),
    bnot (bands [bvar 1129, bvar 1130, bvar 180, bvar 181]),
    bnot (bands [bvar 1120, bvar 1121, bvar 184, bvar 185]),
    bnot (bands [bvar 1120, bvar 1122, bvar 184, bvar 186]),
    bnot (bands [bvar 1120, bvar 1123, bvar 184, bvar 187]),
    bnot (bands [bvar 1120, bvar 1124, bvar 184, bvar 188]),
    bnot (bands [bvar 1120, bvar 1125, bvar 184, bvar 189]),
    bnot (bands [bvar 1121, bvar 1124, bvar 185, bvar 188]),
    bnot (bands [bvar 1121, bvar 1125, bvar 185, bvar 189]),
    bnot (bands [bvar 1122, bvar 1124, bvar 186, bvar 188]),
    bnot (bands [bvar 1123, bvar 1124, bvar 187, bvar 188]),
    bnot (bands [bvar 1123, bvar 1125, bvar 187, bvar 189]),
    bnot (bands [bvar 1124, bvar 1125, bvar 188, bvar 189]),
    bnot (bands [bvar 1127, bvar 1128, bvar 191, bvar 192]),
    bnot (bands [bvar 1127, bvar 1130, bvar 191, bvar 194]),
    bnot (bands [bvar 1127, bvar 1131, bvar 191, bvar 195]),
    bnot (bands [bvar 1128, bvar 1129, bvar 192, bvar 193]),
    bnot (bands [bvar 1128, bvar 1130, bvar 192, bvar 194]),
    bnot (bands [bvar 1128, bvar 1131, bvar 192, bvar 195]),
    bnot (bands [bvar 1129, bvar 1130, bvar 193, bvar 194]),
    bnot (bands [bvar 1129, bvar 1131, bvar 193, bvar 195]),
    bnot (bands [bvar 1130, bvar 1131, bvar 194, bvar 195]),
    bnot (bands [bvar 114, bvar 115, bvar 1206, bvar 1207]),
    bnot (bands [bvar 1133, bvar 1136, bvar 132, bvar 135]),
    bnot (bands [bvar 1133, bvar 1137, bvar 132, bvar 136]),
    bnot (bands [bvar 1133, bvar 1139, bvar 132, bvar 138]),
    bnot (bands [bvar 1133, bvar 1143, bvar 132, bvar 142]),
    bnot (bands [bvar 1133, bvar 1144, bvar 132, bvar 143]),
    bnot (bands [bvar 1136, bvar 1137, bvar 135, bvar 136]),
    bnot (bands [bvar 1136, bvar 1139, bvar 135, bvar 138]),
    bnot (bands [bvar 1136, bvar 1142, bvar 135, bvar 141]),
    bnot (bands [bvar 1136, bvar 1143, bvar 135, bvar 142]),
    bnot (bands [bvar 1136, bvar 1144, bvar 135, bvar 143]),
    bnot (bands [bvar 1136, bvar 1145, bvar 135, bvar 144]),
    bnot (bands [bvar 1137, bvar 1139, bvar 136, bvar 138]),
    bnot (bands [bvar 1137, bvar 1142, bvar 136, bvar 141]),
    bnot (bands [bvar 1137, bvar 1143, bvar 136, bvar 142]),
    bnot (bands [bvar 1137, bvar 1144, bvar 136, bvar 143]),
    bnot (bands [bvar 1137, bvar 1145, bvar 136, bvar 144]),
    bnot (bands [bvar 1139, bvar 1142, bvar 138, bvar 141]),
    bnot (bands [bvar 1139, bvar 1143, bvar 138, bvar 142]),
    bnot (bands [bvar 1139, bvar 1144, bvar 138, bvar 143]),
    bnot (bands [bvar 1139, bvar 1145, bvar 138, bvar 144]),
    bnot (bands [bvar 119, bvar 125, bvar 1159, bvar 1165]),
    bnot (bands [bvar 124, bvar 125, bvar 1164, bvar 1165]),
    bnot (bands [bvar 124, bvar 130, bvar 1164, bvar 1170]),
    bnot (bands [bvar 124, bvar 131, bvar 1164, bvar 1171]),
    bnot (bands [bvar 125, bvar 130, bvar 1165, bvar 1170]),
    bnot (bands [bvar 125, bvar 131, bvar 1165, bvar 1171]),
    bnot (bands [bvar 129, bvar 130, bvar 1169, bvar 1170]),
    bnot (bands [bvar 129, bvar 131, bvar 1169, bvar 1171]),
    bnot (bands [bvar 130, bvar 131, bvar 1170, bvar 1171]),
    bnot (bands [bvar 119, bvar 122, bvar 1172, bvar 1175]) ]

def reducedUnionChunk066 : BVLogicalExpr :=
  bands reducedUnionChunk066Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
