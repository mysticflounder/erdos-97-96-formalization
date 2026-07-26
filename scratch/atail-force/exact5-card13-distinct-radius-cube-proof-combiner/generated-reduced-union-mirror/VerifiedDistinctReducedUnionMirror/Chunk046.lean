import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk046Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 603, bvar 610, bvar 616, bvar 623]),
    bnot (bands [bvar 610, bvar 611, bvar 623, bvar 624]),
    bnot (bands [bvar 613, bvar 614, bvar 639, bvar 640]),
    bnot (bands [bvar 614, bvar 622, bvar 640, bvar 648]),
    bnot (bands [bvar 614, bvar 623, bvar 640, bvar 649]),
    atMost [bvar 652, bvar 660, bvar 661, bvar 662, bvar 663, bvar 664] 2,
    atMost [bvar 665, bvar 673, bvar 674, bvar 675, bvar 676, bvar 677] 2,
    atMost [bvar 678, bvar 686, bvar 687, bvar 688, bvar 689, bvar 690] 2,
    atMost [bvar 691, bvar 699, bvar 700, bvar 701, bvar 702, bvar 703] 2,
    atMost [bvar 639, bvar 647, bvar 648, bvar 649, bvar 650, bvar 651] 1,
    atMost [bvar 535, bvar 543, bvar 544, bvar 545, bvar 546, bvar 547] 1,
    bnot (bands [bvar 640, bvar 645, bvar 679, bvar 684]),
    bnot (bands [bvar 640, bvar 646, bvar 679, bvar 685]),
    atMost [bvar 548, bvar 549, bvar 550, bvar 551, bvar 552] 2,
    atMost [bvar 574, bvar 575, bvar 576, bvar 577, bvar 578] 2,
    atMost [bvar 535, bvar 536, bvar 537, bvar 538, bvar 539] 1,
    bnot (bands [bvar 1044, bvar 1047, bvar 43, bvar 46]),
    bnot (bands [bvar 1044, bvar 1051, bvar 43, bvar 50]),
    bnot (bands [bvar 1044, bvar 1052, bvar 43, bvar 51]),
    bnot (bands [bvar 1044, bvar 1054, bvar 43, bvar 53]),
    bnot (bands [bvar 1046, bvar 1047, bvar 45, bvar 46]),
    bnot (bands [bvar 1046, bvar 1049, bvar 45, bvar 48]),
    bnot (bands [bvar 1046, bvar 1051, bvar 45, bvar 50]),
    bnot (bands [bvar 1046, bvar 1054, bvar 45, bvar 53]),
    bnot (bands [bvar 1047, bvar 1049, bvar 46, bvar 48]),
    bnot (bands [bvar 1047, bvar 1051, bvar 46, bvar 50]),
    bnot (bands [bvar 1047, bvar 1052, bvar 46, bvar 51]),
    bnot (bands [bvar 1047, bvar 1054, bvar 46, bvar 53]),
    bnot (bands [bvar 1049, bvar 1051, bvar 48, bvar 50]),
    bnot (bands [bvar 1049, bvar 1052, bvar 48, bvar 51]),
    bnot (bands [bvar 1052, bvar 1054, bvar 51, bvar 53]),
    bnot (bands [bvar 30, bvar 33, bvar 1057, bvar 1060]),
    bnot (bands [bvar 30, bvar 35, bvar 1057, bvar 1062]),
    bnot (bands [bvar 30, bvar 37, bvar 1057, bvar 1064]),
    bnot (bands [bvar 30, bvar 38, bvar 1057, bvar 1065]),
    bnot (bands [bvar 30, bvar 39, bvar 1057, bvar 1066]),
    bnot (bands [bvar 30, bvar 40, bvar 1057, bvar 1067]),
    bnot (bands [bvar 31, bvar 33, bvar 1058, bvar 1060]),
    bnot (bands [bvar 31, bvar 35, bvar 1058, bvar 1062]),
    bnot (bands [bvar 31, bvar 39, bvar 1058, bvar 1066]),
    bnot (bands [bvar 32, bvar 33, bvar 1059, bvar 1060]),
    bnot (bands [bvar 32, bvar 35, bvar 1059, bvar 1062]),
    bnot (bands [bvar 32, bvar 36, bvar 1059, bvar 1063]),
    bnot (bands [bvar 32, bvar 37, bvar 1059, bvar 1064]),
    bnot (bands [bvar 32, bvar 38, bvar 1059, bvar 1065]),
    bnot (bands [bvar 32, bvar 39, bvar 1059, bvar 1066]),
    bnot (bands [bvar 32, bvar 40, bvar 1059, bvar 1067]),
    bnot (bands [bvar 33, bvar 34, bvar 1060, bvar 1061]),
    bnot (bands [bvar 33, bvar 35, bvar 1060, bvar 1062]),
    bnot (bands [bvar 33, bvar 36, bvar 1060, bvar 1063]),
    bnot (bands [bvar 33, bvar 37, bvar 1060, bvar 1064]),
    bnot (bands [bvar 33, bvar 38, bvar 1060, bvar 1065]),
    bnot (bands [bvar 33, bvar 39, bvar 1060, bvar 1066]),
    bnot (bands [bvar 33, bvar 40, bvar 1060, bvar 1067]),
    bnot (bands [bvar 34, bvar 35, bvar 1061, bvar 1062]),
    bnot (bands [bvar 34, bvar 38, bvar 1061, bvar 1065]),
    bnot (bands [bvar 34, bvar 39, bvar 1061, bvar 1066]),
    bnot (bands [bvar 34, bvar 40, bvar 1061, bvar 1067]),
    bnot (bands [bvar 35, bvar 36, bvar 1062, bvar 1063]),
    bnot (bands [bvar 35, bvar 37, bvar 1062, bvar 1064]),
    bnot (bands [bvar 35, bvar 38, bvar 1062, bvar 1065]),
    bnot (bands [bvar 35, bvar 39, bvar 1062, bvar 1066]),
    bnot (bands [bvar 35, bvar 40, bvar 1062, bvar 1067]),
    bnot (bands [bvar 36, bvar 38, bvar 1063, bvar 1065]) ]

def reducedUnionChunk046 : BVLogicalExpr :=
  bands reducedUnionChunk046Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
