import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk080Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1044, bvar 1053, bvar 693, bvar 702]),
    bnot (bands [bvar 1045, bvar 1047, bvar 694, bvar 696]),
    bnot (bands [bvar 1045, bvar 1048, bvar 694, bvar 697]),
    bnot (bands [bvar 1045, bvar 1049, bvar 694, bvar 698]),
    bnot (bands [bvar 1045, bvar 1050, bvar 694, bvar 699]),
    bnot (bands [bvar 1045, bvar 1051, bvar 694, bvar 700]),
    bnot (bands [bvar 1045, bvar 1052, bvar 694, bvar 701]),
    bnot (bands [bvar 1046, bvar 1047, bvar 695, bvar 696]),
    bnot (bands [bvar 1046, bvar 1048, bvar 695, bvar 697]),
    bnot (bands [bvar 1046, bvar 1049, bvar 695, bvar 698]),
    bnot (bands [bvar 1046, bvar 1050, bvar 695, bvar 699]),
    bnot (bands [bvar 1046, bvar 1051, bvar 695, bvar 700]),
    bnot (bands [bvar 1046, bvar 1052, bvar 695, bvar 701]),
    bnot (bands [bvar 1046, bvar 1053, bvar 695, bvar 702]),
    bnot (bands [bvar 1047, bvar 1048, bvar 696, bvar 697]),
    bnot (bands [bvar 1047, bvar 1049, bvar 696, bvar 698]),
    bnot (bands [bvar 1047, bvar 1050, bvar 696, bvar 699]),
    bnot (bands [bvar 1047, bvar 1051, bvar 696, bvar 700]),
    bnot (bands [bvar 1047, bvar 1052, bvar 696, bvar 701]),
    bnot (bands [bvar 1047, bvar 1053, bvar 696, bvar 702]),
    bnot (bands [bvar 1048, bvar 1049, bvar 697, bvar 698]),
    bnot (bands [bvar 1048, bvar 1050, bvar 697, bvar 699]),
    bnot (bands [bvar 1048, bvar 1051, bvar 697, bvar 700]),
    bnot (bands [bvar 1048, bvar 1052, bvar 697, bvar 701]),
    bnot (bands [bvar 1048, bvar 1053, bvar 697, bvar 702]),
    bnot (bands [bvar 1049, bvar 1050, bvar 698, bvar 699]),
    bnot (bands [bvar 1049, bvar 1051, bvar 698, bvar 700]),
    bnot (bands [bvar 1049, bvar 1052, bvar 698, bvar 701]),
    bnot (bands [bvar 1049, bvar 1053, bvar 698, bvar 702]),
    bnot (bands [bvar 1050, bvar 1051, bvar 699, bvar 700]),
    bnot (bands [bvar 1050, bvar 1053, bvar 699, bvar 702]),
    bnot (bands [bvar 536, bvar 541, bvar 1199, bvar 1204]),
    bnot (bands [bvar 536, bvar 542, bvar 1199, bvar 1205]),
    bnot (bands [bvar 536, bvar 543, bvar 1199, bvar 1206]),
    bnot (bands [bvar 537, bvar 541, bvar 1200, bvar 1204]),
    bnot (bands [bvar 537, bvar 542, bvar 1200, bvar 1205]),
    bnot (bands [bvar 537, bvar 543, bvar 1200, bvar 1206]),
    bnot (bands [bvar 537, bvar 544, bvar 1200, bvar 1207]),
    bnot (bands [bvar 537, bvar 545, bvar 1200, bvar 1208]),
    bnot (bands [bvar 537, bvar 546, bvar 1200, bvar 1209]),
    bnot (bands [bvar 539, bvar 540, bvar 1202, bvar 1203]),
    bnot (bands [bvar 539, bvar 541, bvar 1202, bvar 1204]),
    bnot (bands [bvar 539, bvar 542, bvar 1202, bvar 1205]),
    bnot (bands [bvar 540, bvar 542, bvar 1203, bvar 1205]),
    bnot (bands [bvar 541, bvar 542, bvar 1204, bvar 1205]),
    bnot (bands [bvar 541, bvar 543, bvar 1204, bvar 1206]),
    bnot (bands [bvar 541, bvar 545, bvar 1204, bvar 1208]),
    bnot (bands [bvar 541, bvar 546, bvar 1204, bvar 1209]),
    bnot (bands [bvar 542, bvar 543, bvar 1205, bvar 1206]),
    bnot (bands [bvar 542, bvar 544, bvar 1205, bvar 1207]),
    bnot (bands [bvar 542, bvar 545, bvar 1205, bvar 1208]),
    bnot (bands [bvar 542, bvar 546, bvar 1205, bvar 1209]),
    bnot (bands [bvar 1058, bvar 1060, bvar 564, bvar 566]),
    bnot (bands [bvar 1058, bvar 1067, bvar 564, bvar 573]),
    bnot (bands [bvar 1060, bvar 1063, bvar 579, bvar 582]),
    bnot (bands [bvar 1060, bvar 1064, bvar 579, bvar 583]),
    bnot (bands [bvar 1055, bvar 1063, bvar 600, bvar 608]),
    bnot (bands [bvar 1055, bvar 1064, bvar 600, bvar 609]),
    bnot (bands [bvar 1055, bvar 1065, bvar 600, bvar 610]),
    bnot (bands [bvar 548, bvar 558, bvar 1107, bvar 1117]),
    bnot (bands [bvar 548, bvar 559, bvar 1107, bvar 1118]),
    bnot (bands [bvar 548, bvar 560, bvar 1107, bvar 1119]),
    bnot (bands [bvar 556, bvar 559, bvar 1115, bvar 1118]),
    bnot (bands [bvar 558, bvar 559, bvar 1117, bvar 1118]) ]

def reducedUnionChunk080 : BVLogicalExpr :=
  bands reducedUnionChunk080Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
