import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk123Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 177, bvar 178, bvar 697, bvar 698]),
    bnot (bands [bvar 177, bvar 179, bvar 697, bvar 699]),
    bnot (bands [bvar 177, bvar 180, bvar 697, bvar 700]),
    bnot (bands [bvar 177, bvar 181, bvar 697, bvar 701]),
    bnot (bands [bvar 178, bvar 179, bvar 698, bvar 699]),
    bnot (bands [bvar 178, bvar 180, bvar 698, bvar 700]),
    bnot (bands [bvar 178, bvar 181, bvar 698, bvar 701]),
    bnot (bands [bvar 179, bvar 180, bvar 699, bvar 700]),
    bnot (bands [bvar 179, bvar 181, bvar 699, bvar 701]),
    bnot (bands [bvar 180, bvar 181, bvar 700, bvar 701]),
    bnot (bands [bvar 616, bvar 623, bvar 135, bvar 142]),
    bnot (bands [bvar 616, bvar 624, bvar 135, bvar 143]),
    bnot (bands [bvar 29, bvar 33, bvar 653, bvar 657]),
    bnot (bands [bvar 540, bvar 541, bvar 150, bvar 151]),
    bnot (bands [bvar 536, bvar 542, bvar 172, bvar 178]),
    bnot (bands [bvar 541, bvar 542, bvar 177, bvar 178]),
    bnot (bands [bvar 135, bvar 136, bvar 655, bvar 656]),
    bnot (bands [bvar 135, bvar 138, bvar 655, bvar 658]),
    bnot (bands [bvar 135, bvar 139, bvar 655, bvar 659]),
    bnot (bands [bvar 135, bvar 139, bvar 681, bvar 685]),
    bnot (bands [bvar 175, bvar 178, bvar 695, bvar 698]),
    bnot (bands [bvar 33, bvar 40, bvar 566, bvar 573]),
    bnot (bands [bvar 5, bvar 6, bvar 1047, bvar 1048]),
    bnot (bands [bvar 5, bvar 7, bvar 1047, bvar 1049]),
    bnot (bands [bvar 5, bvar 9, bvar 1047, bvar 1051]),
    bnot (bands [bvar 5, bvar 10, bvar 1047, bvar 1052]),
    bnot (bands [bvar 5, bvar 11, bvar 1047, bvar 1053]),
    bnot (bands [bvar 5, bvar 12, bvar 1047, bvar 1054]),
    bnot (bands [bvar 6, bvar 7, bvar 1048, bvar 1049]),
    bnot (bands [bvar 6, bvar 9, bvar 1048, bvar 1051]),
    bnot (bands [bvar 6, bvar 10, bvar 1048, bvar 1052]),
    bnot (bands [bvar 6, bvar 11, bvar 1048, bvar 1053]),
    bnot (bands [bvar 6, bvar 12, bvar 1048, bvar 1054]),
    bnot (bands [bvar 7, bvar 9, bvar 1049, bvar 1051]),
    bnot (bands [bvar 7, bvar 10, bvar 1049, bvar 1052]),
    bnot (bands [bvar 7, bvar 11, bvar 1049, bvar 1053]),
    bnot (bands [bvar 7, bvar 12, bvar 1049, bvar 1054]),
    bnot (bands [bvar 9, bvar 10, bvar 1051, bvar 1052]),
    bnot (bands [bvar 9, bvar 11, bvar 1051, bvar 1053]),
    bnot (bands [bvar 9, bvar 12, bvar 1051, bvar 1054]),
    bnot (bands [bvar 10, bvar 11, bvar 1052, bvar 1053]),
    bnot (bands [bvar 10, bvar 12, bvar 1052, bvar 1054]),
    bnot (bands [bvar 11, bvar 12, bvar 1053, bvar 1054]),
    bnot (bands [bvar 0, bvar 6, bvar 1055, bvar 1061]),
    bnot (bands [bvar 0, bvar 8, bvar 1055, bvar 1063]),
    bnot (bands [bvar 0, bvar 9, bvar 1055, bvar 1064]),
    bnot (bands [bvar 0, bvar 10, bvar 1055, bvar 1065]),
    bnot (bands [bvar 0, bvar 11, bvar 1055, bvar 1066]),
    bnot (bands [bvar 0, bvar 12, bvar 1055, bvar 1067]),
    bnot (bands [bvar 5, bvar 9, bvar 1060, bvar 1064]),
    bnot (bands [bvar 6, bvar 9, bvar 1061, bvar 1064]),
    bnot (bands [bvar 7, bvar 12, bvar 1062, bvar 1067]),
    bnot (bands [bvar 8, bvar 9, bvar 1063, bvar 1064]),
    bnot (bands [bvar 8, bvar 11, bvar 1063, bvar 1066]),
    bnot (bands [bvar 8, bvar 12, bvar 1063, bvar 1067]),
    bnot (bands [bvar 9, bvar 11, bvar 1064, bvar 1066]),
    bnot (bands [bvar 10, bvar 11, bvar 1065, bvar 1066]),
    bnot (bands [bvar 10, bvar 12, bvar 1065, bvar 1067]),
    bnot (bands [bvar 1, bvar 5, bvar 1069, bvar 1073]),
    bnot (bands [bvar 1, bvar 9, bvar 1069, bvar 1077]),
    bnot (bands [bvar 5, bvar 9, bvar 1073, bvar 1077]),
    bnot (bands [bvar 0, bvar 5, bvar 1081, bvar 1086]),
    bnot (bands [bvar 0, bvar 6, bvar 1081, bvar 1087]),
    bnot (bands [bvar 0, bvar 7, bvar 1081, bvar 1088]) ]

def reducedUnionChunk123 : BVLogicalExpr :=
  bands reducedUnionChunk123Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
