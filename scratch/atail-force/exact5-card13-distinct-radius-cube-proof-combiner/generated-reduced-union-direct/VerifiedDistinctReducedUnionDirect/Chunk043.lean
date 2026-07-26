import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk043Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 615, bvar 617, bvar 693, bvar 695]),
    bnot (bands [bvar 616, bvar 617, bvar 694, bvar 695]),
    bnot (bands [bvar 622, bvar 623, bvar 700, bvar 701]),
    bnot (bands [bvar 626, bvar 627, bvar 639, bvar 640]),
    bnot (bands [bvar 626, bvar 630, bvar 639, bvar 643]),
    bnot (bands [bvar 626, bvar 632, bvar 639, bvar 645]),
    bnot (bands [bvar 626, bvar 637, bvar 639, bvar 650]),
    bnot (bands [bvar 627, bvar 630, bvar 640, bvar 643]),
    bnot (bands [bvar 627, bvar 631, bvar 640, bvar 644]),
    bnot (bands [bvar 627, bvar 632, bvar 640, bvar 645]),
    bnot (bands [bvar 627, bvar 636, bvar 640, bvar 649]),
    bnot (bands [bvar 627, bvar 637, bvar 640, bvar 650]),
    bnot (bands [bvar 627, bvar 638, bvar 640, bvar 651]),
    bnot (bands [bvar 630, bvar 636, bvar 643, bvar 649]),
    bnot (bands [bvar 631, bvar 636, bvar 644, bvar 649]),
    bnot (bands [bvar 626, bvar 627, bvar 652, bvar 653]),
    bnot (bands [bvar 626, bvar 631, bvar 652, bvar 657]),
    bnot (bands [bvar 626, bvar 632, bvar 652, bvar 658]),
    bnot (bands [bvar 627, bvar 631, bvar 653, bvar 657]),
    bnot (bands [bvar 627, bvar 632, bvar 653, bvar 658]),
    bnot (bands [bvar 627, bvar 636, bvar 653, bvar 662]),
    bnot (bands [bvar 627, bvar 637, bvar 653, bvar 663]),
    bnot (bands [bvar 631, bvar 636, bvar 657, bvar 662]),
    bnot (bands [bvar 631, bvar 637, bvar 657, bvar 663]),
    bnot (bands [bvar 632, bvar 636, bvar 658, bvar 662]),
    bnot (bands [bvar 632, bvar 637, bvar 658, bvar 663]),
    bnot (bands [bvar 626, bvar 628, bvar 665, bvar 667]),
    bnot (bands [bvar 626, bvar 630, bvar 665, bvar 669]),
    bnot (bands [bvar 626, bvar 637, bvar 665, bvar 676]),
    bnot (bands [bvar 628, bvar 630, bvar 667, bvar 669]),
    bnot (bands [bvar 628, bvar 637, bvar 667, bvar 676]),
    bnot (bands [bvar 629, bvar 630, bvar 668, bvar 669]),
    bnot (bands [bvar 630, bvar 631, bvar 669, bvar 670]),
    bnot (bands [bvar 630, bvar 632, bvar 669, bvar 671]),
    bnot (bands [bvar 630, bvar 637, bvar 669, bvar 676]),
    bnot (bands [bvar 630, bvar 638, bvar 669, bvar 677]),
    bnot (bands [bvar 632, bvar 637, bvar 671, bvar 676]),
    bnot (bands [bvar 634, bvar 635, bvar 673, bvar 674]),
    bnot (bands [bvar 637, bvar 638, bvar 676, bvar 677]),
    bnot (bands [bvar 626, bvar 627, bvar 678, bvar 679]),
    bnot (bands [bvar 626, bvar 632, bvar 678, bvar 684]),
    bnot (bands [bvar 627, bvar 632, bvar 679, bvar 684]),
    bnot (bands [bvar 634, bvar 635, bvar 686, bvar 687]),
    bnot (bands [bvar 634, bvar 636, bvar 686, bvar 688]),
    bnot (bands [bvar 635, bvar 636, bvar 687, bvar 688]),
    bnot (bands [bvar 639, bvar 640, bvar 652, bvar 653]),
    bnot (bands [bvar 639, bvar 643, bvar 652, bvar 656]),
    bnot (bands [bvar 639, bvar 644, bvar 652, bvar 657]),
    bnot (bands [bvar 639, bvar 645, bvar 652, bvar 658]),
    bnot (bands [bvar 639, bvar 646, bvar 652, bvar 659]),
    bnot (bands [bvar 639, bvar 649, bvar 652, bvar 662]),
    bnot (bands [bvar 639, bvar 651, bvar 652, bvar 664]),
    bnot (bands [bvar 640, bvar 642, bvar 653, bvar 655]),
    bnot (bands [bvar 640, bvar 643, bvar 653, bvar 656]),
    bnot (bands [bvar 640, bvar 645, bvar 653, bvar 658]),
    bnot (bands [bvar 640, bvar 646, bvar 653, bvar 659]),
    bnot (bands [bvar 640, bvar 649, bvar 653, bvar 662]),
    bnot (bands [bvar 640, bvar 650, bvar 653, bvar 663]),
    bnot (bands [bvar 640, bvar 651, bvar 653, bvar 664]),
    bnot (bands [bvar 643, bvar 645, bvar 656, bvar 658]),
    bnot (bands [bvar 643, bvar 646, bvar 656, bvar 659]),
    bnot (bands [bvar 643, bvar 649, bvar 656, bvar 662]),
    bnot (bands [bvar 643, bvar 650, bvar 656, bvar 663]),
    bnot (bands [bvar 644, bvar 649, bvar 657, bvar 662]) ]

def reducedUnionChunk043 : BVLogicalExpr :=
  bands reducedUnionChunk043Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
