import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk095Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 655, bvar 658, bvar 1175, bvar 1178]),
    bnot (bands [bvar 655, bvar 659, bvar 1175, bvar 1179]),
    bnot (bands [bvar 655, bvar 660, bvar 1175, bvar 1180]),
    bnot (bands [bvar 655, bvar 663, bvar 1175, bvar 1183]),
    bnot (bands [bvar 656, bvar 657, bvar 1176, bvar 1177]),
    bnot (bands [bvar 656, bvar 658, bvar 1176, bvar 1178]),
    bnot (bands [bvar 656, bvar 659, bvar 1176, bvar 1179]),
    bnot (bands [bvar 656, bvar 660, bvar 1176, bvar 1180]),
    bnot (bands [bvar 656, bvar 663, bvar 1176, bvar 1183]),
    bnot (bands [bvar 656, bvar 664, bvar 1176, bvar 1184]),
    bnot (bands [bvar 657, bvar 658, bvar 1177, bvar 1178]),
    bnot (bands [bvar 657, bvar 659, bvar 1177, bvar 1179]),
    bnot (bands [bvar 657, bvar 660, bvar 1177, bvar 1180]),
    bnot (bands [bvar 657, bvar 663, bvar 1177, bvar 1183]),
    bnot (bands [bvar 657, bvar 664, bvar 1177, bvar 1184]),
    bnot (bands [bvar 658, bvar 659, bvar 1178, bvar 1179]),
    bnot (bands [bvar 658, bvar 660, bvar 1178, bvar 1180]),
    bnot (bands [bvar 658, bvar 663, bvar 1178, bvar 1183]),
    bnot (bands [bvar 658, bvar 664, bvar 1178, bvar 1184]),
    bnot (bands [bvar 659, bvar 660, bvar 1179, bvar 1180]),
    bnot (bands [bvar 659, bvar 663, bvar 1179, bvar 1183]),
    bnot (bands [bvar 659, bvar 664, bvar 1179, bvar 1184]),
    bnot (bands [bvar 660, bvar 663, bvar 1180, bvar 1183]),
    bnot (bands [bvar 660, bvar 664, bvar 1180, bvar 1184]),
    bnot (bands [bvar 663, bvar 664, bvar 1183, bvar 1184]),
    atMost [bands [bvar 1159, bvar 678], bands [bvar 1160, bvar 679], bands [bvar 1161, bvar 680], bands [bvar 1162, bvar 681], bands [bvar 1163, bvar 682], bands [bvar 1164, bvar 683], bands [bvar 1165, bvar 684], bands [bvar 1166, bvar 685], bands [bvar 1167, bvar 686], bands [bvar 1168, bvar 687], bands [bvar 1169, bvar 688], bands [bvar 1170, bvar 689], bands [bvar 1171, bvar 690]] 2,
    bnot (bands [bvar 1159, bvar 1160, bvar 678, bvar 679]),
    bnot (bands [bvar 1159, bvar 1161, bvar 678, bvar 680]),
    bnot (bands [bvar 1159, bvar 1162, bvar 678, bvar 681]),
    bnot (bands [bvar 1159, bvar 1163, bvar 678, bvar 682]),
    bnot (bands [bvar 1159, bvar 1164, bvar 678, bvar 683]),
    bnot (bands [bvar 1159, bvar 1165, bvar 678, bvar 684]),
    bnot (bands [bvar 1159, bvar 1166, bvar 678, bvar 685]),
    bnot (bands [bvar 1159, bvar 1167, bvar 678, bvar 686]),
    bnot (bands [bvar 1159, bvar 1171, bvar 678, bvar 690]),
    bnot (bands [bvar 1160, bvar 1163, bvar 679, bvar 682]),
    bnot (bands [bvar 1160, bvar 1164, bvar 679, bvar 683]),
    bnot (bands [bvar 1160, bvar 1165, bvar 679, bvar 684]),
    bnot (bands [bvar 1160, bvar 1166, bvar 679, bvar 685]),
    bnot (bands [bvar 1160, bvar 1167, bvar 679, bvar 686]),
    bnot (bands [bvar 1160, bvar 1171, bvar 679, bvar 690]),
    bnot (bands [bvar 1161, bvar 1163, bvar 680, bvar 682]),
    bnot (bands [bvar 1161, bvar 1164, bvar 680, bvar 683]),
    bnot (bands [bvar 1161, bvar 1165, bvar 680, bvar 684]),
    bnot (bands [bvar 1161, bvar 1166, bvar 680, bvar 685]),
    bnot (bands [bvar 1161, bvar 1167, bvar 680, bvar 686]),
    bnot (bands [bvar 1161, bvar 1171, bvar 680, bvar 690]),
    bnot (bands [bvar 1162, bvar 1163, bvar 681, bvar 682]),
    bnot (bands [bvar 1162, bvar 1164, bvar 681, bvar 683]),
    bnot (bands [bvar 1162, bvar 1165, bvar 681, bvar 684]),
    bnot (bands [bvar 1162, bvar 1166, bvar 681, bvar 685]),
    bnot (bands [bvar 1163, bvar 1164, bvar 682, bvar 683]),
    bnot (bands [bvar 1163, bvar 1165, bvar 682, bvar 684]),
    bnot (bands [bvar 1163, bvar 1166, bvar 682, bvar 685]),
    bnot (bands [bvar 1163, bvar 1167, bvar 682, bvar 686]),
    bnot (bands [bvar 1163, bvar 1171, bvar 682, bvar 690]),
    bnot (bands [bvar 1164, bvar 1165, bvar 683, bvar 684]),
    bnot (bands [bvar 1164, bvar 1166, bvar 683, bvar 685]),
    bnot (bands [bvar 1164, bvar 1167, bvar 683, bvar 686]),
    bnot (bands [bvar 1164, bvar 1171, bvar 683, bvar 690]),
    bnot (bands [bvar 1165, bvar 1166, bvar 684, bvar 685]),
    bnot (bands [bvar 1165, bvar 1167, bvar 684, bvar 686]),
    bnot (bands [bvar 1165, bvar 1171, bvar 684, bvar 690]),
    bnot (bands [bvar 1166, bvar 1167, bvar 685, bvar 686]) ]

def reducedUnionChunk095 : BVLogicalExpr :=
  bands reducedUnionChunk095Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
