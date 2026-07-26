import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk105Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 35, bvar 37, bvar 672, bvar 674]),
    bnot (bands [bvar 36, bvar 37, bvar 673, bvar 674]),
    bnot (bands [bvar 536, bvar 539, bvar 159, bvar 162]),
    bnot (bands [bvar 536, bvar 540, bvar 159, bvar 163]),
    bnot (bands [bvar 536, bvar 541, bvar 159, bvar 164]),
    bnot (bands [bvar 536, bvar 542, bvar 159, bvar 165]),
    bnot (bands [bvar 536, bvar 543, bvar 159, bvar 166]),
    bnot (bands [bvar 536, bvar 544, bvar 159, bvar 167]),
    bnot (bands [bvar 537, bvar 539, bvar 160, bvar 162]),
    bnot (bands [bvar 537, bvar 540, bvar 160, bvar 163]),
    bnot (bands [bvar 537, bvar 541, bvar 160, bvar 164]),
    bnot (bands [bvar 537, bvar 542, bvar 160, bvar 165]),
    bnot (bands [bvar 537, bvar 543, bvar 160, bvar 166]),
    bnot (bands [bvar 537, bvar 544, bvar 160, bvar 167]),
    bnot (bands [bvar 538, bvar 540, bvar 161, bvar 163]),
    bnot (bands [bvar 538, bvar 541, bvar 161, bvar 164]),
    bnot (bands [bvar 539, bvar 540, bvar 162, bvar 163]),
    bnot (bands [bvar 539, bvar 541, bvar 162, bvar 164]),
    bnot (bands [bvar 539, bvar 542, bvar 162, bvar 165]),
    bnot (bands [bvar 539, bvar 543, bvar 162, bvar 166]),
    bnot (bands [bvar 539, bvar 544, bvar 162, bvar 167]),
    bnot (bands [bvar 540, bvar 541, bvar 163, bvar 164]),
    bnot (bands [bvar 540, bvar 542, bvar 163, bvar 165]),
    bnot (bands [bvar 540, bvar 543, bvar 163, bvar 166]),
    bnot (bands [bvar 540, bvar 544, bvar 163, bvar 167]),
    bnot (bands [bvar 541, bvar 542, bvar 164, bvar 165]),
    bnot (bands [bvar 541, bvar 543, bvar 164, bvar 166]),
    bnot (bands [bvar 541, bvar 544, bvar 164, bvar 167]),
    bnot (bands [bvar 542, bvar 543, bvar 165, bvar 166]),
    bnot (bands [bvar 542, bvar 544, bvar 165, bvar 167]),
    bnot (bands [bvar 546, bvar 547, bvar 169, bvar 170]),
    atMost [bands [bvar 28, bvar 678], bands [bvar 29, bvar 679], bands [bvar 30, bvar 680], bands [bvar 31, bvar 681], bands [bvar 32, bvar 682], bands [bvar 33, bvar 683], bands [bvar 34, bvar 684], bands [bvar 35, bvar 685], bands [bvar 36, bvar 686], bands [bvar 37, bvar 687], bands [bvar 38, bvar 688], bands [bvar 39, bvar 689], bands [bvar 40, bvar 690]] 2,
    bnot (bands [bvar 29, bvar 32, bvar 679, bvar 682]),
    bnot (bands [bvar 29, bvar 33, bvar 679, bvar 683]),
    bnot (bands [bvar 29, bvar 34, bvar 679, bvar 684]),
    bnot (bands [bvar 29, bvar 35, bvar 679, bvar 685]),
    bnot (bands [bvar 29, bvar 36, bvar 679, bvar 686]),
    bnot (bands [bvar 29, bvar 37, bvar 679, bvar 687]),
    bnot (bands [bvar 29, bvar 38, bvar 679, bvar 688]),
    bnot (bands [bvar 30, bvar 33, bvar 680, bvar 683]),
    bnot (bands [bvar 30, bvar 34, bvar 680, bvar 684]),
    bnot (bands [bvar 30, bvar 35, bvar 680, bvar 685]),
    bnot (bands [bvar 30, bvar 36, bvar 680, bvar 686]),
    bnot (bands [bvar 30, bvar 37, bvar 680, bvar 687]),
    bnot (bands [bvar 30, bvar 38, bvar 680, bvar 688]),
    bnot (bands [bvar 31, bvar 32, bvar 681, bvar 682]),
    bnot (bands [bvar 31, bvar 34, bvar 681, bvar 684]),
    bnot (bands [bvar 31, bvar 35, bvar 681, bvar 685]),
    bnot (bands [bvar 31, bvar 37, bvar 681, bvar 687]),
    bnot (bands [bvar 32, bvar 33, bvar 682, bvar 683]),
    bnot (bands [bvar 32, bvar 34, bvar 682, bvar 684]),
    bnot (bands [bvar 32, bvar 35, bvar 682, bvar 685]),
    bnot (bands [bvar 32, bvar 36, bvar 682, bvar 686]),
    bnot (bands [bvar 32, bvar 37, bvar 682, bvar 687]),
    bnot (bands [bvar 32, bvar 38, bvar 682, bvar 688]),
    bnot (bands [bvar 33, bvar 34, bvar 683, bvar 684]),
    bnot (bands [bvar 33, bvar 35, bvar 683, bvar 685]),
    bnot (bands [bvar 33, bvar 37, bvar 683, bvar 687]),
    bnot (bands [bvar 33, bvar 38, bvar 683, bvar 688]),
    bnot (bands [bvar 34, bvar 35, bvar 684, bvar 685]),
    bnot (bands [bvar 34, bvar 36, bvar 684, bvar 686]),
    bnot (bands [bvar 34, bvar 37, bvar 684, bvar 687]),
    bnot (bands [bvar 34, bvar 38, bvar 684, bvar 688]),
    bnot (bands [bvar 35, bvar 36, bvar 685, bvar 686]) ]

def reducedUnionChunk105 : BVLogicalExpr :=
  bands reducedUnionChunk105Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
