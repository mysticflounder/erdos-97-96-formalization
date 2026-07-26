import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk126Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 9, bvar 11, bvar 1142, bvar 1144]),
    bnot (bands [bvar 9, bvar 12, bvar 1142, bvar 1145]),
    bnot (bands [bvar 10, bvar 11, bvar 1143, bvar 1144]),
    bnot (bands [bvar 10, bvar 12, bvar 1143, bvar 1145]),
    bnot (bands [bvar 0, bvar 10, bvar 1159, bvar 1169]),
    bnot (bands [bvar 0, bvar 12, bvar 1159, bvar 1171]),
    bnot (bands [bvar 1, bvar 10, bvar 1160, bvar 1169]),
    bnot (bands [bvar 1, bvar 11, bvar 1160, bvar 1170]),
    bnot (bands [bvar 1, bvar 12, bvar 1160, bvar 1171]),
    bnot (bands [bvar 2, bvar 10, bvar 1161, bvar 1169]),
    bnot (bands [bvar 2, bvar 11, bvar 1161, bvar 1170]),
    bnot (bands [bvar 3, bvar 11, bvar 1162, bvar 1170]),
    bnot (bands [bvar 6, bvar 7, bvar 1165, bvar 1166]),
    bnot (bands [bvar 10, bvar 12, bvar 1169, bvar 1171]),
    bnot (bands [bvar 0, bvar 11, bvar 1172, bvar 1183]),
    bnot (bands [bvar 1, bvar 11, bvar 1173, bvar 1183]),
    bnot (bands [bvar 5, bvar 9, bvar 1177, bvar 1181]),
    bnot (bands [bvar 6, bvar 9, bvar 1178, bvar 1181]),
    bnot (bands [bvar 7, bvar 9, bvar 1179, bvar 1181]),
    bnot (bands [bvar 11, bvar 12, bvar 1183, bvar 1184]),
    bnot (bands [bvar 0, bvar 12, bvar 1185, bvar 1197]),
    bnot (bands [bvar 2, bvar 12, bvar 1187, bvar 1197]),
    bnot (bands [bvar 5, bvar 9, bvar 1190, bvar 1194]),
    bnot (bands [bvar 5, bvar 10, bvar 1190, bvar 1195]),
    bnot (bands [bvar 6, bvar 10, bvar 1191, bvar 1195]),
    bnot (bands [bvar 8, bvar 10, bvar 1193, bvar 1195]),
    bnot (bands [bvar 9, bvar 10, bvar 1194, bvar 1195]),
    bnot (bands [bvar 0, bvar 1, bvar 1198, bvar 1199]),
    bnot (bands [bvar 5, bvar 9, bvar 1203, bvar 1207]),
    bnot (bands [bvar 5, bvar 10, bvar 1203, bvar 1208]),
    bnot (bands [bvar 6, bvar 9, bvar 1204, bvar 1207]),
    bnot (bands [bvar 6, bvar 10, bvar 1204, bvar 1208]),
    bnot (bands [bvar 6, bvar 11, bvar 1204, bvar 1209]),
    bnot (bands [bvar 7, bvar 10, bvar 1205, bvar 1208]),
    bnot (bands [bvar 7, bvar 11, bvar 1205, bvar 1209]),
    bnot (bands [bvar 8, bvar 10, bvar 1206, bvar 1208]),
    bnot (bands [bvar 8, bvar 11, bvar 1206, bvar 1209]),
    bnot (bands [bvar 9, bvar 11, bvar 1207, bvar 1209]),
    bnot (bands [bvar 10, bvar 11, bvar 1208, bvar 1209]),
    bnot (bands [bvar 9, bvar 10, bvar 1116, bvar 1117]),
    bnot (bands [bvar 10, bvar 11, bvar 1117, bvar 1118]),
    bnot (bands [bvar 10, bvar 12, bvar 1117, bvar 1119]),
    bnot (bands [bvar 11, bvar 12, bvar 1118, bvar 1119]),
    bnot (bands [bvar 0, bvar 9, bvar 1120, bvar 1129]),
    bnot (bands [bvar 1, bvar 10, bvar 1121, bvar 1130]),
    bnot (bands [bvar 2, bvar 9, bvar 1122, bvar 1129]),
    bnot (bands [bvar 2, bvar 12, bvar 1122, bvar 1132]),
    bnot (bands [bvar 3, bvar 9, bvar 1123, bvar 1129]),
    bnot (bands [bvar 3, bvar 10, bvar 1123, bvar 1130]),
    bnot (bands [bvar 3, bvar 12, bvar 1123, bvar 1132]),
    bnot (bands [bvar 9, bvar 11, bvar 1129, bvar 1131]),
    bnot (bands [bvar 10, bvar 11, bvar 1130, bvar 1131]),
    bnot (bands [bvar 11, bvar 12, bvar 1131, bvar 1132]),
    bnot (bands [bvar 0, bvar 12, bvar 1133, bvar 1145]),
    bnot (bands [bvar 1, bvar 9, bvar 1134, bvar 1142]),
    bnot (bands [bvar 1, bvar 12, bvar 1134, bvar 1145]),
    bnot (bands [bvar 2, bvar 9, bvar 1135, bvar 1142]),
    bnot (bands [bvar 5, bvar 7, bvar 1047, bvar 1049]),
    bnot (bands [bvar 5, bvar 9, bvar 1047, bvar 1051]),
    bnot (bands [bvar 5, bvar 10, bvar 1047, bvar 1052]),
    bnot (bands [bvar 5, bvar 11, bvar 1047, bvar 1053]),
    bnot (bands [bvar 5, bvar 12, bvar 1047, bvar 1054]),
    bnot (bands [bvar 6, bvar 9, bvar 1048, bvar 1051]),
    bnot (bands [bvar 6, bvar 10, bvar 1048, bvar 1052]) ]

def reducedUnionChunk126 : BVLogicalExpr :=
  bands reducedUnionChunk126Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
