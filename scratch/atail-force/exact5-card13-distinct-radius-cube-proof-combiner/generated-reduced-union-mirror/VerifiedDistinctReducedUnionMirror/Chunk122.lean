import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk122Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 135, bvar 137, bvar 668, bvar 670]),
    bnot (bands [bvar 135, bvar 138, bvar 668, bvar 671]),
    bnot (bands [bvar 135, bvar 139, bvar 668, bvar 672]),
    bnot (bands [bvar 135, bvar 143, bvar 668, bvar 676]),
    bnot (bands [bvar 135, bvar 144, bvar 668, bvar 677]),
    bnot (bands [bvar 136, bvar 138, bvar 669, bvar 671]),
    bnot (bands [bvar 136, bvar 143, bvar 669, bvar 676]),
    bnot (bands [bvar 136, bvar 144, bvar 669, bvar 677]),
    bnot (bands [bvar 137, bvar 143, bvar 670, bvar 676]),
    bnot (bands [bvar 137, bvar 144, bvar 670, bvar 677]),
    bnot (bands [bvar 138, bvar 144, bvar 671, bvar 677]),
    bnot (bands [bvar 639, bvar 640, bvar 158, bvar 159]),
    bnot (bands [bvar 639, bvar 642, bvar 158, bvar 161]),
    bnot (bands [bvar 639, bvar 643, bvar 158, bvar 162]),
    bnot (bands [bvar 639, bvar 644, bvar 158, bvar 163]),
    bnot (bands [bvar 639, bvar 645, bvar 158, bvar 164]),
    bnot (bands [bvar 639, bvar 646, bvar 158, bvar 165]),
    bnot (bands [bvar 639, bvar 650, bvar 158, bvar 169]),
    bnot (bands [bvar 640, bvar 643, bvar 159, bvar 162]),
    bnot (bands [bvar 640, bvar 644, bvar 159, bvar 163]),
    bnot (bands [bvar 640, bvar 645, bvar 159, bvar 164]),
    bnot (bands [bvar 640, bvar 646, bvar 159, bvar 165]),
    bnot (bands [bvar 640, bvar 650, bvar 159, bvar 169]),
    bnot (bands [bvar 640, bvar 651, bvar 159, bvar 170]),
    bnot (bands [bvar 641, bvar 643, bvar 160, bvar 162]),
    bnot (bands [bvar 641, bvar 645, bvar 160, bvar 164]),
    bnot (bands [bvar 641, bvar 646, bvar 160, bvar 165]),
    bnot (bands [bvar 642, bvar 650, bvar 161, bvar 169]),
    bnot (bands [bvar 643, bvar 645, bvar 162, bvar 164]),
    bnot (bands [bvar 643, bvar 646, bvar 162, bvar 165]),
    bnot (bands [bvar 643, bvar 650, bvar 162, bvar 169]),
    bnot (bands [bvar 643, bvar 651, bvar 162, bvar 170]),
    bnot (bands [bvar 644, bvar 650, bvar 163, bvar 169]),
    bnot (bands [bvar 644, bvar 651, bvar 163, bvar 170]),
    bnot (bands [bvar 645, bvar 646, bvar 164, bvar 165]),
    bnot (bands [bvar 645, bvar 650, bvar 164, bvar 169]),
    bnot (bands [bvar 645, bvar 651, bvar 164, bvar 170]),
    bnot (bands [bvar 646, bvar 651, bvar 165, bvar 170]),
    bnot (bands [bvar 650, bvar 651, bvar 169, bvar 170]),
    bnot (bands [bvar 132, bvar 135, bvar 678, bvar 681]),
    bnot (bands [bvar 132, bvar 136, bvar 678, bvar 682]),
    bnot (bands [bvar 132, bvar 137, bvar 678, bvar 683]),
    bnot (bands [bvar 132, bvar 138, bvar 678, bvar 684]),
    bnot (bands [bvar 132, bvar 139, bvar 678, bvar 685]),
    bnot (bands [bvar 135, bvar 136, bvar 681, bvar 682]),
    bnot (bands [bvar 135, bvar 138, bvar 681, bvar 684]),
    bnot (bands [bvar 135, bvar 139, bvar 681, bvar 685]),
    bnot (bands [bvar 135, bvar 144, bvar 681, bvar 690]),
    bnot (bands [bvar 136, bvar 144, bvar 682, bvar 690]),
    bnot (bands [bvar 137, bvar 144, bvar 683, bvar 690]),
    bnot (bands [bvar 138, bvar 144, bvar 684, bvar 690]),
    bnot (bands [bvar 139, bvar 144, bvar 685, bvar 690]),
    bnot (bands [bvar 639, bvar 640, bvar 171, bvar 172]),
    bnot (bands [bvar 639, bvar 641, bvar 171, bvar 173]),
    bnot (bands [bvar 639, bvar 642, bvar 171, bvar 174]),
    bnot (bands [bvar 639, bvar 643, bvar 171, bvar 175]),
    bnot (bands [bvar 639, bvar 644, bvar 171, bvar 176]),
    bnot (bands [bvar 639, bvar 645, bvar 171, bvar 177]),
    bnot (bands [bvar 639, bvar 646, bvar 171, bvar 178]),
    bnot (bands [bvar 639, bvar 651, bvar 171, bvar 183]),
    bnot (bands [bvar 640, bvar 643, bvar 172, bvar 175]),
    bnot (bands [bvar 640, bvar 644, bvar 172, bvar 176]),
    bnot (bands [bvar 640, bvar 645, bvar 172, bvar 177]),
    bnot (bands [bvar 640, bvar 646, bvar 172, bvar 178]) ]

def reducedUnionChunk122 : BVLogicalExpr :=
  bands reducedUnionChunk122Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
