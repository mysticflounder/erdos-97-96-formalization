import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk099Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 687, bvar 688, bvar 1207, bvar 1208]),
    bnot (bands [bvar 1103, bvar 1106, bvar 622, bvar 625]),
    bnot (bands [bvar 1095, bvar 1103, bvar 640, bvar 648]),
    bnot (bands [bvar 1095, bvar 1104, bvar 640, bvar 649]),
    bnot (bands [bvar 1095, bvar 1105, bvar 640, bvar 650]),
    bnot (bands [bvar 1095, bvar 1106, bvar 640, bvar 651]),
    bnot (bands [bvar 1120, bvar 1121, bvar 639, bvar 640]),
    bnot (bands [bvar 1121, bvar 1129, bvar 640, bvar 648]),
    bnot (bands [bvar 1121, bvar 1130, bvar 640, bvar 649]),
    bnot (bands [bvar 1121, bvar 1131, bvar 640, bvar 650]),
    bnot (bands [bvar 1133, bvar 1134, bvar 639, bvar 640]),
    bnot (bands [bvar 1134, bvar 1142, bvar 640, bvar 648]),
    bnot (bands [bvar 1134, bvar 1145, bvar 640, bvar 651]),
    bnot (bands [bvar 1043, bvar 1048, bvar 640, bvar 645]),
    bnot (bands [bvar 1043, bvar 1047, bvar 653, bvar 657]),
    bnot (bands [bvar 1043, bvar 1049, bvar 653, bvar 659]),
    bnot (bands [bvar 1044, bvar 1047, bvar 654, bvar 657]),
    bnot (bands [bvar 1044, bvar 1048, bvar 654, bvar 658]),
    bnot (bands [bvar 1046, bvar 1047, bvar 656, bvar 657]),
    bnot (bands [bvar 1046, bvar 1048, bvar 656, bvar 658]),
    bnot (bands [bvar 1046, bvar 1049, bvar 656, bvar 659]),
    bnot (bands [bvar 1047, bvar 1049, bvar 657, bvar 659]),
    bnot (bands [bvar 1048, bvar 1049, bvar 658, bvar 659]),
    bnot (bands [bvar 1048, bvar 1049, bvar 671, bvar 672]),
    bnot (bands [bvar 1043, bvar 1049, bvar 679, bvar 685]),
    bnot (bands [bvar 1044, bvar 1047, bvar 680, bvar 683]),
    bnot (bands [bvar 1044, bvar 1048, bvar 680, bvar 684]),
    bnot (bands [bvar 1044, bvar 1049, bvar 680, bvar 685]),
    bnot (bands [bvar 1046, bvar 1047, bvar 682, bvar 683]),
    bnot (bands [bvar 1046, bvar 1049, bvar 682, bvar 685]),
    bnot (bands [bvar 640, bvar 645, bvar 1186, bvar 1191]),
    bnot (bands [bvar 640, bvar 645, bvar 1199, bvar 1204]),
    bnot (bands [bvar 656, bvar 659, bvar 1189, bvar 1192]),
    bnot (bands [bvar 667, bvar 672, bvar 1200, bvar 1205]),
    bnot (bands [bvar 1047, bvar 1051, bvar 566, bvar 570]),
    bnot (bands [bvar 1047, bvar 1052, bvar 566, bvar 571]),
    bnot (bands [bvar 1047, bvar 1054, bvar 566, bvar 573]),
    bnot (bands [bvar 541, bvar 544, bvar 1100, bvar 1103]),
    bnot (bands [bvar 1060, bvar 1064, bvar 566, bvar 570]),
    bnot (bands [bvar 1060, bvar 1067, bvar 566, bvar 573]),
    bnot (bands [bvar 566, bvar 572, bvar 1086, bvar 1092]),
    bnot (bands [bvar 537, bvar 541, bvar 43, bvar 47]),
    bnot (bands [bvar 537, bvar 542, bvar 43, bvar 48]),
    bnot (bands [bvar 537, bvar 544, bvar 43, bvar 50]),
    bnot (bands [bvar 537, bvar 546, bvar 43, bvar 52]),
    bnot (bands [bvar 541, bvar 542, bvar 47, bvar 48]),
    bnot (bands [bvar 541, bvar 543, bvar 47, bvar 49]),
    bnot (bands [bvar 541, bvar 544, bvar 47, bvar 50]),
    bnot (bands [bvar 541, bvar 546, bvar 47, bvar 52]),
    bnot (bands [bvar 542, bvar 544, bvar 48, bvar 50]),
    bnot (bands [bvar 542, bvar 546, bvar 48, bvar 52]),
    bnot (bands [bvar 538, bvar 540, bvar 57, bvar 59]),
    atMost [bands [bvar 535, bvar 67], bands [bvar 536, bvar 68], bands [bvar 537, bvar 69], bands [bvar 538, bvar 70], bands [bvar 539, bvar 71], bands [bvar 540, bvar 72], bands [bvar 541, bvar 73], bands [bvar 542, bvar 74], bands [bvar 543, bvar 75], bands [bvar 544, bvar 76], bands [bvar 545, bvar 77], bands [bvar 546, bvar 78], bands [bvar 547, bvar 79]] 2,
    bnot (bands [bvar 539, bvar 540, bvar 71, bvar 72]),
    bnot (bands [bvar 539, bvar 542, bvar 71, bvar 74]),
    bnot (bands [bvar 539, bvar 545, bvar 71, bvar 77]),
    bnot (bands [bvar 540, bvar 541, bvar 72, bvar 73]),
    bnot (bands [bvar 540, bvar 542, bvar 72, bvar 74]),
    bnot (bands [bvar 540, bvar 543, bvar 72, bvar 75]),
    bnot (bands [bvar 540, bvar 544, bvar 72, bvar 76]),
    bnot (bands [bvar 540, bvar 545, bvar 72, bvar 77]),
    bnot (bands [bvar 540, bvar 546, bvar 72, bvar 78]),
    bnot (bands [bvar 541, bvar 542, bvar 73, bvar 74]),
    bnot (bands [bvar 541, bvar 543, bvar 73, bvar 75]) ]

def reducedUnionChunk099 : BVLogicalExpr :=
  bands reducedUnionChunk099Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
