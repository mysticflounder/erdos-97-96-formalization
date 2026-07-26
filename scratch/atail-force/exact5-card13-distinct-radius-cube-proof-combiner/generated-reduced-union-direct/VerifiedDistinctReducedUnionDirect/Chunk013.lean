import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk013Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1120, bvar 1122, bvar 1172, bvar 1174]),
    bnot (bands [bvar 1120, bvar 1123, bvar 1172, bvar 1175]),
    bnot (bands [bvar 1120, bvar 1124, bvar 1172, bvar 1176]),
    bnot (bands [bvar 1120, bvar 1125, bvar 1172, bvar 1177]),
    bnot (bands [bvar 1120, bvar 1131, bvar 1172, bvar 1183]),
    bnot (bands [bvar 1120, bvar 1132, bvar 1172, bvar 1184]),
    bnot (bands [bvar 1121, bvar 1124, bvar 1173, bvar 1176]),
    bnot (bands [bvar 1121, bvar 1125, bvar 1173, bvar 1177]),
    bnot (bands [bvar 1121, bvar 1131, bvar 1173, bvar 1183]),
    bnot (bands [bvar 1121, bvar 1132, bvar 1173, bvar 1184]),
    bnot (bands [bvar 1122, bvar 1124, bvar 1174, bvar 1176]),
    bnot (bands [bvar 1122, bvar 1125, bvar 1174, bvar 1177]),
    bnot (bands [bvar 1122, bvar 1131, bvar 1174, bvar 1183]),
    bnot (bands [bvar 1122, bvar 1132, bvar 1174, bvar 1184]),
    bnot (bands [bvar 1123, bvar 1124, bvar 1175, bvar 1176]),
    bnot (bands [bvar 1123, bvar 1125, bvar 1175, bvar 1177]),
    bnot (bands [bvar 1123, bvar 1131, bvar 1175, bvar 1183]),
    bnot (bands [bvar 1123, bvar 1132, bvar 1175, bvar 1184]),
    bnot (bands [bvar 1124, bvar 1125, bvar 1176, bvar 1177]),
    bnot (bands [bvar 1124, bvar 1131, bvar 1176, bvar 1183]),
    bnot (bands [bvar 1124, bvar 1132, bvar 1176, bvar 1184]),
    bnot (bands [bvar 1125, bvar 1131, bvar 1177, bvar 1183]),
    bnot (bands [bvar 1125, bvar 1132, bvar 1177, bvar 1184]),
    bnot (bands [bvar 1127, bvar 1128, bvar 1179, bvar 1180]),
    bnot (bands [bvar 1127, bvar 1129, bvar 1179, bvar 1181]),
    bnot (bands [bvar 1131, bvar 1132, bvar 1183, bvar 1184]),
    bnot (bands [bvar 1120, bvar 1121, bvar 1185, bvar 1186]),
    bnot (bands [bvar 1120, bvar 1122, bvar 1185, bvar 1187]),
    bnot (bands [bvar 1120, bvar 1123, bvar 1185, bvar 1188]),
    bnot (bands [bvar 1120, bvar 1124, bvar 1185, bvar 1189]),
    bnot (bands [bvar 1120, bvar 1125, bvar 1185, bvar 1190]),
    bnot (bands [bvar 1120, bvar 1132, bvar 1185, bvar 1197]),
    bnot (bands [bvar 1121, bvar 1124, bvar 1186, bvar 1189]),
    bnot (bands [bvar 1121, bvar 1125, bvar 1186, bvar 1190]),
    bnot (bands [bvar 1121, bvar 1132, bvar 1186, bvar 1197]),
    bnot (bands [bvar 1122, bvar 1124, bvar 1187, bvar 1189]),
    bnot (bands [bvar 1122, bvar 1125, bvar 1187, bvar 1190]),
    bnot (bands [bvar 1122, bvar 1132, bvar 1187, bvar 1197]),
    bnot (bands [bvar 1123, bvar 1124, bvar 1188, bvar 1189]),
    bnot (bands [bvar 1123, bvar 1125, bvar 1188, bvar 1190]),
    bnot (bands [bvar 1123, bvar 1132, bvar 1188, bvar 1197]),
    bnot (bands [bvar 1124, bvar 1125, bvar 1189, bvar 1190]),
    bnot (bands [bvar 1124, bvar 1132, bvar 1189, bvar 1197]),
    bnot (bands [bvar 1125, bvar 1132, bvar 1190, bvar 1197]),
    bnot (bands [bvar 1127, bvar 1128, bvar 1192, bvar 1193]),
    bnot (bands [bvar 1127, bvar 1129, bvar 1192, bvar 1194]),
    bnot (bands [bvar 1127, bvar 1130, bvar 1192, bvar 1195]),
    bnot (bands [bvar 1128, bvar 1129, bvar 1193, bvar 1194]),
    bnot (bands [bvar 1128, bvar 1130, bvar 1193, bvar 1195]),
    bnot (bands [bvar 1129, bvar 1130, bvar 1194, bvar 1195]),
    bnot (bands [bvar 1120, bvar 1121, bvar 1198, bvar 1199]),
    bnot (bands [bvar 1120, bvar 1124, bvar 1198, bvar 1202]),
    bnot (bands [bvar 1121, bvar 1124, bvar 1199, bvar 1202]),
    bnot (bands [bvar 1122, bvar 1124, bvar 1200, bvar 1202]),
    bnot (bands [bvar 1123, bvar 1124, bvar 1201, bvar 1202]),
    bnot (bands [bvar 1124, bvar 1125, bvar 1202, bvar 1203]),
    bnot (bands [bvar 1127, bvar 1128, bvar 1205, bvar 1206]),
    bnot (bands [bvar 1127, bvar 1129, bvar 1205, bvar 1207]),
    bnot (bands [bvar 1127, bvar 1130, bvar 1205, bvar 1208]),
    bnot (bands [bvar 1127, bvar 1131, bvar 1205, bvar 1209]),
    bnot (bands [bvar 1128, bvar 1129, bvar 1206, bvar 1207]),
    bnot (bands [bvar 1128, bvar 1130, bvar 1206, bvar 1208]),
    bnot (bands [bvar 1128, bvar 1131, bvar 1206, bvar 1209]),
    bnot (bands [bvar 1129, bvar 1130, bvar 1207, bvar 1208]) ]

def reducedUnionChunk013 : BVLogicalExpr :=
  bands reducedUnionChunk013Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
