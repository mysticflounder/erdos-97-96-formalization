import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk047Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 670, bvar 672, bvar 683, bvar 685]),
    bnot (bands [bvar 670, bvar 673, bvar 683, bvar 686]),
    bnot (bands [bvar 670, bvar 674, bvar 683, bvar 687]),
    bnot (bands [bvar 670, bvar 677, bvar 683, bvar 690]),
    bnot (bands [bvar 671, bvar 672, bvar 684, bvar 685]),
    bnot (bands [bvar 671, bvar 673, bvar 684, bvar 686]),
    bnot (bands [bvar 671, bvar 674, bvar 684, bvar 687]),
    bnot (bands [bvar 671, bvar 677, bvar 684, bvar 690]),
    bnot (bands [bvar 672, bvar 673, bvar 685, bvar 686]),
    bnot (bands [bvar 672, bvar 674, bvar 685, bvar 687]),
    bnot (bands [bvar 672, bvar 677, bvar 685, bvar 690]),
    bnot (bands [bvar 673, bvar 674, bvar 686, bvar 687]),
    bnot (bands [bvar 673, bvar 677, bvar 686, bvar 690]),
    bnot (bands [bvar 665, bvar 666, bvar 691, bvar 692]),
    bnot (bands [bvar 665, bvar 667, bvar 691, bvar 693]),
    bnot (bands [bvar 665, bvar 668, bvar 691, bvar 694]),
    bnot (bands [bvar 665, bvar 669, bvar 691, bvar 695]),
    bnot (bands [bvar 665, bvar 670, bvar 691, bvar 696]),
    bnot (bands [bvar 665, bvar 671, bvar 691, bvar 697]),
    bnot (bands [bvar 665, bvar 672, bvar 691, bvar 698]),
    bnot (bands [bvar 665, bvar 673, bvar 691, bvar 699]),
    bnot (bands [bvar 665, bvar 674, bvar 691, bvar 700]),
    bnot (bands [bvar 666, bvar 669, bvar 692, bvar 695]),
    bnot (bands [bvar 666, bvar 670, bvar 692, bvar 696]),
    bnot (bands [bvar 666, bvar 671, bvar 692, bvar 697]),
    bnot (bands [bvar 666, bvar 672, bvar 692, bvar 698]),
    bnot (bands [bvar 666, bvar 673, bvar 692, bvar 699]),
    bnot (bands [bvar 666, bvar 674, bvar 692, bvar 700]),
    bnot (bands [bvar 667, bvar 669, bvar 693, bvar 695]),
    bnot (bands [bvar 667, bvar 670, bvar 693, bvar 696]),
    bnot (bands [bvar 667, bvar 671, bvar 693, bvar 697]),
    bnot (bands [bvar 667, bvar 672, bvar 693, bvar 698]),
    bnot (bands [bvar 667, bvar 673, bvar 693, bvar 699]),
    bnot (bands [bvar 667, bvar 674, bvar 693, bvar 700]),
    bnot (bands [bvar 668, bvar 669, bvar 694, bvar 695]),
    bnot (bands [bvar 668, bvar 670, bvar 694, bvar 696]),
    bnot (bands [bvar 668, bvar 671, bvar 694, bvar 697]),
    bnot (bands [bvar 668, bvar 672, bvar 694, bvar 698]),
    bnot (bands [bvar 668, bvar 673, bvar 694, bvar 699]),
    bnot (bands [bvar 668, bvar 674, bvar 694, bvar 700]),
    bnot (bands [bvar 669, bvar 670, bvar 695, bvar 696]),
    bnot (bands [bvar 669, bvar 671, bvar 695, bvar 697]),
    bnot (bands [bvar 669, bvar 672, bvar 695, bvar 698]),
    bnot (bands [bvar 669, bvar 673, bvar 695, bvar 699]),
    bnot (bands [bvar 669, bvar 674, bvar 695, bvar 700]),
    bnot (bands [bvar 670, bvar 671, bvar 696, bvar 697]),
    bnot (bands [bvar 670, bvar 672, bvar 696, bvar 698]),
    bnot (bands [bvar 670, bvar 673, bvar 696, bvar 699]),
    bnot (bands [bvar 670, bvar 674, bvar 696, bvar 700]),
    bnot (bands [bvar 671, bvar 672, bvar 697, bvar 698]),
    bnot (bands [bvar 671, bvar 673, bvar 697, bvar 699]),
    bnot (bands [bvar 671, bvar 674, bvar 697, bvar 700]),
    bnot (bands [bvar 672, bvar 673, bvar 698, bvar 699]),
    bnot (bands [bvar 672, bvar 674, bvar 698, bvar 700]),
    bnot (bands [bvar 673, bvar 674, bvar 699, bvar 700]),
    bnot (bands [bvar 679, bvar 683, bvar 692, bvar 696]),
    bnot (bands [bvar 679, bvar 684, bvar 692, bvar 697]),
    bnot (bands [bvar 683, bvar 687, bvar 696, bvar 700]),
    bnot (bands [bvar 684, bvar 686, bvar 697, bvar 699]),
    atMost [bvar 604, bvar 605, bvar 606, bvar 607, bvar 608] 2,
    atMost [bvar 617, bvar 618, bvar 619, bvar 620, bvar 621] 2,
    atMost [bvar 630, bvar 631, bvar 632, bvar 633, bvar 634] 2,
    atMost [bvar 643, bvar 644, bvar 645, bvar 646, bvar 647] 1,
    bnot (bands [bvar 613, bvar 614, bvar 639, bvar 640]) ]

def reducedUnionChunk047 : BVLogicalExpr :=
  bands reducedUnionChunk047Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
