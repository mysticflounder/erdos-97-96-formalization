import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk103Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 537, bvar 543, bvar 160, bvar 166]),
    bnot (bands [bvar 537, bvar 544, bvar 160, bvar 167]),
    bnot (bands [bvar 538, bvar 539, bvar 161, bvar 162]),
    bnot (bands [bvar 538, bvar 541, bvar 161, bvar 164]),
    bnot (bands [bvar 538, bvar 542, bvar 161, bvar 165]),
    bnot (bands [bvar 539, bvar 540, bvar 162, bvar 163]),
    bnot (bands [bvar 539, bvar 541, bvar 162, bvar 164]),
    bnot (bands [bvar 539, bvar 542, bvar 162, bvar 165]),
    bnot (bands [bvar 539, bvar 543, bvar 162, bvar 166]),
    bnot (bands [bvar 539, bvar 544, bvar 162, bvar 167]),
    bnot (bands [bvar 540, bvar 541, bvar 163, bvar 164]),
    bnot (bands [bvar 540, bvar 542, bvar 163, bvar 165]),
    bnot (bands [bvar 540, bvar 543, bvar 163, bvar 166]),
    bnot (bands [bvar 541, bvar 542, bvar 164, bvar 165]),
    bnot (bands [bvar 541, bvar 543, bvar 164, bvar 166]),
    bnot (bands [bvar 541, bvar 544, bvar 164, bvar 167]),
    bnot (bands [bvar 542, bvar 543, bvar 165, bvar 166]),
    bnot (bands [bvar 542, bvar 544, bvar 165, bvar 167]),
    bnot (bands [bvar 29, bvar 33, bvar 679, bvar 683]),
    bnot (bands [bvar 29, bvar 34, bvar 679, bvar 684]),
    bnot (bands [bvar 29, bvar 35, bvar 679, bvar 685]),
    bnot (bands [bvar 29, bvar 36, bvar 679, bvar 686]),
    bnot (bands [bvar 29, bvar 37, bvar 679, bvar 687]),
    bnot (bands [bvar 29, bvar 38, bvar 679, bvar 688]),
    bnot (bands [bvar 30, bvar 32, bvar 680, bvar 682]),
    bnot (bands [bvar 30, bvar 33, bvar 680, bvar 683]),
    bnot (bands [bvar 30, bvar 34, bvar 680, bvar 684]),
    bnot (bands [bvar 30, bvar 35, bvar 680, bvar 685]),
    bnot (bands [bvar 30, bvar 36, bvar 680, bvar 686]),
    bnot (bands [bvar 30, bvar 37, bvar 680, bvar 687]),
    bnot (bands [bvar 30, bvar 38, bvar 680, bvar 688]),
    bnot (bands [bvar 31, bvar 33, bvar 681, bvar 683]),
    bnot (bands [bvar 31, bvar 34, bvar 681, bvar 684]),
    bnot (bands [bvar 31, bvar 35, bvar 681, bvar 685]),
    bnot (bands [bvar 31, bvar 36, bvar 681, bvar 686]),
    bnot (bands [bvar 31, bvar 38, bvar 681, bvar 688]),
    bnot (bands [bvar 32, bvar 33, bvar 682, bvar 683]),
    bnot (bands [bvar 32, bvar 34, bvar 682, bvar 684]),
    bnot (bands [bvar 32, bvar 35, bvar 682, bvar 685]),
    bnot (bands [bvar 32, bvar 36, bvar 682, bvar 686]),
    bnot (bands [bvar 32, bvar 37, bvar 682, bvar 687]),
    bnot (bands [bvar 32, bvar 38, bvar 682, bvar 688]),
    bnot (bands [bvar 33, bvar 34, bvar 683, bvar 684]),
    bnot (bands [bvar 33, bvar 35, bvar 683, bvar 685]),
    bnot (bands [bvar 33, bvar 36, bvar 683, bvar 686]),
    bnot (bands [bvar 33, bvar 37, bvar 683, bvar 687]),
    bnot (bands [bvar 33, bvar 38, bvar 683, bvar 688]),
    bnot (bands [bvar 34, bvar 35, bvar 684, bvar 685]),
    bnot (bands [bvar 34, bvar 36, bvar 684, bvar 686]),
    bnot (bands [bvar 34, bvar 37, bvar 684, bvar 687]),
    bnot (bands [bvar 34, bvar 38, bvar 684, bvar 688]),
    bnot (bands [bvar 35, bvar 36, bvar 685, bvar 686]),
    bnot (bands [bvar 35, bvar 37, bvar 685, bvar 687]),
    bnot (bands [bvar 35, bvar 38, bvar 685, bvar 688]),
    bnot (bands [bvar 536, bvar 539, bvar 172, bvar 175]),
    bnot (bands [bvar 536, bvar 540, bvar 172, bvar 176]),
    bnot (bands [bvar 536, bvar 541, bvar 172, bvar 177]),
    bnot (bands [bvar 536, bvar 542, bvar 172, bvar 178]),
    bnot (bands [bvar 536, bvar 543, bvar 172, bvar 179]),
    bnot (bands [bvar 536, bvar 544, bvar 172, bvar 180]),
    bnot (bands [bvar 536, bvar 545, bvar 172, bvar 181]),
    bnot (bands [bvar 537, bvar 539, bvar 173, bvar 175]),
    bnot (bands [bvar 537, bvar 540, bvar 173, bvar 176]),
    bnot (bands [bvar 537, bvar 541, bvar 173, bvar 177]) ]

def reducedUnionChunk103 : BVLogicalExpr :=
  bands reducedUnionChunk103Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
