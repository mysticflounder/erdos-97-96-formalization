import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk016Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1166, bvar 1170, bvar 1179, bvar 1183]),
    bnot (bands [bvar 1166, bvar 1171, bvar 1179, bvar 1184]),
    bnot (bands [bvar 1159, bvar 1160, bvar 1185, bvar 1186]),
    bnot (bands [bvar 1159, bvar 1163, bvar 1185, bvar 1189]),
    bnot (bands [bvar 1159, bvar 1164, bvar 1185, bvar 1190]),
    bnot (bands [bvar 1159, bvar 1165, bvar 1185, bvar 1191]),
    bnot (bands [bvar 1159, bvar 1166, bvar 1185, bvar 1192]),
    bnot (bands [bvar 1159, bvar 1167, bvar 1185, bvar 1193]),
    bnot (bands [bvar 1160, bvar 1163, bvar 1186, bvar 1189]),
    bnot (bands [bvar 1160, bvar 1165, bvar 1186, bvar 1191]),
    bnot (bands [bvar 1160, bvar 1166, bvar 1186, bvar 1192]),
    bnot (bands [bvar 1160, bvar 1167, bvar 1186, bvar 1193]),
    bnot (bands [bvar 1160, bvar 1171, bvar 1186, bvar 1197]),
    bnot (bands [bvar 1161, bvar 1163, bvar 1187, bvar 1189]),
    bnot (bands [bvar 1161, bvar 1166, bvar 1187, bvar 1192]),
    bnot (bands [bvar 1161, bvar 1167, bvar 1187, bvar 1193]),
    bnot (bands [bvar 1161, bvar 1171, bvar 1187, bvar 1197]),
    bnot (bands [bvar 1162, bvar 1163, bvar 1188, bvar 1189]),
    bnot (bands [bvar 1162, bvar 1166, bvar 1188, bvar 1192]),
    bnot (bands [bvar 1163, bvar 1164, bvar 1189, bvar 1190]),
    bnot (bands [bvar 1163, bvar 1165, bvar 1189, bvar 1191]),
    bnot (bands [bvar 1163, bvar 1166, bvar 1189, bvar 1192]),
    bnot (bands [bvar 1163, bvar 1167, bvar 1189, bvar 1193]),
    bnot (bands [bvar 1163, bvar 1171, bvar 1189, bvar 1197]),
    bnot (bands [bvar 1164, bvar 1167, bvar 1190, bvar 1193]),
    bnot (bands [bvar 1164, bvar 1171, bvar 1190, bvar 1197]),
    bnot (bands [bvar 1165, bvar 1166, bvar 1191, bvar 1192]),
    bnot (bands [bvar 1165, bvar 1167, bvar 1191, bvar 1193]),
    bnot (bands [bvar 1165, bvar 1171, bvar 1191, bvar 1197]),
    bnot (bands [bvar 1166, bvar 1167, bvar 1192, bvar 1193]),
    bnot (bands [bvar 1166, bvar 1171, bvar 1192, bvar 1197]),
    bnot (bands [bvar 1167, bvar 1171, bvar 1193, bvar 1197]),
    bnot (bands [bvar 1159, bvar 1160, bvar 1198, bvar 1199]),
    bnot (bands [bvar 1159, bvar 1161, bvar 1198, bvar 1200]),
    bnot (bands [bvar 1159, bvar 1163, bvar 1198, bvar 1202]),
    bnot (bands [bvar 1159, bvar 1165, bvar 1198, bvar 1204]),
    bnot (bands [bvar 1159, bvar 1166, bvar 1198, bvar 1205]),
    bnot (bands [bvar 1159, bvar 1167, bvar 1198, bvar 1206]),
    bnot (bands [bvar 1160, bvar 1163, bvar 1199, bvar 1202]),
    bnot (bands [bvar 1160, bvar 1165, bvar 1199, bvar 1204]),
    bnot (bands [bvar 1160, bvar 1166, bvar 1199, bvar 1205]),
    bnot (bands [bvar 1160, bvar 1167, bvar 1199, bvar 1206]),
    bnot (bands [bvar 1161, bvar 1163, bvar 1200, bvar 1202]),
    bnot (bands [bvar 1161, bvar 1165, bvar 1200, bvar 1204]),
    bnot (bands [bvar 1161, bvar 1166, bvar 1200, bvar 1205]),
    bnot (bands [bvar 1161, bvar 1167, bvar 1200, bvar 1206]),
    bnot (bands [bvar 1162, bvar 1163, bvar 1201, bvar 1202]),
    bnot (bands [bvar 1162, bvar 1166, bvar 1201, bvar 1205]),
    bnot (bands [bvar 1163, bvar 1164, bvar 1202, bvar 1203]),
    bnot (bands [bvar 1163, bvar 1165, bvar 1202, bvar 1204]),
    bnot (bands [bvar 1163, bvar 1166, bvar 1202, bvar 1205]),
    bnot (bands [bvar 1163, bvar 1167, bvar 1202, bvar 1206]),
    bnot (bands [bvar 1165, bvar 1166, bvar 1204, bvar 1205]),
    bnot (bands [bvar 1165, bvar 1167, bvar 1204, bvar 1206]),
    bnot (bands [bvar 1166, bvar 1167, bvar 1205, bvar 1206]),
    bnot (bands [bvar 1169, bvar 1170, bvar 1208, bvar 1209]),
    bnot (bands [bvar 1172, bvar 1173, bvar 1185, bvar 1186]),
    bnot (bands [bvar 1172, bvar 1174, bvar 1185, bvar 1187]),
    bnot (bands [bvar 1172, bvar 1175, bvar 1185, bvar 1188]),
    bnot (bands [bvar 1172, bvar 1176, bvar 1185, bvar 1189]),
    bnot (bands [bvar 1172, bvar 1177, bvar 1185, bvar 1190]),
    bnot (bands [bvar 1172, bvar 1178, bvar 1185, bvar 1191]),
    bnot (bands [bvar 1172, bvar 1179, bvar 1185, bvar 1192]),
    bnot (bands [bvar 1172, bvar 1180, bvar 1185, bvar 1193]) ]

def reducedUnionChunk016 : BVLogicalExpr :=
  bands reducedUnionChunk016Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
