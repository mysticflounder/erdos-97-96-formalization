import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk121Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 630, bvar 631, bvar 175, bvar 176]),
    bnot (bands [bvar 630, bvar 632, bvar 175, bvar 177]),
    bnot (bands [bvar 630, bvar 638, bvar 175, bvar 183]),
    bnot (bands [bvar 631, bvar 638, bvar 176, bvar 183]),
    bnot (bands [bvar 632, bvar 638, bvar 177, bvar 183]),
    bnot (bands [bvar 634, bvar 635, bvar 179, bvar 180]),
    bnot (bands [bvar 634, bvar 636, bvar 179, bvar 181]),
    bnot (bands [bvar 635, bvar 636, bvar 180, bvar 181]),
    bnot (bands [bvar 128, bvar 129, bvar 700, bvar 701]),
    bnot (bands [bvar 626, bvar 630, bvar 184, bvar 188]),
    bnot (bands [bvar 132, bvar 135, bvar 652, bvar 655]),
    bnot (bands [bvar 132, bvar 136, bvar 652, bvar 656]),
    bnot (bands [bvar 132, bvar 138, bvar 652, bvar 658]),
    bnot (bands [bvar 132, bvar 139, bvar 652, bvar 659]),
    bnot (bands [bvar 132, bvar 142, bvar 652, bvar 662]),
    bnot (bands [bvar 132, bvar 143, bvar 652, bvar 663]),
    bnot (bands [bvar 135, bvar 136, bvar 655, bvar 656]),
    bnot (bands [bvar 135, bvar 138, bvar 655, bvar 658]),
    bnot (bands [bvar 135, bvar 139, bvar 655, bvar 659]),
    bnot (bands [bvar 135, bvar 142, bvar 655, bvar 662]),
    bnot (bands [bvar 135, bvar 143, bvar 655, bvar 663]),
    bnot (bands [bvar 135, bvar 144, bvar 655, bvar 664]),
    bnot (bands [bvar 136, bvar 138, bvar 656, bvar 658]),
    bnot (bands [bvar 136, bvar 139, bvar 656, bvar 659]),
    bnot (bands [bvar 136, bvar 142, bvar 656, bvar 662]),
    bnot (bands [bvar 136, bvar 143, bvar 656, bvar 663]),
    bnot (bands [bvar 136, bvar 144, bvar 656, bvar 664]),
    bnot (bands [bvar 138, bvar 139, bvar 658, bvar 659]),
    bnot (bands [bvar 138, bvar 142, bvar 658, bvar 662]),
    bnot (bands [bvar 138, bvar 143, bvar 658, bvar 663]),
    bnot (bands [bvar 138, bvar 144, bvar 658, bvar 664]),
    bnot (bands [bvar 139, bvar 142, bvar 659, bvar 662]),
    bnot (bands [bvar 139, bvar 143, bvar 659, bvar 663]),
    bnot (bands [bvar 139, bvar 144, bvar 659, bvar 664]),
    bnot (bands [bvar 639, bvar 640, bvar 145, bvar 146]),
    bnot (bands [bvar 639, bvar 643, bvar 145, bvar 149]),
    bnot (bands [bvar 639, bvar 645, bvar 145, bvar 151]),
    bnot (bands [bvar 639, bvar 646, bvar 145, bvar 152]),
    bnot (bands [bvar 640, bvar 643, bvar 146, bvar 149]),
    bnot (bands [bvar 640, bvar 645, bvar 146, bvar 151]),
    bnot (bands [bvar 640, bvar 646, bvar 146, bvar 152]),
    bnot (bands [bvar 640, bvar 649, bvar 146, bvar 155]),
    bnot (bands [bvar 640, bvar 650, bvar 146, bvar 156]),
    bnot (bands [bvar 640, bvar 651, bvar 146, bvar 157]),
    bnot (bands [bvar 641, bvar 643, bvar 147, bvar 149]),
    bnot (bands [bvar 642, bvar 643, bvar 148, bvar 149]),
    bnot (bands [bvar 642, bvar 646, bvar 148, bvar 152]),
    bnot (bands [bvar 643, bvar 645, bvar 149, bvar 151]),
    bnot (bands [bvar 643, bvar 646, bvar 149, bvar 152]),
    bnot (bands [bvar 643, bvar 649, bvar 149, bvar 155]),
    bnot (bands [bvar 643, bvar 651, bvar 149, bvar 157]),
    bnot (bands [bvar 645, bvar 646, bvar 151, bvar 152]),
    bnot (bands [bvar 645, bvar 649, bvar 151, bvar 155]),
    bnot (bands [bvar 645, bvar 651, bvar 151, bvar 157]),
    bnot (bands [bvar 646, bvar 649, bvar 152, bvar 155]),
    bnot (bands [bvar 646, bvar 651, bvar 152, bvar 157]),
    bnot (bands [bvar 132, bvar 134, bvar 665, bvar 667]),
    bnot (bands [bvar 132, bvar 135, bvar 665, bvar 668]),
    bnot (bands [bvar 132, bvar 136, bvar 665, bvar 669]),
    bnot (bands [bvar 132, bvar 137, bvar 665, bvar 670]),
    bnot (bands [bvar 132, bvar 138, bvar 665, bvar 671]),
    bnot (bands [bvar 132, bvar 144, bvar 665, bvar 677]),
    bnot (bands [bvar 133, bvar 143, bvar 666, bvar 676]),
    bnot (bands [bvar 135, bvar 136, bvar 668, bvar 669]) ]

def reducedUnionChunk121 : BVLogicalExpr :=
  bands reducedUnionChunk121Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
