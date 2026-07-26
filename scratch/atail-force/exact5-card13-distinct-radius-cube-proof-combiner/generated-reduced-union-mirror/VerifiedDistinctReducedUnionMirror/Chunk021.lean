import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk021Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1047, bvar 1051, bvar 1086, bvar 1090]),
    bnot (bands [bvar 1047, bvar 1052, bvar 1086, bvar 1091]),
    bnot (bands [bvar 1047, bvar 1053, bvar 1086, bvar 1092]),
    bnot (bands [bvar 1047, bvar 1054, bvar 1086, bvar 1093]),
    bnot (bands [bvar 1048, bvar 1049, bvar 1087, bvar 1088]),
    bnot (bands [bvar 1048, bvar 1050, bvar 1087, bvar 1089]),
    bnot (bands [bvar 1048, bvar 1051, bvar 1087, bvar 1090]),
    bnot (bands [bvar 1048, bvar 1052, bvar 1087, bvar 1091]),
    bnot (bands [bvar 1048, bvar 1053, bvar 1087, bvar 1092]),
    bnot (bands [bvar 1048, bvar 1054, bvar 1087, bvar 1093]),
    bnot (bands [bvar 1049, bvar 1050, bvar 1088, bvar 1089]),
    bnot (bands [bvar 1049, bvar 1051, bvar 1088, bvar 1090]),
    bnot (bands [bvar 1049, bvar 1052, bvar 1088, bvar 1091]),
    bnot (bands [bvar 1049, bvar 1053, bvar 1088, bvar 1092]),
    bnot (bands [bvar 1049, bvar 1054, bvar 1088, bvar 1093]),
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
    bnot (bands [bvar 1062, bvar 1067, bvar 1075, bvar 1080]),
    bnot (bands [bvar 1060, bvar 1061, bvar 1086, bvar 1087]),
    bnot (bands [bvar 1060, bvar 1063, bvar 1086, bvar 1089]),
    bnot (bands [bvar 1060, bvar 1064, bvar 1086, bvar 1090]),
    bnot (bands [bvar 1060, bvar 1067, bvar 1086, bvar 1093]),
    bnot (bands [bvar 1061, bvar 1062, bvar 1087, bvar 1088]),
    bnot (bands [bvar 1061, bvar 1063, bvar 1087, bvar 1089]),
    bnot (bands [bvar 1061, bvar 1065, bvar 1087, bvar 1091]),
    bnot (bands [bvar 1061, bvar 1066, bvar 1087, bvar 1092]),
    bnot (bands [bvar 1061, bvar 1067, bvar 1087, bvar 1093]),
    bnot (bands [bvar 1062, bvar 1063, bvar 1088, bvar 1089]),
    bnot (bands [bvar 1062, bvar 1064, bvar 1088, bvar 1090]),
    bnot (bands [bvar 1062, bvar 1065, bvar 1088, bvar 1091]),
    bnot (bands [bvar 1062, bvar 1066, bvar 1088, bvar 1092]),
    bnot (bands [bvar 1062, bvar 1067, bvar 1088, bvar 1093]),
    bnot (bands [bvar 1063, bvar 1064, bvar 1089, bvar 1090]),
    bnot (bands [bvar 1063, bvar 1066, bvar 1089, bvar 1092]),
    bnot (bands [bvar 1063, bvar 1067, bvar 1089, bvar 1093]),
    bnot (bands [bvar 1064, bvar 1065, bvar 1090, bvar 1091]),
    bnot (bands [bvar 1064, bvar 1066, bvar 1090, bvar 1092]),
    bnot (bands [bvar 1065, bvar 1066, bvar 1091, bvar 1092]),
    bnot (bands [bvar 1065, bvar 1067, bvar 1091, bvar 1093]),
    bnot (bands [bvar 1066, bvar 1067, bvar 1092, bvar 1093]),
    bnot (bands [bvar 1061, bvar 1064, bvar 1100, bvar 1103]),
    bnot (bands [bvar 1061, bvar 1065, bvar 1100, bvar 1104]),
    bnot (bands [bvar 1061, bvar 1067, bvar 1100, bvar 1106]),
    bnot (bands [bvar 1062, bvar 1065, bvar 1101, bvar 1104]),
    bnot (bands [bvar 1062, bvar 1066, bvar 1101, bvar 1105]),
    bnot (bands [bvar 1062, bvar 1067, bvar 1101, bvar 1106]),
    bnot (bands [bvar 1063, bvar 1064, bvar 1102, bvar 1103]),
    bnot (bands [bvar 1063, bvar 1067, bvar 1102, bvar 1106]),
    bnot (bands [bvar 1064, bvar 1065, bvar 1103, bvar 1104]),
    bnot (bands [bvar 1064, bvar 1066, bvar 1103, bvar 1105]),
    bnot (bands [bvar 1064, bvar 1067, bvar 1103, bvar 1106]),
    bnot (bands [bvar 1065, bvar 1066, bvar 1104, bvar 1105]),
    bnot (bands [bvar 1065, bvar 1067, bvar 1104, bvar 1106]),
    bnot (bands [bvar 1066, bvar 1067, bvar 1105, bvar 1106]) ]

def reducedUnionChunk021 : BVLogicalExpr :=
  bands reducedUnionChunk021Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
