import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk019Assertions : List BVLogicalExpr :=
  [ atMost [bvar 1146, bvar 1154, bvar 1155, bvar 1156, bvar 1157, bvar 1158] 1,
    atMost [bvar 1042, bvar 1050, bvar 1051, bvar 1052, bvar 1053, bvar 1054] 1,
    bnot (bands [bvar 1045, bvar 1048, bvar 1175, bvar 1178]),
    bnot (bands [bvar 1046, bvar 1048, bvar 1176, bvar 1178]),
    bnot (bands [bvar 1046, bvar 1049, bvar 1176, bvar 1179]),
    bnot (bands [bvar 1048, bvar 1049, bvar 1178, bvar 1179]),
    bnot (bands [bvar 1043, bvar 1048, bvar 1186, bvar 1191]),
    bnot (bands [bvar 1043, bvar 1049, bvar 1186, bvar 1192]),
    bnot (bands [bvar 1044, bvar 1048, bvar 1187, bvar 1191]),
    bnot (bands [bvar 1044, bvar 1049, bvar 1187, bvar 1192]),
    bnot (bands [bvar 1046, bvar 1047, bvar 1189, bvar 1190]),
    bnot (bands [bvar 1046, bvar 1048, bvar 1189, bvar 1191]),
    bnot (bands [bvar 1046, bvar 1049, bvar 1189, bvar 1192]),
    bnot (bands [bvar 1047, bvar 1048, bvar 1190, bvar 1191]),
    bnot (bands [bvar 1047, bvar 1049, bvar 1190, bvar 1192]),
    bnot (bands [bvar 1048, bvar 1049, bvar 1191, bvar 1192]),
    bnot (bands [bvar 1043, bvar 1047, bvar 1199, bvar 1203]),
    bnot (bands [bvar 1043, bvar 1048, bvar 1199, bvar 1204]),
    bnot (bands [bvar 1044, bvar 1047, bvar 1200, bvar 1203]),
    bnot (bands [bvar 1044, bvar 1048, bvar 1200, bvar 1204]),
    bnot (bands [bvar 1046, bvar 1047, bvar 1202, bvar 1203]),
    bnot (bands [bvar 1046, bvar 1048, bvar 1202, bvar 1204]),
    bnot (bands [bvar 1046, bvar 1049, bvar 1202, bvar 1205]),
    bnot (bands [bvar 1047, bvar 1048, bvar 1203, bvar 1204]),
    bnot (bands [bvar 1047, bvar 1049, bvar 1203, bvar 1205]),
    bnot (bands [bvar 1186, bvar 1190, bvar 1199, bvar 1203]),
    bnot (bands [bvar 1186, bvar 1191, bvar 1199, bvar 1204]),
    bnot (bands [bvar 1186, bvar 1192, bvar 1199, bvar 1205]),
    bnot (bands [bvar 1188, bvar 1192, bvar 1201, bvar 1205]),
    bnot (bands [bvar 1189, bvar 1192, bvar 1202, bvar 1205]),
    bnot (bands [bvar 1191, bvar 1192, bvar 1204, bvar 1205]),
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
    bnot (bands [bvar 1049, bvar 1053, bvar 1062, bvar 1066]),
    bnot (bands [bvar 1049, bvar 1054, bvar 1062, bvar 1067]),
    bnot (bands [bvar 1047, bvar 1048, bvar 1086, bvar 1087]),
    bnot (bands [bvar 1047, bvar 1049, bvar 1086, bvar 1088]),
    bnot (bands [bvar 1047, bvar 1050, bvar 1086, bvar 1089]),
    bnot (bands [bvar 1047, bvar 1051, bvar 1086, bvar 1090]),
    bnot (bands [bvar 1047, bvar 1052, bvar 1086, bvar 1091]),
    bnot (bands [bvar 1047, bvar 1053, bvar 1086, bvar 1092]),
    bnot (bands [bvar 1048, bvar 1049, bvar 1087, bvar 1088]),
    bnot (bands [bvar 1048, bvar 1051, bvar 1087, bvar 1090]),
    bnot (bands [bvar 1048, bvar 1052, bvar 1087, bvar 1091]),
    bnot (bands [bvar 1048, bvar 1053, bvar 1087, bvar 1092]),
    bnot (bands [bvar 1048, bvar 1054, bvar 1087, bvar 1093]),
    bnot (bands [bvar 1049, bvar 1050, bvar 1088, bvar 1089]),
    bnot (bands [bvar 1049, bvar 1051, bvar 1088, bvar 1090]),
    bnot (bands [bvar 1049, bvar 1052, bvar 1088, bvar 1091]) ]

def reducedUnionChunk019 : BVLogicalExpr :=
  bands reducedUnionChunk019Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
