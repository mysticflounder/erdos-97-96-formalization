import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk039Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 564, bvar 568, bvar 668, bvar 672]),
    bnot (bands [bvar 564, bvar 569, bvar 668, bvar 673]),
    bnot (bands [bvar 564, bvar 570, bvar 668, bvar 674]),
    bnot (bands [bvar 566, bvar 569, bvar 670, bvar 673]),
    bnot (bands [bvar 568, bvar 570, bvar 672, bvar 674]),
    bnot (bands [bvar 569, bvar 570, bvar 673, bvar 674]),
    bnot (bands [bvar 562, bvar 573, bvar 679, bvar 690]),
    bnot (bands [bvar 564, bvar 566, bvar 681, bvar 683]),
    bnot (bands [bvar 564, bvar 567, bvar 681, bvar 684]),
    bnot (bands [bvar 564, bvar 568, bvar 681, bvar 685]),
    bnot (bands [bvar 564, bvar 569, bvar 681, bvar 686]),
    bnot (bands [bvar 564, bvar 570, bvar 681, bvar 687]),
    bnot (bands [bvar 564, bvar 571, bvar 681, bvar 688]),
    bnot (bands [bvar 566, bvar 568, bvar 683, bvar 685]),
    bnot (bands [bvar 567, bvar 570, bvar 684, bvar 687]),
    bnot (bands [bvar 567, bvar 571, bvar 684, bvar 688]),
    bnot (bands [bvar 568, bvar 570, bvar 685, bvar 687]),
    bnot (bands [bvar 569, bvar 570, bvar 686, bvar 687]),
    bnot (bands [bvar 564, bvar 566, bvar 694, bvar 696]),
    bnot (bands [bvar 564, bvar 567, bvar 694, bvar 697]),
    bnot (bands [bvar 564, bvar 568, bvar 694, bvar 698]),
    bnot (bands [bvar 564, bvar 569, bvar 694, bvar 699]),
    bnot (bands [bvar 564, bvar 570, bvar 694, bvar 700]),
    bnot (bands [bvar 564, bvar 571, bvar 694, bvar 701]),
    bnot (bands [bvar 564, bvar 572, bvar 694, bvar 702]),
    bnot (bands [bvar 566, bvar 569, bvar 696, bvar 699]),
    bnot (bands [bvar 567, bvar 571, bvar 697, bvar 701]),
    bnot (bands [bvar 568, bvar 569, bvar 698, bvar 699]),
    bnot (bands [bvar 568, bvar 572, bvar 698, bvar 702]),
    bnot (bands [bvar 569, bvar 571, bvar 699, bvar 701]),
    bnot (bands [bvar 569, bvar 572, bvar 699, bvar 702]),
    bnot (bands [bvar 571, bvar 572, bvar 701, bvar 702]),
    bnot (bands [bvar 574, bvar 575, bvar 678, bvar 679]),
    bnot (bands [bvar 574, bvar 576, bvar 678, bvar 680]),
    bnot (bands [bvar 574, bvar 586, bvar 678, bvar 690]),
    bnot (bands [bvar 576, bvar 586, bvar 680, bvar 690]),
    bnot (bands [bvar 578, bvar 579, bvar 682, bvar 683]),
    bnot (bands [bvar 578, bvar 580, bvar 682, bvar 684]),
    bnot (bands [bvar 578, bvar 583, bvar 682, bvar 687]),
    bnot (bands [bvar 580, bvar 581, bvar 684, bvar 685]),
    bnot (bands [bvar 580, bvar 582, bvar 684, bvar 686]),
    bnot (bands [bvar 580, bvar 583, bvar 684, bvar 687]),
    bnot (bands [bvar 581, bvar 582, bvar 685, bvar 686]),
    bnot (bands [bvar 581, bvar 583, bvar 685, bvar 687]),
    bnot (bands [bvar 582, bvar 583, bvar 686, bvar 687]),
    bnot (bands [bvar 600, bvar 611, bvar 613, bvar 624]),
    bnot (bands [bvar 600, bvar 612, bvar 613, bvar 625]),
    bnot (bands [bvar 601, bvar 604, bvar 614, bvar 617]),
    bnot (bands [bvar 601, bvar 611, bvar 614, bvar 624]),
    bnot (bands [bvar 601, bvar 612, bvar 614, bvar 625]),
    bnot (bands [bvar 602, bvar 604, bvar 615, bvar 617]),
    bnot (bands [bvar 602, bvar 607, bvar 615, bvar 620]),
    bnot (bands [bvar 602, bvar 608, bvar 615, bvar 621]),
    bnot (bands [bvar 602, bvar 609, bvar 615, bvar 622]),
    bnot (bands [bvar 602, bvar 611, bvar 615, bvar 624]),
    bnot (bands [bvar 602, bvar 612, bvar 615, bvar 625]),
    bnot (bands [bvar 603, bvar 604, bvar 616, bvar 617]),
    bnot (bands [bvar 603, bvar 607, bvar 616, bvar 620]),
    bnot (bands [bvar 603, bvar 608, bvar 616, bvar 621]),
    bnot (bands [bvar 603, bvar 609, bvar 616, bvar 622]),
    bnot (bands [bvar 603, bvar 610, bvar 616, bvar 623]),
    bnot (bands [bvar 603, bvar 611, bvar 616, bvar 624]),
    bnot (bands [bvar 603, bvar 612, bvar 616, bvar 625]),
    bnot (bands [bvar 604, bvar 607, bvar 617, bvar 620]) ]

def reducedUnionChunk039 : BVLogicalExpr :=
  bands reducedUnionChunk039Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
