import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk142Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1, bvar 12, bvar 640, bvar 651]),
    bnot (bands [bvar 10, bvar 11, bvar 649, bvar 650]),
    bnot (bands [bvar 0, bvar 10, bvar 652, bvar 662]),
    bnot (bands [bvar 0, bvar 11, bvar 652, bvar 663]),
    bnot (bands [bvar 0, bvar 12, bvar 652, bvar 664]),
    bnot (bands [bvar 1, bvar 11, bvar 653, bvar 663]),
    bnot (bands [bvar 1, bvar 12, bvar 653, bvar 664]),
    bnot (bands [bvar 2, bvar 10, bvar 654, bvar 662]),
    bnot (bands [bvar 2, bvar 11, bvar 654, bvar 663]),
    bnot (bands [bvar 2, bvar 12, bvar 654, bvar 664]),
    bnot (bands [bvar 3, bvar 10, bvar 655, bvar 662]),
    bnot (bands [bvar 3, bvar 12, bvar 655, bvar 664]),
    bnot (bands [bvar 6, bvar 8, bvar 658, bvar 660]),
    bnot (bands [bvar 7, bvar 8, bvar 659, bvar 660]),
    bnot (bands [bvar 10, bvar 11, bvar 662, bvar 663]),
    bnot (bands [bvar 0, bvar 11, bvar 665, bvar 676]),
    bnot (bands [bvar 0, bvar 12, bvar 665, bvar 677]),
    bnot (bands [bvar 2, bvar 12, bvar 667, bvar 677]),
    bnot (bands [bvar 5, bvar 9, bvar 670, bvar 674]),
    bnot (bands [bvar 6, bvar 9, bvar 671, bvar 674]),
    bnot (bands [bvar 7, bvar 8, bvar 672, bvar 673]),
    bnot (bands [bvar 7, bvar 9, bvar 672, bvar 674]),
    bnot (bands [bvar 8, bvar 9, bvar 673, bvar 674]),
    bnot (bands [bvar 11, bvar 12, bvar 676, bvar 677]),
    bnot (bands [bvar 0, bvar 3, bvar 678, bvar 681]),
    bnot (bands [bvar 1, bvar 12, bvar 679, bvar 690]),
    bnot (bands [bvar 2, bvar 12, bvar 680, bvar 690]),
    bnot (bands [bvar 3, bvar 12, bvar 681, bvar 690]),
    bnot (bands [bvar 5, bvar 9, bvar 683, bvar 687]),
    bnot (bands [bvar 5, bvar 10, bvar 683, bvar 688]),
    bnot (bands [bvar 6, bvar 9, bvar 684, bvar 687]),
    bnot (bands [bvar 6, bvar 10, bvar 684, bvar 688]),
    bnot (bands [bvar 7, bvar 9, bvar 685, bvar 687]),
    bnot (bands [bvar 7, bvar 10, bvar 685, bvar 688]),
    bnot (bands [bvar 8, bvar 9, bvar 686, bvar 687]),
    bnot (bands [bvar 8, bvar 10, bvar 686, bvar 688]),
    bnot (bands [bvar 9, bvar 10, bvar 687, bvar 688]),
    bnot (bands [bvar 5, bvar 8, bvar 696, bvar 699]),
    bnot (bands [bvar 5, bvar 9, bvar 696, bvar 700]),
    bnot (bands [bvar 5, bvar 11, bvar 696, bvar 702]),
    bnot (bands [bvar 6, bvar 9, bvar 697, bvar 700]),
    bnot (bands [bvar 6, bvar 10, bvar 697, bvar 701]),
    bnot (bands [bvar 6, bvar 11, bvar 697, bvar 702]),
    bnot (bands [bvar 7, bvar 8, bvar 698, bvar 699]),
    bnot (bands [bvar 7, bvar 9, bvar 698, bvar 700]),
    bnot (bands [bvar 7, bvar 10, bvar 698, bvar 701]),
    bnot (bands [bvar 7, bvar 11, bvar 698, bvar 702]),
    bnot (bands [bvar 8, bvar 9, bvar 699, bvar 700]),
    bnot (bands [bvar 8, bvar 10, bvar 699, bvar 701]),
    bnot (bands [bvar 8, bvar 11, bvar 699, bvar 702]),
    bnot (bands [bvar 9, bvar 10, bvar 700, bvar 701]),
    bnot (bands [bvar 9, bvar 11, bvar 700, bvar 702]),
    bnot (bands [bvar 10, bvar 11, bvar 701, bvar 702]),
    bnot (bands [bvar 0, bvar 11, bvar 600, bvar 611]),
    bnot (bands [bvar 0, bvar 12, bvar 600, bvar 612]),
    bnot (bands [bvar 1, bvar 11, bvar 601, bvar 611]),
    bnot (bands [bvar 2, bvar 11, bvar 602, bvar 611]),
    bnot (bands [bvar 3, bvar 11, bvar 603, bvar 611]),
    bnot (bands [bvar 0, bvar 9, bvar 613, bvar 622]),
    bnot (bands [bvar 0, bvar 10, bvar 613, bvar 623]),
    bnot (bands [bvar 0, bvar 12, bvar 613, bvar 625]),
    bnot (bands [bvar 2, bvar 12, bvar 615, bvar 625]),
    bnot (bands [bvar 9, bvar 11, bvar 622, bvar 624]),
    bnot (bands [bvar 9, bvar 12, bvar 622, bvar 625]) ]

def reducedUnionChunk142 : BVLogicalExpr :=
  bands reducedUnionChunk142Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
