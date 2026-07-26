import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk060Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 71, bvar 76, bvar 1189, bvar 1194]),
    bnot (bands [bvar 71, bvar 77, bvar 1189, bvar 1195]),
    bnot (bands [bvar 72, bvar 73, bvar 1190, bvar 1191]),
    bnot (bands [bvar 72, bvar 74, bvar 1190, bvar 1192]),
    bnot (bands [bvar 72, bvar 75, bvar 1190, bvar 1193]),
    bnot (bands [bvar 72, bvar 76, bvar 1190, bvar 1194]),
    bnot (bands [bvar 72, bvar 77, bvar 1190, bvar 1195]),
    bnot (bands [bvar 73, bvar 74, bvar 1191, bvar 1192]),
    bnot (bands [bvar 73, bvar 75, bvar 1191, bvar 1193]),
    bnot (bands [bvar 73, bvar 76, bvar 1191, bvar 1194]),
    bnot (bands [bvar 73, bvar 77, bvar 1191, bvar 1195]),
    bnot (bands [bvar 74, bvar 75, bvar 1192, bvar 1193]),
    bnot (bands [bvar 74, bvar 76, bvar 1192, bvar 1194]),
    bnot (bands [bvar 74, bvar 77, bvar 1192, bvar 1195]),
    bnot (bands [bvar 75, bvar 76, bvar 1193, bvar 1194]),
    bnot (bands [bvar 75, bvar 77, bvar 1193, bvar 1195]),
    bnot (bands [bvar 76, bvar 77, bvar 1194, bvar 1195]),
    bnot (bands [bvar 1081, bvar 1082, bvar 184, bvar 185]),
    bnot (bands [bvar 1085, bvar 1087, bvar 188, bvar 190]),
    bnot (bands [bvar 1085, bvar 1089, bvar 188, bvar 192]),
    bnot (bands [bvar 1085, bvar 1092, bvar 188, bvar 195]),
    bnot (bands [bvar 1087, bvar 1089, bvar 190, bvar 192]),
    bnot (bands [bvar 1087, bvar 1092, bvar 190, bvar 195]),
    bnot (bands [bvar 1088, bvar 1089, bvar 191, bvar 192]),
    bnot (bands [bvar 1088, bvar 1090, bvar 191, bvar 193]),
    bnot (bands [bvar 1088, bvar 1091, bvar 191, bvar 194]),
    bnot (bands [bvar 1088, bvar 1092, bvar 191, bvar 195]),
    bnot (bands [bvar 1089, bvar 1092, bvar 192, bvar 195]),
    bnot (bands [bvar 1090, bvar 1092, bvar 193, bvar 195]),
    bnot (bands [bvar 67, bvar 68, bvar 1198, bvar 1199]),
    bnot (bands [bvar 67, bvar 69, bvar 1198, bvar 1200]),
    bnot (bands [bvar 71, bvar 72, bvar 1202, bvar 1203]),
    bnot (bands [bvar 71, bvar 73, bvar 1202, bvar 1204]),
    bnot (bands [bvar 71, bvar 74, bvar 1202, bvar 1205]),
    bnot (bands [bvar 71, bvar 75, bvar 1202, bvar 1206]),
    bnot (bands [bvar 71, bvar 76, bvar 1202, bvar 1207]),
    bnot (bands [bvar 71, bvar 77, bvar 1202, bvar 1208]),
    bnot (bands [bvar 71, bvar 78, bvar 1202, bvar 1209]),
    bnot (bands [bvar 72, bvar 74, bvar 1203, bvar 1205]),
    bnot (bands [bvar 72, bvar 75, bvar 1203, bvar 1206]),
    bnot (bands [bvar 72, bvar 76, bvar 1203, bvar 1207]),
    bnot (bands [bvar 72, bvar 77, bvar 1203, bvar 1208]),
    bnot (bands [bvar 73, bvar 75, bvar 1204, bvar 1206]),
    bnot (bands [bvar 73, bvar 76, bvar 1204, bvar 1207]),
    bnot (bands [bvar 73, bvar 78, bvar 1204, bvar 1209]),
    bnot (bands [bvar 74, bvar 75, bvar 1205, bvar 1206]),
    bnot (bands [bvar 74, bvar 78, bvar 1205, bvar 1209]),
    bnot (bands [bvar 75, bvar 76, bvar 1206, bvar 1207]),
    bnot (bands [bvar 75, bvar 78, bvar 1206, bvar 1209]),
    bnot (bands [bvar 76, bvar 78, bvar 1207, bvar 1209]),
    bnot (bands [bvar 77, bvar 78, bvar 1208, bvar 1209]),
    bnot (bands [bvar 1094, bvar 1103, bvar 93, bvar 102]),
    bnot (bands [bvar 1094, bvar 1105, bvar 93, bvar 104]),
    bnot (bands [bvar 1094, bvar 1106, bvar 93, bvar 105]),
    bnot (bands [bvar 1095, bvar 1104, bvar 94, bvar 103]),
    bnot (bands [bvar 1095, bvar 1106, bvar 94, bvar 105]),
    bnot (bands [bvar 1096, bvar 1100, bvar 95, bvar 99]),
    bnot (bands [bvar 1096, bvar 1101, bvar 95, bvar 100]),
    bnot (bands [bvar 1096, bvar 1102, bvar 95, bvar 101]),
    bnot (bands [bvar 1096, bvar 1103, bvar 95, bvar 102]),
    bnot (bands [bvar 1096, bvar 1104, bvar 95, bvar 103]),
    bnot (bands [bvar 1096, bvar 1105, bvar 95, bvar 104]),
    bnot (bands [bvar 1096, bvar 1106, bvar 95, bvar 105]),
    bnot (bands [bvar 1097, bvar 1100, bvar 96, bvar 99]) ]

def reducedUnionChunk060 : BVLogicalExpr :=
  bands reducedUnionChunk060Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
