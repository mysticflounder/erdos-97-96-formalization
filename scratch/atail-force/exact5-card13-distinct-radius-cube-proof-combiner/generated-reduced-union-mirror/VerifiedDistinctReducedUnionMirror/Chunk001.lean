import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk001Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1045, bvar 1050, bvar 1058, bvar 1063]),
    bnot (bands [bvar 1046, bvar 1047, bvar 1059, bvar 1060]),
    bnot (bands [bvar 1046, bvar 1048, bvar 1059, bvar 1061]),
    bnot (bands [bvar 1046, bvar 1049, bvar 1059, bvar 1062]),
    bnot (bands [bvar 1046, bvar 1050, bvar 1059, bvar 1063]),
    bnot (bands [bvar 1046, bvar 1051, bvar 1059, bvar 1064]),
    bnot (bands [bvar 1046, bvar 1052, bvar 1059, bvar 1065]),
    bnot (bands [bvar 1046, bvar 1053, bvar 1059, bvar 1066]),
    bnot (bands [bvar 1046, bvar 1054, bvar 1059, bvar 1067]),
    bnot (bands [bvar 1047, bvar 1054, bvar 1060, bvar 1067]),
    bnot (bands [bvar 1048, bvar 1049, bvar 1061, bvar 1062]),
    bnot (bands [bvar 1048, bvar 1050, bvar 1061, bvar 1063]),
    bnot (bands [bvar 1048, bvar 1051, bvar 1061, bvar 1064]),
    bnot (bands [bvar 1048, bvar 1052, bvar 1061, bvar 1065]),
    bnot (bands [bvar 1048, bvar 1054, bvar 1061, bvar 1067]),
    bnot (bands [bvar 1049, bvar 1050, bvar 1062, bvar 1063]),
    bnot (bands [bvar 1049, bvar 1051, bvar 1062, bvar 1064]),
    bnot (bands [bvar 1049, bvar 1052, bvar 1062, bvar 1065]),
    bnot (bands [bvar 1049, bvar 1053, bvar 1062, bvar 1066]),
    bnot (bands [bvar 1049, bvar 1054, bvar 1062, bvar 1067]),
    bnot (bands [bvar 1045, bvar 1047, bvar 1071, bvar 1073]),
    bnot (bands [bvar 1045, bvar 1048, bvar 1071, bvar 1074]),
    bnot (bands [bvar 1045, bvar 1049, bvar 1071, bvar 1075]),
    bnot (bands [bvar 1045, bvar 1050, bvar 1071, bvar 1076]),
    bnot (bands [bvar 1045, bvar 1051, bvar 1071, bvar 1077]),
    bnot (bands [bvar 1045, bvar 1052, bvar 1071, bvar 1078]),
    bnot (bands [bvar 1045, bvar 1053, bvar 1071, bvar 1079]),
    bnot (bands [bvar 1045, bvar 1054, bvar 1071, bvar 1080]),
    bnot (bands [bvar 1047, bvar 1049, bvar 1073, bvar 1075]),
    bnot (bands [bvar 1047, bvar 1051, bvar 1073, bvar 1077]),
    bnot (bands [bvar 1047, bvar 1052, bvar 1073, bvar 1078]),
    bnot (bands [bvar 1047, bvar 1054, bvar 1073, bvar 1080]),
    bnot (bands [bvar 1048, bvar 1049, bvar 1074, bvar 1075]),
    bnot (bands [bvar 1048, bvar 1050, bvar 1074, bvar 1076]),
    bnot (bands [bvar 1048, bvar 1051, bvar 1074, bvar 1077]),
    bnot (bands [bvar 1048, bvar 1053, bvar 1074, bvar 1079]),
    bnot (bands [bvar 1049, bvar 1050, bvar 1075, bvar 1076]),
    bnot (bands [bvar 1049, bvar 1052, bvar 1075, bvar 1078]),
    bnot (bands [bvar 1049, bvar 1053, bvar 1075, bvar 1079]),
    bnot (bands [bvar 1049, bvar 1054, bvar 1075, bvar 1080]),
    bnot (bands [bvar 1050, bvar 1051, bvar 1076, bvar 1077]),
    bnot (bands [bvar 1050, bvar 1052, bvar 1076, bvar 1078]),
    bnot (bands [bvar 1050, bvar 1053, bvar 1076, bvar 1079]),
    bnot (bands [bvar 1050, bvar 1054, bvar 1076, bvar 1080]),
    bnot (bands [bvar 1051, bvar 1052, bvar 1077, bvar 1078]),
    bnot (bands [bvar 1051, bvar 1053, bvar 1077, bvar 1079]),
    bnot (bands [bvar 1051, bvar 1054, bvar 1077, bvar 1080]),
    bnot (bands [bvar 1052, bvar 1054, bvar 1078, bvar 1080]),
    bnot (bands [bvar 1053, bvar 1054, bvar 1079, bvar 1080]),
    bnot (bands [bvar 1046, bvar 1047, bvar 1085, bvar 1086]),
    bnot (bands [bvar 1046, bvar 1048, bvar 1085, bvar 1087]),
    bnot (bands [bvar 1046, bvar 1049, bvar 1085, bvar 1088]),
    bnot (bands [bvar 1046, bvar 1050, bvar 1085, bvar 1089]),
    bnot (bands [bvar 1046, bvar 1051, bvar 1085, bvar 1090]),
    bnot (bands [bvar 1046, bvar 1052, bvar 1085, bvar 1091]),
    bnot (bands [bvar 1046, bvar 1053, bvar 1085, bvar 1092]),
    bnot (bands [bvar 1046, bvar 1054, bvar 1085, bvar 1093]),
    bnot (bands [bvar 1047, bvar 1048, bvar 1086, bvar 1087]),
    bnot (bands [bvar 1047, bvar 1049, bvar 1086, bvar 1088]),
    bnot (bands [bvar 1047, bvar 1050, bvar 1086, bvar 1089]),
    bnot (bands [bvar 1047, bvar 1051, bvar 1086, bvar 1090]),
    bnot (bands [bvar 1047, bvar 1052, bvar 1086, bvar 1091]),
    bnot (bands [bvar 1047, bvar 1053, bvar 1086, bvar 1092]),
    bnot (bands [bvar 1047, bvar 1054, bvar 1086, bvar 1093]) ]

def reducedUnionChunk001 : BVLogicalExpr :=
  bands reducedUnionChunk001Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
