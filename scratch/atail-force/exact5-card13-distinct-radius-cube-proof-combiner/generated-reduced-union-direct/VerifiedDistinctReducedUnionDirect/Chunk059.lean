import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk059Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 77, bvar 79, bvar 1104, bvar 1106]),
    bnot (bands [bvar 78, bvar 79, bvar 1105, bvar 1106]),
    bnot (bands [bvar 1081, bvar 1091, bvar 93, bvar 103]),
    bnot (bands [bvar 1081, bvar 1092, bvar 93, bvar 104]),
    bnot (bands [bvar 1091, bvar 1092, bvar 103, bvar 104]),
    bnot (bands [bvar 68, bvar 74, bvar 1121, bvar 1127]),
    bnot (bands [bvar 68, bvar 75, bvar 1121, bvar 1128]),
    bnot (bands [bvar 68, bvar 76, bvar 1121, bvar 1129]),
    bnot (bands [bvar 68, bvar 77, bvar 1121, bvar 1130]),
    bnot (bands [bvar 68, bvar 78, bvar 1121, bvar 1131]),
    bnot (bands [bvar 69, bvar 77, bvar 1122, bvar 1130]),
    bnot (bands [bvar 69, bvar 78, bvar 1122, bvar 1131]),
    bnot (bands [bvar 71, bvar 72, bvar 1124, bvar 1125]),
    bnot (bands [bvar 74, bvar 75, bvar 1127, bvar 1128]),
    bnot (bands [bvar 74, bvar 76, bvar 1127, bvar 1129]),
    bnot (bands [bvar 74, bvar 77, bvar 1127, bvar 1130]),
    bnot (bands [bvar 74, bvar 78, bvar 1127, bvar 1131]),
    bnot (bands [bvar 74, bvar 79, bvar 1127, bvar 1132]),
    bnot (bands [bvar 75, bvar 76, bvar 1128, bvar 1129]),
    bnot (bands [bvar 75, bvar 77, bvar 1128, bvar 1130]),
    bnot (bands [bvar 75, bvar 78, bvar 1128, bvar 1131]),
    bnot (bands [bvar 75, bvar 79, bvar 1128, bvar 1132]),
    bnot (bands [bvar 76, bvar 77, bvar 1129, bvar 1130]),
    bnot (bands [bvar 76, bvar 78, bvar 1129, bvar 1131]),
    bnot (bands [bvar 76, bvar 79, bvar 1129, bvar 1132]),
    bnot (bands [bvar 77, bvar 78, bvar 1130, bvar 1131]),
    bnot (bands [bvar 77, bvar 79, bvar 1130, bvar 1132]),
    bnot (bands [bvar 78, bvar 79, bvar 1131, bvar 1132]),
    bnot (bands [bvar 1081, bvar 1082, bvar 145, bvar 146]),
    bnot (bands [bvar 1082, bvar 1091, bvar 146, bvar 155]),
    bnot (bands [bvar 1082, bvar 1092, bvar 146, bvar 156]),
    bnot (bands [bvar 1085, bvar 1087, bvar 149, bvar 151]),
    bnot (bands [bvar 1085, bvar 1089, bvar 149, bvar 153]),
    bnot (bands [bvar 1086, bvar 1087, bvar 150, bvar 151]),
    bnot (bands [bvar 1086, bvar 1089, bvar 150, bvar 153]),
    bnot (bands [bvar 1087, bvar 1088, bvar 151, bvar 152]),
    bnot (bands [bvar 1087, bvar 1089, bvar 151, bvar 153]),
    bnot (bands [bvar 1088, bvar 1089, bvar 152, bvar 153]),
    atMost [bands [bvar 1081, bvar 158], bands [bvar 1082, bvar 159], bands [bvar 1083, bvar 160], bands [bvar 1084, bvar 161], bands [bvar 1085, bvar 162], bands [bvar 1086, bvar 163], bands [bvar 1087, bvar 164], bands [bvar 1088, bvar 165], bands [bvar 1089, bvar 166], bands [bvar 1090, bvar 167], bands [bvar 1091, bvar 168], bands [bvar 1092, bvar 169], bands [bvar 1093, bvar 170]] 2,
    bnot (bands [bvar 1081, bvar 1083, bvar 158, bvar 160]),
    bnot (bands [bvar 1081, bvar 1092, bvar 158, bvar 169]),
    bnot (bands [bvar 1082, bvar 1092, bvar 159, bvar 169]),
    bnot (bands [bvar 1083, bvar 1092, bvar 160, bvar 169]),
    bnot (bands [bvar 1085, bvar 1086, bvar 162, bvar 163]),
    bnot (bands [bvar 1085, bvar 1087, bvar 162, bvar 164]),
    bnot (bands [bvar 1085, bvar 1088, bvar 162, bvar 165]),
    bnot (bands [bvar 1085, bvar 1089, bvar 162, bvar 166]),
    bnot (bands [bvar 1085, bvar 1090, bvar 162, bvar 167]),
    bnot (bands [bvar 1086, bvar 1087, bvar 163, bvar 164]),
    bnot (bands [bvar 1086, bvar 1089, bvar 163, bvar 166]),
    bnot (bands [bvar 1086, bvar 1090, bvar 163, bvar 167]),
    bnot (bands [bvar 1087, bvar 1089, bvar 164, bvar 166]),
    bnot (bands [bvar 1087, bvar 1090, bvar 164, bvar 167]),
    bnot (bands [bvar 1088, bvar 1089, bvar 165, bvar 166]),
    bnot (bands [bvar 1088, bvar 1090, bvar 165, bvar 167]),
    bnot (bands [bvar 1089, bvar 1090, bvar 166, bvar 167]),
    bnot (bands [bvar 1092, bvar 1093, bvar 169, bvar 170]),
    bnot (bands [bvar 71, bvar 75, bvar 1176, bvar 1180]),
    bnot (bands [bvar 72, bvar 75, bvar 1177, bvar 1180]),
    bnot (bands [bvar 67, bvar 79, bvar 1185, bvar 1197]),
    bnot (bands [bvar 71, bvar 72, bvar 1189, bvar 1190]),
    bnot (bands [bvar 71, bvar 73, bvar 1189, bvar 1191]),
    bnot (bands [bvar 71, bvar 74, bvar 1189, bvar 1192]),
    bnot (bands [bvar 71, bvar 75, bvar 1189, bvar 1193]) ]

def reducedUnionChunk059 : BVLogicalExpr :=
  bands reducedUnionChunk059Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
