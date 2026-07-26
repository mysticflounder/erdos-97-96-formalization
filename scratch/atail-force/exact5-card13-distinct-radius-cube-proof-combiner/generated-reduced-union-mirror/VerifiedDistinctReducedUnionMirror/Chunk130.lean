import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk130Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 684, bvar 685, bvar 190, bvar 191]),
    bnot (bands [bvar 684, bvar 686, bvar 190, bvar 192]),
    bnot (bands [bvar 684, bvar 687, bvar 190, bvar 193]),
    bnot (bands [bvar 684, bvar 688, bvar 190, bvar 194]),
    bnot (bands [bvar 685, bvar 686, bvar 191, bvar 192]),
    bnot (bands [bvar 685, bvar 687, bvar 191, bvar 193]),
    bnot (bands [bvar 685, bvar 688, bvar 191, bvar 194]),
    bnot (bands [bvar 686, bvar 687, bvar 192, bvar 193]),
    bnot (bands [bvar 686, bvar 688, bvar 192, bvar 194]),
    bnot (bands [bvar 687, bvar 688, bvar 193, bvar 194]),
    bnot (bands [bvar 614, bvar 616, bvar 133, bvar 135]),
    bnot (bands [bvar 616, bvar 622, bvar 135, bvar 141]),
    bnot (bands [bvar 616, bvar 623, bvar 135, bvar 142]),
    bnot (bands [bvar 537, bvar 542, bvar 147, bvar 152]),
    bnot (bands [bvar 539, bvar 540, bvar 175, bvar 176]),
    bnot (bands [bvar 539, bvar 542, bvar 175, bvar 178]),
    bnot (bands [bvar 536, bvar 541, bvar 185, bvar 190]),
    bnot (bands [bvar 536, bvar 542, bvar 185, bvar 191]),
    bnot (bands [bvar 537, bvar 541, bvar 186, bvar 190]),
    bnot (bands [bvar 135, bvar 136, bvar 681, bvar 682]),
    bnot (bands [bvar 135, bvar 138, bvar 681, bvar 684]),
    bnot (bands [bvar 135, bvar 139, bvar 681, bvar 685]),
    bnot (bands [bvar 33, bvar 40, bvar 566, bvar 573]),
    bnot (bands [bvar 5, bvar 6, bvar 1047, bvar 1048]),
    bnot (bands [bvar 5, bvar 7, bvar 1047, bvar 1049]),
    bnot (bands [bvar 5, bvar 8, bvar 1047, bvar 1050]),
    bnot (bands [bvar 5, bvar 9, bvar 1047, bvar 1051]),
    bnot (bands [bvar 5, bvar 10, bvar 1047, bvar 1052]),
    bnot (bands [bvar 5, bvar 11, bvar 1047, bvar 1053]),
    bnot (bands [bvar 5, bvar 12, bvar 1047, bvar 1054]),
    bnot (bands [bvar 6, bvar 7, bvar 1048, bvar 1049]),
    bnot (bands [bvar 6, bvar 8, bvar 1048, bvar 1050]),
    bnot (bands [bvar 6, bvar 9, bvar 1048, bvar 1051]),
    bnot (bands [bvar 6, bvar 10, bvar 1048, bvar 1052]),
    bnot (bands [bvar 6, bvar 11, bvar 1048, bvar 1053]),
    bnot (bands [bvar 6, bvar 12, bvar 1048, bvar 1054]),
    bnot (bands [bvar 7, bvar 9, bvar 1049, bvar 1051]),
    bnot (bands [bvar 7, bvar 10, bvar 1049, bvar 1052]),
    bnot (bands [bvar 7, bvar 11, bvar 1049, bvar 1053]),
    bnot (bands [bvar 7, bvar 12, bvar 1049, bvar 1054]),
    bnot (bands [bvar 8, bvar 9, bvar 1050, bvar 1051]),
    bnot (bands [bvar 8, bvar 10, bvar 1050, bvar 1052]),
    bnot (bands [bvar 8, bvar 12, bvar 1050, bvar 1054]),
    bnot (bands [bvar 9, bvar 10, bvar 1051, bvar 1052]),
    bnot (bands [bvar 9, bvar 12, bvar 1051, bvar 1054]),
    bnot (bands [bvar 10, bvar 11, bvar 1052, bvar 1053]),
    bnot (bands [bvar 10, bvar 12, bvar 1052, bvar 1054]),
    bnot (bands [bvar 11, bvar 12, bvar 1053, bvar 1054]),
    bnot (bands [bvar 0, bvar 6, bvar 1055, bvar 1061]),
    bnot (bands [bvar 0, bvar 7, bvar 1055, bvar 1062]),
    bnot (bands [bvar 0, bvar 8, bvar 1055, bvar 1063]),
    bnot (bands [bvar 0, bvar 9, bvar 1055, bvar 1064]),
    bnot (bands [bvar 0, bvar 10, bvar 1055, bvar 1065]),
    bnot (bands [bvar 0, bvar 11, bvar 1055, bvar 1066]),
    bnot (bands [bvar 0, bvar 12, bvar 1055, bvar 1067]),
    bnot (bands [bvar 6, bvar 10, bvar 1061, bvar 1065]),
    bnot (bands [bvar 6, bvar 11, bvar 1061, bvar 1066]),
    bnot (bands [bvar 7, bvar 10, bvar 1062, bvar 1065]),
    bnot (bands [bvar 7, bvar 11, bvar 1062, bvar 1066]),
    bnot (bands [bvar 8, bvar 11, bvar 1063, bvar 1066]),
    bnot (bands [bvar 8, bvar 12, bvar 1063, bvar 1067]),
    bnot (bands [bvar 9, bvar 11, bvar 1064, bvar 1066]),
    bnot (bands [bvar 9, bvar 12, bvar 1064, bvar 1067]),
    bnot (bands [bvar 10, bvar 11, bvar 1065, bvar 1066]) ]

def reducedUnionChunk130 : BVLogicalExpr :=
  bands reducedUnionChunk130Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
