import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk020Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1121, bvar 1129, bvar 1134, bvar 1142]),
    bnot (bands [bvar 1121, bvar 1130, bvar 1134, bvar 1143]),
    bnot (bands [bvar 1122, bvar 1129, bvar 1135, bvar 1142]),
    bnot (bands [bvar 1122, bvar 1130, bvar 1135, bvar 1143]),
    bnot (bands [bvar 1123, bvar 1129, bvar 1136, bvar 1142]),
    bnot (bands [bvar 1123, bvar 1130, bvar 1136, bvar 1143]),
    bnot (bands [bvar 1123, bvar 1131, bvar 1136, bvar 1144]),
    bnot (bands [bvar 1123, bvar 1132, bvar 1136, bvar 1145]),
    bnot (bands [bvar 1129, bvar 1130, bvar 1142, bvar 1143]),
    bnot (bands [bvar 1129, bvar 1131, bvar 1142, bvar 1144]),
    bnot (bands [bvar 1129, bvar 1132, bvar 1142, bvar 1145]),
    bnot (bands [bvar 1130, bvar 1132, bvar 1143, bvar 1145]),
    atMost [bvar 1159, bvar 1167, bvar 1168, bvar 1169, bvar 1170, bvar 1171] 2,
    atMost [bvar 1172, bvar 1180, bvar 1181, bvar 1182, bvar 1183, bvar 1184] 2,
    atMost [bvar 1185, bvar 1193, bvar 1194, bvar 1195, bvar 1196, bvar 1197] 2,
    atMost [bvar 1198, bvar 1206, bvar 1207, bvar 1208, bvar 1209, bvar 1210] 2,
    atMost [bvar 1042, bvar 1050, bvar 1051, bvar 1052, bvar 1053, bvar 1054] 1,
    bnot (bands [bvar 1043, bvar 1048, bvar 1160, bvar 1165]),
    bnot (bands [bvar 1044, bvar 1048, bvar 1174, bvar 1178]),
    bnot (bands [bvar 1045, bvar 1048, bvar 1175, bvar 1178]),
    bnot (bands [bvar 1046, bvar 1048, bvar 1176, bvar 1178]),
    bnot (bands [bvar 1048, bvar 1049, bvar 1178, bvar 1179]),
    bnot (bands [bvar 1043, bvar 1047, bvar 1186, bvar 1190]),
    bnot (bands [bvar 1043, bvar 1048, bvar 1186, bvar 1191]),
    bnot (bands [bvar 1043, bvar 1049, bvar 1186, bvar 1192]),
    bnot (bands [bvar 1044, bvar 1048, bvar 1187, bvar 1191]),
    bnot (bands [bvar 1044, bvar 1049, bvar 1187, bvar 1192]),
    bnot (bands [bvar 1046, bvar 1047, bvar 1189, bvar 1190]),
    bnot (bands [bvar 1046, bvar 1048, bvar 1189, bvar 1191]),
    bnot (bands [bvar 1046, bvar 1049, bvar 1189, bvar 1192]),
    bnot (bands [bvar 1047, bvar 1048, bvar 1190, bvar 1191]),
    bnot (bands [bvar 1047, bvar 1049, bvar 1190, bvar 1192]),
    bnot (bands [bvar 1043, bvar 1048, bvar 1199, bvar 1204]),
    bnot (bands [bvar 1044, bvar 1047, bvar 1200, bvar 1203]),
    bnot (bands [bvar 1044, bvar 1048, bvar 1200, bvar 1204]),
    bnot (bands [bvar 1046, bvar 1047, bvar 1202, bvar 1203]),
    bnot (bands [bvar 1046, bvar 1048, bvar 1202, bvar 1204]),
    bnot (bands [bvar 1046, bvar 1049, bvar 1202, bvar 1205]),
    bnot (bands [bvar 1047, bvar 1049, bvar 1203, bvar 1205]),
    bnot (bands [bvar 1048, bvar 1049, bvar 1204, bvar 1205]),
    atMost [bvar 1055, bvar 1056, bvar 1057, bvar 1058, bvar 1059] 2,
    atMost [bvar 1081, bvar 1082, bvar 1083, bvar 1084, bvar 1085] 2,
    atMost [bvar 1042, bvar 1043, bvar 1044, bvar 1045, bvar 1046] 1,
    atMost [bvar 1094, bvar 1095, bvar 1096, bvar 1097, bvar 1098] 1,
    bnot (bands [bvar 1047, bvar 1048, bvar 1060, bvar 1061]),
    bnot (bands [bvar 1047, bvar 1049, bvar 1060, bvar 1062]),
    bnot (bands [bvar 1047, bvar 1050, bvar 1060, bvar 1063]),
    bnot (bands [bvar 1047, bvar 1051, bvar 1060, bvar 1064]),
    bnot (bands [bvar 1047, bvar 1052, bvar 1060, bvar 1065]),
    bnot (bands [bvar 1047, bvar 1053, bvar 1060, bvar 1066]),
    bnot (bands [bvar 1047, bvar 1054, bvar 1060, bvar 1067]),
    bnot (bands [bvar 1048, bvar 1049, bvar 1061, bvar 1062]),
    bnot (bands [bvar 1048, bvar 1050, bvar 1061, bvar 1063]),
    bnot (bands [bvar 1048, bvar 1052, bvar 1061, bvar 1065]),
    bnot (bands [bvar 1048, bvar 1053, bvar 1061, bvar 1066]),
    bnot (bands [bvar 1048, bvar 1054, bvar 1061, bvar 1067]),
    bnot (bands [bvar 1049, bvar 1050, bvar 1062, bvar 1063]),
    bnot (bands [bvar 1049, bvar 1051, bvar 1062, bvar 1064]),
    bnot (bands [bvar 1049, bvar 1052, bvar 1062, bvar 1065]),
    bnot (bands [bvar 1049, bvar 1053, bvar 1062, bvar 1066]),
    bnot (bands [bvar 1049, bvar 1054, bvar 1062, bvar 1067]),
    bnot (bands [bvar 1047, bvar 1048, bvar 1086, bvar 1087]),
    bnot (bands [bvar 1047, bvar 1049, bvar 1086, bvar 1088]),
    bnot (bands [bvar 1047, bvar 1050, bvar 1086, bvar 1089]) ]

def reducedUnionChunk020 : BVLogicalExpr :=
  bands reducedUnionChunk020Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
