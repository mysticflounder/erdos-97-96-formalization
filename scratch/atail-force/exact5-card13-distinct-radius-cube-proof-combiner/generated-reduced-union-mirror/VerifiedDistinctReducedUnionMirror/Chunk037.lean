import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk037Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 568, bvar 571, bvar 620, bvar 623]),
    bnot (bands [bvar 568, bvar 572, bvar 620, bvar 624]),
    bnot (bands [bvar 568, bvar 573, bvar 620, bvar 625]),
    bnot (bands [bvar 569, bvar 570, bvar 621, bvar 622]),
    bnot (bands [bvar 570, bvar 573, bvar 622, bvar 625]),
    bnot (bands [bvar 562, bvar 569, bvar 627, bvar 634]),
    bnot (bands [bvar 562, bvar 570, bvar 627, bvar 635]),
    bnot (bands [bvar 562, bvar 572, bvar 627, bvar 637]),
    bnot (bands [bvar 562, bvar 573, bvar 627, bvar 638]),
    bnot (bands [bvar 564, bvar 567, bvar 629, bvar 632]),
    bnot (bands [bvar 569, bvar 570, bvar 634, bvar 635]),
    bnot (bands [bvar 569, bvar 572, bvar 634, bvar 637]),
    bnot (bands [bvar 569, bvar 573, bvar 634, bvar 638]),
    bnot (bands [bvar 570, bvar 572, bvar 635, bvar 637]),
    bnot (bands [bvar 562, bvar 570, bvar 640, bvar 648]),
    bnot (bands [bvar 562, bvar 571, bvar 640, bvar 649]),
    bnot (bands [bvar 564, bvar 568, bvar 642, bvar 646]),
    bnot (bands [bvar 562, bvar 571, bvar 653, bvar 662]),
    bnot (bands [bvar 562, bvar 572, bvar 653, bvar 663]),
    bnot (bands [bvar 562, bvar 573, bvar 653, bvar 664]),
    bnot (bands [bvar 564, bvar 566, bvar 655, bvar 657]),
    bnot (bands [bvar 564, bvar 567, bvar 655, bvar 658]),
    bnot (bands [bvar 564, bvar 568, bvar 655, bvar 659]),
    bnot (bands [bvar 564, bvar 569, bvar 655, bvar 660]),
    bnot (bands [bvar 566, bvar 569, bvar 657, bvar 660]),
    bnot (bands [bvar 568, bvar 569, bvar 659, bvar 660]),
    bnot (bands [bvar 571, bvar 572, bvar 662, bvar 663]),
    bnot (bands [bvar 571, bvar 573, bvar 662, bvar 664]),
    bnot (bands [bvar 572, bvar 573, bvar 663, bvar 664]),
    bnot (bands [bvar 562, bvar 572, bvar 666, bvar 676]),
    bnot (bands [bvar 562, bvar 573, bvar 666, bvar 677]),
    bnot (bands [bvar 564, bvar 567, bvar 668, bvar 671]),
    bnot (bands [bvar 564, bvar 568, bvar 668, bvar 672]),
    bnot (bands [bvar 564, bvar 569, bvar 668, bvar 673]),
    bnot (bands [bvar 564, bvar 570, bvar 668, bvar 674]),
    bnot (bands [bvar 568, bvar 570, bvar 672, bvar 674]),
    bnot (bands [bvar 569, bvar 570, bvar 673, bvar 674]),
    bnot (bands [bvar 564, bvar 566, bvar 681, bvar 683]),
    bnot (bands [bvar 564, bvar 567, bvar 681, bvar 684]),
    bnot (bands [bvar 564, bvar 568, bvar 681, bvar 685]),
    bnot (bands [bvar 564, bvar 569, bvar 681, bvar 686]),
    bnot (bands [bvar 564, bvar 570, bvar 681, bvar 687]),
    bnot (bands [bvar 564, bvar 571, bvar 681, bvar 688]),
    bnot (bands [bvar 566, bvar 567, bvar 683, bvar 684]),
    bnot (bands [bvar 566, bvar 569, bvar 683, bvar 686]),
    bnot (bands [bvar 567, bvar 570, bvar 684, bvar 687]),
    bnot (bands [bvar 568, bvar 570, bvar 685, bvar 687]),
    bnot (bands [bvar 569, bvar 570, bvar 686, bvar 687]),
    bnot (bands [bvar 569, bvar 571, bvar 686, bvar 688]),
    bnot (bands [bvar 564, bvar 567, bvar 694, bvar 697]),
    bnot (bands [bvar 564, bvar 568, bvar 694, bvar 698]),
    bnot (bands [bvar 564, bvar 569, bvar 694, bvar 699]),
    bnot (bands [bvar 564, bvar 570, bvar 694, bvar 700]),
    bnot (bands [bvar 564, bvar 571, bvar 694, bvar 701]),
    bnot (bands [bvar 564, bvar 572, bvar 694, bvar 702]),
    bnot (bands [bvar 567, bvar 570, bvar 697, bvar 700]),
    bnot (bands [bvar 567, bvar 571, bvar 697, bvar 701]),
    bnot (bands [bvar 568, bvar 570, bvar 698, bvar 700]),
    bnot (bands [bvar 568, bvar 571, bvar 698, bvar 701]),
    bnot (bands [bvar 568, bvar 572, bvar 698, bvar 702]),
    bnot (bands [bvar 569, bvar 571, bvar 699, bvar 701]),
    bnot (bands [bvar 570, bvar 571, bvar 700, bvar 701]),
    bnot (bands [bvar 570, bvar 572, bvar 700, bvar 702]),
    bnot (bands [bvar 578, bvar 579, bvar 630, bvar 631]) ]

def reducedUnionChunk037 : BVLogicalExpr :=
  bands reducedUnionChunk037Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
