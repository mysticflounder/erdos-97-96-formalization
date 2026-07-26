import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk083Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1082, bvar 1093, bvar 679, bvar 690]),
    bnot (bands [bvar 1083, bvar 1093, bvar 680, bvar 690]),
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
    bnot (bands [bvar 1086, bvar 1091, bvar 683, bvar 688]),
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
    bnot (bands [bvar 576, bvar 586, bvar 1187, bvar 1197]),
    bnot (bands [bvar 578, bvar 579, bvar 1189, bvar 1190]),
    bnot (bands [bvar 578, bvar 580, bvar 1189, bvar 1191]),
    bnot (bands [bvar 578, bvar 581, bvar 1189, bvar 1192]),
    bnot (bands [bvar 578, bvar 582, bvar 1189, bvar 1193]),
    bnot (bands [bvar 578, bvar 583, bvar 1189, bvar 1194]),
    bnot (bands [bvar 578, bvar 584, bvar 1189, bvar 1195]),
    bnot (bands [bvar 579, bvar 580, bvar 1190, bvar 1191]),
    bnot (bands [bvar 579, bvar 581, bvar 1190, bvar 1192]),
    bnot (bands [bvar 579, bvar 582, bvar 1190, bvar 1193]),
    bnot (bands [bvar 579, bvar 583, bvar 1190, bvar 1194]),
    bnot (bands [bvar 579, bvar 584, bvar 1190, bvar 1195]),
    bnot (bands [bvar 580, bvar 582, bvar 1191, bvar 1193]),
    bnot (bands [bvar 580, bvar 583, bvar 1191, bvar 1194]),
    bnot (bands [bvar 580, bvar 584, bvar 1191, bvar 1195]),
    bnot (bands [bvar 581, bvar 582, bvar 1192, bvar 1193]),
    bnot (bands [bvar 581, bvar 583, bvar 1192, bvar 1194]),
    bnot (bands [bvar 581, bvar 584, bvar 1192, bvar 1195]),
    bnot (bands [bvar 582, bvar 583, bvar 1193, bvar 1194]),
    bnot (bands [bvar 582, bvar 584, bvar 1193, bvar 1195]),
    bnot (bands [bvar 583, bvar 584, bvar 1194, bvar 1195]),
    bnot (bands [bvar 1085, bvar 1088, bvar 695, bvar 698]),
    bnot (bands [bvar 1085, bvar 1089, bvar 695, bvar 699]),
    bnot (bands [bvar 1085, bvar 1090, bvar 695, bvar 700]),
    bnot (bands [bvar 1085, bvar 1091, bvar 695, bvar 701]),
    bnot (bands [bvar 1085, bvar 1092, bvar 695, bvar 702]),
    bnot (bands [bvar 1086, bvar 1088, bvar 696, bvar 698]),
    bnot (bands [bvar 1086, bvar 1092, bvar 696, bvar 702]),
    bnot (bands [bvar 1088, bvar 1089, bvar 698, bvar 699]),
    bnot (bands [bvar 1088, bvar 1090, bvar 698, bvar 700]),
    bnot (bands [bvar 1088, bvar 1091, bvar 698, bvar 701]),
    bnot (bands [bvar 1088, bvar 1092, bvar 698, bvar 702]),
    bnot (bands [bvar 1089, bvar 1092, bvar 699, bvar 702]),
    bnot (bands [bvar 1094, bvar 1095, bvar 600, bvar 601]),
    bnot (bands [bvar 1094, bvar 1096, bvar 600, bvar 602]),
    bnot (bands [bvar 1094, bvar 1097, bvar 600, bvar 603]),
    bnot (bands [bvar 1094, bvar 1100, bvar 600, bvar 606]),
    bnot (bands [bvar 1094, bvar 1101, bvar 600, bvar 607]),
    bnot (bands [bvar 1094, bvar 1102, bvar 600, bvar 608]),
    bnot (bands [bvar 1094, bvar 1103, bvar 600, bvar 609]),
    bnot (bands [bvar 1094, bvar 1104, bvar 600, bvar 610]) ]

def reducedUnionChunk083 : BVLogicalExpr :=
  bands reducedUnionChunk083Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
