import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk083Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1081, bvar 1091, bvar 652, bvar 662]),
    bnot (bands [bvar 1081, bvar 1092, bvar 652, bvar 663]),
    bnot (bands [bvar 1082, bvar 1091, bvar 653, bvar 662]),
    bnot (bands [bvar 1082, bvar 1093, bvar 653, bvar 664]),
    bnot (bands [bvar 1083, bvar 1093, bvar 654, bvar 664]),
    bnot (bands [bvar 1085, bvar 1086, bvar 656, bvar 657]),
    bnot (bands [bvar 1085, bvar 1087, bvar 656, bvar 658]),
    bnot (bands [bvar 1085, bvar 1088, bvar 656, bvar 659]),
    bnot (bands [bvar 1085, bvar 1089, bvar 656, bvar 660]),
    bnot (bands [bvar 1086, bvar 1087, bvar 657, bvar 658]),
    bnot (bands [bvar 1086, bvar 1088, bvar 657, bvar 659]),
    bnot (bands [bvar 1086, bvar 1089, bvar 657, bvar 660]),
    bnot (bands [bvar 1087, bvar 1088, bvar 658, bvar 659]),
    bnot (bands [bvar 1087, bvar 1089, bvar 658, bvar 660]),
    bnot (bands [bvar 1088, bvar 1089, bvar 659, bvar 660]),
    bnot (bands [bvar 1091, bvar 1092, bvar 662, bvar 663]),
    bnot (bands [bvar 1091, bvar 1093, bvar 662, bvar 664]),
    bnot (bands [bvar 1092, bvar 1093, bvar 663, bvar 664]),
    bnot (bands [bvar 1081, bvar 1082, bvar 678, bvar 679]),
    bnot (bands [bvar 1081, bvar 1083, bvar 678, bvar 680]),
    bnot (bands [bvar 1085, bvar 1086, bvar 682, bvar 683]),
    bnot (bands [bvar 1085, bvar 1087, bvar 682, bvar 684]),
    bnot (bands [bvar 1085, bvar 1088, bvar 682, bvar 685]),
    bnot (bands [bvar 1085, bvar 1089, bvar 682, bvar 686]),
    bnot (bands [bvar 1085, bvar 1090, bvar 682, bvar 687]),
    bnot (bands [bvar 1085, bvar 1091, bvar 682, bvar 688]),
    bnot (bands [bvar 1086, bvar 1087, bvar 683, bvar 684]),
    bnot (bands [bvar 1086, bvar 1088, bvar 683, bvar 685]),
    bnot (bands [bvar 1086, bvar 1089, bvar 683, bvar 686]),
    bnot (bands [bvar 1086, bvar 1090, bvar 683, bvar 687]),
    bnot (bands [bvar 1087, bvar 1088, bvar 684, bvar 685]),
    bnot (bands [bvar 1087, bvar 1089, bvar 684, bvar 686]),
    bnot (bands [bvar 1087, bvar 1090, bvar 684, bvar 687]),
    bnot (bands [bvar 1087, bvar 1091, bvar 684, bvar 688]),
    bnot (bands [bvar 1088, bvar 1089, bvar 685, bvar 686]),
    bnot (bands [bvar 1088, bvar 1090, bvar 685, bvar 687]),
    bnot (bands [bvar 1088, bvar 1091, bvar 685, bvar 688]),
    bnot (bands [bvar 1089, bvar 1090, bvar 686, bvar 687]),
    bnot (bands [bvar 1089, bvar 1091, bvar 686, bvar 688]),
    bnot (bands [bvar 1090, bvar 1091, bvar 687, bvar 688]),
    bnot (bands [bvar 574, bvar 575, bvar 1198, bvar 1199]),
    bnot (bands [bvar 574, bvar 576, bvar 1198, bvar 1200]),
    bnot (bands [bvar 578, bvar 579, bvar 1202, bvar 1203]),
    bnot (bands [bvar 578, bvar 580, bvar 1202, bvar 1204]),
    bnot (bands [bvar 578, bvar 581, bvar 1202, bvar 1205]),
    bnot (bands [bvar 578, bvar 583, bvar 1202, bvar 1207]),
    bnot (bands [bvar 578, bvar 584, bvar 1202, bvar 1208]),
    bnot (bands [bvar 578, bvar 585, bvar 1202, bvar 1209]),
    bnot (bands [bvar 579, bvar 583, bvar 1203, bvar 1207]),
    bnot (bands [bvar 579, bvar 585, bvar 1203, bvar 1209]),
    bnot (bands [bvar 580, bvar 582, bvar 1204, bvar 1206]),
    bnot (bands [bvar 580, bvar 583, bvar 1204, bvar 1207]),
    bnot (bands [bvar 580, bvar 585, bvar 1204, bvar 1209]),
    bnot (bands [bvar 581, bvar 582, bvar 1205, bvar 1206]),
    bnot (bands [bvar 581, bvar 583, bvar 1205, bvar 1207]),
    bnot (bands [bvar 581, bvar 585, bvar 1205, bvar 1209]),
    bnot (bands [bvar 582, bvar 583, bvar 1206, bvar 1207]),
    bnot (bands [bvar 582, bvar 585, bvar 1206, bvar 1209]),
    bnot (bands [bvar 583, bvar 585, bvar 1207, bvar 1209]),
    bnot (bands [bvar 1094, bvar 1095, bvar 600, bvar 601]),
    bnot (bands [bvar 1094, bvar 1096, bvar 600, bvar 602]),
    bnot (bands [bvar 1094, bvar 1097, bvar 600, bvar 603]),
    bnot (bands [bvar 1094, bvar 1100, bvar 600, bvar 606]),
    bnot (bands [bvar 1094, bvar 1101, bvar 600, bvar 607]) ]

def reducedUnionChunk083 : BVLogicalExpr :=
  bands reducedUnionChunk083Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
