import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk007Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1059, bvar 1063, bvar 1176, bvar 1180]),
    bnot (bands [bvar 1059, bvar 1064, bvar 1176, bvar 1181]),
    bnot (bands [bvar 1062, bvar 1063, bvar 1179, bvar 1180]),
    bnot (bands [bvar 1062, bvar 1064, bvar 1179, bvar 1181]),
    bnot (bands [bvar 1055, bvar 1067, bvar 1185, bvar 1197]),
    bnot (bands [bvar 1057, bvar 1059, bvar 1187, bvar 1189]),
    bnot (bands [bvar 1057, bvar 1062, bvar 1187, bvar 1192]),
    bnot (bands [bvar 1058, bvar 1062, bvar 1188, bvar 1192]),
    bnot (bands [bvar 1059, bvar 1062, bvar 1189, bvar 1192]),
    bnot (bands [bvar 1059, bvar 1063, bvar 1189, bvar 1193]),
    bnot (bands [bvar 1059, bvar 1064, bvar 1189, bvar 1194]),
    bnot (bands [bvar 1059, bvar 1065, bvar 1189, bvar 1195]),
    bnot (bands [bvar 1060, bvar 1063, bvar 1190, bvar 1193]),
    bnot (bands [bvar 1060, bvar 1064, bvar 1190, bvar 1194]),
    bnot (bands [bvar 1060, bvar 1065, bvar 1190, bvar 1195]),
    bnot (bands [bvar 1061, bvar 1063, bvar 1191, bvar 1193]),
    bnot (bands [bvar 1061, bvar 1064, bvar 1191, bvar 1194]),
    bnot (bands [bvar 1061, bvar 1065, bvar 1191, bvar 1195]),
    bnot (bands [bvar 1062, bvar 1063, bvar 1192, bvar 1193]),
    bnot (bands [bvar 1062, bvar 1064, bvar 1192, bvar 1194]),
    bnot (bands [bvar 1062, bvar 1065, bvar 1192, bvar 1195]),
    bnot (bands [bvar 1063, bvar 1064, bvar 1193, bvar 1194]),
    bnot (bands [bvar 1063, bvar 1065, bvar 1193, bvar 1195]),
    bnot (bands [bvar 1064, bvar 1065, bvar 1194, bvar 1195]),
    bnot (bands [bvar 1057, bvar 1065, bvar 1200, bvar 1208]),
    bnot (bands [bvar 1059, bvar 1062, bvar 1202, bvar 1205]),
    bnot (bands [bvar 1059, bvar 1063, bvar 1202, bvar 1206]),
    bnot (bands [bvar 1059, bvar 1064, bvar 1202, bvar 1207]),
    bnot (bands [bvar 1059, bvar 1065, bvar 1202, bvar 1208]),
    bnot (bands [bvar 1059, bvar 1066, bvar 1202, bvar 1209]),
    bnot (bands [bvar 1064, bvar 1065, bvar 1207, bvar 1208]),
    bnot (bands [bvar 1064, bvar 1066, bvar 1207, bvar 1209]),
    bnot (bands [bvar 1065, bvar 1066, bvar 1208, bvar 1209]),
    bnot (bands [bvar 1069, bvar 1080, bvar 1082, bvar 1093]),
    bnot (bands [bvar 1073, bvar 1078, bvar 1086, bvar 1091]),
    bnot (bands [bvar 1075, bvar 1080, bvar 1088, bvar 1093]),
    bnot (bands [bvar 1069, bvar 1078, bvar 1095, bvar 1104]),
    bnot (bands [bvar 1075, bvar 1080, bvar 1101, bvar 1106]),
    bnot (bands [bvar 1071, bvar 1073, bvar 1136, bvar 1138]),
    bnot (bands [bvar 1071, bvar 1073, bvar 1162, bvar 1164]),
    bnot (bands [bvar 1071, bvar 1073, bvar 1188, bvar 1190]),
    bnot (bands [bvar 1071, bvar 1078, bvar 1188, bvar 1195]),
    bnot (bands [bvar 1071, bvar 1073, bvar 1201, bvar 1203]),
    bnot (bands [bvar 1071, bvar 1078, bvar 1201, bvar 1208]),
    bnot (bands [bvar 1081, bvar 1086, bvar 1094, bvar 1099]),
    bnot (bands [bvar 1081, bvar 1087, bvar 1094, bvar 1100]),
    bnot (bands [bvar 1081, bvar 1088, bvar 1094, bvar 1101]),
    bnot (bands [bvar 1081, bvar 1089, bvar 1094, bvar 1102]),
    bnot (bands [bvar 1081, bvar 1090, bvar 1094, bvar 1103]),
    bnot (bands [bvar 1081, bvar 1091, bvar 1094, bvar 1104]),
    bnot (bands [bvar 1081, bvar 1092, bvar 1094, bvar 1105]),
    bnot (bands [bvar 1081, bvar 1093, bvar 1094, bvar 1106]),
    bnot (bands [bvar 1082, bvar 1086, bvar 1095, bvar 1099]),
    bnot (bands [bvar 1082, bvar 1088, bvar 1095, bvar 1101]),
    bnot (bands [bvar 1082, bvar 1089, bvar 1095, bvar 1102]),
    bnot (bands [bvar 1082, bvar 1090, bvar 1095, bvar 1103]),
    bnot (bands [bvar 1082, bvar 1091, bvar 1095, bvar 1104]),
    bnot (bands [bvar 1082, bvar 1092, bvar 1095, bvar 1105]),
    bnot (bands [bvar 1082, bvar 1093, bvar 1095, bvar 1106]),
    bnot (bands [bvar 1083, bvar 1086, bvar 1096, bvar 1099]),
    bnot (bands [bvar 1083, bvar 1087, bvar 1096, bvar 1100]),
    bnot (bands [bvar 1083, bvar 1088, bvar 1096, bvar 1101]),
    bnot (bands [bvar 1083, bvar 1090, bvar 1096, bvar 1103]),
    bnot (bands [bvar 1083, bvar 1091, bvar 1096, bvar 1104]) ]

def reducedUnionChunk007 : BVLogicalExpr :=
  bands reducedUnionChunk007Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
