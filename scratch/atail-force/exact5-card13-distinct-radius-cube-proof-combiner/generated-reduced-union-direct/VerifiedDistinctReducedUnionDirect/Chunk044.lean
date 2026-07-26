import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk044Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 644, bvar 650, bvar 657, bvar 663]),
    bnot (bands [bvar 644, bvar 651, bvar 657, bvar 664]),
    bnot (bands [bvar 645, bvar 646, bvar 658, bvar 659]),
    bnot (bands [bvar 645, bvar 649, bvar 658, bvar 662]),
    bnot (bands [bvar 645, bvar 650, bvar 658, bvar 663]),
    bnot (bands [bvar 645, bvar 651, bvar 658, bvar 664]),
    bnot (bands [bvar 646, bvar 649, bvar 659, bvar 662]),
    bnot (bands [bvar 646, bvar 650, bvar 659, bvar 663]),
    bnot (bands [bvar 649, bvar 651, bvar 662, bvar 664]),
    bnot (bands [bvar 639, bvar 640, bvar 665, bvar 666]),
    bnot (bands [bvar 639, bvar 641, bvar 665, bvar 667]),
    bnot (bands [bvar 639, bvar 642, bvar 665, bvar 668]),
    bnot (bands [bvar 639, bvar 643, bvar 665, bvar 669]),
    bnot (bands [bvar 639, bvar 644, bvar 665, bvar 670]),
    bnot (bands [bvar 639, bvar 645, bvar 665, bvar 671]),
    bnot (bands [bvar 639, bvar 646, bvar 665, bvar 672]),
    bnot (bands [bvar 639, bvar 650, bvar 665, bvar 676]),
    bnot (bands [bvar 639, bvar 651, bvar 665, bvar 677]),
    bnot (bands [bvar 640, bvar 642, bvar 666, bvar 668]),
    bnot (bands [bvar 640, bvar 643, bvar 666, bvar 669]),
    bnot (bands [bvar 640, bvar 644, bvar 666, bvar 670]),
    bnot (bands [bvar 640, bvar 645, bvar 666, bvar 671]),
    bnot (bands [bvar 640, bvar 646, bvar 666, bvar 672]),
    bnot (bands [bvar 640, bvar 650, bvar 666, bvar 676]),
    bnot (bands [bvar 640, bvar 651, bvar 666, bvar 677]),
    bnot (bands [bvar 641, bvar 643, bvar 667, bvar 669]),
    bnot (bands [bvar 641, bvar 645, bvar 667, bvar 671]),
    bnot (bands [bvar 641, bvar 646, bvar 667, bvar 672]),
    bnot (bands [bvar 642, bvar 645, bvar 668, bvar 671]),
    bnot (bands [bvar 643, bvar 645, bvar 669, bvar 671]),
    bnot (bands [bvar 643, bvar 646, bvar 669, bvar 672]),
    bnot (bands [bvar 643, bvar 650, bvar 669, bvar 676]),
    bnot (bands [bvar 643, bvar 651, bvar 669, bvar 677]),
    bnot (bands [bvar 644, bvar 650, bvar 670, bvar 676]),
    bnot (bands [bvar 644, bvar 651, bvar 670, bvar 677]),
    bnot (bands [bvar 645, bvar 646, bvar 671, bvar 672]),
    bnot (bands [bvar 645, bvar 650, bvar 671, bvar 676]),
    bnot (bands [bvar 645, bvar 651, bvar 671, bvar 677]),
    bnot (bands [bvar 646, bvar 650, bvar 672, bvar 676]),
    bnot (bands [bvar 646, bvar 651, bvar 672, bvar 677]),
    bnot (bands [bvar 650, bvar 651, bvar 676, bvar 677]),
    bnot (bands [bvar 639, bvar 640, bvar 678, bvar 679]),
    bnot (bands [bvar 639, bvar 642, bvar 678, bvar 681]),
    bnot (bands [bvar 639, bvar 643, bvar 678, bvar 682]),
    bnot (bands [bvar 639, bvar 645, bvar 678, bvar 684]),
    bnot (bands [bvar 639, bvar 646, bvar 678, bvar 685]),
    bnot (bands [bvar 640, bvar 643, bvar 679, bvar 682]),
    bnot (bands [bvar 640, bvar 645, bvar 679, bvar 684]),
    bnot (bands [bvar 640, bvar 646, bvar 679, bvar 685]),
    bnot (bands [bvar 640, bvar 651, bvar 679, bvar 690]),
    bnot (bands [bvar 641, bvar 643, bvar 680, bvar 682]),
    bnot (bands [bvar 641, bvar 645, bvar 680, bvar 684]),
    bnot (bands [bvar 643, bvar 645, bvar 682, bvar 684]),
    bnot (bands [bvar 643, bvar 646, bvar 682, bvar 685]),
    bnot (bands [bvar 645, bvar 651, bvar 684, bvar 690]),
    bnot (bands [bvar 639, bvar 640, bvar 691, bvar 692]),
    bnot (bands [bvar 639, bvar 643, bvar 691, bvar 695]),
    bnot (bands [bvar 639, bvar 644, bvar 691, bvar 696]),
    bnot (bands [bvar 639, bvar 645, bvar 691, bvar 697]),
    bnot (bands [bvar 639, bvar 646, bvar 691, bvar 698]),
    bnot (bands [bvar 640, bvar 643, bvar 692, bvar 695]),
    bnot (bands [bvar 640, bvar 644, bvar 692, bvar 696]),
    bnot (bands [bvar 640, bvar 645, bvar 692, bvar 697]),
    bnot (bands [bvar 640, bvar 646, bvar 692, bvar 698]) ]

def reducedUnionChunk044 : BVLogicalExpr :=
  bands reducedUnionChunk044Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
