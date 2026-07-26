import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk043Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 630, bvar 631, bvar 682, bvar 683]),
    bnot (bands [bvar 630, bvar 632, bvar 682, bvar 684]),
    bnot (bands [bvar 631, bvar 632, bvar 683, bvar 684]),
    bnot (bands [bvar 631, bvar 638, bvar 683, bvar 690]),
    bnot (bands [bvar 632, bvar 638, bvar 684, bvar 690]),
    bnot (bands [bvar 635, bvar 636, bvar 687, bvar 688]),
    bnot (bands [bvar 626, bvar 628, bvar 691, bvar 693]),
    bnot (bands [bvar 626, bvar 631, bvar 691, bvar 696]),
    bnot (bands [bvar 639, bvar 640, bvar 652, bvar 653]),
    bnot (bands [bvar 639, bvar 641, bvar 652, bvar 654]),
    bnot (bands [bvar 639, bvar 642, bvar 652, bvar 655]),
    bnot (bands [bvar 639, bvar 643, bvar 652, bvar 656]),
    bnot (bands [bvar 639, bvar 644, bvar 652, bvar 657]),
    bnot (bands [bvar 639, bvar 645, bvar 652, bvar 658]),
    bnot (bands [bvar 639, bvar 646, bvar 652, bvar 659]),
    bnot (bands [bvar 639, bvar 649, bvar 652, bvar 662]),
    bnot (bands [bvar 639, bvar 650, bvar 652, bvar 663]),
    bnot (bands [bvar 639, bvar 651, bvar 652, bvar 664]),
    bnot (bands [bvar 640, bvar 643, bvar 653, bvar 656]),
    bnot (bands [bvar 640, bvar 644, bvar 653, bvar 657]),
    bnot (bands [bvar 640, bvar 645, bvar 653, bvar 658]),
    bnot (bands [bvar 640, bvar 646, bvar 653, bvar 659]),
    bnot (bands [bvar 640, bvar 649, bvar 653, bvar 662]),
    bnot (bands [bvar 640, bvar 650, bvar 653, bvar 663]),
    bnot (bands [bvar 640, bvar 651, bvar 653, bvar 664]),
    bnot (bands [bvar 641, bvar 646, bvar 654, bvar 659]),
    bnot (bands [bvar 641, bvar 650, bvar 654, bvar 663]),
    bnot (bands [bvar 642, bvar 645, bvar 655, bvar 658]),
    bnot (bands [bvar 643, bvar 645, bvar 656, bvar 658]),
    bnot (bands [bvar 643, bvar 646, bvar 656, bvar 659]),
    bnot (bands [bvar 643, bvar 650, bvar 656, bvar 663]),
    bnot (bands [bvar 643, bvar 651, bvar 656, bvar 664]),
    bnot (bands [bvar 644, bvar 649, bvar 657, bvar 662]),
    bnot (bands [bvar 644, bvar 650, bvar 657, bvar 663]),
    bnot (bands [bvar 645, bvar 646, bvar 658, bvar 659]),
    bnot (bands [bvar 645, bvar 650, bvar 658, bvar 663]),
    bnot (bands [bvar 645, bvar 651, bvar 658, bvar 664]),
    bnot (bands [bvar 649, bvar 650, bvar 662, bvar 663]),
    bnot (bands [bvar 639, bvar 640, bvar 665, bvar 666]),
    bnot (bands [bvar 639, bvar 643, bvar 665, bvar 669]),
    bnot (bands [bvar 639, bvar 644, bvar 665, bvar 670]),
    bnot (bands [bvar 639, bvar 645, bvar 665, bvar 671]),
    bnot (bands [bvar 640, bvar 643, bvar 666, bvar 669]),
    bnot (bands [bvar 640, bvar 645, bvar 666, bvar 671]),
    bnot (bands [bvar 640, bvar 646, bvar 666, bvar 672]),
    bnot (bands [bvar 640, bvar 650, bvar 666, bvar 676]),
    bnot (bands [bvar 640, bvar 651, bvar 666, bvar 677]),
    bnot (bands [bvar 643, bvar 645, bvar 669, bvar 671]),
    bnot (bands [bvar 643, bvar 650, bvar 669, bvar 676]),
    bnot (bands [bvar 643, bvar 651, bvar 669, bvar 677]),
    bnot (bands [bvar 645, bvar 650, bvar 671, bvar 676]),
    bnot (bands [bvar 645, bvar 651, bvar 671, bvar 677]),
    bnot (bands [bvar 639, bvar 640, bvar 678, bvar 679]),
    bnot (bands [bvar 639, bvar 643, bvar 678, bvar 682]),
    bnot (bands [bvar 639, bvar 645, bvar 678, bvar 684]),
    bnot (bands [bvar 639, bvar 646, bvar 678, bvar 685]),
    bnot (bands [bvar 640, bvar 643, bvar 679, bvar 682]),
    bnot (bands [bvar 640, bvar 645, bvar 679, bvar 684]),
    bnot (bands [bvar 640, bvar 646, bvar 679, bvar 685]),
    bnot (bands [bvar 640, bvar 651, bvar 679, bvar 690]),
    bnot (bands [bvar 643, bvar 645, bvar 682, bvar 684]),
    bnot (bands [bvar 643, bvar 646, bvar 682, bvar 685]),
    bnot (bands [bvar 643, bvar 651, bvar 682, bvar 690]),
    bnot (bands [bvar 645, bvar 646, bvar 684, bvar 685]) ]

def reducedUnionChunk043 : BVLogicalExpr :=
  bands reducedUnionChunk043Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
