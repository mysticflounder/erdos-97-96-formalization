import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk074Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 73, bvar 79, bvar 1100, bvar 1106]),
    bnot (bands [bvar 74, bvar 76, bvar 1101, bvar 1103]),
    bnot (bands [bvar 74, bvar 79, bvar 1101, bvar 1106]),
    bnot (bands [bvar 75, bvar 76, bvar 1102, bvar 1103]),
    bnot (bands [bvar 75, bvar 77, bvar 1102, bvar 1104]),
    bnot (bands [bvar 75, bvar 79, bvar 1102, bvar 1106]),
    bnot (bands [bvar 76, bvar 77, bvar 1103, bvar 1104]),
    bnot (bands [bvar 76, bvar 78, bvar 1103, bvar 1105]),
    bnot (bands [bvar 76, bvar 79, bvar 1103, bvar 1106]),
    bnot (bands [bvar 77, bvar 78, bvar 1104, bvar 1105]),
    bnot (bands [bvar 78, bvar 79, bvar 1105, bvar 1106]),
    bnot (bands [bvar 1044, bvar 1047, bvar 550, bvar 553]),
    bnot (bands [bvar 1044, bvar 1048, bvar 550, bvar 554]),
    bnot (bands [bvar 1044, bvar 1054, bvar 550, bvar 560]),
    bnot (bands [bvar 1045, bvar 1047, bvar 551, bvar 553]),
    bnot (bands [bvar 1045, bvar 1048, bvar 551, bvar 554]),
    bnot (bands [bvar 1045, bvar 1049, bvar 551, bvar 555]),
    bnot (bands [bvar 1046, bvar 1047, bvar 552, bvar 553]),
    bnot (bands [bvar 1046, bvar 1048, bvar 552, bvar 554]),
    bnot (bands [bvar 1046, bvar 1049, bvar 552, bvar 555]),
    bnot (bands [bvar 1046, bvar 1051, bvar 552, bvar 557]),
    bnot (bands [bvar 1047, bvar 1048, bvar 553, bvar 554]),
    bnot (bands [bvar 1047, bvar 1049, bvar 553, bvar 555]),
    bnot (bands [bvar 1047, bvar 1051, bvar 553, bvar 557]),
    bnot (bands [bvar 1048, bvar 1049, bvar 554, bvar 555]),
    bnot (bands [bvar 1048, bvar 1050, bvar 554, bvar 556]),
    bnot (bands [bvar 1048, bvar 1051, bvar 554, bvar 557]),
    bnot (bands [bvar 1048, bvar 1053, bvar 554, bvar 559]),
    bnot (bands [bvar 1048, bvar 1054, bvar 554, bvar 560]),
    bnot (bands [bvar 1049, bvar 1051, bvar 555, bvar 557]),
    bnot (bands [bvar 1049, bvar 1053, bvar 555, bvar 559]),
    bnot (bands [bvar 1049, bvar 1054, bvar 555, bvar 560]),
    bnot (bands [bvar 537, bvar 540, bvar 1057, bvar 1060]),
    bnot (bands [bvar 537, bvar 541, bvar 1057, bvar 1061]),
    bnot (bands [bvar 537, bvar 542, bvar 1057, bvar 1062]),
    bnot (bands [bvar 538, bvar 540, bvar 1058, bvar 1060]),
    bnot (bands [bvar 539, bvar 540, bvar 1059, bvar 1060]),
    bnot (bands [bvar 539, bvar 541, bvar 1059, bvar 1061]),
    bnot (bands [bvar 539, bvar 545, bvar 1059, bvar 1065]),
    bnot (bands [bvar 539, bvar 547, bvar 1059, bvar 1067]),
    bnot (bands [bvar 540, bvar 541, bvar 1060, bvar 1061]),
    bnot (bands [bvar 540, bvar 542, bvar 1060, bvar 1062]),
    bnot (bands [bvar 540, bvar 545, bvar 1060, bvar 1065]),
    bnot (bands [bvar 540, bvar 546, bvar 1060, bvar 1066]),
    bnot (bands [bvar 540, bvar 547, bvar 1060, bvar 1067]),
    bnot (bands [bvar 541, bvar 542, bvar 1061, bvar 1062]),
    bnot (bands [bvar 541, bvar 543, bvar 1061, bvar 1063]),
    bnot (bands [bvar 541, bvar 545, bvar 1061, bvar 1065]),
    bnot (bands [bvar 541, bvar 546, bvar 1061, bvar 1066]),
    bnot (bands [bvar 541, bvar 547, bvar 1061, bvar 1067]),
    bnot (bands [bvar 542, bvar 543, bvar 1062, bvar 1063]),
    bnot (bands [bvar 542, bvar 546, bvar 1062, bvar 1066]),
    bnot (bands [bvar 542, bvar 547, bvar 1062, bvar 1067]),
    bnot (bands [bvar 1045, bvar 1047, bvar 564, bvar 566]),
    bnot (bands [bvar 1045, bvar 1051, bvar 564, bvar 570]),
    bnot (bands [bvar 1045, bvar 1054, bvar 564, bvar 573]),
    bnot (bands [bvar 1048, bvar 1054, bvar 567, bvar 573]),
    bnot (bands [bvar 1046, bvar 1047, bvar 578, bvar 579]),
    bnot (bands [bvar 1046, bvar 1048, bvar 578, bvar 580]),
    bnot (bands [bvar 1046, bvar 1049, bvar 578, bvar 581]),
    bnot (bands [bvar 1046, bvar 1050, bvar 578, bvar 582]),
    bnot (bands [bvar 1046, bvar 1051, bvar 578, bvar 583]),
    bnot (bands [bvar 1046, bvar 1052, bvar 578, bvar 584]),
    bnot (bands [bvar 1046, bvar 1054, bvar 578, bvar 586]) ]

def reducedUnionChunk074 : BVLogicalExpr :=
  bands reducedUnionChunk074Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
