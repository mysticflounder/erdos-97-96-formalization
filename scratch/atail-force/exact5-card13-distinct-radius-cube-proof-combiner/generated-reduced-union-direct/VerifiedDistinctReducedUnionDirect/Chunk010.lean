import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk010Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1094, bvar 1105, bvar 1133, bvar 1144]),
    bnot (bands [bvar 1094, bvar 1106, bvar 1133, bvar 1145]),
    bnot (bands [bvar 1095, bvar 1104, bvar 1134, bvar 1143]),
    bnot (bands [bvar 1095, bvar 1106, bvar 1134, bvar 1145]),
    bnot (bands [bvar 1096, bvar 1102, bvar 1135, bvar 1141]),
    bnot (bands [bvar 1096, bvar 1103, bvar 1135, bvar 1142]),
    bnot (bands [bvar 1096, bvar 1104, bvar 1135, bvar 1143]),
    bnot (bands [bvar 1096, bvar 1106, bvar 1135, bvar 1145]),
    bnot (bands [bvar 1097, bvar 1102, bvar 1136, bvar 1141]),
    bnot (bands [bvar 1097, bvar 1103, bvar 1136, bvar 1142]),
    bnot (bands [bvar 1097, bvar 1104, bvar 1136, bvar 1143]),
    bnot (bands [bvar 1097, bvar 1105, bvar 1136, bvar 1144]),
    bnot (bands [bvar 1097, bvar 1106, bvar 1136, bvar 1145]),
    bnot (bands [bvar 1099, bvar 1100, bvar 1138, bvar 1139]),
    bnot (bands [bvar 1102, bvar 1103, bvar 1141, bvar 1142]),
    bnot (bands [bvar 1102, bvar 1104, bvar 1141, bvar 1143]),
    bnot (bands [bvar 1102, bvar 1105, bvar 1141, bvar 1144]),
    bnot (bands [bvar 1102, bvar 1106, bvar 1141, bvar 1145]),
    bnot (bands [bvar 1103, bvar 1104, bvar 1142, bvar 1143]),
    bnot (bands [bvar 1103, bvar 1105, bvar 1142, bvar 1144]),
    bnot (bands [bvar 1103, bvar 1106, bvar 1142, bvar 1145]),
    bnot (bands [bvar 1104, bvar 1105, bvar 1143, bvar 1144]),
    bnot (bands [bvar 1104, bvar 1106, bvar 1143, bvar 1145]),
    bnot (bands [bvar 1094, bvar 1104, bvar 1159, bvar 1169]),
    bnot (bands [bvar 1094, bvar 1106, bvar 1159, bvar 1171]),
    bnot (bands [bvar 1095, bvar 1104, bvar 1160, bvar 1169]),
    bnot (bands [bvar 1095, bvar 1105, bvar 1160, bvar 1170]),
    bnot (bands [bvar 1095, bvar 1106, bvar 1160, bvar 1171]),
    bnot (bands [bvar 1096, bvar 1104, bvar 1161, bvar 1169]),
    bnot (bands [bvar 1096, bvar 1105, bvar 1161, bvar 1170]),
    bnot (bands [bvar 1097, bvar 1105, bvar 1162, bvar 1170]),
    bnot (bands [bvar 1100, bvar 1101, bvar 1165, bvar 1166]),
    bnot (bands [bvar 1104, bvar 1106, bvar 1169, bvar 1171]),
    bnot (bands [bvar 1094, bvar 1105, bvar 1172, bvar 1183]),
    bnot (bands [bvar 1095, bvar 1105, bvar 1173, bvar 1183]),
    bnot (bands [bvar 1097, bvar 1105, bvar 1175, bvar 1183]),
    bnot (bands [bvar 1099, bvar 1103, bvar 1177, bvar 1181]),
    bnot (bands [bvar 1100, bvar 1103, bvar 1178, bvar 1181]),
    bnot (bands [bvar 1101, bvar 1103, bvar 1179, bvar 1181]),
    bnot (bands [bvar 1105, bvar 1106, bvar 1183, bvar 1184]),
    bnot (bands [bvar 1094, bvar 1106, bvar 1185, bvar 1197]),
    bnot (bands [bvar 1096, bvar 1106, bvar 1187, bvar 1197]),
    bnot (bands [bvar 1099, bvar 1104, bvar 1190, bvar 1195]),
    bnot (bands [bvar 1100, bvar 1104, bvar 1191, bvar 1195]),
    bnot (bands [bvar 1102, bvar 1104, bvar 1193, bvar 1195]),
    bnot (bands [bvar 1103, bvar 1104, bvar 1194, bvar 1195]),
    bnot (bands [bvar 1099, bvar 1103, bvar 1203, bvar 1207]),
    bnot (bands [bvar 1099, bvar 1104, bvar 1203, bvar 1208]),
    bnot (bands [bvar 1100, bvar 1103, bvar 1204, bvar 1207]),
    bnot (bands [bvar 1100, bvar 1104, bvar 1204, bvar 1208]),
    bnot (bands [bvar 1100, bvar 1105, bvar 1204, bvar 1209]),
    bnot (bands [bvar 1101, bvar 1104, bvar 1205, bvar 1208]),
    bnot (bands [bvar 1102, bvar 1104, bvar 1206, bvar 1208]),
    bnot (bands [bvar 1102, bvar 1105, bvar 1206, bvar 1209]),
    bnot (bands [bvar 1103, bvar 1105, bvar 1207, bvar 1209]),
    bnot (bands [bvar 1104, bvar 1105, bvar 1208, bvar 1209]),
    bnot (bands [bvar 1107, bvar 1108, bvar 1120, bvar 1121]),
    bnot (bands [bvar 1107, bvar 1111, bvar 1120, bvar 1124]),
    bnot (bands [bvar 1107, bvar 1114, bvar 1120, bvar 1127]),
    bnot (bands [bvar 1107, bvar 1117, bvar 1120, bvar 1130]),
    bnot (bands [bvar 1107, bvar 1118, bvar 1120, bvar 1131]),
    bnot (bands [bvar 1108, bvar 1114, bvar 1121, bvar 1127]),
    bnot (bands [bvar 1109, bvar 1111, bvar 1122, bvar 1124]),
    bnot (bands [bvar 1109, bvar 1114, bvar 1122, bvar 1127]) ]

def reducedUnionChunk010 : BVLogicalExpr :=
  bands reducedUnionChunk010Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
