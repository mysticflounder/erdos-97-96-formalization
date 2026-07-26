import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk133Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 0, bvar 9, bvar 626, bvar 635]),
    bnot (bands [bvar 0, bvar 10, bvar 626, bvar 636]),
    bnot (bands [bvar 0, bvar 12, bvar 626, bvar 638]),
    bnot (bands [bvar 8, bvar 10, bvar 634, bvar 636]),
    bnot (bands [bvar 8, bvar 11, bvar 634, bvar 637]),
    bnot (bands [bvar 9, bvar 12, bvar 635, bvar 638]),
    bnot (bands [bvar 10, bvar 12, bvar 636, bvar 638]),
    bnot (bands [bvar 11, bvar 12, bvar 637, bvar 638]),
    bnot (bands [bvar 0, bvar 1, bvar 639, bvar 640]),
    bnot (bands [bvar 1, bvar 9, bvar 640, bvar 648]),
    bnot (bands [bvar 1, bvar 10, bvar 640, bvar 649]),
    bnot (bands [bvar 1, bvar 11, bvar 640, bvar 650]),
    bnot (bands [bvar 1, bvar 12, bvar 640, bvar 651]),
    bnot (bands [bvar 3, bvar 10, bvar 642, bvar 649]),
    bnot (bands [bvar 3, bvar 12, bvar 642, bvar 651]),
    bnot (bands [bvar 9, bvar 11, bvar 648, bvar 650]),
    bnot (bands [bvar 9, bvar 12, bvar 648, bvar 651]),
    bnot (bands [bvar 10, bvar 11, bvar 649, bvar 650]),
    bnot (bands [bvar 10, bvar 12, bvar 649, bvar 651]),
    bnot (bands [bvar 0, bvar 1, bvar 652, bvar 653]),
    bnot (bands [bvar 0, bvar 2, bvar 652, bvar 654]),
    bnot (bands [bvar 0, bvar 10, bvar 652, bvar 662]),
    bnot (bands [bvar 0, bvar 12, bvar 652, bvar 664]),
    bnot (bands [bvar 1, bvar 10, bvar 653, bvar 662]),
    bnot (bands [bvar 1, bvar 12, bvar 653, bvar 664]),
    bnot (bands [bvar 2, bvar 10, bvar 654, bvar 662]),
    bnot (bands [bvar 2, bvar 11, bvar 654, bvar 663]),
    bnot (bands [bvar 2, bvar 12, bvar 654, bvar 664]),
    bnot (bands [bvar 5, bvar 8, bvar 657, bvar 660]),
    bnot (bands [bvar 6, bvar 8, bvar 658, bvar 660]),
    bnot (bands [bvar 10, bvar 12, bvar 662, bvar 664]),
    bnot (bands [bvar 0, bvar 11, bvar 665, bvar 676]),
    bnot (bands [bvar 0, bvar 12, bvar 665, bvar 677]),
    bnot (bands [bvar 1, bvar 11, bvar 666, bvar 676]),
    bnot (bands [bvar 1, bvar 12, bvar 666, bvar 677]),
    bnot (bands [bvar 2, bvar 11, bvar 667, bvar 676]),
    bnot (bands [bvar 2, bvar 12, bvar 667, bvar 677]),
    bnot (bands [bvar 3, bvar 11, bvar 668, bvar 676]),
    bnot (bands [bvar 3, bvar 12, bvar 668, bvar 677]),
    bnot (bands [bvar 5, bvar 7, bvar 670, bvar 672]),
    bnot (bands [bvar 5, bvar 8, bvar 670, bvar 673]),
    bnot (bands [bvar 5, bvar 9, bvar 670, bvar 674]),
    bnot (bands [bvar 6, bvar 8, bvar 671, bvar 673]),
    bnot (bands [bvar 6, bvar 9, bvar 671, bvar 674]),
    bnot (bands [bvar 7, bvar 8, bvar 672, bvar 673]),
    bnot (bands [bvar 7, bvar 9, bvar 672, bvar 674]),
    bnot (bands [bvar 8, bvar 9, bvar 673, bvar 674]),
    bnot (bands [bvar 11, bvar 12, bvar 676, bvar 677]),
    bnot (bands [bvar 3, bvar 12, bvar 681, bvar 690]),
    bnot (bands [bvar 5, bvar 9, bvar 683, bvar 687]),
    bnot (bands [bvar 6, bvar 10, bvar 684, bvar 688]),
    bnot (bands [bvar 7, bvar 9, bvar 685, bvar 687]),
    bnot (bands [bvar 7, bvar 10, bvar 685, bvar 688]),
    bnot (bands [bvar 8, bvar 9, bvar 686, bvar 687]),
    bnot (bands [bvar 8, bvar 10, bvar 686, bvar 688]),
    bnot (bands [bvar 9, bvar 10, bvar 687, bvar 688]),
    bnot (bands [bvar 5, bvar 7, bvar 696, bvar 698]),
    bnot (bands [bvar 5, bvar 9, bvar 696, bvar 700]),
    bnot (bands [bvar 5, bvar 10, bvar 696, bvar 701]),
    bnot (bands [bvar 5, bvar 11, bvar 696, bvar 702]),
    bnot (bands [bvar 6, bvar 9, bvar 697, bvar 700]),
    bnot (bands [bvar 6, bvar 11, bvar 697, bvar 702]),
    bnot (bands [bvar 7, bvar 8, bvar 698, bvar 699]),
    bnot (bands [bvar 7, bvar 9, bvar 698, bvar 700]) ]

def reducedUnionChunk133 : BVLogicalExpr :=
  bands reducedUnionChunk133Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
