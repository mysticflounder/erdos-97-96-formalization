import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk058Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 68, bvar 79, bvar 1160, bvar 1171]),
    bnot (bands [bvar 71, bvar 72, bvar 1163, bvar 1164]),
    bnot (bands [bvar 71, bvar 74, bvar 1163, bvar 1166]),
    bnot (bands [bvar 71, bvar 75, bvar 1163, bvar 1167]),
    bnot (bands [bvar 72, bvar 75, bvar 1164, bvar 1167]),
    bnot (bands [bvar 73, bvar 74, bvar 1165, bvar 1166]),
    bnot (bands [bvar 77, bvar 78, bvar 1169, bvar 1170]),
    bnot (bands [bvar 1081, bvar 1093, bvar 158, bvar 170]),
    bnot (bands [bvar 1082, bvar 1092, bvar 159, bvar 169]),
    bnot (bands [bvar 1082, bvar 1093, bvar 159, bvar 170]),
    bnot (bands [bvar 1085, bvar 1086, bvar 162, bvar 163]),
    bnot (bands [bvar 1085, bvar 1087, bvar 162, bvar 164]),
    bnot (bands [bvar 1085, bvar 1088, bvar 162, bvar 165]),
    bnot (bands [bvar 1085, bvar 1089, bvar 162, bvar 166]),
    bnot (bands [bvar 1085, bvar 1090, bvar 162, bvar 167]),
    bnot (bands [bvar 1086, bvar 1088, bvar 163, bvar 165]),
    bnot (bands [bvar 1086, bvar 1089, bvar 163, bvar 166]),
    bnot (bands [bvar 1086, bvar 1090, bvar 163, bvar 167]),
    bnot (bands [bvar 1087, bvar 1088, bvar 164, bvar 165]),
    bnot (bands [bvar 1087, bvar 1089, bvar 164, bvar 166]),
    bnot (bands [bvar 1087, bvar 1090, bvar 164, bvar 167]),
    bnot (bands [bvar 1088, bvar 1089, bvar 165, bvar 166]),
    bnot (bands [bvar 1088, bvar 1090, bvar 165, bvar 167]),
    bnot (bands [bvar 1089, bvar 1090, bvar 166, bvar 167]),
    bnot (bands [bvar 1092, bvar 1093, bvar 169, bvar 170]),
    bnot (bands [bvar 71, bvar 74, bvar 1176, bvar 1179]),
    bnot (bands [bvar 71, bvar 76, bvar 1176, bvar 1181]),
    bnot (bands [bvar 72, bvar 75, bvar 1177, bvar 1180]),
    bnot (bands [bvar 74, bvar 75, bvar 1179, bvar 1180]),
    bnot (bands [bvar 75, bvar 76, bvar 1180, bvar 1181]),
    bnot (bands [bvar 1085, bvar 1089, bvar 175, bvar 179]),
    bnot (bands [bvar 1085, bvar 1091, bvar 175, bvar 181]),
    bnot (bands [bvar 67, bvar 68, bvar 1185, bvar 1186]),
    bnot (bands [bvar 67, bvar 79, bvar 1185, bvar 1197]),
    bnot (bands [bvar 68, bvar 79, bvar 1186, bvar 1197]),
    bnot (bands [bvar 71, bvar 72, bvar 1189, bvar 1190]),
    bnot (bands [bvar 71, bvar 73, bvar 1189, bvar 1191]),
    bnot (bands [bvar 71, bvar 74, bvar 1189, bvar 1192]),
    bnot (bands [bvar 71, bvar 75, bvar 1189, bvar 1193]),
    bnot (bands [bvar 71, bvar 76, bvar 1189, bvar 1194]),
    bnot (bands [bvar 71, bvar 77, bvar 1189, bvar 1195]),
    bnot (bands [bvar 72, bvar 73, bvar 1190, bvar 1191]),
    bnot (bands [bvar 72, bvar 74, bvar 1190, bvar 1192]),
    bnot (bands [bvar 72, bvar 75, bvar 1190, bvar 1193]),
    bnot (bands [bvar 72, bvar 76, bvar 1190, bvar 1194]),
    bnot (bands [bvar 72, bvar 77, bvar 1190, bvar 1195]),
    bnot (bands [bvar 73, bvar 74, bvar 1191, bvar 1192]),
    bnot (bands [bvar 73, bvar 75, bvar 1191, bvar 1193]),
    bnot (bands [bvar 73, bvar 76, bvar 1191, bvar 1194]),
    bnot (bands [bvar 73, bvar 77, bvar 1191, bvar 1195]),
    bnot (bands [bvar 74, bvar 75, bvar 1192, bvar 1193]),
    bnot (bands [bvar 74, bvar 76, bvar 1192, bvar 1194]),
    bnot (bands [bvar 74, bvar 77, bvar 1192, bvar 1195]),
    bnot (bands [bvar 75, bvar 76, bvar 1193, bvar 1194]),
    bnot (bands [bvar 75, bvar 77, bvar 1193, bvar 1195]),
    bnot (bands [bvar 76, bvar 77, bvar 1194, bvar 1195]),
    bnot (bands [bvar 1081, bvar 1082, bvar 184, bvar 185]),
    bnot (bands [bvar 1081, bvar 1083, bvar 184, bvar 186]),
    bnot (bands [bvar 1085, bvar 1089, bvar 188, bvar 192]),
    bnot (bands [bvar 1085, bvar 1090, bvar 188, bvar 193]),
    bnot (bands [bvar 1085, bvar 1091, bvar 188, bvar 194]),
    bnot (bands [bvar 1085, bvar 1092, bvar 188, bvar 195]),
    bnot (bands [bvar 1087, bvar 1089, bvar 190, bvar 192]),
    bnot (bands [bvar 1087, bvar 1091, bvar 190, bvar 194]) ]

def reducedUnionChunk058 : BVLogicalExpr :=
  bands reducedUnionChunk058Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
