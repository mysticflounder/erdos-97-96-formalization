import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk110Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 75, bvar 76, bvar 621, bvar 622]),
    bnot (bands [bvar 75, bvar 77, bvar 621, bvar 623]),
    bnot (bands [bvar 75, bvar 78, bvar 621, bvar 624]),
    bnot (bands [bvar 75, bvar 79, bvar 621, bvar 625]),
    bnot (bands [bvar 76, bvar 78, bvar 622, bvar 624]),
    bnot (bands [bvar 76, bvar 79, bvar 622, bvar 625]),
    bnot (bands [bvar 77, bvar 78, bvar 623, bvar 624]),
    bnot (bands [bvar 67, bvar 68, bvar 639, bvar 640]),
    bnot (bands [bvar 68, bvar 76, bvar 640, bvar 648]),
    bnot (bands [bvar 68, bvar 77, bvar 640, bvar 649]),
    bnot (bands [bvar 68, bvar 78, bvar 640, bvar 650]),
    bnot (bands [bvar 68, bvar 79, bvar 640, bvar 651]),
    bnot (bands [bvar 67, bvar 69, bvar 652, bvar 654]),
    bnot (bands [bvar 67, bvar 79, bvar 652, bvar 664]),
    bnot (bands [bvar 68, bvar 79, bvar 653, bvar 664]),
    bnot (bands [bvar 69, bvar 79, bvar 654, bvar 664]),
    bnot (bands [bvar 71, bvar 72, bvar 656, bvar 657]),
    bnot (bands [bvar 74, bvar 75, bvar 659, bvar 660]),
    bnot (bands [bvar 77, bvar 78, bvar 662, bvar 663]),
    bnot (bands [bvar 77, bvar 79, bvar 662, bvar 664]),
    bnot (bands [bvar 67, bvar 68, bvar 665, bvar 666]),
    bnot (bands [bvar 68, bvar 79, bvar 666, bvar 677]),
    bnot (bands [bvar 71, bvar 74, bvar 669, bvar 672]),
    bnot (bands [bvar 72, bvar 75, bvar 670, bvar 673]),
    bnot (bands [bvar 72, bvar 76, bvar 670, bvar 674]),
    bnot (bands [bvar 578, bvar 581, bvar 162, bvar 165]),
    bnot (bands [bvar 578, bvar 583, bvar 162, bvar 167]),
    bnot (bands [bvar 581, bvar 583, bvar 165, bvar 167]),
    atMost [bands [bvar 67, bvar 678], bands [bvar 68, bvar 679], bands [bvar 69, bvar 680], bands [bvar 70, bvar 681], bands [bvar 71, bvar 682], bands [bvar 72, bvar 683], bands [bvar 73, bvar 684], bands [bvar 74, bvar 685], bands [bvar 75, bvar 686], bands [bvar 76, bvar 687], bands [bvar 77, bvar 688], bands [bvar 78, bvar 689], bands [bvar 79, bvar 690]] 2,
    bnot (bands [bvar 68, bvar 79, bvar 679, bvar 690]),
    bnot (bands [bvar 69, bvar 79, bvar 680, bvar 690]),
    bnot (bands [bvar 71, bvar 72, bvar 682, bvar 683]),
    bnot (bands [bvar 71, bvar 73, bvar 682, bvar 684]),
    bnot (bands [bvar 71, bvar 74, bvar 682, bvar 685]),
    bnot (bands [bvar 71, bvar 75, bvar 682, bvar 686]),
    bnot (bands [bvar 71, bvar 76, bvar 682, bvar 687]),
    bnot (bands [bvar 71, bvar 77, bvar 682, bvar 688]),
    bnot (bands [bvar 72, bvar 73, bvar 683, bvar 684]),
    bnot (bands [bvar 72, bvar 74, bvar 683, bvar 685]),
    bnot (bands [bvar 72, bvar 75, bvar 683, bvar 686]),
    bnot (bands [bvar 72, bvar 76, bvar 683, bvar 687]),
    bnot (bands [bvar 72, bvar 77, bvar 683, bvar 688]),
    bnot (bands [bvar 73, bvar 74, bvar 684, bvar 685]),
    bnot (bands [bvar 73, bvar 75, bvar 684, bvar 686]),
    bnot (bands [bvar 73, bvar 76, bvar 684, bvar 687]),
    bnot (bands [bvar 73, bvar 77, bvar 684, bvar 688]),
    bnot (bands [bvar 74, bvar 75, bvar 685, bvar 686]),
    bnot (bands [bvar 74, bvar 76, bvar 685, bvar 687]),
    bnot (bands [bvar 74, bvar 77, bvar 685, bvar 688]),
    bnot (bands [bvar 75, bvar 76, bvar 686, bvar 687]),
    bnot (bands [bvar 75, bvar 77, bvar 686, bvar 688]),
    bnot (bands [bvar 76, bvar 77, bvar 687, bvar 688]),
    bnot (bands [bvar 575, bvar 586, bvar 172, bvar 183]),
    bnot (bands [bvar 579, bvar 583, bvar 176, bvar 180]),
    bnot (bands [bvar 67, bvar 68, bvar 691, bvar 692]),
    bnot (bands [bvar 67, bvar 69, bvar 691, bvar 693]),
    bnot (bands [bvar 71, bvar 72, bvar 695, bvar 696]),
    bnot (bands [bvar 71, bvar 74, bvar 695, bvar 698]),
    bnot (bands [bvar 71, bvar 75, bvar 695, bvar 699]),
    bnot (bands [bvar 71, bvar 76, bvar 695, bvar 700]),
    bnot (bands [bvar 71, bvar 77, bvar 695, bvar 701]),
    bnot (bands [bvar 71, bvar 78, bvar 695, bvar 702]),
    bnot (bands [bvar 73, bvar 75, bvar 697, bvar 699]),
    bnot (bands [bvar 73, bvar 77, bvar 697, bvar 701]) ]

def reducedUnionChunk110 : BVLogicalExpr :=
  bands reducedUnionChunk110Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
