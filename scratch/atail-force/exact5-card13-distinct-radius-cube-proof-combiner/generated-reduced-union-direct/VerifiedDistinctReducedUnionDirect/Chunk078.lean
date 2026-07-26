import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk078Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1044, bvar 1051, bvar 667, bvar 674]),
    bnot (bands [bvar 1045, bvar 1047, bvar 668, bvar 670]),
    bnot (bands [bvar 1045, bvar 1048, bvar 668, bvar 671]),
    bnot (bands [bvar 1045, bvar 1049, bvar 668, bvar 672]),
    bnot (bands [bvar 1045, bvar 1051, bvar 668, bvar 674]),
    bnot (bands [bvar 1046, bvar 1047, bvar 669, bvar 670]),
    bnot (bands [bvar 1046, bvar 1048, bvar 669, bvar 671]),
    bnot (bands [bvar 1046, bvar 1049, bvar 669, bvar 672]),
    bnot (bands [bvar 1046, bvar 1050, bvar 669, bvar 673]),
    bnot (bands [bvar 1046, bvar 1051, bvar 669, bvar 674]),
    bnot (bands [bvar 1047, bvar 1048, bvar 670, bvar 671]),
    bnot (bands [bvar 1047, bvar 1049, bvar 670, bvar 672]),
    bnot (bands [bvar 1047, bvar 1050, bvar 670, bvar 673]),
    bnot (bands [bvar 1047, bvar 1051, bvar 670, bvar 674]),
    bnot (bands [bvar 1048, bvar 1049, bvar 671, bvar 672]),
    bnot (bands [bvar 1048, bvar 1050, bvar 671, bvar 673]),
    bnot (bands [bvar 1048, bvar 1051, bvar 671, bvar 674]),
    bnot (bands [bvar 1049, bvar 1050, bvar 672, bvar 673]),
    bnot (bands [bvar 1049, bvar 1051, bvar 672, bvar 674]),
    bnot (bands [bvar 536, bvar 539, bvar 1173, bvar 1176]),
    bnot (bands [bvar 536, bvar 540, bvar 1173, bvar 1177]),
    bnot (bands [bvar 536, bvar 541, bvar 1173, bvar 1178]),
    bnot (bands [bvar 536, bvar 542, bvar 1173, bvar 1179]),
    bnot (bands [bvar 536, bvar 543, bvar 1173, bvar 1180]),
    bnot (bands [bvar 536, bvar 544, bvar 1173, bvar 1181]),
    bnot (bands [bvar 537, bvar 539, bvar 1174, bvar 1176]),
    bnot (bands [bvar 537, bvar 540, bvar 1174, bvar 1177]),
    bnot (bands [bvar 537, bvar 541, bvar 1174, bvar 1178]),
    bnot (bands [bvar 537, bvar 542, bvar 1174, bvar 1179]),
    bnot (bands [bvar 537, bvar 543, bvar 1174, bvar 1180]),
    bnot (bands [bvar 538, bvar 540, bvar 1175, bvar 1177]),
    bnot (bands [bvar 538, bvar 541, bvar 1175, bvar 1178]),
    bnot (bands [bvar 538, bvar 542, bvar 1175, bvar 1179]),
    bnot (bands [bvar 538, bvar 543, bvar 1175, bvar 1180]),
    bnot (bands [bvar 538, bvar 544, bvar 1175, bvar 1181]),
    bnot (bands [bvar 539, bvar 540, bvar 1176, bvar 1177]),
    bnot (bands [bvar 539, bvar 541, bvar 1176, bvar 1178]),
    bnot (bands [bvar 539, bvar 542, bvar 1176, bvar 1179]),
    bnot (bands [bvar 539, bvar 543, bvar 1176, bvar 1180]),
    bnot (bands [bvar 539, bvar 544, bvar 1176, bvar 1181]),
    bnot (bands [bvar 540, bvar 541, bvar 1177, bvar 1178]),
    bnot (bands [bvar 540, bvar 542, bvar 1177, bvar 1179]),
    bnot (bands [bvar 540, bvar 543, bvar 1177, bvar 1180]),
    bnot (bands [bvar 540, bvar 544, bvar 1177, bvar 1181]),
    bnot (bands [bvar 541, bvar 542, bvar 1178, bvar 1179]),
    bnot (bands [bvar 541, bvar 543, bvar 1178, bvar 1180]),
    bnot (bands [bvar 541, bvar 544, bvar 1178, bvar 1181]),
    bnot (bands [bvar 542, bvar 543, bvar 1179, bvar 1180]),
    bnot (bands [bvar 542, bvar 544, bvar 1179, bvar 1181]),
    bnot (bands [bvar 543, bvar 544, bvar 1180, bvar 1181]),
    bnot (bands [bvar 1043, bvar 1047, bvar 679, bvar 683]),
    bnot (bands [bvar 1043, bvar 1048, bvar 679, bvar 684]),
    bnot (bands [bvar 1043, bvar 1049, bvar 679, bvar 685]),
    bnot (bands [bvar 1043, bvar 1050, bvar 679, bvar 686]),
    bnot (bands [bvar 1043, bvar 1051, bvar 679, bvar 687]),
    bnot (bands [bvar 1044, bvar 1046, bvar 680, bvar 682]),
    bnot (bands [bvar 1044, bvar 1047, bvar 680, bvar 683]),
    bnot (bands [bvar 1044, bvar 1048, bvar 680, bvar 684]),
    bnot (bands [bvar 1044, bvar 1049, bvar 680, bvar 685]),
    bnot (bands [bvar 1044, bvar 1050, bvar 680, bvar 686]),
    bnot (bands [bvar 1044, bvar 1051, bvar 680, bvar 687]),
    bnot (bands [bvar 1045, bvar 1047, bvar 681, bvar 683]),
    bnot (bands [bvar 1045, bvar 1049, bvar 681, bvar 685]),
    bnot (bands [bvar 1046, bvar 1047, bvar 682, bvar 683]) ]

def reducedUnionChunk078 : BVLogicalExpr :=
  bands reducedUnionChunk078Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
