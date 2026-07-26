import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk081Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1059, bvar 1063, bvar 656, bvar 660]),
    bnot (bands [bvar 1060, bvar 1063, bvar 657, bvar 660]),
    bnot (bands [bvar 1062, bvar 1063, bvar 659, bvar 660]),
    bnot (bands [bvar 1065, bvar 1066, bvar 662, bvar 663]),
    bnot (bands [bvar 1065, bvar 1067, bvar 662, bvar 664]),
    bnot (bands [bvar 1066, bvar 1067, bvar 663, bvar 664]),
    bnot (bands [bvar 553, bvar 555, bvar 1164, bvar 1166]),
    bnot (bands [bvar 554, bvar 555, bvar 1165, bvar 1166]),
    bnot (bands [bvar 559, bvar 560, bvar 1170, bvar 1171]),
    bnot (bands [bvar 1059, bvar 1062, bvar 669, bvar 672]),
    bnot (bands [bvar 1059, bvar 1063, bvar 669, bvar 673]),
    bnot (bands [bvar 1062, bvar 1063, bvar 672, bvar 673]),
    bnot (bands [bvar 550, bvar 554, bvar 1174, bvar 1178]),
    bnot (bands [bvar 550, bvar 557, bvar 1174, bvar 1181]),
    bnot (bands [bvar 554, bvar 557, bvar 1178, bvar 1181]),
    bnot (bands [bvar 1057, bvar 1059, bvar 680, bvar 682]),
    bnot (bands [bvar 1057, bvar 1061, bvar 680, bvar 684]),
    bnot (bands [bvar 1057, bvar 1062, bvar 680, bvar 685]),
    bnot (bands [bvar 1057, bvar 1064, bvar 680, bvar 687]),
    bnot (bands [bvar 1057, bvar 1065, bvar 680, bvar 688]),
    bnot (bands [bvar 1058, bvar 1059, bvar 681, bvar 682]),
    bnot (bands [bvar 1058, bvar 1062, bvar 681, bvar 685]),
    bnot (bands [bvar 1058, bvar 1063, bvar 681, bvar 686]),
    bnot (bands [bvar 1058, bvar 1064, bvar 681, bvar 687]),
    bnot (bands [bvar 1058, bvar 1065, bvar 681, bvar 688]),
    bnot (bands [bvar 1059, bvar 1060, bvar 682, bvar 683]),
    bnot (bands [bvar 1059, bvar 1061, bvar 682, bvar 684]),
    bnot (bands [bvar 1059, bvar 1062, bvar 682, bvar 685]),
    bnot (bands [bvar 1059, bvar 1063, bvar 682, bvar 686]),
    bnot (bands [bvar 1059, bvar 1064, bvar 682, bvar 687]),
    bnot (bands [bvar 1059, bvar 1065, bvar 682, bvar 688]),
    bnot (bands [bvar 1060, bvar 1063, bvar 683, bvar 686]),
    bnot (bands [bvar 1060, bvar 1064, bvar 683, bvar 687]),
    bnot (bands [bvar 1060, bvar 1065, bvar 683, bvar 688]),
    bnot (bands [bvar 1061, bvar 1062, bvar 684, bvar 685]),
    bnot (bands [bvar 1061, bvar 1063, bvar 684, bvar 686]),
    bnot (bands [bvar 1061, bvar 1064, bvar 684, bvar 687]),
    bnot (bands [bvar 1061, bvar 1065, bvar 684, bvar 688]),
    bnot (bands [bvar 1062, bvar 1063, bvar 685, bvar 686]),
    bnot (bands [bvar 1062, bvar 1064, bvar 685, bvar 687]),
    bnot (bands [bvar 1062, bvar 1065, bvar 685, bvar 688]),
    bnot (bands [bvar 1063, bvar 1064, bvar 686, bvar 687]),
    bnot (bands [bvar 1063, bvar 1065, bvar 686, bvar 688]),
    bnot (bands [bvar 1064, bvar 1065, bvar 687, bvar 688]),
    bnot (bands [bvar 555, bvar 557, bvar 1192, bvar 1194]),
    bnot (bands [bvar 555, bvar 558, bvar 1192, bvar 1195]),
    bnot (bands [bvar 1059, bvar 1061, bvar 695, bvar 697]),
    bnot (bands [bvar 1059, bvar 1065, bvar 695, bvar 701]),
    bnot (bands [bvar 1061, bvar 1062, bvar 697, bvar 698]),
    bnot (bands [bvar 1061, bvar 1063, bvar 697, bvar 699]),
    bnot (bands [bvar 1061, bvar 1064, bvar 697, bvar 700]),
    bnot (bands [bvar 1063, bvar 1064, bvar 699, bvar 700]),
    bnot (bands [bvar 562, bvar 567, bvar 1082, bvar 1087]),
    bnot (bands [bvar 562, bvar 568, bvar 1082, bvar 1088]),
    bnot (bands [bvar 562, bvar 573, bvar 1082, bvar 1093]),
    bnot (bands [bvar 562, bvar 566, bvar 1095, bvar 1099]),
    bnot (bands [bvar 562, bvar 568, bvar 1095, bvar 1101]),
    bnot (bands [bvar 562, bvar 572, bvar 1095, bvar 1105]),
    bnot (bands [bvar 562, bvar 567, bvar 1108, bvar 1113]),
    bnot (bands [bvar 562, bvar 573, bvar 1108, bvar 1119]),
    bnot (bands [bvar 568, bvar 573, bvar 1114, bvar 1119]),
    bnot (bands [bvar 1071, bvar 1073, bvar 616, bvar 618]),
    bnot (bands [bvar 562, bvar 571, bvar 1121, bvar 1130]),
    bnot (bands [bvar 562, bvar 573, bvar 1121, bvar 1132]) ]

def reducedUnionChunk081 : BVLogicalExpr :=
  bands reducedUnionChunk081Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
