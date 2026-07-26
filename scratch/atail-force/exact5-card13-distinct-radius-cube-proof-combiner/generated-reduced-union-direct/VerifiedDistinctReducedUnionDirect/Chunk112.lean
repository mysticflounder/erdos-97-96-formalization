import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk112Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 109, bvar 111, bvar 655, bvar 657]),
    bnot (bands [bvar 109, bvar 117, bvar 655, bvar 663]),
    bnot (bands [bvar 109, bvar 118, bvar 655, bvar 664]),
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
    atMost [bands [bvar 613, bvar 145], bands [bvar 614, bvar 146], bands [bvar 615, bvar 147], bands [bvar 616, bvar 148], bands [bvar 617, bvar 149], bands [bvar 618, bvar 150], bands [bvar 619, bvar 151], bands [bvar 620, bvar 152], bands [bvar 621, bvar 153], bands [bvar 622, bvar 154], bands [bvar 623, bvar 155], bands [bvar 624, bvar 156], bands [bvar 625, bvar 157]] 2,
    bnot (bands [bvar 613, bvar 614, bvar 145, bvar 146]),
    bnot (bands [bvar 613, bvar 615, bvar 145, bvar 147]),
    bnot (bands [bvar 613, bvar 616, bvar 145, bvar 148]),
    bnot (bands [bvar 613, bvar 617, bvar 145, bvar 149]),
    bnot (bands [bvar 613, bvar 618, bvar 145, bvar 150]),
    bnot (bands [bvar 613, bvar 623, bvar 145, bvar 155]),
    bnot (bands [bvar 613, bvar 624, bvar 145, bvar 156]),
    bnot (bands [bvar 613, bvar 625, bvar 145, bvar 157]),
    bnot (bands [bvar 614, bvar 617, bvar 146, bvar 149]),
    bnot (bands [bvar 614, bvar 618, bvar 146, bvar 150]),
    bnot (bands [bvar 614, bvar 623, bvar 146, bvar 155]),
    bnot (bands [bvar 614, bvar 624, bvar 146, bvar 156]),
    bnot (bands [bvar 614, bvar 625, bvar 146, bvar 157]),
    bnot (bands [bvar 615, bvar 617, bvar 147, bvar 149]),
    bnot (bands [bvar 615, bvar 618, bvar 147, bvar 150]),
    bnot (bands [bvar 615, bvar 624, bvar 147, bvar 156]),
    bnot (bands [bvar 615, bvar 625, bvar 147, bvar 157]),
    bnot (bands [bvar 616, bvar 617, bvar 148, bvar 149]),
    bnot (bands [bvar 616, bvar 618, bvar 148, bvar 150]),
    bnot (bands [bvar 616, bvar 623, bvar 148, bvar 155]),
    bnot (bands [bvar 616, bvar 624, bvar 148, bvar 156]),
    bnot (bands [bvar 616, bvar 625, bvar 148, bvar 157]),
    bnot (bands [bvar 617, bvar 618, bvar 149, bvar 150]),
    bnot (bands [bvar 617, bvar 623, bvar 149, bvar 155]),
    bnot (bands [bvar 617, bvar 624, bvar 149, bvar 156]),
    bnot (bands [bvar 617, bvar 625, bvar 149, bvar 157]),
    bnot (bands [bvar 618, bvar 623, bvar 150, bvar 155]),
    bnot (bands [bvar 618, bvar 624, bvar 150, bvar 156]),
    bnot (bands [bvar 618, bvar 625, bvar 150, bvar 157]),
    bnot (bands [bvar 620, bvar 621, bvar 152, bvar 153]),
    bnot (bands [bvar 623, bvar 624, bvar 155, bvar 156]),
    bnot (bands [bvar 623, bvar 625, bvar 155, bvar 157]),
    bnot (bands [bvar 624, bvar 625, bvar 156, bvar 157]),
    bnot (bands [bvar 108, bvar 110, bvar 667, bvar 669]),
    bnot (bands [bvar 108, bvar 117, bvar 667, bvar 676]),
    bnot (bands [bvar 109, bvar 110, bvar 668, bvar 669]),
    bnot (bands [bvar 613, bvar 617, bvar 158, bvar 162]),
    bnot (bands [bvar 613, bvar 624, bvar 158, bvar 169]),
    bnot (bands [bvar 614, bvar 617, bvar 159, bvar 162]),
    bnot (bands [bvar 614, bvar 624, bvar 159, bvar 169]),
    bnot (bands [bvar 615, bvar 617, bvar 160, bvar 162]),
    bnot (bands [bvar 616, bvar 617, bvar 161, bvar 162]),
    bnot (bands [bvar 617, bvar 624, bvar 162, bvar 169]),
    bnot (bands [bvar 617, bvar 625, bvar 162, bvar 170]),
    bnot (bands [bvar 620, bvar 621, bvar 165, bvar 166]),
    bnot (bands [bvar 621, bvar 622, bvar 166, bvar 167]),
    bnot (bands [bvar 624, bvar 625, bvar 169, bvar 170]),
    bnot (bands [bvar 613, bvar 614, bvar 171, bvar 172]),
    bnot (bands [bvar 613, bvar 616, bvar 171, bvar 174]) ]

def reducedUnionChunk112 : BVLogicalExpr :=
  bands reducedUnionChunk112Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
