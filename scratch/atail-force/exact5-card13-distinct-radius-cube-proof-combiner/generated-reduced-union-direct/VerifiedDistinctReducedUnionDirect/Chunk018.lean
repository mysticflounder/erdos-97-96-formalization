import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk018Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1187, bvar 1194, bvar 1200, bvar 1207]),
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
    bnot (bands [bvar 1190, bvar 1192, bvar 1203, bvar 1205]),
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
    atMost [bvar 1124, bvar 1125, bvar 1126, bvar 1127, bvar 1128] 2,
    atMost [bvar 1137, bvar 1138, bvar 1139, bvar 1140, bvar 1141] 2,
    atMost [bvar 1098, bvar 1099, bvar 1100, bvar 1101, bvar 1102] 1,
    atMost [bvar 1150, bvar 1151, bvar 1152, bvar 1153, bvar 1154] 1,
    bnot (bands [bvar 1104, bvar 1106, bvar 1117, bvar 1119]),
    bnot (bands [bvar 1105, bvar 1106, bvar 1118, bvar 1119]),
    bnot (bands [bvar 1094, bvar 1103, bvar 1120, bvar 1129]),
    bnot (bands [bvar 1095, bvar 1103, bvar 1121, bvar 1129]),
    bnot (bands [bvar 1095, bvar 1105, bvar 1121, bvar 1131]),
    bnot (bands [bvar 1095, bvar 1106, bvar 1121, bvar 1132]),
    bnot (bands [bvar 1096, bvar 1103, bvar 1122, bvar 1129]),
    bnot (bands [bvar 1096, bvar 1104, bvar 1122, bvar 1130]),
    bnot (bands [bvar 1096, bvar 1105, bvar 1122, bvar 1131]),
    bnot (bands [bvar 1096, bvar 1106, bvar 1122, bvar 1132]),
    bnot (bands [bvar 1097, bvar 1103, bvar 1123, bvar 1129]),
    bnot (bands [bvar 1097, bvar 1104, bvar 1123, bvar 1130]),
    bnot (bands [bvar 1097, bvar 1105, bvar 1123, bvar 1131]),
    bnot (bands [bvar 1097, bvar 1106, bvar 1123, bvar 1132]),
    bnot (bands [bvar 1103, bvar 1104, bvar 1129, bvar 1130]),
    bnot (bands [bvar 1103, bvar 1105, bvar 1129, bvar 1131]),
    bnot (bands [bvar 1104, bvar 1105, bvar 1130, bvar 1131]),
    bnot (bands [bvar 1105, bvar 1106, bvar 1131, bvar 1132]),
    bnot (bands [bvar 1094, bvar 1106, bvar 1133, bvar 1145]),
    bnot (bands [bvar 1095, bvar 1103, bvar 1134, bvar 1142]),
    bnot (bands [bvar 1096, bvar 1103, bvar 1135, bvar 1142]),
    bnot (bands [bvar 1097, bvar 1103, bvar 1136, bvar 1142]),
    bnot (bands [bvar 1121, bvar 1129, bvar 1134, bvar 1142]),
    bnot (bands [bvar 1123, bvar 1129, bvar 1136, bvar 1142]),
    bnot (bands [bvar 1123, bvar 1131, bvar 1136, bvar 1144]),
    bnot (bands [bvar 1129, bvar 1130, bvar 1142, bvar 1143]),
    bnot (bands [bvar 1129, bvar 1131, bvar 1142, bvar 1144]),
    bnot (bands [bvar 1129, bvar 1132, bvar 1142, bvar 1145]),
    bnot (bands [bvar 1122, bvar 1129, bvar 1148, bvar 1155]),
    atMost [bvar 1159, bvar 1167, bvar 1168, bvar 1169, bvar 1170, bvar 1171] 2,
    atMost [bvar 1172, bvar 1180, bvar 1181, bvar 1182, bvar 1183, bvar 1184] 2,
    atMost [bvar 1185, bvar 1193, bvar 1194, bvar 1195, bvar 1196, bvar 1197] 2,
    atMost [bvar 1198, bvar 1206, bvar 1207, bvar 1208, bvar 1209, bvar 1210] 2 ]

def reducedUnionChunk018 : BVLogicalExpr :=
  bands reducedUnionChunk018Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
