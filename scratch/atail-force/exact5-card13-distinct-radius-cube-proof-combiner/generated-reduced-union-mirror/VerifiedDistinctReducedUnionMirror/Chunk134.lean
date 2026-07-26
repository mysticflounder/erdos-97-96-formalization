import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk134Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1, bvar 9, bvar 1108, bvar 1116]),
    bnot (bands [bvar 2, bvar 9, bvar 1109, bvar 1116]),
    bnot (bands [bvar 2, bvar 10, bvar 1109, bvar 1117]),
    bnot (bands [bvar 2, bvar 12, bvar 1109, bvar 1119]),
    bnot (bands [bvar 3, bvar 9, bvar 1110, bvar 1116]),
    bnot (bands [bvar 3, bvar 10, bvar 1110, bvar 1117]),
    bnot (bands [bvar 3, bvar 11, bvar 1110, bvar 1118]),
    bnot (bands [bvar 3, bvar 12, bvar 1110, bvar 1119]),
    bnot (bands [bvar 9, bvar 10, bvar 1116, bvar 1117]),
    bnot (bands [bvar 9, bvar 11, bvar 1116, bvar 1118]),
    bnot (bands [bvar 10, bvar 11, bvar 1117, bvar 1118]),
    bnot (bands [bvar 10, bvar 12, bvar 1117, bvar 1119]),
    bnot (bands [bvar 11, bvar 12, bvar 1118, bvar 1119]),
    bnot (bands [bvar 0, bvar 9, bvar 1120, bvar 1129]),
    bnot (bands [bvar 0, bvar 10, bvar 1120, bvar 1130]),
    bnot (bands [bvar 0, bvar 11, bvar 1120, bvar 1131]),
    bnot (bands [bvar 0, bvar 12, bvar 1120, bvar 1132]),
    bnot (bands [bvar 1, bvar 9, bvar 1121, bvar 1129]),
    bnot (bands [bvar 1, bvar 10, bvar 1121, bvar 1130]),
    bnot (bands [bvar 1, bvar 11, bvar 1121, bvar 1131]),
    bnot (bands [bvar 2, bvar 10, bvar 1122, bvar 1130]),
    bnot (bands [bvar 2, bvar 11, bvar 1122, bvar 1131]),
    bnot (bands [bvar 2, bvar 12, bvar 1122, bvar 1132]),
    bnot (bands [bvar 3, bvar 9, bvar 1123, bvar 1129]),
    bnot (bands [bvar 3, bvar 10, bvar 1123, bvar 1130]),
    bnot (bands [bvar 3, bvar 11, bvar 1123, bvar 1131]),
    bnot (bands [bvar 3, bvar 12, bvar 1123, bvar 1132]),
    bnot (bands [bvar 9, bvar 11, bvar 1129, bvar 1131]),
    bnot (bands [bvar 10, bvar 11, bvar 1130, bvar 1131]),
    bnot (bands [bvar 10, bvar 12, bvar 1130, bvar 1132]),
    bnot (bands [bvar 11, bvar 12, bvar 1131, bvar 1132]),
    bnot (bands [bvar 1, bvar 9, bvar 1134, bvar 1142]),
    bnot (bands [bvar 1, bvar 11, bvar 1134, bvar 1144]),
    bnot (bands [bvar 2, bvar 11, bvar 1135, bvar 1144]),
    bnot (bands [bvar 2, bvar 12, bvar 1135, bvar 1145]),
    bnot (bands [bvar 3, bvar 11, bvar 1136, bvar 1144]),
    bnot (bands [bvar 9, bvar 12, bvar 1142, bvar 1145]),
    bnot (bands [bvar 10, bvar 12, bvar 1143, bvar 1145]),
    bnot (bands [bvar 5, bvar 9, bvar 1047, bvar 1051]),
    bnot (bands [bvar 5, bvar 10, bvar 1047, bvar 1052]),
    bnot (bands [bvar 5, bvar 11, bvar 1047, bvar 1053]),
    bnot (bands [bvar 5, bvar 12, bvar 1047, bvar 1054]),
    bnot (bands [bvar 6, bvar 9, bvar 1048, bvar 1051]),
    bnot (bands [bvar 6, bvar 10, bvar 1048, bvar 1052]),
    bnot (bands [bvar 6, bvar 11, bvar 1048, bvar 1053]),
    bnot (bands [bvar 6, bvar 12, bvar 1048, bvar 1054]),
    bnot (bands [bvar 7, bvar 9, bvar 1049, bvar 1051]),
    bnot (bands [bvar 7, bvar 10, bvar 1049, bvar 1052]),
    bnot (bands [bvar 7, bvar 11, bvar 1049, bvar 1053]),
    bnot (bands [bvar 7, bvar 12, bvar 1049, bvar 1054]),
    bnot (bands [bvar 6, bvar 9, bvar 1061, bvar 1064]),
    bnot (bands [bvar 6, bvar 11, bvar 1061, bvar 1066]),
    bnot (bands [bvar 6, bvar 12, bvar 1061, bvar 1067]),
    bnot (bands [bvar 7, bvar 10, bvar 1062, bvar 1065]),
    bnot (bands [bvar 7, bvar 11, bvar 1062, bvar 1066]),
    bnot (bands [bvar 7, bvar 12, bvar 1062, bvar 1067]),
    bnot (bands [bvar 8, bvar 9, bvar 1063, bvar 1064]),
    bnot (bands [bvar 8, bvar 11, bvar 1063, bvar 1066]),
    bnot (bands [bvar 9, bvar 10, bvar 1064, bvar 1065]),
    bnot (bands [bvar 10, bvar 12, bvar 1065, bvar 1067]),
    bnot (bands [bvar 11, bvar 12, bvar 1066, bvar 1067]),
    bnot (bands [bvar 5, bvar 9, bvar 1073, bvar 1077]),
    bnot (bands [bvar 5, bvar 10, bvar 1086, bvar 1091]),
    bnot (bands [bvar 5, bvar 11, bvar 1086, bvar 1092]) ]

def reducedUnionChunk134 : BVLogicalExpr :=
  bands reducedUnionChunk134Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
