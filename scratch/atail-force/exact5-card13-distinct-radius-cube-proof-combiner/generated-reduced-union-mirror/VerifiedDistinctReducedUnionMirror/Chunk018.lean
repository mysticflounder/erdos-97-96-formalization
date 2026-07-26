import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk018Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1176, bvar 1184, bvar 1189, bvar 1197]),
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
    bnot (bands [bvar 1181, bvar 1184, bvar 1194, bvar 1197]),
    bnot (bands [bvar 1185, bvar 1186, bvar 1198, bvar 1199]),
    bnot (bands [bvar 1185, bvar 1187, bvar 1198, bvar 1200]),
    bnot (bands [bvar 1185, bvar 1188, bvar 1198, bvar 1201]),
    bnot (bands [bvar 1185, bvar 1189, bvar 1198, bvar 1202]),
    bnot (bands [bvar 1185, bvar 1190, bvar 1198, bvar 1203]),
    bnot (bands [bvar 1185, bvar 1191, bvar 1198, bvar 1204]),
    bnot (bands [bvar 1185, bvar 1192, bvar 1198, bvar 1205]),
    bnot (bands [bvar 1185, bvar 1193, bvar 1198, bvar 1206]),
    bnot (bands [bvar 1185, bvar 1194, bvar 1198, bvar 1207]),
    bnot (bands [bvar 1185, bvar 1195, bvar 1198, bvar 1208]),
    bnot (bands [bvar 1186, bvar 1189, bvar 1199, bvar 1202]),
    bnot (bands [bvar 1186, bvar 1190, bvar 1199, bvar 1203]),
    bnot (bands [bvar 1186, bvar 1191, bvar 1199, bvar 1204]),
    bnot (bands [bvar 1186, bvar 1192, bvar 1199, bvar 1205]),
    bnot (bands [bvar 1186, bvar 1193, bvar 1199, bvar 1206]),
    bnot (bands [bvar 1186, bvar 1194, bvar 1199, bvar 1207]),
    bnot (bands [bvar 1186, bvar 1195, bvar 1199, bvar 1208]),
    bnot (bands [bvar 1187, bvar 1189, bvar 1200, bvar 1202]),
    bnot (bands [bvar 1187, bvar 1190, bvar 1200, bvar 1203]),
    bnot (bands [bvar 1187, bvar 1192, bvar 1200, bvar 1205]),
    bnot (bands [bvar 1187, bvar 1193, bvar 1200, bvar 1206]),
    bnot (bands [bvar 1187, bvar 1194, bvar 1200, bvar 1207]),
    bnot (bands [bvar 1187, bvar 1195, bvar 1200, bvar 1208]),
    bnot (bands [bvar 1188, bvar 1189, bvar 1201, bvar 1202]),
    bnot (bands [bvar 1188, bvar 1191, bvar 1201, bvar 1204]),
    bnot (bands [bvar 1188, bvar 1192, bvar 1201, bvar 1205]),
    bnot (bands [bvar 1189, bvar 1190, bvar 1202, bvar 1203]),
    bnot (bands [bvar 1189, bvar 1191, bvar 1202, bvar 1204]),
    bnot (bands [bvar 1189, bvar 1192, bvar 1202, bvar 1205]),
    bnot (bands [bvar 1189, bvar 1193, bvar 1202, bvar 1206]),
    bnot (bands [bvar 1189, bvar 1194, bvar 1202, bvar 1207]),
    bnot (bands [bvar 1189, bvar 1195, bvar 1202, bvar 1208]),
    bnot (bands [bvar 1190, bvar 1191, bvar 1203, bvar 1204]),
    bnot (bands [bvar 1190, bvar 1193, bvar 1203, bvar 1206]),
    bnot (bands [bvar 1190, bvar 1194, bvar 1203, bvar 1207]),
    bnot (bands [bvar 1190, bvar 1195, bvar 1203, bvar 1208]),
    bnot (bands [bvar 1191, bvar 1192, bvar 1204, bvar 1205]),
    bnot (bands [bvar 1191, bvar 1193, bvar 1204, bvar 1206]),
    bnot (bands [bvar 1191, bvar 1194, bvar 1204, bvar 1207]),
    bnot (bands [bvar 1191, bvar 1195, bvar 1204, bvar 1208]),
    bnot (bands [bvar 1192, bvar 1193, bvar 1205, bvar 1206]),
    bnot (bands [bvar 1192, bvar 1194, bvar 1205, bvar 1207]),
    bnot (bands [bvar 1192, bvar 1195, bvar 1205, bvar 1208]),
    bnot (bands [bvar 1193, bvar 1194, bvar 1206, bvar 1207]),
    bnot (bands [bvar 1193, bvar 1195, bvar 1206, bvar 1208]),
    bnot (bands [bvar 1194, bvar 1195, bvar 1207, bvar 1208]),
    atMost [bvar 1111, bvar 1112, bvar 1113, bvar 1114, bvar 1115] 2,
    atMost [bvar 1124, bvar 1125, bvar 1126, bvar 1127, bvar 1128] 2 ]

def reducedUnionChunk018 : BVLogicalExpr :=
  bands reducedUnionChunk018Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
