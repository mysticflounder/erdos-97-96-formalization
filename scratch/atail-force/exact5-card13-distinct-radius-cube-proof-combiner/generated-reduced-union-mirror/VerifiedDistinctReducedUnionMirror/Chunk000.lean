import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk000Assertions : List BVLogicalExpr :=
  [ bnot (bvar 1042),
    exactly [bvar 1042, bvar 1043, bvar 1044, bvar 1045, bvar 1046, bvar 1047, bvar 1048, bvar 1049, bvar 1050, bvar 1051, bvar 1052, bvar 1053, bvar 1054] 4,
    bnot (bvar 1056),
    exactly [bvar 1055, bvar 1056, bvar 1057, bvar 1058, bvar 1059, bvar 1060, bvar 1061, bvar 1062, bvar 1063, bvar 1064, bvar 1065, bvar 1066, bvar 1067] 4,
    bnot (bvar 1070),
    exactly [bvar 1068, bvar 1069, bvar 1070, bvar 1071, bvar 1072, bvar 1073, bvar 1074, bvar 1075, bvar 1076, bvar 1077, bvar 1078, bvar 1079, bvar 1080] 4,
    bnot (bvar 1084),
    exactly [bvar 1081, bvar 1082, bvar 1083, bvar 1084, bvar 1085, bvar 1086, bvar 1087, bvar 1088, bvar 1089, bvar 1090, bvar 1091, bvar 1092, bvar 1093] 4,
    bnot (bvar 1098),
    exactly [bvar 1094, bvar 1095, bvar 1096, bvar 1097, bvar 1098, bvar 1099, bvar 1100, bvar 1101, bvar 1102, bvar 1103, bvar 1104, bvar 1105, bvar 1106] 4,
    bnot (bvar 1112),
    exactly [bvar 1107, bvar 1108, bvar 1109, bvar 1110, bvar 1111, bvar 1112, bvar 1113, bvar 1114, bvar 1115, bvar 1116, bvar 1117, bvar 1118, bvar 1119] 4,
    bnot (bvar 1126),
    exactly [bvar 1120, bvar 1121, bvar 1122, bvar 1123, bvar 1124, bvar 1125, bvar 1126, bvar 1127, bvar 1128, bvar 1129, bvar 1130, bvar 1131, bvar 1132] 4,
    bnot (bvar 1140),
    exactly [bvar 1133, bvar 1134, bvar 1135, bvar 1136, bvar 1137, bvar 1138, bvar 1139, bvar 1140, bvar 1141, bvar 1142, bvar 1143, bvar 1144, bvar 1145] 4,
    bnot (bvar 1154),
    exactly [bvar 1146, bvar 1147, bvar 1148, bvar 1149, bvar 1150, bvar 1151, bvar 1152, bvar 1153, bvar 1154, bvar 1155, bvar 1156, bvar 1157, bvar 1158] 4,
    bnot (bvar 1168),
    exactly [bvar 1159, bvar 1160, bvar 1161, bvar 1162, bvar 1163, bvar 1164, bvar 1165, bvar 1166, bvar 1167, bvar 1168, bvar 1169, bvar 1170, bvar 1171] 4,
    bnot (bvar 1182),
    exactly [bvar 1172, bvar 1173, bvar 1174, bvar 1175, bvar 1176, bvar 1177, bvar 1178, bvar 1179, bvar 1180, bvar 1181, bvar 1182, bvar 1183, bvar 1184] 4,
    bnot (bvar 1196),
    exactly [bvar 1185, bvar 1186, bvar 1187, bvar 1188, bvar 1189, bvar 1190, bvar 1191, bvar 1192, bvar 1193, bvar 1194, bvar 1195, bvar 1196, bvar 1197] 4,
    bnot (bvar 1210),
    exactly [bvar 1198, bvar 1199, bvar 1200, bvar 1201, bvar 1202, bvar 1203, bvar 1204, bvar 1205, bvar 1206, bvar 1207, bvar 1208, bvar 1209, bvar 1210] 4,
    atMost [bands [bvar 1042, bvar 1107], bands [bvar 1043, bvar 1108], bands [bvar 1044, bvar 1109], bands [bvar 1045, bvar 1110], bands [bvar 1046, bvar 1111], bands [bvar 1047, bvar 1112], bands [bvar 1048, bvar 1113], bands [bvar 1049, bvar 1114], bands [bvar 1050, bvar 1115], bands [bvar 1051, bvar 1116], bands [bvar 1052, bvar 1117], bands [bvar 1053, bvar 1118], bands [bvar 1054, bvar 1119]] 2,
    atMost [bands [bvar 1042, bvar 1120], bands [bvar 1043, bvar 1121], bands [bvar 1044, bvar 1122], bands [bvar 1045, bvar 1123], bands [bvar 1046, bvar 1124], bands [bvar 1047, bvar 1125], bands [bvar 1048, bvar 1126], bands [bvar 1049, bvar 1127], bands [bvar 1050, bvar 1128], bands [bvar 1051, bvar 1129], bands [bvar 1052, bvar 1130], bands [bvar 1053, bvar 1131], bands [bvar 1054, bvar 1132]] 2,
    atMost [bands [bvar 1042, bvar 1172], bands [bvar 1043, bvar 1173], bands [bvar 1044, bvar 1174], bands [bvar 1045, bvar 1175], bands [bvar 1046, bvar 1176], bands [bvar 1047, bvar 1177], bands [bvar 1048, bvar 1178], bands [bvar 1049, bvar 1179], bands [bvar 1050, bvar 1180], bands [bvar 1051, bvar 1181], bands [bvar 1052, bvar 1182], bands [bvar 1053, bvar 1183], bands [bvar 1054, bvar 1184]] 2,
    atMost [bands [bvar 1055, bvar 1120], bands [bvar 1056, bvar 1121], bands [bvar 1057, bvar 1122], bands [bvar 1058, bvar 1123], bands [bvar 1059, bvar 1124], bands [bvar 1060, bvar 1125], bands [bvar 1061, bvar 1126], bands [bvar 1062, bvar 1127], bands [bvar 1063, bvar 1128], bands [bvar 1064, bvar 1129], bands [bvar 1065, bvar 1130], bands [bvar 1066, bvar 1131], bands [bvar 1067, bvar 1132]] 2,
    atMost [bands [bvar 1120, bvar 1159], bands [bvar 1121, bvar 1160], bands [bvar 1122, bvar 1161], bands [bvar 1123, bvar 1162], bands [bvar 1124, bvar 1163], bands [bvar 1125, bvar 1164], bands [bvar 1126, bvar 1165], bands [bvar 1127, bvar 1166], bands [bvar 1128, bvar 1167], bands [bvar 1129, bvar 1168], bands [bvar 1130, bvar 1169], bands [bvar 1131, bvar 1170], bands [bvar 1132, bvar 1171]] 2,
    atMost [bands [bvar 1133, bvar 1185], bands [bvar 1134, bvar 1186], bands [bvar 1135, bvar 1187], bands [bvar 1136, bvar 1188], bands [bvar 1137, bvar 1189], bands [bvar 1138, bvar 1190], bands [bvar 1139, bvar 1191], bands [bvar 1140, bvar 1192], bands [bvar 1141, bvar 1193], bands [bvar 1142, bvar 1194], bands [bvar 1143, bvar 1195], bands [bvar 1144, bvar 1196], bands [bvar 1145, bvar 1197]] 2,
    atMost [bands [bvar 1159, bvar 1185], bands [bvar 1160, bvar 1186], bands [bvar 1161, bvar 1187], bands [bvar 1162, bvar 1188], bands [bvar 1163, bvar 1189], bands [bvar 1164, bvar 1190], bands [bvar 1165, bvar 1191], bands [bvar 1166, bvar 1192], bands [bvar 1167, bvar 1193], bands [bvar 1168, bvar 1194], bands [bvar 1169, bvar 1195], bands [bvar 1170, bvar 1196], bands [bvar 1171, bvar 1197]] 2,
    atMost [bands [bvar 1043, bvar 1047], bands [bvar 1056, bvar 1060], bands [bvar 1069, bvar 1073], bands [bvar 1082, bvar 1086], bands [bvar 1095, bvar 1099], bands [bvar 1108, bvar 1112], bands [bvar 1121, bvar 1125], bands [bvar 1134, bvar 1138], bands [bvar 1147, bvar 1151], bands [bvar 1160, bvar 1164], bands [bvar 1173, bvar 1177], bands [bvar 1186, bvar 1190], bands [bvar 1199, bvar 1203]] 2,
    atMost [bands [bvar 1043, bvar 1048], bands [bvar 1056, bvar 1061], bands [bvar 1069, bvar 1074], bands [bvar 1082, bvar 1087], bands [bvar 1095, bvar 1100], bands [bvar 1108, bvar 1113], bands [bvar 1121, bvar 1126], bands [bvar 1134, bvar 1139], bands [bvar 1147, bvar 1152], bands [bvar 1160, bvar 1165], bands [bvar 1173, bvar 1178], bands [bvar 1186, bvar 1191], bands [bvar 1199, bvar 1204]] 2,
    atMost [bands [bvar 1043, bvar 1049], bands [bvar 1056, bvar 1062], bands [bvar 1069, bvar 1075], bands [bvar 1082, bvar 1088], bands [bvar 1095, bvar 1101], bands [bvar 1108, bvar 1114], bands [bvar 1121, bvar 1127], bands [bvar 1134, bvar 1140], bands [bvar 1147, bvar 1153], bands [bvar 1160, bvar 1166], bands [bvar 1173, bvar 1179], bands [bvar 1186, bvar 1192], bands [bvar 1199, bvar 1205]] 2,
    atMost [bands [bvar 1043, bvar 1050], bands [bvar 1056, bvar 1063], bands [bvar 1069, bvar 1076], bands [bvar 1082, bvar 1089], bands [bvar 1095, bvar 1102], bands [bvar 1108, bvar 1115], bands [bvar 1121, bvar 1128], bands [bvar 1134, bvar 1141], bands [bvar 1147, bvar 1154], bands [bvar 1160, bvar 1167], bands [bvar 1173, bvar 1180], bands [bvar 1186, bvar 1193], bands [bvar 1199, bvar 1206]] 2,
    atMost [bands [bvar 1043, bvar 1051], bands [bvar 1056, bvar 1064], bands [bvar 1069, bvar 1077], bands [bvar 1082, bvar 1090], bands [bvar 1095, bvar 1103], bands [bvar 1108, bvar 1116], bands [bvar 1121, bvar 1129], bands [bvar 1134, bvar 1142], bands [bvar 1147, bvar 1155], bands [bvar 1160, bvar 1168], bands [bvar 1173, bvar 1181], bands [bvar 1186, bvar 1194], bands [bvar 1199, bvar 1207]] 2,
    atMost [bands [bvar 1043, bvar 1052], bands [bvar 1056, bvar 1065], bands [bvar 1069, bvar 1078], bands [bvar 1082, bvar 1091], bands [bvar 1095, bvar 1104], bands [bvar 1108, bvar 1117], bands [bvar 1121, bvar 1130], bands [bvar 1134, bvar 1143], bands [bvar 1147, bvar 1156], bands [bvar 1160, bvar 1169], bands [bvar 1173, bvar 1182], bands [bvar 1186, bvar 1195], bands [bvar 1199, bvar 1208]] 2,
    atMost [bands [bvar 1043, bvar 1053], bands [bvar 1056, bvar 1066], bands [bvar 1069, bvar 1079], bands [bvar 1082, bvar 1092], bands [bvar 1095, bvar 1105], bands [bvar 1108, bvar 1118], bands [bvar 1121, bvar 1131], bands [bvar 1134, bvar 1144], bands [bvar 1147, bvar 1157], bands [bvar 1160, bvar 1170], bands [bvar 1173, bvar 1183], bands [bvar 1186, bvar 1196], bands [bvar 1199, bvar 1209]] 2,
    atMost [bands [bvar 1044, bvar 1049], bands [bvar 1057, bvar 1062], bands [bvar 1070, bvar 1075], bands [bvar 1083, bvar 1088], bands [bvar 1096, bvar 1101], bands [bvar 1109, bvar 1114], bands [bvar 1122, bvar 1127], bands [bvar 1135, bvar 1140], bands [bvar 1148, bvar 1153], bands [bvar 1161, bvar 1166], bands [bvar 1174, bvar 1179], bands [bvar 1187, bvar 1192], bands [bvar 1200, bvar 1205]] 2,
    atMost [bands [bvar 1045, bvar 1050], bands [bvar 1058, bvar 1063], bands [bvar 1071, bvar 1076], bands [bvar 1084, bvar 1089], bands [bvar 1097, bvar 1102], bands [bvar 1110, bvar 1115], bands [bvar 1123, bvar 1128], bands [bvar 1136, bvar 1141], bands [bvar 1149, bvar 1154], bands [bvar 1162, bvar 1167], bands [bvar 1175, bvar 1180], bands [bvar 1188, bvar 1193], bands [bvar 1201, bvar 1206]] 2,
    atMost [bands [bvar 1045, bvar 1051], bands [bvar 1058, bvar 1064], bands [bvar 1071, bvar 1077], bands [bvar 1084, bvar 1090], bands [bvar 1097, bvar 1103], bands [bvar 1110, bvar 1116], bands [bvar 1123, bvar 1129], bands [bvar 1136, bvar 1142], bands [bvar 1149, bvar 1155], bands [bvar 1162, bvar 1168], bands [bvar 1175, bvar 1181], bands [bvar 1188, bvar 1194], bands [bvar 1201, bvar 1207]] 2,
    atMost [bands [bvar 1045, bvar 1053], bands [bvar 1058, bvar 1066], bands [bvar 1071, bvar 1079], bands [bvar 1084, bvar 1092], bands [bvar 1097, bvar 1105], bands [bvar 1110, bvar 1118], bands [bvar 1123, bvar 1131], bands [bvar 1136, bvar 1144], bands [bvar 1149, bvar 1157], bands [bvar 1162, bvar 1170], bands [bvar 1175, bvar 1183], bands [bvar 1188, bvar 1196], bands [bvar 1201, bvar 1209]] 2,
    atMost [bands [bvar 1045, bvar 1054], bands [bvar 1058, bvar 1067], bands [bvar 1071, bvar 1080], bands [bvar 1084, bvar 1093], bands [bvar 1097, bvar 1106], bands [bvar 1110, bvar 1119], bands [bvar 1123, bvar 1132], bands [bvar 1136, bvar 1145], bands [bvar 1149, bvar 1158], bands [bvar 1162, bvar 1171], bands [bvar 1175, bvar 1184], bands [bvar 1188, bvar 1197], bands [bvar 1201, bvar 1210]] 2,
    atMost [bands [bvar 1046, bvar 1049], bands [bvar 1059, bvar 1062], bands [bvar 1072, bvar 1075], bands [bvar 1085, bvar 1088], bands [bvar 1098, bvar 1101], bands [bvar 1111, bvar 1114], bands [bvar 1124, bvar 1127], bands [bvar 1137, bvar 1140], bands [bvar 1150, bvar 1153], bands [bvar 1163, bvar 1166], bands [bvar 1176, bvar 1179], bands [bvar 1189, bvar 1192], bands [bvar 1202, bvar 1205]] 2,
    atMost [bands [bvar 1046, bvar 1050], bands [bvar 1059, bvar 1063], bands [bvar 1072, bvar 1076], bands [bvar 1085, bvar 1089], bands [bvar 1098, bvar 1102], bands [bvar 1111, bvar 1115], bands [bvar 1124, bvar 1128], bands [bvar 1137, bvar 1141], bands [bvar 1150, bvar 1154], bands [bvar 1163, bvar 1167], bands [bvar 1176, bvar 1180], bands [bvar 1189, bvar 1193], bands [bvar 1202, bvar 1206]] 2,
    atMost [bands [bvar 1046, bvar 1052], bands [bvar 1059, bvar 1065], bands [bvar 1072, bvar 1078], bands [bvar 1085, bvar 1091], bands [bvar 1098, bvar 1104], bands [bvar 1111, bvar 1117], bands [bvar 1124, bvar 1130], bands [bvar 1137, bvar 1143], bands [bvar 1150, bvar 1156], bands [bvar 1163, bvar 1169], bands [bvar 1176, bvar 1182], bands [bvar 1189, bvar 1195], bands [bvar 1202, bvar 1208]] 2,
    atMost [bands [bvar 1047, bvar 1052], bands [bvar 1060, bvar 1065], bands [bvar 1073, bvar 1078], bands [bvar 1086, bvar 1091], bands [bvar 1099, bvar 1104], bands [bvar 1112, bvar 1117], bands [bvar 1125, bvar 1130], bands [bvar 1138, bvar 1143], bands [bvar 1151, bvar 1156], bands [bvar 1164, bvar 1169], bands [bvar 1177, bvar 1182], bands [bvar 1190, bvar 1195], bands [bvar 1203, bvar 1208]] 2,
    atMost [bands [bvar 1047, bvar 1054], bands [bvar 1060, bvar 1067], bands [bvar 1073, bvar 1080], bands [bvar 1086, bvar 1093], bands [bvar 1099, bvar 1106], bands [bvar 1112, bvar 1119], bands [bvar 1125, bvar 1132], bands [bvar 1138, bvar 1145], bands [bvar 1151, bvar 1158], bands [bvar 1164, bvar 1171], bands [bvar 1177, bvar 1184], bands [bvar 1190, bvar 1197], bands [bvar 1203, bvar 1210]] 2,
    atMost [bands [bvar 1048, bvar 1052], bands [bvar 1061, bvar 1065], bands [bvar 1074, bvar 1078], bands [bvar 1087, bvar 1091], bands [bvar 1100, bvar 1104], bands [bvar 1113, bvar 1117], bands [bvar 1126, bvar 1130], bands [bvar 1139, bvar 1143], bands [bvar 1152, bvar 1156], bands [bvar 1165, bvar 1169], bands [bvar 1178, bvar 1182], bands [bvar 1191, bvar 1195], bands [bvar 1204, bvar 1208]] 2,
    atMost [bands [bvar 1048, bvar 1053], bands [bvar 1061, bvar 1066], bands [bvar 1074, bvar 1079], bands [bvar 1087, bvar 1092], bands [bvar 1100, bvar 1105], bands [bvar 1113, bvar 1118], bands [bvar 1126, bvar 1131], bands [bvar 1139, bvar 1144], bands [bvar 1152, bvar 1157], bands [bvar 1165, bvar 1170], bands [bvar 1178, bvar 1183], bands [bvar 1191, bvar 1196], bands [bvar 1204, bvar 1209]] 2,
    atMost [bands [bvar 1048, bvar 1054], bands [bvar 1061, bvar 1067], bands [bvar 1074, bvar 1080], bands [bvar 1087, bvar 1093], bands [bvar 1100, bvar 1106], bands [bvar 1113, bvar 1119], bands [bvar 1126, bvar 1132], bands [bvar 1139, bvar 1145], bands [bvar 1152, bvar 1158], bands [bvar 1165, bvar 1171], bands [bvar 1178, bvar 1184], bands [bvar 1191, bvar 1197], bands [bvar 1204, bvar 1210]] 2,
    atMost [bands [bvar 1049, bvar 1052], bands [bvar 1062, bvar 1065], bands [bvar 1075, bvar 1078], bands [bvar 1088, bvar 1091], bands [bvar 1101, bvar 1104], bands [bvar 1114, bvar 1117], bands [bvar 1127, bvar 1130], bands [bvar 1140, bvar 1143], bands [bvar 1153, bvar 1156], bands [bvar 1166, bvar 1169], bands [bvar 1179, bvar 1182], bands [bvar 1192, bvar 1195], bands [bvar 1205, bvar 1208]] 2,
    bnot (bands [bvar 1044, bvar 1047, bvar 1057, bvar 1060]),
    bnot (bands [bvar 1044, bvar 1048, bvar 1057, bvar 1061]),
    bnot (bands [bvar 1044, bvar 1049, bvar 1057, bvar 1062]),
    bnot (bands [bvar 1044, bvar 1051, bvar 1057, bvar 1064]),
    bnot (bands [bvar 1044, bvar 1052, bvar 1057, bvar 1065]),
    bnot (bands [bvar 1044, bvar 1053, bvar 1057, bvar 1066]),
    bnot (bands [bvar 1044, bvar 1054, bvar 1057, bvar 1067]),
    bnot (bands [bvar 1045, bvar 1047, bvar 1058, bvar 1060]),
    bnot (bands [bvar 1045, bvar 1048, bvar 1058, bvar 1061]),
    bnot (bands [bvar 1045, bvar 1049, bvar 1058, bvar 1062]) ]

def reducedUnionChunk000 : BVLogicalExpr :=
  bands reducedUnionChunk000Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
