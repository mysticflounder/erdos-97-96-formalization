import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk009Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1081, bvar 1089, bvar 1120, bvar 1128]),
    bnot (bands [bvar 1081, bvar 1090, bvar 1120, bvar 1129]),
    bnot (bands [bvar 1081, bvar 1091, bvar 1120, bvar 1130]),
    bnot (bands [bvar 1081, bvar 1092, bvar 1120, bvar 1131]),
    bnot (bands [bvar 1081, bvar 1093, bvar 1120, bvar 1132]),
    bnot (bands [bvar 1082, bvar 1088, bvar 1121, bvar 1127]),
    bnot (bands [bvar 1082, bvar 1089, bvar 1121, bvar 1128]),
    bnot (bands [bvar 1082, bvar 1090, bvar 1121, bvar 1129]),
    bnot (bands [bvar 1082, bvar 1091, bvar 1121, bvar 1130]),
    bnot (bands [bvar 1082, bvar 1092, bvar 1121, bvar 1131]),
    bnot (bands [bvar 1082, bvar 1093, bvar 1121, bvar 1132]),
    bnot (bands [bvar 1083, bvar 1088, bvar 1122, bvar 1127]),
    bnot (bands [bvar 1083, bvar 1090, bvar 1122, bvar 1129]),
    bnot (bands [bvar 1083, bvar 1092, bvar 1122, bvar 1131]),
    bnot (bands [bvar 1083, bvar 1093, bvar 1122, bvar 1132]),
    bnot (bands [bvar 1085, bvar 1086, bvar 1124, bvar 1125]),
    bnot (bands [bvar 1088, bvar 1089, bvar 1127, bvar 1128]),
    bnot (bands [bvar 1088, bvar 1090, bvar 1127, bvar 1129]),
    bnot (bands [bvar 1088, bvar 1091, bvar 1127, bvar 1130]),
    bnot (bands [bvar 1088, bvar 1092, bvar 1127, bvar 1131]),
    bnot (bands [bvar 1088, bvar 1093, bvar 1127, bvar 1132]),
    bnot (bands [bvar 1089, bvar 1090, bvar 1128, bvar 1129]),
    bnot (bands [bvar 1089, bvar 1091, bvar 1128, bvar 1130]),
    bnot (bands [bvar 1089, bvar 1092, bvar 1128, bvar 1131]),
    bnot (bands [bvar 1089, bvar 1093, bvar 1128, bvar 1132]),
    bnot (bands [bvar 1090, bvar 1091, bvar 1129, bvar 1130]),
    bnot (bands [bvar 1090, bvar 1092, bvar 1129, bvar 1131]),
    bnot (bands [bvar 1090, bvar 1093, bvar 1129, bvar 1132]),
    bnot (bands [bvar 1091, bvar 1092, bvar 1130, bvar 1131]),
    bnot (bands [bvar 1091, bvar 1093, bvar 1130, bvar 1132]),
    bnot (bands [bvar 1092, bvar 1093, bvar 1131, bvar 1132]),
    bnot (bands [bvar 1081, bvar 1089, bvar 1133, bvar 1141]),
    bnot (bands [bvar 1081, bvar 1090, bvar 1133, bvar 1142]),
    bnot (bands [bvar 1081, bvar 1091, bvar 1133, bvar 1143]),
    bnot (bands [bvar 1081, bvar 1092, bvar 1133, bvar 1144]),
    bnot (bands [bvar 1082, bvar 1089, bvar 1134, bvar 1141]),
    bnot (bands [bvar 1082, bvar 1090, bvar 1134, bvar 1142]),
    bnot (bands [bvar 1082, bvar 1091, bvar 1134, bvar 1143]),
    bnot (bands [bvar 1085, bvar 1086, bvar 1137, bvar 1138]),
    bnot (bands [bvar 1089, bvar 1090, bvar 1141, bvar 1142]),
    bnot (bands [bvar 1089, bvar 1091, bvar 1141, bvar 1143]),
    bnot (bands [bvar 1089, bvar 1092, bvar 1141, bvar 1144]),
    bnot (bands [bvar 1090, bvar 1091, bvar 1142, bvar 1143]),
    bnot (bands [bvar 1090, bvar 1092, bvar 1142, bvar 1144]),
    bnot (bands [bvar 1090, bvar 1093, bvar 1142, bvar 1145]),
    bnot (bands [bvar 1091, bvar 1092, bvar 1143, bvar 1144]),
    bnot (bands [bvar 1092, bvar 1093, bvar 1144, bvar 1145]),
    bnot (bands [bvar 1085, bvar 1088, bvar 1163, bvar 1166]),
    bnot (bands [bvar 1085, bvar 1089, bvar 1163, bvar 1167]),
    bnot (bands [bvar 1088, bvar 1089, bvar 1166, bvar 1167]),
    bnot (bands [bvar 1081, bvar 1083, bvar 1172, bvar 1174]),
    bnot (bands [bvar 1085, bvar 1086, bvar 1176, bvar 1177]),
    bnot (bands [bvar 1085, bvar 1087, bvar 1176, bvar 1178]),
    bnot (bands [bvar 1085, bvar 1088, bvar 1176, bvar 1179]),
    bnot (bands [bvar 1085, bvar 1089, bvar 1176, bvar 1180]),
    bnot (bands [bvar 1086, bvar 1088, bvar 1177, bvar 1179]),
    bnot (bands [bvar 1086, bvar 1090, bvar 1177, bvar 1181]),
    bnot (bands [bvar 1087, bvar 1089, bvar 1178, bvar 1180]),
    bnot (bands [bvar 1088, bvar 1089, bvar 1179, bvar 1180]),
    bnot (bands [bvar 1092, bvar 1093, bvar 1183, bvar 1184]),
    bnot (bands [bvar 1081, bvar 1082, bvar 1185, bvar 1186]),
    bnot (bands [bvar 1085, bvar 1088, bvar 1189, bvar 1192]),
    bnot (bands [bvar 1086, bvar 1090, bvar 1190, bvar 1194]),
    bnot (bands [bvar 1086, bvar 1091, bvar 1190, bvar 1195]) ]

def reducedUnionChunk009 : BVLogicalExpr :=
  bands reducedUnionChunk009Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
