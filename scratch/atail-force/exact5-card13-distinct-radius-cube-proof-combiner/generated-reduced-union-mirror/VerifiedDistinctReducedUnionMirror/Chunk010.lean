import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk010Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1087, bvar 1090, bvar 1191, bvar 1194]),
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
    bnot (bands [bvar 1086, bvar 1088, bvar 1203, bvar 1205]),
    bnot (bands [bvar 1086, bvar 1089, bvar 1203, bvar 1206]),
    bnot (bands [bvar 1086, bvar 1091, bvar 1203, bvar 1208]),
    bnot (bands [bvar 1086, bvar 1092, bvar 1203, bvar 1209]),
    bnot (bands [bvar 1087, bvar 1088, bvar 1204, bvar 1205]),
    bnot (bands [bvar 1087, bvar 1089, bvar 1204, bvar 1206]),
    bnot (bands [bvar 1087, bvar 1090, bvar 1204, bvar 1207]),
    bnot (bands [bvar 1087, bvar 1091, bvar 1204, bvar 1208]),
    bnot (bands [bvar 1087, bvar 1092, bvar 1204, bvar 1209]),
    bnot (bands [bvar 1088, bvar 1089, bvar 1205, bvar 1206]),
    bnot (bands [bvar 1088, bvar 1091, bvar 1205, bvar 1208]),
    bnot (bands [bvar 1088, bvar 1092, bvar 1205, bvar 1209]),
    bnot (bands [bvar 1089, bvar 1090, bvar 1206, bvar 1207]),
    bnot (bands [bvar 1089, bvar 1091, bvar 1206, bvar 1208]),
    bnot (bands [bvar 1089, bvar 1092, bvar 1206, bvar 1209]),
    bnot (bands [bvar 1090, bvar 1092, bvar 1207, bvar 1209]),
    bnot (bands [bvar 1094, bvar 1100, bvar 1107, bvar 1113]),
    bnot (bands [bvar 1094, bvar 1101, bvar 1107, bvar 1114]),
    bnot (bands [bvar 1094, bvar 1102, bvar 1107, bvar 1115]),
    bnot (bands [bvar 1094, bvar 1103, bvar 1107, bvar 1116]),
    bnot (bands [bvar 1094, bvar 1104, bvar 1107, bvar 1117]),
    bnot (bands [bvar 1094, bvar 1105, bvar 1107, bvar 1118]),
    bnot (bands [bvar 1094, bvar 1106, bvar 1107, bvar 1119]),
    bnot (bands [bvar 1095, bvar 1103, bvar 1108, bvar 1116]),
    bnot (bands [bvar 1095, bvar 1105, bvar 1108, bvar 1118]),
    bnot (bands [bvar 1096, bvar 1100, bvar 1109, bvar 1113]),
    bnot (bands [bvar 1096, bvar 1101, bvar 1109, bvar 1114]),
    bnot (bands [bvar 1096, bvar 1102, bvar 1109, bvar 1115]),
    bnot (bands [bvar 1096, bvar 1103, bvar 1109, bvar 1116]),
    bnot (bands [bvar 1096, bvar 1104, bvar 1109, bvar 1117]),
    bnot (bands [bvar 1096, bvar 1105, bvar 1109, bvar 1118]),
    bnot (bands [bvar 1096, bvar 1106, bvar 1109, bvar 1119]),
    bnot (bands [bvar 1097, bvar 1100, bvar 1110, bvar 1113]),
    bnot (bands [bvar 1097, bvar 1101, bvar 1110, bvar 1114]),
    bnot (bands [bvar 1097, bvar 1102, bvar 1110, bvar 1115]),
    bnot (bands [bvar 1097, bvar 1103, bvar 1110, bvar 1116]),
    bnot (bands [bvar 1097, bvar 1104, bvar 1110, bvar 1117]),
    bnot (bands [bvar 1097, bvar 1105, bvar 1110, bvar 1118]),
    bnot (bands [bvar 1097, bvar 1106, bvar 1110, bvar 1119]),
    bnot (bands [bvar 1100, bvar 1103, bvar 1113, bvar 1116]),
    bnot (bands [bvar 1100, bvar 1104, bvar 1113, bvar 1117]),
    bnot (bands [bvar 1100, bvar 1105, bvar 1113, bvar 1118]),
    bnot (bands [bvar 1100, bvar 1106, bvar 1113, bvar 1119]),
    bnot (bands [bvar 1101, bvar 1103, bvar 1114, bvar 1116]),
    bnot (bands [bvar 1101, bvar 1104, bvar 1114, bvar 1117]),
    bnot (bands [bvar 1101, bvar 1105, bvar 1114, bvar 1118]),
    bnot (bands [bvar 1101, bvar 1106, bvar 1114, bvar 1119]) ]

def reducedUnionChunk010 : BVLogicalExpr :=
  bands reducedUnionChunk010Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
