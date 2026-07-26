import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk048Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 614, bvar 623, bvar 640, bvar 649]),
    bnot (bands [bvar 614, bvar 624, bvar 640, bvar 650]),
    atMost [bvar 652, bvar 660, bvar 661, bvar 662, bvar 663, bvar 664] 2,
    atMost [bvar 665, bvar 673, bvar 674, bvar 675, bvar 676, bvar 677] 2,
    atMost [bvar 678, bvar 686, bvar 687, bvar 688, bvar 689, bvar 690] 2,
    atMost [bvar 691, bvar 699, bvar 700, bvar 701, bvar 702, bvar 703] 2,
    atMost [bvar 639, bvar 647, bvar 648, bvar 649, bvar 650, bvar 651] 1,
    atMost [bvar 535, bvar 543, bvar 544, bvar 545, bvar 546, bvar 547] 1,
    bnot (bands [bvar 640, bvar 643, bvar 653, bvar 656]),
    bnot (bands [bvar 643, bvar 645, bvar 656, bvar 658]),
    bnot (bands [bvar 643, bvar 646, bvar 656, bvar 659]),
    atMost [bvar 548, bvar 549, bvar 550, bvar 551, bvar 552] 2,
    atMost [bvar 574, bvar 575, bvar 576, bvar 577, bvar 578] 2,
    atMost [bvar 535, bvar 536, bvar 537, bvar 538, bvar 539] 1,
    bnot (bands [bvar 1044, bvar 1047, bvar 43, bvar 46]),
    bnot (bands [bvar 1044, bvar 1048, bvar 43, bvar 47]),
    bnot (bands [bvar 1044, bvar 1049, bvar 43, bvar 48]),
    bnot (bands [bvar 1044, bvar 1051, bvar 43, bvar 50]),
    bnot (bands [bvar 1044, bvar 1053, bvar 43, bvar 52]),
    bnot (bands [bvar 1045, bvar 1047, bvar 44, bvar 46]),
    bnot (bands [bvar 1045, bvar 1049, bvar 44, bvar 48]),
    bnot (bands [bvar 1046, bvar 1047, bvar 45, bvar 46]),
    bnot (bands [bvar 1046, bvar 1048, bvar 45, bvar 47]),
    bnot (bands [bvar 1046, bvar 1049, bvar 45, bvar 48]),
    bnot (bands [bvar 1046, bvar 1050, bvar 45, bvar 49]),
    bnot (bands [bvar 1046, bvar 1051, bvar 45, bvar 50]),
    bnot (bands [bvar 1046, bvar 1052, bvar 45, bvar 51]),
    bnot (bands [bvar 1046, bvar 1053, bvar 45, bvar 52]),
    bnot (bands [bvar 1046, bvar 1054, bvar 45, bvar 53]),
    bnot (bands [bvar 1047, bvar 1048, bvar 46, bvar 47]),
    bnot (bands [bvar 1047, bvar 1049, bvar 46, bvar 48]),
    bnot (bands [bvar 1047, bvar 1050, bvar 46, bvar 49]),
    bnot (bands [bvar 1047, bvar 1051, bvar 46, bvar 50]),
    bnot (bands [bvar 1047, bvar 1052, bvar 46, bvar 51]),
    bnot (bands [bvar 1047, bvar 1053, bvar 46, bvar 52]),
    bnot (bands [bvar 1047, bvar 1054, bvar 46, bvar 53]),
    bnot (bands [bvar 1048, bvar 1049, bvar 47, bvar 48]),
    bnot (bands [bvar 1048, bvar 1050, bvar 47, bvar 49]),
    bnot (bands [bvar 1048, bvar 1051, bvar 47, bvar 50]),
    bnot (bands [bvar 1048, bvar 1052, bvar 47, bvar 51]),
    bnot (bands [bvar 1048, bvar 1053, bvar 47, bvar 52]),
    bnot (bands [bvar 1048, bvar 1054, bvar 47, bvar 53]),
    bnot (bands [bvar 1049, bvar 1050, bvar 48, bvar 49]),
    bnot (bands [bvar 1049, bvar 1051, bvar 48, bvar 50]),
    bnot (bands [bvar 1049, bvar 1052, bvar 48, bvar 51]),
    bnot (bands [bvar 1049, bvar 1053, bvar 48, bvar 52]),
    bnot (bands [bvar 1049, bvar 1054, bvar 48, bvar 53]),
    bnot (bands [bvar 1050, bvar 1053, bvar 49, bvar 52]),
    bnot (bands [bvar 1045, bvar 1047, bvar 57, bvar 59]),
    bnot (bands [bvar 31, bvar 33, bvar 1071, bvar 1073]),
    atMost [bands [bvar 1042, bvar 67], bands [bvar 1043, bvar 68], bands [bvar 1044, bvar 69], bands [bvar 1045, bvar 70], bands [bvar 1046, bvar 71], bands [bvar 1047, bvar 72], bands [bvar 1048, bvar 73], bands [bvar 1049, bvar 74], bands [bvar 1050, bvar 75], bands [bvar 1051, bvar 76], bands [bvar 1052, bvar 77], bands [bvar 1053, bvar 78], bands [bvar 1054, bvar 79]] 2,
    bnot (bands [bvar 1046, bvar 1047, bvar 71, bvar 72]),
    bnot (bands [bvar 1046, bvar 1048, bvar 71, bvar 73]),
    bnot (bands [bvar 1046, bvar 1049, bvar 71, bvar 74]),
    bnot (bands [bvar 1046, bvar 1050, bvar 71, bvar 75]),
    bnot (bands [bvar 1046, bvar 1051, bvar 71, bvar 76]),
    bnot (bands [bvar 1046, bvar 1052, bvar 71, bvar 77]),
    bnot (bands [bvar 1046, bvar 1053, bvar 71, bvar 78]),
    bnot (bands [bvar 1046, bvar 1054, bvar 71, bvar 79]),
    bnot (bands [bvar 1047, bvar 1048, bvar 72, bvar 73]),
    bnot (bands [bvar 1047, bvar 1049, bvar 72, bvar 74]),
    bnot (bands [bvar 1048, bvar 1049, bvar 73, bvar 74]),
    bnot (bands [bvar 1048, bvar 1050, bvar 73, bvar 75]),
    bnot (bands [bvar 1048, bvar 1051, bvar 73, bvar 76]) ]

def reducedUnionChunk048 : BVLogicalExpr :=
  bands reducedUnionChunk048Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
