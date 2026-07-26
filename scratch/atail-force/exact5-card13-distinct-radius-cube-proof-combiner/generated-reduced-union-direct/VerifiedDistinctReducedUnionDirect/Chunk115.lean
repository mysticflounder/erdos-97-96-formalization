import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk115Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 639, bvar 645, bvar 145, bvar 151]),
    bnot (bands [bvar 639, bvar 646, bvar 145, bvar 152]),
    bnot (bands [bvar 639, bvar 649, bvar 145, bvar 155]),
    bnot (bands [bvar 639, bvar 650, bvar 145, bvar 156]),
    bnot (bands [bvar 640, bvar 643, bvar 146, bvar 149]),
    bnot (bands [bvar 640, bvar 644, bvar 146, bvar 150]),
    bnot (bands [bvar 640, bvar 645, bvar 146, bvar 151]),
    bnot (bands [bvar 640, bvar 646, bvar 146, bvar 152]),
    bnot (bands [bvar 640, bvar 649, bvar 146, bvar 155]),
    bnot (bands [bvar 640, bvar 650, bvar 146, bvar 156]),
    bnot (bands [bvar 640, bvar 651, bvar 146, bvar 157]),
    bnot (bands [bvar 641, bvar 643, bvar 147, bvar 149]),
    bnot (bands [bvar 641, bvar 649, bvar 147, bvar 155]),
    bnot (bands [bvar 643, bvar 649, bvar 149, bvar 155]),
    bnot (bands [bvar 643, bvar 650, bvar 149, bvar 156]),
    bnot (bands [bvar 643, bvar 651, bvar 149, bvar 157]),
    bnot (bands [bvar 644, bvar 649, bvar 150, bvar 155]),
    bnot (bands [bvar 644, bvar 650, bvar 150, bvar 156]),
    bnot (bands [bvar 644, bvar 651, bvar 150, bvar 157]),
    bnot (bands [bvar 645, bvar 649, bvar 151, bvar 155]),
    bnot (bands [bvar 645, bvar 650, bvar 151, bvar 156]),
    bnot (bands [bvar 645, bvar 651, bvar 151, bvar 157]),
    bnot (bands [bvar 132, bvar 133, bvar 665, bvar 666]),
    bnot (bands [bvar 132, bvar 134, bvar 665, bvar 667]),
    bnot (bands [bvar 132, bvar 135, bvar 665, bvar 668]),
    bnot (bands [bvar 132, bvar 136, bvar 665, bvar 669]),
    bnot (bands [bvar 132, bvar 137, bvar 665, bvar 670]),
    bnot (bands [bvar 132, bvar 138, bvar 665, bvar 671]),
    bnot (bands [bvar 132, bvar 143, bvar 665, bvar 676]),
    bnot (bands [bvar 133, bvar 143, bvar 666, bvar 676]),
    bnot (bands [bvar 135, bvar 136, bvar 668, bvar 669]),
    bnot (bands [bvar 135, bvar 138, bvar 668, bvar 671]),
    bnot (bands [bvar 135, bvar 143, bvar 668, bvar 676]),
    bnot (bands [bvar 135, bvar 144, bvar 668, bvar 677]),
    bnot (bands [bvar 136, bvar 138, bvar 669, bvar 671]),
    bnot (bands [bvar 136, bvar 143, bvar 669, bvar 676]),
    bnot (bands [bvar 136, bvar 144, bvar 669, bvar 677]),
    bnot (bands [bvar 137, bvar 143, bvar 670, bvar 676]),
    bnot (bands [bvar 137, bvar 144, bvar 670, bvar 677]),
    bnot (bands [bvar 138, bvar 143, bvar 671, bvar 676]),
    bnot (bands [bvar 138, bvar 144, bvar 671, bvar 677]),
    bnot (bands [bvar 639, bvar 640, bvar 158, bvar 159]),
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
    bnot (bands [bvar 644, bvar 650, bvar 163, bvar 169]),
    bnot (bands [bvar 644, bvar 651, bvar 163, bvar 170]),
    bnot (bands [bvar 132, bvar 135, bvar 678, bvar 681]),
    bnot (bands [bvar 132, bvar 136, bvar 678, bvar 682]),
    bnot (bands [bvar 132, bvar 137, bvar 678, bvar 683]),
    bnot (bands [bvar 132, bvar 138, bvar 678, bvar 684]),
    bnot (bands [bvar 132, bvar 139, bvar 678, bvar 685]),
    bnot (bands [bvar 132, bvar 144, bvar 678, bvar 690]),
    bnot (bands [bvar 135, bvar 136, bvar 681, bvar 682]),
    bnot (bands [bvar 135, bvar 138, bvar 681, bvar 684]),
    bnot (bands [bvar 135, bvar 139, bvar 681, bvar 685]) ]

def reducedUnionChunk115 : BVLogicalExpr :=
  bands reducedUnionChunk115Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
