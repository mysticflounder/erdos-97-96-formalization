import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk041Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 613, bvar 614, bvar 652, bvar 653]),
    bnot (bands [bvar 613, bvar 617, bvar 652, bvar 656]),
    bnot (bands [bvar 613, bvar 618, bvar 652, bvar 657]),
    bnot (bands [bvar 613, bvar 623, bvar 652, bvar 662]),
    bnot (bands [bvar 613, bvar 624, bvar 652, bvar 663]),
    bnot (bands [bvar 613, bvar 625, bvar 652, bvar 664]),
    bnot (bands [bvar 614, bvar 617, bvar 653, bvar 656]),
    bnot (bands [bvar 614, bvar 623, bvar 653, bvar 662]),
    bnot (bands [bvar 614, bvar 624, bvar 653, bvar 663]),
    bnot (bands [bvar 614, bvar 625, bvar 653, bvar 664]),
    bnot (bands [bvar 615, bvar 617, bvar 654, bvar 656]),
    bnot (bands [bvar 615, bvar 623, bvar 654, bvar 662]),
    bnot (bands [bvar 615, bvar 624, bvar 654, bvar 663]),
    bnot (bands [bvar 615, bvar 625, bvar 654, bvar 664]),
    bnot (bands [bvar 616, bvar 617, bvar 655, bvar 656]),
    bnot (bands [bvar 616, bvar 623, bvar 655, bvar 662]),
    bnot (bands [bvar 616, bvar 624, bvar 655, bvar 663]),
    bnot (bands [bvar 616, bvar 625, bvar 655, bvar 664]),
    bnot (bands [bvar 617, bvar 618, bvar 656, bvar 657]),
    bnot (bands [bvar 617, bvar 623, bvar 656, bvar 662]),
    bnot (bands [bvar 617, bvar 624, bvar 656, bvar 663]),
    bnot (bands [bvar 617, bvar 625, bvar 656, bvar 664]),
    bnot (bands [bvar 618, bvar 623, bvar 657, bvar 662]),
    bnot (bands [bvar 618, bvar 624, bvar 657, bvar 663]),
    bnot (bands [bvar 618, bvar 625, bvar 657, bvar 664]),
    bnot (bands [bvar 620, bvar 621, bvar 659, bvar 660]),
    bnot (bands [bvar 623, bvar 624, bvar 662, bvar 663]),
    bnot (bands [bvar 623, bvar 625, bvar 662, bvar 664]),
    bnot (bands [bvar 624, bvar 625, bvar 663, bvar 664]),
    bnot (bands [bvar 616, bvar 617, bvar 668, bvar 669]),
    bnot (bands [bvar 617, bvar 618, bvar 669, bvar 670]),
    bnot (bands [bvar 617, bvar 624, bvar 669, bvar 676]),
    bnot (bands [bvar 617, bvar 625, bvar 669, bvar 677]),
    bnot (bands [bvar 618, bvar 624, bvar 670, bvar 676]),
    bnot (bands [bvar 620, bvar 621, bvar 672, bvar 673]),
    bnot (bands [bvar 613, bvar 614, bvar 678, bvar 679]),
    bnot (bands [bvar 613, bvar 617, bvar 678, bvar 682]),
    bnot (bands [bvar 613, bvar 618, bvar 678, bvar 683]),
    bnot (bands [bvar 614, bvar 617, bvar 679, bvar 682]),
    bnot (bands [bvar 614, bvar 625, bvar 679, bvar 690]),
    bnot (bands [bvar 615, bvar 617, bvar 680, bvar 682]),
    bnot (bands [bvar 615, bvar 625, bvar 680, bvar 690]),
    bnot (bands [bvar 616, bvar 617, bvar 681, bvar 682]),
    bnot (bands [bvar 616, bvar 625, bvar 681, bvar 690]),
    bnot (bands [bvar 617, bvar 618, bvar 682, bvar 683]),
    bnot (bands [bvar 617, bvar 625, bvar 682, bvar 690]),
    bnot (bands [bvar 618, bvar 625, bvar 683, bvar 690]),
    bnot (bands [bvar 620, bvar 621, bvar 685, bvar 686]),
    bnot (bands [bvar 620, bvar 622, bvar 685, bvar 687]),
    bnot (bands [bvar 620, bvar 623, bvar 685, bvar 688]),
    bnot (bands [bvar 621, bvar 622, bvar 686, bvar 687]),
    bnot (bands [bvar 621, bvar 623, bvar 686, bvar 688]),
    bnot (bands [bvar 622, bvar 623, bvar 687, bvar 688]),
    bnot (bands [bvar 620, bvar 622, bvar 698, bvar 700]),
    bnot (bands [bvar 620, bvar 623, bvar 698, bvar 701]),
    bnot (bands [bvar 620, bvar 624, bvar 698, bvar 702]),
    bnot (bands [bvar 621, bvar 624, bvar 699, bvar 702]),
    bnot (bands [bvar 626, bvar 627, bvar 639, bvar 640]),
    bnot (bands [bvar 626, bvar 630, bvar 639, bvar 643]),
    bnot (bands [bvar 626, bvar 632, bvar 639, bvar 645]),
    bnot (bands [bvar 626, bvar 635, bvar 639, bvar 648]),
    bnot (bands [bvar 626, bvar 636, bvar 639, bvar 649]),
    bnot (bands [bvar 627, bvar 630, bvar 640, bvar 643]),
    bnot (bands [bvar 627, bvar 632, bvar 640, bvar 645]) ]

def reducedUnionChunk041 : BVLogicalExpr :=
  bands reducedUnionChunk041Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
