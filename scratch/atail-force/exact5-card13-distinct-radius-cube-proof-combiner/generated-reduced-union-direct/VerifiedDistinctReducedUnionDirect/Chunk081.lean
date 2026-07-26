import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk081Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1058, bvar 1059, bvar 616, bvar 617]),
    bnot (bands [bvar 1059, bvar 1060, bvar 617, bvar 618]),
    bnot (bands [bvar 1062, bvar 1063, bvar 620, bvar 621]),
    bnot (bands [bvar 1062, bvar 1064, bvar 620, bvar 622]),
    bnot (bands [bvar 1062, bvar 1065, bvar 620, bvar 623]),
    bnot (bands [bvar 1062, bvar 1066, bvar 620, bvar 624]),
    bnot (bands [bvar 1062, bvar 1067, bvar 620, bvar 625]),
    bnot (bands [bvar 1063, bvar 1065, bvar 621, bvar 623]),
    bnot (bands [bvar 1063, bvar 1066, bvar 621, bvar 624]),
    bnot (bands [bvar 1063, bvar 1067, bvar 621, bvar 625]),
    bnot (bands [bvar 1064, bvar 1066, bvar 622, bvar 624]),
    bnot (bands [bvar 1064, bvar 1067, bvar 622, bvar 625]),
    bnot (bands [bvar 1065, bvar 1067, bvar 623, bvar 625]),
    bnot (bands [bvar 556, bvar 558, bvar 1128, bvar 1130]),
    bnot (bands [bvar 556, bvar 560, bvar 1128, bvar 1132]),
    bnot (bands [bvar 1055, bvar 1065, bvar 652, bvar 662]),
    bnot (bands [bvar 1057, bvar 1062, bvar 654, bvar 659]),
    bnot (bands [bvar 1058, bvar 1059, bvar 655, bvar 656]),
    bnot (bands [bvar 1058, bvar 1061, bvar 655, bvar 658]),
    bnot (bands [bvar 1058, bvar 1062, bvar 655, bvar 659]),
    bnot (bands [bvar 1058, bvar 1063, bvar 655, bvar 660]),
    bnot (bands [bvar 1059, bvar 1060, bvar 656, bvar 657]),
    bnot (bands [bvar 1059, bvar 1062, bvar 656, bvar 659]),
    bnot (bands [bvar 1059, bvar 1063, bvar 656, bvar 660]),
    bnot (bands [bvar 1060, bvar 1063, bvar 657, bvar 660]),
    bnot (bands [bvar 1061, bvar 1062, bvar 658, bvar 659]),
    bnot (bands [bvar 1061, bvar 1063, bvar 658, bvar 660]),
    bnot (bands [bvar 1062, bvar 1063, bvar 659, bvar 660]),
    bnot (bands [bvar 1057, bvar 1061, bvar 680, bvar 684]),
    bnot (bands [bvar 1061, bvar 1063, bvar 684, bvar 686]),
    bnot (bands [bvar 1061, bvar 1064, bvar 684, bvar 687]),
    bnot (bands [bvar 1063, bvar 1064, bvar 686, bvar 687]),
    bnot (bands [bvar 562, bvar 566, bvar 1082, bvar 1086]),
    bnot (bands [bvar 562, bvar 572, bvar 1082, bvar 1092]),
    bnot (bands [bvar 562, bvar 573, bvar 1082, bvar 1093]),
    bnot (bands [bvar 562, bvar 566, bvar 1095, bvar 1099]),
    bnot (bands [bvar 562, bvar 571, bvar 1095, bvar 1104]),
    bnot (bands [bvar 562, bvar 573, bvar 1095, bvar 1106]),
    bnot (bands [bvar 1069, bvar 1077, bvar 614, bvar 622]),
    bnot (bands [bvar 1071, bvar 1073, bvar 616, bvar 618]),
    bnot (bands [bvar 562, bvar 571, bvar 1121, bvar 1130]),
    bnot (bands [bvar 562, bvar 572, bvar 1121, bvar 1131]),
    bnot (bands [bvar 562, bvar 573, bvar 1121, bvar 1132]),
    bnot (bands [bvar 564, bvar 566, bvar 1123, bvar 1125]),
    bnot (bands [bvar 562, bvar 572, bvar 1134, bvar 1144]),
    bnot (bands [bvar 564, bvar 566, bvar 1136, bvar 1138]),
    bnot (bands [bvar 1069, bvar 1077, bvar 640, bvar 648]),
    bnot (bands [bvar 1069, bvar 1078, bvar 640, bvar 649]),
    bnot (bands [bvar 1069, bvar 1080, bvar 640, bvar 651]),
    bnot (bands [bvar 1071, bvar 1073, bvar 655, bvar 657]),
    bnot (bands [bvar 564, bvar 566, bvar 1175, bvar 1177]),
    bnot (bands [bvar 1071, bvar 1077, bvar 681, bvar 687]),
    bnot (bands [bvar 1073, bvar 1078, bvar 683, bvar 688]),
    bnot (bands [bvar 564, bvar 566, bvar 1188, bvar 1190]),
    bnot (bands [bvar 564, bvar 566, bvar 1201, bvar 1203]),
    bnot (bands [bvar 564, bvar 572, bvar 1201, bvar 1209]),
    bnot (bands [bvar 574, bvar 579, bvar 1094, bvar 1099]),
    bnot (bands [bvar 574, bvar 581, bvar 1094, bvar 1101]),
    bnot (bands [bvar 574, bvar 583, bvar 1094, bvar 1103]),
    bnot (bands [bvar 574, bvar 584, bvar 1094, bvar 1104]),
    bnot (bands [bvar 574, bvar 585, bvar 1094, bvar 1105]),
    bnot (bands [bvar 579, bvar 583, bvar 1099, bvar 1103]),
    bnot (bands [bvar 579, bvar 584, bvar 1099, bvar 1104]),
    bnot (bands [bvar 580, bvar 583, bvar 1100, bvar 1103]) ]

def reducedUnionChunk081 : BVLogicalExpr :=
  bands reducedUnionChunk081Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
