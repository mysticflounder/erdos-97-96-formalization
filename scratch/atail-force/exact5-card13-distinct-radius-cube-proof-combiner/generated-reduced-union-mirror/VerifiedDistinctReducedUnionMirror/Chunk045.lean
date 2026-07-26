import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk045Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 657, bvar 660, bvar 683, bvar 686]),
    bnot (bands [bvar 657, bvar 664, bvar 683, bvar 690]),
    bnot (bands [bvar 658, bvar 659, bvar 684, bvar 685]),
    bnot (bands [bvar 658, bvar 660, bvar 684, bvar 686]),
    bnot (bands [bvar 658, bvar 664, bvar 684, bvar 690]),
    bnot (bands [bvar 659, bvar 660, bvar 685, bvar 686]),
    bnot (bands [bvar 659, bvar 664, bvar 685, bvar 690]),
    bnot (bands [bvar 652, bvar 653, bvar 691, bvar 692]),
    bnot (bands [bvar 652, bvar 654, bvar 691, bvar 693]),
    bnot (bands [bvar 652, bvar 655, bvar 691, bvar 694]),
    bnot (bands [bvar 652, bvar 656, bvar 691, bvar 695]),
    bnot (bands [bvar 652, bvar 657, bvar 691, bvar 696]),
    bnot (bands [bvar 652, bvar 658, bvar 691, bvar 697]),
    bnot (bands [bvar 652, bvar 659, bvar 691, bvar 698]),
    bnot (bands [bvar 652, bvar 660, bvar 691, bvar 699]),
    bnot (bands [bvar 653, bvar 656, bvar 692, bvar 695]),
    bnot (bands [bvar 653, bvar 657, bvar 692, bvar 696]),
    bnot (bands [bvar 653, bvar 658, bvar 692, bvar 697]),
    bnot (bands [bvar 653, bvar 659, bvar 692, bvar 698]),
    bnot (bands [bvar 653, bvar 660, bvar 692, bvar 699]),
    bnot (bands [bvar 654, bvar 656, bvar 693, bvar 695]),
    bnot (bands [bvar 654, bvar 657, bvar 693, bvar 696]),
    bnot (bands [bvar 654, bvar 658, bvar 693, bvar 697]),
    bnot (bands [bvar 654, bvar 659, bvar 693, bvar 698]),
    bnot (bands [bvar 654, bvar 660, bvar 693, bvar 699]),
    bnot (bands [bvar 655, bvar 656, bvar 694, bvar 695]),
    bnot (bands [bvar 655, bvar 657, bvar 694, bvar 696]),
    bnot (bands [bvar 655, bvar 658, bvar 694, bvar 697]),
    bnot (bands [bvar 655, bvar 659, bvar 694, bvar 698]),
    bnot (bands [bvar 656, bvar 657, bvar 695, bvar 696]),
    bnot (bands [bvar 656, bvar 658, bvar 695, bvar 697]),
    bnot (bands [bvar 656, bvar 659, bvar 695, bvar 698]),
    bnot (bands [bvar 656, bvar 660, bvar 695, bvar 699]),
    bnot (bands [bvar 657, bvar 658, bvar 696, bvar 697]),
    bnot (bands [bvar 657, bvar 659, bvar 696, bvar 698]),
    bnot (bands [bvar 657, bvar 660, bvar 696, bvar 699]),
    bnot (bands [bvar 658, bvar 659, bvar 697, bvar 698]),
    bnot (bands [bvar 658, bvar 660, bvar 697, bvar 699]),
    bnot (bands [bvar 659, bvar 660, bvar 698, bvar 699]),
    bnot (bands [bvar 662, bvar 663, bvar 701, bvar 702]),
    bnot (bands [bvar 666, bvar 670, bvar 679, bvar 683]),
    bnot (bands [bvar 666, bvar 674, bvar 679, bvar 687]),
    bnot (bands [bvar 667, bvar 674, bvar 680, bvar 687]),
    bnot (bands [bvar 668, bvar 674, bvar 681, bvar 687]),
    bnot (bands [bvar 670, bvar 674, bvar 683, bvar 687]),
    bnot (bands [bvar 671, bvar 674, bvar 684, bvar 687]),
    bnot (bands [bvar 665, bvar 666, bvar 691, bvar 692]),
    bnot (bands [bvar 665, bvar 669, bvar 691, bvar 695]),
    bnot (bands [bvar 666, bvar 669, bvar 692, bvar 695]),
    bnot (bands [bvar 666, bvar 671, bvar 692, bvar 697]),
    bnot (bands [bvar 666, bvar 674, bvar 692, bvar 700]),
    bnot (bands [bvar 667, bvar 671, bvar 693, bvar 697]),
    bnot (bands [bvar 668, bvar 671, bvar 694, bvar 697]),
    bnot (bands [bvar 668, bvar 674, bvar 694, bvar 700]),
    bnot (bands [bvar 669, bvar 672, bvar 695, bvar 698]),
    bnot (bands [bvar 670, bvar 674, bvar 696, bvar 700]),
    bnot (bands [bvar 671, bvar 674, bvar 697, bvar 700]),
    bnot (bands [bvar 672, bvar 674, bvar 698, bvar 700]),
    bnot (bands [bvar 678, bvar 688, bvar 691, bvar 701]),
    bnot (bands [bvar 679, bvar 688, bvar 692, bvar 701]),
    atMost [bvar 604, bvar 605, bvar 606, bvar 607, bvar 608] 2,
    atMost [bvar 617, bvar 618, bvar 619, bvar 620, bvar 621] 2,
    atMost [bvar 630, bvar 631, bvar 632, bvar 633, bvar 634] 2,
    atMost [bvar 643, bvar 644, bvar 645, bvar 646, bvar 647] 1 ]

def reducedUnionChunk045 : BVLogicalExpr :=
  bands reducedUnionChunk045Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
