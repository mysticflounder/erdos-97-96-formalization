import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk005Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1055, bvar 1059, bvar 1081, bvar 1085]),
    bnot (bands [bvar 1055, bvar 1061, bvar 1081, bvar 1087]),
    bnot (bands [bvar 1055, bvar 1062, bvar 1081, bvar 1088]),
    bnot (bands [bvar 1055, bvar 1063, bvar 1081, bvar 1089]),
    bnot (bands [bvar 1055, bvar 1064, bvar 1081, bvar 1090]),
    bnot (bands [bvar 1055, bvar 1065, bvar 1081, bvar 1091]),
    bnot (bands [bvar 1055, bvar 1066, bvar 1081, bvar 1092]),
    bnot (bands [bvar 1055, bvar 1067, bvar 1081, bvar 1093]),
    bnot (bands [bvar 1059, bvar 1060, bvar 1085, bvar 1086]),
    bnot (bands [bvar 1059, bvar 1061, bvar 1085, bvar 1087]),
    bnot (bands [bvar 1059, bvar 1062, bvar 1085, bvar 1088]),
    bnot (bands [bvar 1059, bvar 1063, bvar 1085, bvar 1089]),
    bnot (bands [bvar 1059, bvar 1064, bvar 1085, bvar 1090]),
    bnot (bands [bvar 1059, bvar 1065, bvar 1085, bvar 1091]),
    bnot (bands [bvar 1059, bvar 1066, bvar 1085, bvar 1092]),
    bnot (bands [bvar 1059, bvar 1067, bvar 1085, bvar 1093]),
    bnot (bands [bvar 1060, bvar 1063, bvar 1086, bvar 1089]),
    bnot (bands [bvar 1061, bvar 1066, bvar 1087, bvar 1092]),
    bnot (bands [bvar 1063, bvar 1064, bvar 1089, bvar 1090]),
    bnot (bands [bvar 1063, bvar 1065, bvar 1089, bvar 1091]),
    bnot (bands [bvar 1063, bvar 1066, bvar 1089, bvar 1092]),
    bnot (bands [bvar 1066, bvar 1067, bvar 1092, bvar 1093]),
    bnot (bands [bvar 1055, bvar 1061, bvar 1094, bvar 1100]),
    bnot (bands [bvar 1055, bvar 1063, bvar 1094, bvar 1102]),
    bnot (bands [bvar 1055, bvar 1064, bvar 1094, bvar 1103]),
    bnot (bands [bvar 1055, bvar 1065, bvar 1094, bvar 1104]),
    bnot (bands [bvar 1055, bvar 1066, bvar 1094, bvar 1105]),
    bnot (bands [bvar 1055, bvar 1067, bvar 1094, bvar 1106]),
    bnot (bands [bvar 1060, bvar 1064, bvar 1099, bvar 1103]),
    bnot (bands [bvar 1061, bvar 1067, bvar 1100, bvar 1106]),
    bnot (bands [bvar 1063, bvar 1066, bvar 1102, bvar 1105]),
    bnot (bands [bvar 1063, bvar 1067, bvar 1102, bvar 1106]),
    bnot (bands [bvar 1064, bvar 1066, bvar 1103, bvar 1105]),
    bnot (bands [bvar 1057, bvar 1059, bvar 1122, bvar 1124]),
    bnot (bands [bvar 1058, bvar 1059, bvar 1123, bvar 1124]),
    bnot (bands [bvar 1059, bvar 1060, bvar 1124, bvar 1125]),
    bnot (bands [bvar 1062, bvar 1063, bvar 1127, bvar 1128]),
    bnot (bands [bvar 1062, bvar 1064, bvar 1127, bvar 1129]),
    bnot (bands [bvar 1062, bvar 1065, bvar 1127, bvar 1130]),
    bnot (bands [bvar 1062, bvar 1066, bvar 1127, bvar 1131]),
    bnot (bands [bvar 1062, bvar 1067, bvar 1127, bvar 1132]),
    bnot (bands [bvar 1063, bvar 1064, bvar 1128, bvar 1129]),
    bnot (bands [bvar 1063, bvar 1067, bvar 1128, bvar 1132]),
    bnot (bands [bvar 1064, bvar 1066, bvar 1129, bvar 1131]),
    bnot (bands [bvar 1064, bvar 1067, bvar 1129, bvar 1132]),
    bnot (bands [bvar 1065, bvar 1066, bvar 1130, bvar 1131]),
    bnot (bands [bvar 1065, bvar 1067, bvar 1130, bvar 1132]),
    bnot (bands [bvar 1066, bvar 1067, bvar 1131, bvar 1132]),
    bnot (bands [bvar 1057, bvar 1059, bvar 1187, bvar 1189]),
    bnot (bands [bvar 1057, bvar 1061, bvar 1187, bvar 1191]),
    bnot (bands [bvar 1057, bvar 1062, bvar 1187, bvar 1192]),
    bnot (bands [bvar 1057, bvar 1064, bvar 1187, bvar 1194]),
    bnot (bands [bvar 1058, bvar 1059, bvar 1188, bvar 1189]),
    bnot (bands [bvar 1058, bvar 1061, bvar 1188, bvar 1191]),
    bnot (bands [bvar 1058, bvar 1062, bvar 1188, bvar 1192]),
    bnot (bands [bvar 1058, bvar 1063, bvar 1188, bvar 1193]),
    bnot (bands [bvar 1058, bvar 1064, bvar 1188, bvar 1194]),
    bnot (bands [bvar 1058, bvar 1065, bvar 1188, bvar 1195]),
    bnot (bands [bvar 1059, bvar 1060, bvar 1189, bvar 1190]),
    bnot (bands [bvar 1059, bvar 1061, bvar 1189, bvar 1191]),
    bnot (bands [bvar 1059, bvar 1062, bvar 1189, bvar 1192]),
    bnot (bands [bvar 1059, bvar 1063, bvar 1189, bvar 1193]),
    bnot (bands [bvar 1059, bvar 1064, bvar 1189, bvar 1194]),
    bnot (bands [bvar 1059, bvar 1065, bvar 1189, bvar 1195]) ]

def reducedUnionChunk005 : BVLogicalExpr :=
  bands reducedUnionChunk005Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
