import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk017Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1172, bvar 1181, bvar 1185, bvar 1194]),
    bnot (bands [bvar 1173, bvar 1176, bvar 1186, bvar 1189]),
    bnot (bands [bvar 1173, bvar 1177, bvar 1186, bvar 1190]),
    bnot (bands [bvar 1173, bvar 1178, bvar 1186, bvar 1191]),
    bnot (bands [bvar 1173, bvar 1179, bvar 1186, bvar 1192]),
    bnot (bands [bvar 1173, bvar 1180, bvar 1186, bvar 1193]),
    bnot (bands [bvar 1173, bvar 1181, bvar 1186, bvar 1194]),
    bnot (bands [bvar 1174, bvar 1176, bvar 1187, bvar 1189]),
    bnot (bands [bvar 1174, bvar 1177, bvar 1187, bvar 1190]),
    bnot (bands [bvar 1174, bvar 1178, bvar 1187, bvar 1191]),
    bnot (bands [bvar 1174, bvar 1179, bvar 1187, bvar 1192]),
    bnot (bands [bvar 1174, bvar 1180, bvar 1187, bvar 1193]),
    bnot (bands [bvar 1174, bvar 1181, bvar 1187, bvar 1194]),
    bnot (bands [bvar 1174, bvar 1184, bvar 1187, bvar 1197]),
    bnot (bands [bvar 1175, bvar 1176, bvar 1188, bvar 1189]),
    bnot (bands [bvar 1175, bvar 1178, bvar 1188, bvar 1191]),
    bnot (bands [bvar 1175, bvar 1179, bvar 1188, bvar 1192]),
    bnot (bands [bvar 1175, bvar 1180, bvar 1188, bvar 1193]),
    bnot (bands [bvar 1176, bvar 1177, bvar 1189, bvar 1190]),
    bnot (bands [bvar 1176, bvar 1178, bvar 1189, bvar 1191]),
    bnot (bands [bvar 1176, bvar 1179, bvar 1189, bvar 1192]),
    bnot (bands [bvar 1176, bvar 1180, bvar 1189, bvar 1193]),
    bnot (bands [bvar 1176, bvar 1181, bvar 1189, bvar 1194]),
    bnot (bands [bvar 1176, bvar 1184, bvar 1189, bvar 1197]),
    bnot (bands [bvar 1177, bvar 1178, bvar 1190, bvar 1191]),
    bnot (bands [bvar 1177, bvar 1179, bvar 1190, bvar 1192]),
    bnot (bands [bvar 1177, bvar 1180, bvar 1190, bvar 1193]),
    bnot (bands [bvar 1177, bvar 1181, bvar 1190, bvar 1194]),
    bnot (bands [bvar 1177, bvar 1184, bvar 1190, bvar 1197]),
    bnot (bands [bvar 1178, bvar 1179, bvar 1191, bvar 1192]),
    bnot (bands [bvar 1178, bvar 1180, bvar 1191, bvar 1193]),
    bnot (bands [bvar 1178, bvar 1181, bvar 1191, bvar 1194]),
    bnot (bands [bvar 1178, bvar 1184, bvar 1191, bvar 1197]),
    bnot (bands [bvar 1179, bvar 1180, bvar 1192, bvar 1193]),
    bnot (bands [bvar 1179, bvar 1181, bvar 1192, bvar 1194]),
    bnot (bands [bvar 1179, bvar 1184, bvar 1192, bvar 1197]),
    bnot (bands [bvar 1180, bvar 1181, bvar 1193, bvar 1194]),
    bnot (bands [bvar 1180, bvar 1184, bvar 1193, bvar 1197]),
    bnot (bands [bvar 1172, bvar 1176, bvar 1198, bvar 1202]),
    bnot (bands [bvar 1172, bvar 1177, bvar 1198, bvar 1203]),
    bnot (bands [bvar 1176, bvar 1177, bvar 1202, bvar 1203]),
    bnot (bands [bvar 1176, bvar 1181, bvar 1202, bvar 1207]),
    bnot (bands [bvar 1177, bvar 1180, bvar 1203, bvar 1206]),
    bnot (bands [bvar 1179, bvar 1180, bvar 1205, bvar 1206]),
    bnot (bands [bvar 1185, bvar 1186, bvar 1198, bvar 1199]),
    bnot (bands [bvar 1185, bvar 1187, bvar 1198, bvar 1200]),
    bnot (bands [bvar 1185, bvar 1189, bvar 1198, bvar 1202]),
    bnot (bands [bvar 1185, bvar 1190, bvar 1198, bvar 1203]),
    bnot (bands [bvar 1185, bvar 1191, bvar 1198, bvar 1204]),
    bnot (bands [bvar 1185, bvar 1192, bvar 1198, bvar 1205]),
    bnot (bands [bvar 1185, bvar 1193, bvar 1198, bvar 1206]),
    bnot (bands [bvar 1185, bvar 1194, bvar 1198, bvar 1207]),
    bnot (bands [bvar 1185, bvar 1195, bvar 1198, bvar 1208]),
    bnot (bands [bvar 1186, bvar 1189, bvar 1199, bvar 1202]),
    bnot (bands [bvar 1186, bvar 1191, bvar 1199, bvar 1204]),
    bnot (bands [bvar 1186, bvar 1192, bvar 1199, bvar 1205]),
    bnot (bands [bvar 1186, bvar 1193, bvar 1199, bvar 1206]),
    bnot (bands [bvar 1186, bvar 1194, bvar 1199, bvar 1207]),
    bnot (bands [bvar 1186, bvar 1195, bvar 1199, bvar 1208]),
    bnot (bands [bvar 1187, bvar 1189, bvar 1200, bvar 1202]),
    bnot (bands [bvar 1187, bvar 1190, bvar 1200, bvar 1203]),
    bnot (bands [bvar 1187, bvar 1191, bvar 1200, bvar 1204]),
    bnot (bands [bvar 1187, bvar 1192, bvar 1200, bvar 1205]),
    bnot (bands [bvar 1187, bvar 1193, bvar 1200, bvar 1206]) ]

def reducedUnionChunk017 : BVLogicalExpr :=
  bands reducedUnionChunk017Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
