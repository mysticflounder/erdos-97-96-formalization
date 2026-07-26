import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk006Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1060, bvar 1061, bvar 1190, bvar 1191]),
    bnot (bands [bvar 1060, bvar 1062, bvar 1190, bvar 1192]),
    bnot (bands [bvar 1060, bvar 1063, bvar 1190, bvar 1193]),
    bnot (bands [bvar 1060, bvar 1064, bvar 1190, bvar 1194]),
    bnot (bands [bvar 1060, bvar 1065, bvar 1190, bvar 1195]),
    bnot (bands [bvar 1061, bvar 1062, bvar 1191, bvar 1192]),
    bnot (bands [bvar 1061, bvar 1063, bvar 1191, bvar 1193]),
    bnot (bands [bvar 1061, bvar 1064, bvar 1191, bvar 1194]),
    bnot (bands [bvar 1061, bvar 1065, bvar 1191, bvar 1195]),
    bnot (bands [bvar 1062, bvar 1063, bvar 1192, bvar 1193]),
    bnot (bands [bvar 1062, bvar 1064, bvar 1192, bvar 1194]),
    bnot (bands [bvar 1062, bvar 1065, bvar 1192, bvar 1195]),
    bnot (bands [bvar 1063, bvar 1064, bvar 1193, bvar 1194]),
    bnot (bands [bvar 1063, bvar 1065, bvar 1193, bvar 1195]),
    bnot (bands [bvar 1064, bvar 1065, bvar 1194, bvar 1195]),
    bnot (bands [bvar 1058, bvar 1059, bvar 1201, bvar 1202]),
    bnot (bands [bvar 1058, bvar 1063, bvar 1201, bvar 1206]),
    bnot (bands [bvar 1058, bvar 1066, bvar 1201, bvar 1209]),
    bnot (bands [bvar 1059, bvar 1060, bvar 1202, bvar 1203]),
    bnot (bands [bvar 1059, bvar 1062, bvar 1202, bvar 1205]),
    bnot (bands [bvar 1059, bvar 1063, bvar 1202, bvar 1206]),
    bnot (bands [bvar 1059, bvar 1064, bvar 1202, bvar 1207]),
    bnot (bands [bvar 1059, bvar 1065, bvar 1202, bvar 1208]),
    bnot (bands [bvar 1059, bvar 1066, bvar 1202, bvar 1209]),
    bnot (bands [bvar 1060, bvar 1065, bvar 1203, bvar 1208]),
    bnot (bands [bvar 1062, bvar 1066, bvar 1205, bvar 1209]),
    bnot (bands [bvar 1063, bvar 1064, bvar 1206, bvar 1207]),
    bnot (bands [bvar 1063, bvar 1066, bvar 1206, bvar 1209]),
    bnot (bands [bvar 1064, bvar 1066, bvar 1207, bvar 1209]),
    bnot (bands [bvar 1073, bvar 1077, bvar 1099, bvar 1103]),
    bnot (bands [bvar 1073, bvar 1079, bvar 1099, bvar 1105]),
    bnot (bands [bvar 1071, bvar 1073, bvar 1136, bvar 1138]),
    bnot (bands [bvar 1071, bvar 1073, bvar 1162, bvar 1164]),
    bnot (bands [bvar 1071, bvar 1073, bvar 1175, bvar 1177]),
    bnot (bands [bvar 1071, bvar 1073, bvar 1188, bvar 1190]),
    bnot (bands [bvar 1071, bvar 1073, bvar 1201, bvar 1203]),
    bnot (bands [bvar 1071, bvar 1077, bvar 1201, bvar 1207]),
    bnot (bands [bvar 1081, bvar 1086, bvar 1094, bvar 1099]),
    bnot (bands [bvar 1081, bvar 1087, bvar 1094, bvar 1100]),
    bnot (bands [bvar 1081, bvar 1088, bvar 1094, bvar 1101]),
    bnot (bands [bvar 1081, bvar 1089, bvar 1094, bvar 1102]),
    bnot (bands [bvar 1081, bvar 1090, bvar 1094, bvar 1103]),
    bnot (bands [bvar 1081, bvar 1091, bvar 1094, bvar 1104]),
    bnot (bands [bvar 1081, bvar 1092, bvar 1094, bvar 1105]),
    bnot (bands [bvar 1081, bvar 1093, bvar 1094, bvar 1106]),
    bnot (bands [bvar 1082, bvar 1086, bvar 1095, bvar 1099]),
    bnot (bands [bvar 1082, bvar 1087, bvar 1095, bvar 1100]),
    bnot (bands [bvar 1082, bvar 1088, bvar 1095, bvar 1101]),
    bnot (bands [bvar 1082, bvar 1089, bvar 1095, bvar 1102]),
    bnot (bands [bvar 1082, bvar 1090, bvar 1095, bvar 1103]),
    bnot (bands [bvar 1082, bvar 1091, bvar 1095, bvar 1104]),
    bnot (bands [bvar 1082, bvar 1092, bvar 1095, bvar 1105]),
    bnot (bands [bvar 1082, bvar 1093, bvar 1095, bvar 1106]),
    bnot (bands [bvar 1083, bvar 1087, bvar 1096, bvar 1100]),
    bnot (bands [bvar 1083, bvar 1088, bvar 1096, bvar 1101]),
    bnot (bands [bvar 1083, bvar 1090, bvar 1096, bvar 1103]),
    bnot (bands [bvar 1083, bvar 1091, bvar 1096, bvar 1104]),
    bnot (bands [bvar 1083, bvar 1092, bvar 1096, bvar 1105]),
    bnot (bands [bvar 1086, bvar 1090, bvar 1099, bvar 1103]),
    bnot (bands [bvar 1086, bvar 1091, bvar 1099, bvar 1104]),
    bnot (bands [bvar 1086, bvar 1092, bvar 1099, bvar 1105]),
    bnot (bands [bvar 1086, bvar 1093, bvar 1099, bvar 1106]),
    bnot (bands [bvar 1087, bvar 1090, bvar 1100, bvar 1103]),
    bnot (bands [bvar 1087, bvar 1091, bvar 1100, bvar 1104]) ]

def reducedUnionChunk006 : BVLogicalExpr :=
  bands reducedUnionChunk006Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
