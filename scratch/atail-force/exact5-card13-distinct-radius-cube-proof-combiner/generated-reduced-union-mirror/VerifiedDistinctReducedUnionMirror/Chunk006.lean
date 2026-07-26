import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk006Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1061, bvar 1064, bvar 1087, bvar 1090]),
    bnot (bands [bvar 1061, bvar 1066, bvar 1087, bvar 1092]),
    bnot (bands [bvar 1061, bvar 1067, bvar 1087, bvar 1093]),
    bnot (bands [bvar 1062, bvar 1063, bvar 1088, bvar 1089]),
    bnot (bands [bvar 1062, bvar 1067, bvar 1088, bvar 1093]),
    bnot (bands [bvar 1063, bvar 1065, bvar 1089, bvar 1091]),
    bnot (bands [bvar 1063, bvar 1067, bvar 1089, bvar 1093]),
    bnot (bands [bvar 1064, bvar 1067, bvar 1090, bvar 1093]),
    bnot (bands [bvar 1066, bvar 1067, bvar 1092, bvar 1093]),
    bnot (bands [bvar 1055, bvar 1061, bvar 1094, bvar 1100]),
    bnot (bands [bvar 1055, bvar 1062, bvar 1094, bvar 1101]),
    bnot (bands [bvar 1055, bvar 1063, bvar 1094, bvar 1102]),
    bnot (bands [bvar 1055, bvar 1064, bvar 1094, bvar 1103]),
    bnot (bands [bvar 1055, bvar 1065, bvar 1094, bvar 1104]),
    bnot (bands [bvar 1055, bvar 1066, bvar 1094, bvar 1105]),
    bnot (bands [bvar 1055, bvar 1067, bvar 1094, bvar 1106]),
    bnot (bands [bvar 1061, bvar 1066, bvar 1100, bvar 1105]),
    bnot (bands [bvar 1062, bvar 1065, bvar 1101, bvar 1104]),
    bnot (bands [bvar 1062, bvar 1067, bvar 1101, bvar 1106]),
    bnot (bands [bvar 1063, bvar 1066, bvar 1102, bvar 1105]),
    bnot (bands [bvar 1063, bvar 1067, bvar 1102, bvar 1106]),
    bnot (bands [bvar 1065, bvar 1067, bvar 1104, bvar 1106]),
    bnot (bands [bvar 1063, bvar 1067, bvar 1115, bvar 1119]),
    bnot (bands [bvar 1055, bvar 1062, bvar 1120, bvar 1127]),
    bnot (bands [bvar 1055, bvar 1063, bvar 1120, bvar 1128]),
    bnot (bands [bvar 1055, bvar 1065, bvar 1120, bvar 1130]),
    bnot (bands [bvar 1055, bvar 1066, bvar 1120, bvar 1131]),
    bnot (bands [bvar 1057, bvar 1059, bvar 1122, bvar 1124]),
    bnot (bands [bvar 1058, bvar 1059, bvar 1123, bvar 1124]),
    bnot (bands [bvar 1058, bvar 1060, bvar 1123, bvar 1125]),
    bnot (bands [bvar 1059, bvar 1060, bvar 1124, bvar 1125]),
    bnot (bands [bvar 1062, bvar 1063, bvar 1127, bvar 1128]),
    bnot (bands [bvar 1062, bvar 1064, bvar 1127, bvar 1129]),
    bnot (bands [bvar 1062, bvar 1065, bvar 1127, bvar 1130]),
    bnot (bands [bvar 1062, bvar 1066, bvar 1127, bvar 1131]),
    bnot (bands [bvar 1062, bvar 1067, bvar 1127, bvar 1132]),
    bnot (bands [bvar 1063, bvar 1064, bvar 1128, bvar 1129]),
    bnot (bands [bvar 1063, bvar 1065, bvar 1128, bvar 1130]),
    bnot (bands [bvar 1063, bvar 1066, bvar 1128, bvar 1131]),
    bnot (bands [bvar 1063, bvar 1067, bvar 1128, bvar 1132]),
    bnot (bands [bvar 1064, bvar 1065, bvar 1129, bvar 1130]),
    bnot (bands [bvar 1064, bvar 1066, bvar 1129, bvar 1131]),
    bnot (bands [bvar 1064, bvar 1067, bvar 1129, bvar 1132]),
    bnot (bands [bvar 1065, bvar 1066, bvar 1130, bvar 1131]),
    bnot (bands [bvar 1065, bvar 1067, bvar 1130, bvar 1132]),
    bnot (bands [bvar 1066, bvar 1067, bvar 1131, bvar 1132]),
    bnot (bands [bvar 1055, bvar 1063, bvar 1133, bvar 1141]),
    bnot (bands [bvar 1055, bvar 1064, bvar 1133, bvar 1142]),
    bnot (bands [bvar 1055, bvar 1065, bvar 1133, bvar 1143]),
    bnot (bands [bvar 1055, bvar 1067, bvar 1133, bvar 1145]),
    bnot (bands [bvar 1058, bvar 1060, bvar 1136, bvar 1138]),
    bnot (bands [bvar 1059, bvar 1060, bvar 1137, bvar 1138]),
    bnot (bands [bvar 1059, bvar 1061, bvar 1137, bvar 1139]),
    bnot (bands [bvar 1060, bvar 1061, bvar 1138, bvar 1139]),
    bnot (bands [bvar 1063, bvar 1064, bvar 1141, bvar 1142]),
    bnot (bands [bvar 1063, bvar 1065, bvar 1141, bvar 1143]),
    bnot (bands [bvar 1064, bvar 1065, bvar 1142, bvar 1143]),
    bnot (bands [bvar 1064, bvar 1066, bvar 1142, bvar 1144]),
    bnot (bands [bvar 1064, bvar 1067, bvar 1142, bvar 1145]),
    bnot (bands [bvar 1065, bvar 1066, bvar 1143, bvar 1144]),
    bnot (bands [bvar 1065, bvar 1067, bvar 1143, bvar 1145]),
    bnot (bands [bvar 1066, bvar 1067, bvar 1144, bvar 1145]),
    bnot (bands [bvar 1055, bvar 1066, bvar 1172, bvar 1183]),
    bnot (bands [bvar 1059, bvar 1062, bvar 1176, bvar 1179]) ]

def reducedUnionChunk006 : BVLogicalExpr :=
  bands reducedUnionChunk006Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
