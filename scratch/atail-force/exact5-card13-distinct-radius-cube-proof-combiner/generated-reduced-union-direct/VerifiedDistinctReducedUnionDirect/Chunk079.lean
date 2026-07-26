import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk079Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1046, bvar 1048, bvar 682, bvar 684]),
    bnot (bands [bvar 1046, bvar 1049, bvar 682, bvar 685]),
    bnot (bands [bvar 1046, bvar 1050, bvar 682, bvar 686]),
    bnot (bands [bvar 1046, bvar 1051, bvar 682, bvar 687]),
    bnot (bands [bvar 1046, bvar 1052, bvar 682, bvar 688]),
    bnot (bands [bvar 1047, bvar 1048, bvar 683, bvar 684]),
    bnot (bands [bvar 1047, bvar 1049, bvar 683, bvar 685]),
    bnot (bands [bvar 1047, bvar 1050, bvar 683, bvar 686]),
    bnot (bands [bvar 1047, bvar 1051, bvar 683, bvar 687]),
    bnot (bands [bvar 1047, bvar 1052, bvar 683, bvar 688]),
    bnot (bands [bvar 1048, bvar 1049, bvar 684, bvar 685]),
    bnot (bands [bvar 1048, bvar 1050, bvar 684, bvar 686]),
    bnot (bands [bvar 1048, bvar 1051, bvar 684, bvar 687]),
    bnot (bands [bvar 1048, bvar 1052, bvar 684, bvar 688]),
    bnot (bands [bvar 1049, bvar 1050, bvar 685, bvar 686]),
    bnot (bands [bvar 1049, bvar 1051, bvar 685, bvar 687]),
    bnot (bands [bvar 1049, bvar 1052, bvar 685, bvar 688]),
    bnot (bands [bvar 1050, bvar 1051, bvar 686, bvar 687]),
    bnot (bands [bvar 536, bvar 539, bvar 1186, bvar 1189]),
    bnot (bands [bvar 536, bvar 541, bvar 1186, bvar 1191]),
    bnot (bands [bvar 536, bvar 542, bvar 1186, bvar 1192]),
    bnot (bands [bvar 536, bvar 543, bvar 1186, bvar 1193]),
    bnot (bands [bvar 536, bvar 544, bvar 1186, bvar 1194]),
    bnot (bands [bvar 536, bvar 545, bvar 1186, bvar 1195]),
    bnot (bands [bvar 537, bvar 539, bvar 1187, bvar 1189]),
    bnot (bands [bvar 537, bvar 541, bvar 1187, bvar 1191]),
    bnot (bands [bvar 537, bvar 542, bvar 1187, bvar 1192]),
    bnot (bands [bvar 537, bvar 543, bvar 1187, bvar 1193]),
    bnot (bands [bvar 537, bvar 545, bvar 1187, bvar 1195]),
    bnot (bands [bvar 538, bvar 540, bvar 1188, bvar 1190]),
    bnot (bands [bvar 538, bvar 541, bvar 1188, bvar 1191]),
    bnot (bands [bvar 538, bvar 542, bvar 1188, bvar 1192]),
    bnot (bands [bvar 538, bvar 543, bvar 1188, bvar 1193]),
    bnot (bands [bvar 539, bvar 540, bvar 1189, bvar 1190]),
    bnot (bands [bvar 539, bvar 541, bvar 1189, bvar 1191]),
    bnot (bands [bvar 539, bvar 542, bvar 1189, bvar 1192]),
    bnot (bands [bvar 539, bvar 543, bvar 1189, bvar 1193]),
    bnot (bands [bvar 539, bvar 544, bvar 1189, bvar 1194]),
    bnot (bands [bvar 539, bvar 545, bvar 1189, bvar 1195]),
    bnot (bands [bvar 540, bvar 541, bvar 1190, bvar 1191]),
    bnot (bands [bvar 540, bvar 542, bvar 1190, bvar 1192]),
    bnot (bands [bvar 540, bvar 543, bvar 1190, bvar 1193]),
    bnot (bands [bvar 540, bvar 545, bvar 1190, bvar 1195]),
    bnot (bands [bvar 541, bvar 542, bvar 1191, bvar 1192]),
    bnot (bands [bvar 541, bvar 543, bvar 1191, bvar 1193]),
    bnot (bands [bvar 541, bvar 544, bvar 1191, bvar 1194]),
    bnot (bands [bvar 541, bvar 545, bvar 1191, bvar 1195]),
    bnot (bands [bvar 542, bvar 543, bvar 1192, bvar 1193]),
    bnot (bands [bvar 542, bvar 544, bvar 1192, bvar 1194]),
    bnot (bands [bvar 542, bvar 545, bvar 1192, bvar 1195]),
    bnot (bands [bvar 543, bvar 544, bvar 1193, bvar 1194]),
    bnot (bands [bvar 1043, bvar 1047, bvar 692, bvar 696]),
    bnot (bands [bvar 1043, bvar 1048, bvar 692, bvar 697]),
    bnot (bands [bvar 1043, bvar 1049, bvar 692, bvar 698]),
    bnot (bands [bvar 1043, bvar 1050, bvar 692, bvar 699]),
    bnot (bands [bvar 1043, bvar 1051, bvar 692, bvar 700]),
    bnot (bands [bvar 1043, bvar 1052, bvar 692, bvar 701]),
    bnot (bands [bvar 1043, bvar 1053, bvar 692, bvar 702]),
    bnot (bands [bvar 1044, bvar 1047, bvar 693, bvar 696]),
    bnot (bands [bvar 1044, bvar 1048, bvar 693, bvar 697]),
    bnot (bands [bvar 1044, bvar 1049, bvar 693, bvar 698]),
    bnot (bands [bvar 1044, bvar 1050, bvar 693, bvar 699]),
    bnot (bands [bvar 1044, bvar 1051, bvar 693, bvar 700]),
    bnot (bands [bvar 1044, bvar 1052, bvar 693, bvar 701]) ]

def reducedUnionChunk079 : BVLogicalExpr :=
  bands reducedUnionChunk079Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
