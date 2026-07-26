import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk116Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 616, bvar 617, bvar 135, bvar 136]),
    bnot (bands [bvar 616, bvar 622, bvar 135, bvar 141]),
    bnot (bands [bvar 616, bvar 623, bvar 135, bvar 142]),
    bnot (bands [bvar 616, bvar 624, bvar 135, bvar 143]),
    bnot (bands [bvar 616, bvar 625, bvar 135, bvar 144]),
    bnot (bands [bvar 617, bvar 622, bvar 136, bvar 141]),
    bnot (bands [bvar 617, bvar 623, bvar 136, bvar 142]),
    bnot (bands [bvar 617, bvar 625, bvar 136, bvar 144]),
    bnot (bands [bvar 618, bvar 622, bvar 137, bvar 141]),
    bnot (bands [bvar 618, bvar 623, bvar 137, bvar 142]),
    bnot (bands [bvar 618, bvar 624, bvar 137, bvar 143]),
    bnot (bands [bvar 618, bvar 625, bvar 137, bvar 144]),
    bnot (bands [bvar 622, bvar 625, bvar 141, bvar 144]),
    atMost [bands [bvar 106, bvar 652], bands [bvar 107, bvar 653], bands [bvar 108, bvar 654], bands [bvar 109, bvar 655], bands [bvar 110, bvar 656], bands [bvar 111, bvar 657], bands [bvar 112, bvar 658], bands [bvar 113, bvar 659], bands [bvar 114, bvar 660], bands [bvar 115, bvar 661], bands [bvar 116, bvar 662], bands [bvar 117, bvar 663], bands [bvar 118, bvar 664]] 2,
    bnot (bands [bvar 106, bvar 107, bvar 652, bvar 653]),
    bnot (bands [bvar 106, bvar 110, bvar 652, bvar 656]),
    bnot (bands [bvar 106, bvar 111, bvar 652, bvar 657]),
    bnot (bands [bvar 106, bvar 116, bvar 652, bvar 662]),
    bnot (bands [bvar 106, bvar 118, bvar 652, bvar 664]),
    bnot (bands [bvar 107, bvar 110, bvar 653, bvar 656]),
    bnot (bands [bvar 107, bvar 111, bvar 653, bvar 657]),
    bnot (bands [bvar 108, bvar 110, bvar 654, bvar 656]),
    bnot (bands [bvar 108, bvar 111, bvar 654, bvar 657]),
    bnot (bands [bvar 108, bvar 116, bvar 654, bvar 662]),
    bnot (bands [bvar 108, bvar 117, bvar 654, bvar 663]),
    bnot (bands [bvar 109, bvar 110, bvar 655, bvar 656]),
    bnot (bands [bvar 109, bvar 111, bvar 655, bvar 657]),
    bnot (bands [bvar 109, bvar 116, bvar 655, bvar 662]),
    bnot (bands [bvar 109, bvar 117, bvar 655, bvar 663]),
    bnot (bands [bvar 110, bvar 111, bvar 656, bvar 657]),
    bnot (bands [bvar 110, bvar 116, bvar 656, bvar 662]),
    bnot (bands [bvar 110, bvar 117, bvar 656, bvar 663]),
    bnot (bands [bvar 110, bvar 118, bvar 656, bvar 664]),
    bnot (bands [bvar 111, bvar 116, bvar 657, bvar 662]),
    bnot (bands [bvar 111, bvar 117, bvar 657, bvar 663]),
    bnot (bands [bvar 111, bvar 118, bvar 657, bvar 664]),
    bnot (bands [bvar 113, bvar 114, bvar 659, bvar 660]),
    bnot (bands [bvar 116, bvar 117, bvar 662, bvar 663]),
    bnot (bands [bvar 116, bvar 118, bvar 662, bvar 664]),
    bnot (bands [bvar 117, bvar 118, bvar 663, bvar 664]),
    bnot (bands [bvar 613, bvar 614, bvar 145, bvar 146]),
    bnot (bands [bvar 613, bvar 617, bvar 145, bvar 149]),
    bnot (bands [bvar 613, bvar 618, bvar 145, bvar 150]),
    bnot (bands [bvar 613, bvar 623, bvar 145, bvar 155]),
    bnot (bands [bvar 614, bvar 617, bvar 146, bvar 149]),
    bnot (bands [bvar 614, bvar 624, bvar 146, bvar 156]),
    bnot (bands [bvar 615, bvar 617, bvar 147, bvar 149]),
    bnot (bands [bvar 615, bvar 625, bvar 147, bvar 157]),
    bnot (bands [bvar 616, bvar 617, bvar 148, bvar 149]),
    bnot (bands [bvar 617, bvar 618, bvar 149, bvar 150]),
    bnot (bands [bvar 617, bvar 623, bvar 149, bvar 155]),
    bnot (bands [bvar 617, bvar 624, bvar 149, bvar 156]),
    bnot (bands [bvar 617, bvar 625, bvar 149, bvar 157]),
    bnot (bands [bvar 618, bvar 623, bvar 150, bvar 155]),
    bnot (bands [bvar 623, bvar 624, bvar 155, bvar 156]),
    bnot (bands [bvar 623, bvar 625, bvar 155, bvar 157]),
    bnot (bands [bvar 624, bvar 625, bvar 156, bvar 157]),
    atMost [bands [bvar 106, bvar 665], bands [bvar 107, bvar 666], bands [bvar 108, bvar 667], bands [bvar 109, bvar 668], bands [bvar 110, bvar 669], bands [bvar 111, bvar 670], bands [bvar 112, bvar 671], bands [bvar 113, bvar 672], bands [bvar 114, bvar 673], bands [bvar 115, bvar 674], bands [bvar 116, bvar 675], bands [bvar 117, bvar 676], bands [bvar 118, bvar 677]] 2,
    bnot (bands [bvar 106, bvar 107, bvar 665, bvar 666]),
    bnot (bands [bvar 106, bvar 108, bvar 665, bvar 667]),
    bnot (bands [bvar 106, bvar 109, bvar 665, bvar 668]),
    bnot (bands [bvar 106, bvar 110, bvar 665, bvar 669]),
    bnot (bands [bvar 106, bvar 111, bvar 665, bvar 670]),
    bnot (bands [bvar 106, bvar 118, bvar 665, bvar 677]) ]

def reducedUnionChunk116 : BVLogicalExpr :=
  bands reducedUnionChunk116Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
