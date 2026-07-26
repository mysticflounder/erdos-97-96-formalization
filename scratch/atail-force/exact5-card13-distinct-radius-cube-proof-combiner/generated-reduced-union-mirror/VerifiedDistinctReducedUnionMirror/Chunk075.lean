import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk075Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1047, bvar 1048, bvar 579, bvar 580]),
    bnot (bands [bvar 1047, bvar 1049, bvar 579, bvar 581]),
    bnot (bands [bvar 1047, bvar 1050, bvar 579, bvar 582]),
    bnot (bands [bvar 1047, bvar 1051, bvar 579, bvar 583]),
    bnot (bands [bvar 1047, bvar 1052, bvar 579, bvar 584]),
    bnot (bands [bvar 1047, bvar 1054, bvar 579, bvar 586]),
    bnot (bands [bvar 1048, bvar 1049, bvar 580, bvar 581]),
    bnot (bands [bvar 1048, bvar 1050, bvar 580, bvar 582]),
    bnot (bands [bvar 1048, bvar 1051, bvar 580, bvar 583]),
    bnot (bands [bvar 1048, bvar 1052, bvar 580, bvar 584]),
    bnot (bands [bvar 1048, bvar 1053, bvar 580, bvar 585]),
    bnot (bands [bvar 1048, bvar 1054, bvar 580, bvar 586]),
    bnot (bands [bvar 1049, bvar 1050, bvar 581, bvar 582]),
    bnot (bands [bvar 1049, bvar 1051, bvar 581, bvar 583]),
    bnot (bands [bvar 1049, bvar 1052, bvar 581, bvar 584]),
    bnot (bands [bvar 1049, bvar 1053, bvar 581, bvar 585]),
    bnot (bands [bvar 1049, bvar 1054, bvar 581, bvar 586]),
    bnot (bands [bvar 1050, bvar 1052, bvar 582, bvar 584]),
    bnot (bands [bvar 1051, bvar 1054, bvar 583, bvar 586]),
    bnot (bands [bvar 539, bvar 540, bvar 1085, bvar 1086]),
    bnot (bands [bvar 539, bvar 542, bvar 1085, bvar 1088]),
    bnot (bands [bvar 540, bvar 542, bvar 1086, bvar 1088]),
    bnot (bands [bvar 540, bvar 543, bvar 1086, bvar 1089]),
    bnot (bands [bvar 540, bvar 544, bvar 1086, bvar 1090]),
    bnot (bands [bvar 540, bvar 547, bvar 1086, bvar 1093]),
    bnot (bands [bvar 541, bvar 542, bvar 1087, bvar 1088]),
    bnot (bands [bvar 541, bvar 543, bvar 1087, bvar 1089]),
    bnot (bands [bvar 541, bvar 545, bvar 1087, bvar 1091]),
    bnot (bands [bvar 541, bvar 546, bvar 1087, bvar 1092]),
    bnot (bands [bvar 541, bvar 547, bvar 1087, bvar 1093]),
    bnot (bands [bvar 542, bvar 543, bvar 1088, bvar 1089]),
    bnot (bands [bvar 542, bvar 545, bvar 1088, bvar 1091]),
    bnot (bands [bvar 542, bvar 546, bvar 1088, bvar 1092]),
    bnot (bands [bvar 542, bvar 547, bvar 1088, bvar 1093]),
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
    bnot (bands [bvar 544, bvar 545, bvar 1103, bvar 1104]),
    bnot (bands [bvar 544, bvar 546, bvar 1103, bvar 1105]),
    bnot (bands [bvar 544, bvar 547, bvar 1103, bvar 1106]),
    bnot (bands [bvar 545, bvar 546, bvar 1104, bvar 1105]),
    bnot (bands [bvar 545, bvar 547, bvar 1104, bvar 1106]),
    bnot (bands [bvar 1048, bvar 1049, bvar 606, bvar 607]),
    bnot (bands [bvar 1048, bvar 1050, bvar 606, bvar 608]),
    bnot (bands [bvar 1048, bvar 1051, bvar 606, bvar 609]),
    bnot (bands [bvar 1048, bvar 1052, bvar 606, bvar 610]),
    bnot (bands [bvar 1048, bvar 1053, bvar 606, bvar 611]),
    bnot (bands [bvar 1048, bvar 1054, bvar 606, bvar 612]),
    bnot (bands [bvar 1049, bvar 1050, bvar 607, bvar 608]) ]

def reducedUnionChunk075 : BVLogicalExpr :=
  bands reducedUnionChunk075Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
