import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk120Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 654, bvar 656, bvar 186, bvar 188]),
    bnot (bands [bvar 654, bvar 658, bvar 186, bvar 190]),
    bnot (bands [bvar 654, bvar 659, bvar 186, bvar 191]),
    bnot (bands [bvar 654, bvar 660, bvar 186, bvar 192]),
    bnot (bands [bvar 655, bvar 656, bvar 187, bvar 188]),
    bnot (bands [bvar 655, bvar 658, bvar 187, bvar 190]),
    bnot (bands [bvar 656, bvar 657, bvar 188, bvar 189]),
    bnot (bands [bvar 656, bvar 658, bvar 188, bvar 190]),
    bnot (bands [bvar 656, bvar 659, bvar 188, bvar 191]),
    bnot (bands [bvar 656, bvar 660, bvar 188, bvar 192]),
    bnot (bands [bvar 657, bvar 660, bvar 189, bvar 192]),
    bnot (bands [bvar 658, bvar 659, bvar 190, bvar 191]),
    bnot (bands [bvar 658, bvar 660, bvar 190, bvar 192]),
    bnot (bands [bvar 659, bvar 660, bvar 191, bvar 192]),
    bnot (bands [bvar 662, bvar 663, bvar 194, bvar 195]),
    bnot (bands [bvar 158, bvar 159, bvar 678, bvar 679]),
    bnot (bands [bvar 158, bvar 166, bvar 678, bvar 686]),
    bnot (bands [bvar 159, bvar 163, bvar 679, bvar 683]),
    bnot (bands [bvar 159, bvar 164, bvar 679, bvar 684]),
    bnot (bands [bvar 159, bvar 165, bvar 679, bvar 685]),
    bnot (bands [bvar 159, bvar 166, bvar 679, bvar 686]),
    bnot (bands [bvar 159, bvar 167, bvar 679, bvar 687]),
    bnot (bands [bvar 160, bvar 163, bvar 680, bvar 683]),
    bnot (bands [bvar 160, bvar 164, bvar 680, bvar 684]),
    bnot (bands [bvar 160, bvar 165, bvar 680, bvar 685]),
    bnot (bands [bvar 160, bvar 166, bvar 680, bvar 686]),
    bnot (bands [bvar 160, bvar 167, bvar 680, bvar 687]),
    bnot (bands [bvar 161, bvar 165, bvar 681, bvar 685]),
    bnot (bands [bvar 162, bvar 163, bvar 682, bvar 683]),
    bnot (bands [bvar 162, bvar 165, bvar 682, bvar 685]),
    bnot (bands [bvar 162, bvar 166, bvar 682, bvar 686]),
    bnot (bands [bvar 162, bvar 170, bvar 682, bvar 690]),
    bnot (bands [bvar 163, bvar 164, bvar 683, bvar 684]),
    bnot (bands [bvar 163, bvar 165, bvar 683, bvar 685]),
    bnot (bands [bvar 163, bvar 166, bvar 683, bvar 686]),
    bnot (bands [bvar 163, bvar 167, bvar 683, bvar 687]),
    bnot (bands [bvar 164, bvar 165, bvar 684, bvar 685]),
    bnot (bands [bvar 164, bvar 166, bvar 684, bvar 686]),
    bnot (bands [bvar 164, bvar 167, bvar 684, bvar 687]),
    bnot (bands [bvar 165, bvar 166, bvar 685, bvar 686]),
    bnot (bands [bvar 165, bvar 167, bvar 685, bvar 687]),
    bnot (bands [bvar 166, bvar 167, bvar 686, bvar 687]),
    bnot (bands [bvar 665, bvar 666, bvar 171, bvar 172]),
    bnot (bands [bvar 665, bvar 667, bvar 171, bvar 173]),
    bnot (bands [bvar 665, bvar 669, bvar 171, bvar 175]),
    bnot (bands [bvar 665, bvar 670, bvar 171, bvar 176]),
    bnot (bands [bvar 665, bvar 671, bvar 171, bvar 177]),
    bnot (bands [bvar 665, bvar 672, bvar 171, bvar 178]),
    bnot (bands [bvar 665, bvar 673, bvar 171, bvar 179]),
    bnot (bands [bvar 665, bvar 674, bvar 171, bvar 180]),
    bnot (bands [bvar 665, bvar 677, bvar 171, bvar 183]),
    bnot (bands [bvar 666, bvar 669, bvar 172, bvar 175]),
    bnot (bands [bvar 666, bvar 670, bvar 172, bvar 176]),
    bnot (bands [bvar 666, bvar 671, bvar 172, bvar 177]),
    bnot (bands [bvar 666, bvar 672, bvar 172, bvar 178]),
    bnot (bands [bvar 666, bvar 673, bvar 172, bvar 179]),
    bnot (bands [bvar 666, bvar 674, bvar 172, bvar 180]),
    bnot (bands [bvar 666, bvar 677, bvar 172, bvar 183]),
    bnot (bands [bvar 667, bvar 669, bvar 173, bvar 175]),
    bnot (bands [bvar 667, bvar 670, bvar 173, bvar 176]),
    bnot (bands [bvar 667, bvar 671, bvar 173, bvar 177]),
    bnot (bands [bvar 667, bvar 672, bvar 173, bvar 178]),
    bnot (bands [bvar 667, bvar 673, bvar 173, bvar 179]),
    bnot (bands [bvar 667, bvar 674, bvar 173, bvar 180]) ]

def reducedUnionChunk120 : BVLogicalExpr :=
  bands reducedUnionChunk120Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
