import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk002Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1047, bvar 1053, bvar 1099, bvar 1105]),
    bnot (bands [bvar 1047, bvar 1054, bvar 1099, bvar 1106]),
    bnot (bands [bvar 1048, bvar 1049, bvar 1100, bvar 1101]),
    bnot (bands [bvar 1048, bvar 1050, bvar 1100, bvar 1102]),
    bnot (bands [bvar 1048, bvar 1051, bvar 1100, bvar 1103]),
    bnot (bands [bvar 1048, bvar 1052, bvar 1100, bvar 1104]),
    bnot (bands [bvar 1048, bvar 1053, bvar 1100, bvar 1105]),
    bnot (bands [bvar 1048, bvar 1054, bvar 1100, bvar 1106]),
    bnot (bands [bvar 1049, bvar 1050, bvar 1101, bvar 1102]),
    bnot (bands [bvar 1049, bvar 1051, bvar 1101, bvar 1103]),
    bnot (bands [bvar 1049, bvar 1052, bvar 1101, bvar 1104]),
    bnot (bands [bvar 1049, bvar 1053, bvar 1101, bvar 1105]),
    bnot (bands [bvar 1049, bvar 1054, bvar 1101, bvar 1106]),
    bnot (bands [bvar 1051, bvar 1054, bvar 1103, bvar 1106]),
    bnot (bands [bvar 1052, bvar 1053, bvar 1104, bvar 1105]),
    bnot (bands [bvar 1052, bvar 1054, bvar 1104, bvar 1106]),
    bnot (bands [bvar 1044, bvar 1046, bvar 1109, bvar 1111]),
    bnot (bands [bvar 1048, bvar 1049, bvar 1113, bvar 1114]),
    bnot (bands [bvar 1048, bvar 1050, bvar 1113, bvar 1115]),
    bnot (bands [bvar 1048, bvar 1051, bvar 1113, bvar 1116]),
    bnot (bands [bvar 1048, bvar 1052, bvar 1113, bvar 1117]),
    bnot (bands [bvar 1048, bvar 1053, bvar 1113, bvar 1118]),
    bnot (bands [bvar 1048, bvar 1054, bvar 1113, bvar 1119]),
    bnot (bands [bvar 1049, bvar 1050, bvar 1114, bvar 1115]),
    bnot (bands [bvar 1049, bvar 1051, bvar 1114, bvar 1116]),
    bnot (bands [bvar 1049, bvar 1052, bvar 1114, bvar 1117]),
    bnot (bands [bvar 1049, bvar 1053, bvar 1114, bvar 1118]),
    bnot (bands [bvar 1049, bvar 1054, bvar 1114, bvar 1119]),
    bnot (bands [bvar 1051, bvar 1052, bvar 1116, bvar 1117]),
    bnot (bands [bvar 1051, bvar 1053, bvar 1116, bvar 1118]),
    bnot (bands [bvar 1051, bvar 1054, bvar 1116, bvar 1119]),
    bnot (bands [bvar 1052, bvar 1053, bvar 1117, bvar 1118]),
    bnot (bands [bvar 1052, bvar 1054, bvar 1117, bvar 1119]),
    bnot (bands [bvar 1053, bvar 1054, bvar 1118, bvar 1119]),
    bnot (bands [bvar 1043, bvar 1047, bvar 1121, bvar 1125]),
    bnot (bands [bvar 1044, bvar 1047, bvar 1122, bvar 1125]),
    bnot (bands [bvar 1045, bvar 1047, bvar 1123, bvar 1125]),
    bnot (bands [bvar 1046, bvar 1047, bvar 1124, bvar 1125]),
    bnot (bands [bvar 1049, bvar 1050, bvar 1127, bvar 1128]),
    bnot (bands [bvar 1049, bvar 1051, bvar 1127, bvar 1129]),
    bnot (bands [bvar 1049, bvar 1052, bvar 1127, bvar 1130]),
    bnot (bands [bvar 1049, bvar 1053, bvar 1127, bvar 1131]),
    bnot (bands [bvar 1049, bvar 1054, bvar 1127, bvar 1132]),
    bnot (bands [bvar 1050, bvar 1051, bvar 1128, bvar 1129]),
    bnot (bands [bvar 1050, bvar 1053, bvar 1128, bvar 1131]),
    bnot (bands [bvar 1051, bvar 1053, bvar 1129, bvar 1131]),
    bnot (bands [bvar 1043, bvar 1047, bvar 1134, bvar 1138]),
    bnot (bands [bvar 1043, bvar 1048, bvar 1134, bvar 1139]),
    bnot (bands [bvar 1044, bvar 1047, bvar 1135, bvar 1138]),
    bnot (bands [bvar 1044, bvar 1048, bvar 1135, bvar 1139]),
    bnot (bands [bvar 1045, bvar 1046, bvar 1136, bvar 1137]),
    bnot (bands [bvar 1045, bvar 1047, bvar 1136, bvar 1138]),
    bnot (bands [bvar 1045, bvar 1048, bvar 1136, bvar 1139]),
    bnot (bands [bvar 1046, bvar 1047, bvar 1137, bvar 1138]),
    bnot (bands [bvar 1046, bvar 1048, bvar 1137, bvar 1139]),
    bnot (bands [bvar 1047, bvar 1048, bvar 1138, bvar 1139]),
    bnot (bands [bvar 1052, bvar 1053, bvar 1143, bvar 1144]),
    bnot (bands [bvar 1043, bvar 1046, bvar 1160, bvar 1163]),
    bnot (bands [bvar 1043, bvar 1047, bvar 1160, bvar 1164]),
    bnot (bands [bvar 1043, bvar 1048, bvar 1160, bvar 1165]),
    bnot (bands [bvar 1043, bvar 1049, bvar 1160, bvar 1166]),
    bnot (bands [bvar 1043, bvar 1050, bvar 1160, bvar 1167]),
    bnot (bands [bvar 1044, bvar 1047, bvar 1161, bvar 1164]),
    bnot (bands [bvar 1044, bvar 1048, bvar 1161, bvar 1165]) ]

def reducedUnionChunk002 : BVLogicalExpr :=
  bands reducedUnionChunk002Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
