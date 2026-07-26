import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk055Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1059, bvar 1063, bvar 71, bvar 75]),
    bnot (bands [bvar 1059, bvar 1064, bvar 71, bvar 76]),
    bnot (bands [bvar 1059, bvar 1065, bvar 71, bvar 77]),
    bnot (bands [bvar 1059, bvar 1066, bvar 71, bvar 78]),
    bnot (bands [bvar 1059, bvar 1067, bvar 71, bvar 79]),
    bnot (bands [bvar 1060, bvar 1063, bvar 72, bvar 75]),
    bnot (bands [bvar 1061, bvar 1062, bvar 73, bvar 74]),
    bnot (bands [bvar 1061, bvar 1063, bvar 73, bvar 75]),
    bnot (bands [bvar 1061, bvar 1065, bvar 73, bvar 77]),
    bnot (bands [bvar 1061, bvar 1066, bvar 73, bvar 78]),
    bnot (bands [bvar 1062, bvar 1063, bvar 74, bvar 75]),
    bnot (bands [bvar 1063, bvar 1066, bvar 75, bvar 78]),
    bnot (bands [bvar 1064, bvar 1066, bvar 76, bvar 78]),
    bnot (bands [bvar 1065, bvar 1066, bvar 77, bvar 78]),
    bnot (bands [bvar 1065, bvar 1067, bvar 77, bvar 79]),
    bnot (bands [bvar 41, bvar 49, bvar 1094, bvar 1102]),
    bnot (bands [bvar 41, bvar 50, bvar 1094, bvar 1103]),
    bnot (bands [bvar 41, bvar 51, bvar 1094, bvar 1104]),
    bnot (bands [bvar 41, bvar 52, bvar 1094, bvar 1105]),
    bnot (bands [bvar 49, bvar 51, bvar 1102, bvar 1104]),
    bnot (bands [bvar 49, bvar 53, bvar 1102, bvar 1106]),
    bnot (bands [bvar 52, bvar 53, bvar 1105, bvar 1106]),
    bnot (bands [bvar 1058, bvar 1059, bvar 135, bvar 136]),
    bnot (bands [bvar 1058, bvar 1061, bvar 135, bvar 138]),
    bnot (bands [bvar 1058, bvar 1062, bvar 135, bvar 139]),
    bnot (bands [bvar 1057, bvar 1059, bvar 147, bvar 149]),
    bnot (bands [bvar 1058, bvar 1059, bvar 148, bvar 149]),
    bnot (bands [bvar 1059, bvar 1060, bvar 149, bvar 150]),
    bnot (bands [bvar 1059, bvar 1061, bvar 149, bvar 151]),
    bnot (bands [bvar 1059, bvar 1062, bvar 149, bvar 152]),
    bnot (bands [bvar 1059, bvar 1063, bvar 149, bvar 153]),
    bnot (bands [bvar 1060, bvar 1063, bvar 150, bvar 153]),
    bnot (bands [bvar 44, bvar 48, bvar 1162, bvar 1166]),
    bnot (bands [bvar 45, bvar 47, bvar 1163, bvar 1165]),
    bnot (bands [bvar 47, bvar 48, bvar 1165, bvar 1166]),
    bnot (bands [bvar 47, bvar 49, bvar 1165, bvar 1167]),
    bnot (bands [bvar 48, bvar 49, bvar 1166, bvar 1167]),
    bnot (bands [bvar 44, bvar 46, bvar 1175, bvar 1177]),
    bnot (bands [bvar 45, bvar 48, bvar 1176, bvar 1179]),
    bnot (bands [bvar 45, bvar 49, bvar 1176, bvar 1180]),
    bnot (bands [bvar 46, bvar 48, bvar 1177, bvar 1179]),
    bnot (bands [bvar 46, bvar 49, bvar 1177, bvar 1180]),
    bnot (bands [bvar 46, bvar 50, bvar 1177, bvar 1181]),
    bnot (bands [bvar 48, bvar 49, bvar 1179, bvar 1180]),
    bnot (bands [bvar 48, bvar 50, bvar 1179, bvar 1181]),
    bnot (bands [bvar 49, bvar 50, bvar 1180, bvar 1181]),
    bnot (bands [bvar 43, bvar 47, bvar 1187, bvar 1191]),
    bnot (bands [bvar 43, bvar 48, bvar 1187, bvar 1192]),
    bnot (bands [bvar 43, bvar 51, bvar 1187, bvar 1195]),
    bnot (bands [bvar 44, bvar 48, bvar 1188, bvar 1192]),
    bnot (bands [bvar 44, bvar 49, bvar 1188, bvar 1193]),
    bnot (bands [bvar 44, bvar 50, bvar 1188, bvar 1194]),
    bnot (bands [bvar 44, bvar 51, bvar 1188, bvar 1195]),
    bnot (bands [bvar 45, bvar 48, bvar 1189, bvar 1192]),
    bnot (bands [bvar 45, bvar 49, bvar 1189, bvar 1193]),
    bnot (bands [bvar 45, bvar 51, bvar 1189, bvar 1195]),
    bnot (bands [bvar 47, bvar 48, bvar 1191, bvar 1192]),
    bnot (bands [bvar 47, bvar 49, bvar 1191, bvar 1193]),
    bnot (bands [bvar 47, bvar 50, bvar 1191, bvar 1194]),
    bnot (bands [bvar 47, bvar 51, bvar 1191, bvar 1195]),
    bnot (bands [bvar 48, bvar 49, bvar 1192, bvar 1193]),
    bnot (bands [bvar 48, bvar 50, bvar 1192, bvar 1194]),
    bnot (bands [bvar 48, bvar 51, bvar 1192, bvar 1195]),
    bnot (bands [bvar 49, bvar 50, bvar 1193, bvar 1194]) ]

def reducedUnionChunk055 : BVLogicalExpr :=
  bands reducedUnionChunk055Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
