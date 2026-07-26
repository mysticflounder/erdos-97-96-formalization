import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk008Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1081, bvar 1092, bvar 1172, bvar 1183]),
    bnot (bands [bvar 1081, bvar 1093, bvar 1172, bvar 1184]),
    bnot (bands [bvar 1085, bvar 1086, bvar 1176, bvar 1177]),
    bnot (bands [bvar 1085, bvar 1087, bvar 1176, bvar 1178]),
    bnot (bands [bvar 1085, bvar 1088, bvar 1176, bvar 1179]),
    bnot (bands [bvar 1085, bvar 1089, bvar 1176, bvar 1180]),
    bnot (bands [bvar 1085, bvar 1090, bvar 1176, bvar 1181]),
    bnot (bands [bvar 1086, bvar 1087, bvar 1177, bvar 1178]),
    bnot (bands [bvar 1086, bvar 1089, bvar 1177, bvar 1180]),
    bnot (bands [bvar 1087, bvar 1088, bvar 1178, bvar 1179]),
    bnot (bands [bvar 1087, bvar 1089, bvar 1178, bvar 1180]),
    bnot (bands [bvar 1087, bvar 1090, bvar 1178, bvar 1181]),
    bnot (bands [bvar 1088, bvar 1089, bvar 1179, bvar 1180]),
    bnot (bands [bvar 1088, bvar 1090, bvar 1179, bvar 1181]),
    bnot (bands [bvar 1089, bvar 1090, bvar 1180, bvar 1181]),
    bnot (bands [bvar 1081, bvar 1082, bvar 1185, bvar 1186]),
    bnot (bands [bvar 1083, bvar 1093, bvar 1187, bvar 1197]),
    bnot (bands [bvar 1085, bvar 1086, bvar 1189, bvar 1190]),
    bnot (bands [bvar 1085, bvar 1087, bvar 1189, bvar 1191]),
    bnot (bands [bvar 1085, bvar 1088, bvar 1189, bvar 1192]),
    bnot (bands [bvar 1085, bvar 1089, bvar 1189, bvar 1193]),
    bnot (bands [bvar 1085, bvar 1090, bvar 1189, bvar 1194]),
    bnot (bands [bvar 1085, bvar 1091, bvar 1189, bvar 1195]),
    bnot (bands [bvar 1086, bvar 1089, bvar 1190, bvar 1193]),
    bnot (bands [bvar 1086, bvar 1090, bvar 1190, bvar 1194]),
    bnot (bands [bvar 1086, bvar 1091, bvar 1190, bvar 1195]),
    bnot (bands [bvar 1087, bvar 1088, bvar 1191, bvar 1192]),
    bnot (bands [bvar 1087, bvar 1089, bvar 1191, bvar 1193]),
    bnot (bands [bvar 1087, bvar 1090, bvar 1191, bvar 1194]),
    bnot (bands [bvar 1087, bvar 1091, bvar 1191, bvar 1195]),
    bnot (bands [bvar 1088, bvar 1089, bvar 1192, bvar 1193]),
    bnot (bands [bvar 1088, bvar 1090, bvar 1192, bvar 1194]),
    bnot (bands [bvar 1088, bvar 1091, bvar 1192, bvar 1195]),
    bnot (bands [bvar 1089, bvar 1090, bvar 1193, bvar 1194]),
    bnot (bands [bvar 1089, bvar 1091, bvar 1193, bvar 1195]),
    bnot (bands [bvar 1090, bvar 1091, bvar 1194, bvar 1195]),
    bnot (bands [bvar 1081, bvar 1082, bvar 1198, bvar 1199]),
    bnot (bands [bvar 1085, bvar 1086, bvar 1202, bvar 1203]),
    bnot (bands [bvar 1085, bvar 1087, bvar 1202, bvar 1204]),
    bnot (bands [bvar 1085, bvar 1088, bvar 1202, bvar 1205]),
    bnot (bands [bvar 1085, bvar 1089, bvar 1202, bvar 1206]),
    bnot (bands [bvar 1085, bvar 1090, bvar 1202, bvar 1207]),
    bnot (bands [bvar 1085, bvar 1091, bvar 1202, bvar 1208]),
    bnot (bands [bvar 1085, bvar 1092, bvar 1202, bvar 1209]),
    bnot (bands [bvar 1086, bvar 1087, bvar 1203, bvar 1204]),
    bnot (bands [bvar 1086, bvar 1089, bvar 1203, bvar 1206]),
    bnot (bands [bvar 1086, bvar 1090, bvar 1203, bvar 1207]),
    bnot (bands [bvar 1086, bvar 1091, bvar 1203, bvar 1208]),
    bnot (bands [bvar 1087, bvar 1088, bvar 1204, bvar 1205]),
    bnot (bands [bvar 1087, bvar 1089, bvar 1204, bvar 1206]),
    bnot (bands [bvar 1087, bvar 1090, bvar 1204, bvar 1207]),
    bnot (bands [bvar 1087, bvar 1091, bvar 1204, bvar 1208]),
    bnot (bands [bvar 1087, bvar 1092, bvar 1204, bvar 1209]),
    bnot (bands [bvar 1088, bvar 1089, bvar 1205, bvar 1206]),
    bnot (bands [bvar 1088, bvar 1090, bvar 1205, bvar 1207]),
    bnot (bands [bvar 1088, bvar 1091, bvar 1205, bvar 1208]),
    bnot (bands [bvar 1088, bvar 1092, bvar 1205, bvar 1209]),
    bnot (bands [bvar 1089, bvar 1090, bvar 1206, bvar 1207]),
    bnot (bands [bvar 1089, bvar 1091, bvar 1206, bvar 1208]),
    bnot (bands [bvar 1089, bvar 1092, bvar 1206, bvar 1209]),
    bnot (bands [bvar 1090, bvar 1091, bvar 1207, bvar 1208]),
    bnot (bands [bvar 1091, bvar 1092, bvar 1208, bvar 1209]),
    bnot (bands [bvar 1094, bvar 1095, bvar 1107, bvar 1108]),
    bnot (bands [bvar 1094, bvar 1101, bvar 1107, bvar 1114]) ]

def reducedUnionChunk008 : BVLogicalExpr :=
  bands reducedUnionChunk008Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
