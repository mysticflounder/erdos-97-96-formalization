import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk020Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1049, bvar 1053, bvar 1088, bvar 1092]),
    bnot (bands [bvar 1047, bvar 1051, bvar 1099, bvar 1103]),
    bnot (bands [bvar 1047, bvar 1052, bvar 1099, bvar 1104]),
    bnot (bands [bvar 1047, bvar 1053, bvar 1099, bvar 1105]),
    bnot (bands [bvar 1047, bvar 1054, bvar 1099, bvar 1106]),
    bnot (bands [bvar 1048, bvar 1051, bvar 1100, bvar 1103]),
    bnot (bands [bvar 1048, bvar 1052, bvar 1100, bvar 1104]),
    bnot (bands [bvar 1048, bvar 1053, bvar 1100, bvar 1105]),
    bnot (bands [bvar 1048, bvar 1054, bvar 1100, bvar 1106]),
    bnot (bands [bvar 1049, bvar 1051, bvar 1101, bvar 1103]),
    bnot (bands [bvar 1049, bvar 1052, bvar 1101, bvar 1104]),
    bnot (bands [bvar 1049, bvar 1053, bvar 1101, bvar 1105]),
    bnot (bands [bvar 1049, bvar 1054, bvar 1101, bvar 1106]),
    bnot (bands [bvar 1061, bvar 1062, bvar 1087, bvar 1088]),
    bnot (bands [bvar 1061, bvar 1063, bvar 1087, bvar 1089]),
    bnot (bands [bvar 1061, bvar 1064, bvar 1087, bvar 1090]),
    bnot (bands [bvar 1061, bvar 1065, bvar 1087, bvar 1091]),
    bnot (bands [bvar 1061, bvar 1067, bvar 1087, bvar 1093]),
    bnot (bands [bvar 1062, bvar 1063, bvar 1088, bvar 1089]),
    bnot (bands [bvar 1062, bvar 1064, bvar 1088, bvar 1090]),
    bnot (bands [bvar 1062, bvar 1065, bvar 1088, bvar 1091]),
    bnot (bands [bvar 1062, bvar 1066, bvar 1088, bvar 1092]),
    bnot (bands [bvar 1062, bvar 1067, bvar 1088, bvar 1093]),
    bnot (bands [bvar 1063, bvar 1067, bvar 1089, bvar 1093]),
    bnot (bands [bvar 1064, bvar 1067, bvar 1090, bvar 1093]),
    bnot (bands [bvar 1061, bvar 1064, bvar 1100, bvar 1103]),
    bnot (bands [bvar 1061, bvar 1065, bvar 1100, bvar 1104]),
    bnot (bands [bvar 1061, bvar 1066, bvar 1100, bvar 1105]),
    bnot (bands [bvar 1062, bvar 1064, bvar 1101, bvar 1103]),
    bnot (bands [bvar 1062, bvar 1067, bvar 1101, bvar 1106]),
    bnot (bands [bvar 1063, bvar 1064, bvar 1102, bvar 1103]),
    bnot (bands [bvar 1063, bvar 1065, bvar 1102, bvar 1104]),
    bnot (bands [bvar 1064, bvar 1065, bvar 1103, bvar 1104]),
    bnot (bands [bvar 1064, bvar 1067, bvar 1103, bvar 1106]),
    bnot (bands [bvar 1065, bvar 1066, bvar 1104, bvar 1105]),
    bnot (bands [bvar 1065, bvar 1067, bvar 1104, bvar 1106]),
    bnot (bands [bvar 1066, bvar 1067, bvar 1105, bvar 1106]),
    bnot (bands [bvar 1073, bvar 1077, bvar 1086, bvar 1090]),
    bnot (bands [bvar 1073, bvar 1078, bvar 1086, bvar 1091]),
    bnot (bands [bvar 1073, bvar 1080, bvar 1086, bvar 1093]),
    bnot (bands [bvar 1073, bvar 1080, bvar 1099, bvar 1106]),
    bnot (bands [bvar 1086, bvar 1091, bvar 1099, bvar 1104]),
    bnot (bands [bvar 1086, bvar 1093, bvar 1099, bvar 1106]),
    bnot (bands [bvar 1087, bvar 1090, bvar 1100, bvar 1103]),
    bnot (bands [bvar 1087, bvar 1091, bvar 1100, bvar 1104]),
    bnot (bands [bvar 1087, bvar 1092, bvar 1100, bvar 1105]),
    bnot (bands [bvar 1087, bvar 1093, bvar 1100, bvar 1106]),
    bnot (bands [bvar 1088, bvar 1090, bvar 1101, bvar 1103]),
    bnot (bands [bvar 1088, bvar 1091, bvar 1101, bvar 1104]),
    bnot (bands [bvar 1088, bvar 1092, bvar 1101, bvar 1105]),
    bnot (bands [bvar 1088, bvar 1093, bvar 1101, bvar 1106]),
    bnot (bands [bvar 1089, bvar 1090, bvar 1102, bvar 1103]),
    bnot (bands [bvar 1089, bvar 1092, bvar 1102, bvar 1105]),
    bnot (bands [bvar 1089, bvar 1093, bvar 1102, bvar 1106]),
    bnot (bands [bvar 1090, bvar 1091, bvar 1103, bvar 1104]),
    bnot (bands [bvar 1090, bvar 1092, bvar 1103, bvar 1105]),
    bnot (bands [bvar 1090, bvar 1093, bvar 1103, bvar 1106]),
    bnot (bands [bvar 1091, bvar 1092, bvar 1104, bvar 1105]),
    bnot (bvar 28),
    exactly [bvar 28, bvar 29, bvar 30, bvar 31, bvar 32, bvar 33, bvar 34, bvar 35, bvar 36, bvar 37, bvar 38, bvar 39, bvar 40] 4,
    bnot (bvar 42),
    exactly [bvar 41, bvar 42, bvar 43, bvar 44, bvar 45, bvar 46, bvar 47, bvar 48, bvar 49, bvar 50, bvar 51, bvar 52, bvar 53] 4,
    bnot (bvar 70),
    exactly [bvar 67, bvar 68, bvar 69, bvar 70, bvar 71, bvar 72, bvar 73, bvar 74, bvar 75, bvar 76, bvar 77, bvar 78, bvar 79] 4 ]

def reducedUnionChunk020 : BVLogicalExpr :=
  bands reducedUnionChunk020Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
