import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk074Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1049, bvar 1053, bvar 74, bvar 78]),
    bnot (bands [bvar 1049, bvar 1054, bvar 74, bvar 79]),
    bnot (bands [bvar 35, bvar 36, bvar 1088, bvar 1089]),
    bnot (bands [bvar 1060, bvar 1063, bvar 72, bvar 75]),
    bnot (bands [bvar 1060, bvar 1064, bvar 72, bvar 76]),
    bnot (bands [bvar 1061, bvar 1064, bvar 73, bvar 76]),
    bnot (bands [bvar 1061, bvar 1067, bvar 73, bvar 79]),
    bnot (bands [bvar 1062, bvar 1064, bvar 74, bvar 76]),
    bnot (bands [bvar 1062, bvar 1065, bvar 74, bvar 77]),
    bnot (bands [bvar 1062, bvar 1066, bvar 74, bvar 78]),
    bnot (bands [bvar 1062, bvar 1067, bvar 74, bvar 79]),
    bnot (bands [bvar 1063, bvar 1064, bvar 75, bvar 76]),
    bnot (bands [bvar 1063, bvar 1065, bvar 75, bvar 77]),
    bnot (bands [bvar 1063, bvar 1067, bvar 75, bvar 79]),
    bnot (bands [bvar 1064, bvar 1065, bvar 76, bvar 77]),
    bnot (bands [bvar 1066, bvar 1067, bvar 78, bvar 79]),
    bnot (bands [bvar 72, bvar 77, bvar 1099, bvar 1104]),
    bnot (bands [bvar 73, bvar 77, bvar 1100, bvar 1104]),
    bnot (bands [bvar 73, bvar 79, bvar 1100, bvar 1106]),
    bnot (bands [bvar 74, bvar 79, bvar 1101, bvar 1106]),
    bnot (bands [bvar 75, bvar 78, bvar 1102, bvar 1105]),
    bnot (bands [bvar 75, bvar 79, bvar 1102, bvar 1106]),
    bnot (bands [bvar 78, bvar 79, bvar 1105, bvar 1106]),
    bnot (bands [bvar 1046, bvar 1047, bvar 552, bvar 553]),
    bnot (bands [bvar 1046, bvar 1049, bvar 552, bvar 555]),
    bnot (bands [bvar 1048, bvar 1049, bvar 554, bvar 555]),
    bnot (bands [bvar 1048, bvar 1051, bvar 554, bvar 557]),
    bnot (bands [bvar 1048, bvar 1054, bvar 554, bvar 560]),
    bnot (bands [bvar 1049, bvar 1051, bvar 555, bvar 557]),
    bnot (bands [bvar 1049, bvar 1053, bvar 555, bvar 559]),
    bnot (bands [bvar 1049, bvar 1054, bvar 555, bvar 560]),
    bnot (bands [bvar 1045, bvar 1051, bvar 564, bvar 570]),
    bnot (bands [bvar 1045, bvar 1054, bvar 564, bvar 573]),
    bnot (bands [bvar 1047, bvar 1053, bvar 566, bvar 572]),
    bnot (bands [bvar 1046, bvar 1047, bvar 578, bvar 579]),
    bnot (bands [bvar 1046, bvar 1048, bvar 578, bvar 580]),
    bnot (bands [bvar 1046, bvar 1049, bvar 578, bvar 581]),
    bnot (bands [bvar 1046, bvar 1050, bvar 578, bvar 582]),
    bnot (bands [bvar 1046, bvar 1051, bvar 578, bvar 583]),
    bnot (bands [bvar 1046, bvar 1052, bvar 578, bvar 584]),
    bnot (bands [bvar 1046, bvar 1053, bvar 578, bvar 585]),
    bnot (bands [bvar 1046, bvar 1054, bvar 578, bvar 586]),
    bnot (bands [bvar 1047, bvar 1048, bvar 579, bvar 580]),
    bnot (bands [bvar 1047, bvar 1049, bvar 579, bvar 581]),
    bnot (bands [bvar 1047, bvar 1050, bvar 579, bvar 582]),
    bnot (bands [bvar 1047, bvar 1051, bvar 579, bvar 583]),
    bnot (bands [bvar 1047, bvar 1052, bvar 579, bvar 584]),
    bnot (bands [bvar 1047, bvar 1053, bvar 579, bvar 585]),
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
    bnot (bands [bvar 539, bvar 540, bvar 1085, bvar 1086]),
    bnot (bands [bvar 539, bvar 541, bvar 1085, bvar 1087]),
    bnot (bands [bvar 539, bvar 542, bvar 1085, bvar 1088]),
    bnot (bands [bvar 539, bvar 543, bvar 1085, bvar 1089]) ]

def reducedUnionChunk074 : BVLogicalExpr :=
  bands reducedUnionChunk074Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
