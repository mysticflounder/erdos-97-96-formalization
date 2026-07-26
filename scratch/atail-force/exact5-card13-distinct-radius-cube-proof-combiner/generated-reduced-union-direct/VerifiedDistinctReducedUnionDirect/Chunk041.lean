import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk041Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 604, bvar 609, bvar 643, bvar 648]),
    bnot (bands [bvar 604, bvar 610, bvar 643, bvar 649]),
    bnot (bands [bvar 604, bvar 611, bvar 643, bvar 650]),
    bnot (bands [bvar 604, bvar 612, bvar 643, bvar 651]),
    bnot (bands [bvar 602, bvar 604, bvar 654, bvar 656]),
    bnot (bands [bvar 604, bvar 610, bvar 656, bvar 662]),
    bnot (bands [bvar 604, bvar 612, bvar 656, bvar 664]),
    bnot (bands [bvar 610, bvar 611, bvar 662, bvar 663]),
    bnot (bands [bvar 603, bvar 604, bvar 668, bvar 669]),
    bnot (bands [bvar 603, bvar 611, bvar 668, bvar 676]),
    bnot (bands [bvar 604, bvar 611, bvar 669, bvar 676]),
    bnot (bands [bvar 604, bvar 612, bvar 669, bvar 677]),
    bnot (bands [bvar 606, bvar 607, bvar 671, bvar 672]),
    bnot (bands [bvar 606, bvar 608, bvar 671, bvar 673]),
    bnot (bands [bvar 607, bvar 608, bvar 672, bvar 673]),
    bnot (bands [bvar 600, bvar 612, bvar 678, bvar 690]),
    bnot (bands [bvar 602, bvar 604, bvar 680, bvar 682]),
    bnot (bands [bvar 603, bvar 604, bvar 681, bvar 682]),
    bnot (bands [bvar 604, bvar 612, bvar 682, bvar 690]),
    bnot (bands [bvar 606, bvar 608, bvar 684, bvar 686]),
    bnot (bands [bvar 606, bvar 609, bvar 684, bvar 687]),
    bnot (bands [bvar 606, bvar 610, bvar 684, bvar 688]),
    bnot (bands [bvar 607, bvar 609, bvar 685, bvar 687]),
    bnot (bands [bvar 607, bvar 610, bvar 685, bvar 688]),
    bnot (bands [bvar 608, bvar 609, bvar 686, bvar 687]),
    bnot (bands [bvar 608, bvar 610, bvar 686, bvar 688]),
    bnot (bands [bvar 609, bvar 610, bvar 687, bvar 688]),
    bnot (bands [bvar 601, bvar 604, bvar 692, bvar 695]),
    bnot (bands [bvar 602, bvar 604, bvar 693, bvar 695]),
    bnot (bands [bvar 606, bvar 608, bvar 697, bvar 699]),
    bnot (bands [bvar 606, bvar 611, bvar 697, bvar 702]),
    bnot (bands [bvar 607, bvar 608, bvar 698, bvar 699]),
    bnot (bands [bvar 607, bvar 609, bvar 698, bvar 700]),
    bnot (bands [bvar 607, bvar 610, bvar 698, bvar 701]),
    bnot (bands [bvar 607, bvar 611, bvar 698, bvar 702]),
    bnot (bands [bvar 608, bvar 609, bvar 699, bvar 700]),
    bnot (bands [bvar 608, bvar 610, bvar 699, bvar 701]),
    bnot (bands [bvar 608, bvar 611, bvar 699, bvar 702]),
    bnot (bands [bvar 609, bvar 611, bvar 700, bvar 702]),
    bnot (bands [bvar 613, bvar 614, bvar 639, bvar 640]),
    bnot (bands [bvar 613, bvar 616, bvar 639, bvar 642]),
    bnot (bands [bvar 613, bvar 617, bvar 639, bvar 643]),
    bnot (bands [bvar 613, bvar 618, bvar 639, bvar 644]),
    bnot (bands [bvar 613, bvar 622, bvar 639, bvar 648]),
    bnot (bands [bvar 613, bvar 623, bvar 639, bvar 649]),
    bnot (bands [bvar 613, bvar 624, bvar 639, bvar 650]),
    bnot (bands [bvar 613, bvar 625, bvar 639, bvar 651]),
    bnot (bands [bvar 614, bvar 617, bvar 640, bvar 643]),
    bnot (bands [bvar 614, bvar 618, bvar 640, bvar 644]),
    bnot (bands [bvar 614, bvar 622, bvar 640, bvar 648]),
    bnot (bands [bvar 614, bvar 623, bvar 640, bvar 649]),
    bnot (bands [bvar 614, bvar 624, bvar 640, bvar 650]),
    bnot (bands [bvar 614, bvar 625, bvar 640, bvar 651]),
    bnot (bands [bvar 616, bvar 623, bvar 642, bvar 649]),
    bnot (bands [bvar 616, bvar 625, bvar 642, bvar 651]),
    bnot (bands [bvar 617, bvar 622, bvar 643, bvar 648]),
    bnot (bands [bvar 617, bvar 623, bvar 643, bvar 649]),
    bnot (bands [bvar 617, bvar 624, bvar 643, bvar 650]),
    bnot (bands [bvar 617, bvar 625, bvar 643, bvar 651]),
    bnot (bands [bvar 618, bvar 622, bvar 644, bvar 648]),
    bnot (bands [bvar 618, bvar 623, bvar 644, bvar 649]),
    bnot (bands [bvar 618, bvar 624, bvar 644, bvar 650]),
    bnot (bands [bvar 618, bvar 625, bvar 644, bvar 651]),
    bnot (bands [bvar 622, bvar 623, bvar 648, bvar 649]) ]

def reducedUnionChunk041 : BVLogicalExpr :=
  bands reducedUnionChunk041Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
