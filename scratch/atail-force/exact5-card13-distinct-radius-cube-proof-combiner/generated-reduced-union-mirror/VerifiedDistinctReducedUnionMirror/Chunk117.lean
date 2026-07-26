import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk117Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 107, bvar 110, bvar 666, bvar 669]),
    bnot (bands [bvar 107, bvar 111, bvar 666, bvar 670]),
    bnot (bands [bvar 107, bvar 117, bvar 666, bvar 676]),
    bnot (bands [bvar 108, bvar 110, bvar 667, bvar 669]),
    bnot (bands [bvar 108, bvar 111, bvar 667, bvar 670]),
    bnot (bands [bvar 108, bvar 117, bvar 667, bvar 676]),
    bnot (bands [bvar 108, bvar 118, bvar 667, bvar 677]),
    bnot (bands [bvar 109, bvar 110, bvar 668, bvar 669]),
    bnot (bands [bvar 109, bvar 111, bvar 668, bvar 670]),
    bnot (bands [bvar 109, bvar 117, bvar 668, bvar 676]),
    bnot (bands [bvar 110, bvar 111, bvar 669, bvar 670]),
    bnot (bands [bvar 110, bvar 117, bvar 669, bvar 676]),
    bnot (bands [bvar 110, bvar 118, bvar 669, bvar 677]),
    bnot (bands [bvar 111, bvar 117, bvar 670, bvar 676]),
    bnot (bands [bvar 111, bvar 118, bvar 670, bvar 677]),
    bnot (bands [bvar 113, bvar 114, bvar 672, bvar 673]),
    bnot (bands [bvar 113, bvar 115, bvar 672, bvar 674]),
    bnot (bands [bvar 114, bvar 115, bvar 673, bvar 674]),
    bnot (bands [bvar 117, bvar 118, bvar 676, bvar 677]),
    bnot (bands [bvar 613, bvar 614, bvar 158, bvar 159]),
    bnot (bands [bvar 613, bvar 615, bvar 158, bvar 160]),
    bnot (bands [bvar 613, bvar 617, bvar 158, bvar 162]),
    bnot (bands [bvar 613, bvar 618, bvar 158, bvar 163]),
    bnot (bands [bvar 613, bvar 624, bvar 158, bvar 169]),
    bnot (bands [bvar 613, bvar 625, bvar 158, bvar 170]),
    bnot (bands [bvar 614, bvar 617, bvar 159, bvar 162]),
    bnot (bands [bvar 614, bvar 624, bvar 159, bvar 169]),
    bnot (bands [bvar 614, bvar 625, bvar 159, bvar 170]),
    bnot (bands [bvar 615, bvar 617, bvar 160, bvar 162]),
    bnot (bands [bvar 615, bvar 624, bvar 160, bvar 169]),
    bnot (bands [bvar 615, bvar 625, bvar 160, bvar 170]),
    bnot (bands [bvar 616, bvar 617, bvar 161, bvar 162]),
    bnot (bands [bvar 616, bvar 624, bvar 161, bvar 169]),
    bnot (bands [bvar 616, bvar 625, bvar 161, bvar 170]),
    bnot (bands [bvar 617, bvar 624, bvar 162, bvar 169]),
    bnot (bands [bvar 617, bvar 625, bvar 162, bvar 170]),
    bnot (bands [bvar 618, bvar 624, bvar 163, bvar 169]),
    bnot (bands [bvar 618, bvar 625, bvar 163, bvar 170]),
    bnot (bands [bvar 620, bvar 621, bvar 165, bvar 166]),
    bnot (bands [bvar 620, bvar 622, bvar 165, bvar 167]),
    bnot (bands [bvar 621, bvar 622, bvar 166, bvar 167]),
    bnot (bands [bvar 624, bvar 625, bvar 169, bvar 170]),
    atMost [bands [bvar 106, bvar 678], bands [bvar 107, bvar 679], bands [bvar 108, bvar 680], bands [bvar 109, bvar 681], bands [bvar 110, bvar 682], bands [bvar 111, bvar 683], bands [bvar 112, bvar 684], bands [bvar 113, bvar 685], bands [bvar 114, bvar 686], bands [bvar 115, bvar 687], bands [bvar 116, bvar 688], bands [bvar 117, bvar 689], bands [bvar 118, bvar 690]] 2,
    bnot (bands [bvar 109, bvar 110, bvar 681, bvar 682]),
    bnot (bands [bvar 109, bvar 111, bvar 681, bvar 683]),
    bnot (bands [bvar 110, bvar 111, bvar 682, bvar 683]),
    bnot (bands [bvar 110, bvar 118, bvar 682, bvar 690]),
    bnot (bands [bvar 111, bvar 118, bvar 683, bvar 690]),
    bnot (bands [bvar 113, bvar 114, bvar 685, bvar 686]),
    bnot (bands [bvar 113, bvar 115, bvar 685, bvar 687]),
    bnot (bands [bvar 113, bvar 116, bvar 685, bvar 688]),
    bnot (bands [bvar 114, bvar 115, bvar 686, bvar 687]),
    bnot (bands [bvar 114, bvar 116, bvar 686, bvar 688]),
    bnot (bands [bvar 115, bvar 116, bvar 687, bvar 688]),
    bnot (bands [bvar 620, bvar 622, bvar 178, bvar 180]),
    bnot (bands [bvar 621, bvar 622, bvar 179, bvar 180]),
    bnot (bands [bvar 622, bvar 623, bvar 180, bvar 181]),
    atMost [bands [bvar 106, bvar 691], bands [bvar 107, bvar 692], bands [bvar 108, bvar 693], bands [bvar 109, bvar 694], bands [bvar 110, bvar 695], bands [bvar 111, bvar 696], bands [bvar 112, bvar 697], bands [bvar 113, bvar 698], bands [bvar 114, bvar 699], bands [bvar 115, bvar 700], bands [bvar 116, bvar 701], bands [bvar 117, bvar 702], bands [bvar 118, bvar 703]] 2,
    bnot (bands [bvar 106, bvar 107, bvar 691, bvar 692]),
    bnot (bands [bvar 106, bvar 108, bvar 691, bvar 693]),
    bnot (bands [bvar 106, bvar 109, bvar 691, bvar 694]),
    bnot (bands [bvar 106, bvar 110, bvar 691, bvar 695]),
    bnot (bands [bvar 106, bvar 111, bvar 691, bvar 696]),
    bnot (bands [bvar 107, bvar 110, bvar 692, bvar 695]) ]

def reducedUnionChunk117 : BVLogicalExpr :=
  bands reducedUnionChunk117Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
