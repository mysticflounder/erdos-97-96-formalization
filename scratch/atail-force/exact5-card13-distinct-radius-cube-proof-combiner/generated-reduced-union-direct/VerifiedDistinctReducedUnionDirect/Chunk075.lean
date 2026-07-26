import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk075Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 539, bvar 544, bvar 1085, bvar 1090]),
    bnot (bands [bvar 539, bvar 545, bvar 1085, bvar 1091]),
    bnot (bands [bvar 539, bvar 546, bvar 1085, bvar 1092]),
    bnot (bands [bvar 539, bvar 547, bvar 1085, bvar 1093]),
    bnot (bands [bvar 540, bvar 541, bvar 1086, bvar 1087]),
    bnot (bands [bvar 540, bvar 543, bvar 1086, bvar 1089]),
    bnot (bands [bvar 540, bvar 544, bvar 1086, bvar 1090]),
    bnot (bands [bvar 540, bvar 545, bvar 1086, bvar 1091]),
    bnot (bands [bvar 540, bvar 546, bvar 1086, bvar 1092]),
    bnot (bands [bvar 540, bvar 547, bvar 1086, bvar 1093]),
    bnot (bands [bvar 541, bvar 542, bvar 1087, bvar 1088]),
    bnot (bands [bvar 541, bvar 543, bvar 1087, bvar 1089]),
    bnot (bands [bvar 541, bvar 544, bvar 1087, bvar 1090]),
    bnot (bands [bvar 541, bvar 545, bvar 1087, bvar 1091]),
    bnot (bands [bvar 541, bvar 546, bvar 1087, bvar 1092]),
    bnot (bands [bvar 541, bvar 547, bvar 1087, bvar 1093]),
    bnot (bands [bvar 542, bvar 543, bvar 1088, bvar 1089]),
    bnot (bands [bvar 542, bvar 544, bvar 1088, bvar 1090]),
    bnot (bands [bvar 542, bvar 545, bvar 1088, bvar 1091]),
    bnot (bands [bvar 542, bvar 546, bvar 1088, bvar 1092]),
    bnot (bands [bvar 540, bvar 541, bvar 1099, bvar 1100]),
    bnot (bands [bvar 540, bvar 542, bvar 1099, bvar 1101]),
    bnot (bands [bvar 540, bvar 543, bvar 1099, bvar 1102]),
    bnot (bands [bvar 540, bvar 544, bvar 1099, bvar 1103]),
    bnot (bands [bvar 540, bvar 545, bvar 1099, bvar 1104]),
    bnot (bands [bvar 540, bvar 546, bvar 1099, bvar 1105]),
    bnot (bands [bvar 540, bvar 547, bvar 1099, bvar 1106]),
    bnot (bands [bvar 541, bvar 542, bvar 1100, bvar 1101]),
    bnot (bands [bvar 541, bvar 543, bvar 1100, bvar 1102]),
    bnot (bands [bvar 541, bvar 544, bvar 1100, bvar 1103]),
    bnot (bands [bvar 541, bvar 545, bvar 1100, bvar 1104]),
    bnot (bands [bvar 541, bvar 546, bvar 1100, bvar 1105]),
    bnot (bands [bvar 541, bvar 547, bvar 1100, bvar 1106]),
    bnot (bands [bvar 542, bvar 543, bvar 1101, bvar 1102]),
    bnot (bands [bvar 542, bvar 544, bvar 1101, bvar 1103]),
    bnot (bands [bvar 542, bvar 545, bvar 1101, bvar 1104]),
    bnot (bands [bvar 542, bvar 546, bvar 1101, bvar 1105]),
    bnot (bands [bvar 542, bvar 547, bvar 1101, bvar 1106]),
    bnot (bands [bvar 543, bvar 544, bvar 1102, bvar 1103]),
    bnot (bands [bvar 544, bvar 546, bvar 1103, bvar 1105]),
    bnot (bands [bvar 545, bvar 546, bvar 1104, bvar 1105]),
    bnot (bands [bvar 1043, bvar 1046, bvar 601, bvar 604]),
    bnot (bands [bvar 1048, bvar 1049, bvar 606, bvar 607]),
    bnot (bands [bvar 1048, bvar 1050, bvar 606, bvar 608]),
    bnot (bands [bvar 1048, bvar 1051, bvar 606, bvar 609]),
    bnot (bands [bvar 1048, bvar 1052, bvar 606, bvar 610]),
    bnot (bands [bvar 1048, bvar 1053, bvar 606, bvar 611]),
    bnot (bands [bvar 1048, bvar 1054, bvar 606, bvar 612]),
    bnot (bands [bvar 1049, bvar 1050, bvar 607, bvar 608]),
    bnot (bands [bvar 1049, bvar 1051, bvar 607, bvar 609]),
    bnot (bands [bvar 1049, bvar 1052, bvar 607, bvar 610]),
    bnot (bands [bvar 1049, bvar 1053, bvar 607, bvar 611]),
    bnot (bands [bvar 1049, bvar 1054, bvar 607, bvar 612]),
    bnot (bands [bvar 1050, bvar 1051, bvar 608, bvar 609]),
    bnot (bands [bvar 1050, bvar 1052, bvar 608, bvar 610]),
    bnot (bands [bvar 1050, bvar 1053, bvar 608, bvar 611]),
    bnot (bands [bvar 1050, bvar 1054, bvar 608, bvar 612]),
    bnot (bands [bvar 1051, bvar 1052, bvar 609, bvar 610]),
    bnot (bands [bvar 1051, bvar 1053, bvar 609, bvar 611]),
    bnot (bands [bvar 1051, bvar 1054, bvar 609, bvar 612]),
    bnot (bands [bvar 1052, bvar 1053, bvar 610, bvar 611]),
    bnot (bands [bvar 1052, bvar 1054, bvar 610, bvar 612]),
    bnot (bands [bvar 1053, bvar 1054, bvar 611, bvar 612]),
    atMost [bands [bvar 535, bvar 1107], bands [bvar 536, bvar 1108], bands [bvar 537, bvar 1109], bands [bvar 538, bvar 1110], bands [bvar 539, bvar 1111], bands [bvar 540, bvar 1112], bands [bvar 541, bvar 1113], bands [bvar 542, bvar 1114], bands [bvar 543, bvar 1115], bands [bvar 544, bvar 1116], bands [bvar 545, bvar 1117], bands [bvar 546, bvar 1118], bands [bvar 547, bvar 1119]] 2 ]

def reducedUnionChunk075 : BVLogicalExpr :=
  bands reducedUnionChunk075Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
