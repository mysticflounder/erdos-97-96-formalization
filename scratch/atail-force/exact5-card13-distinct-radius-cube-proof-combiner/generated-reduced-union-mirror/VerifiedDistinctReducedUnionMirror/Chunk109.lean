import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk109Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 562, bvar 573, bvar 146, bvar 157]),
    bnot (bands [bvar 564, bvar 566, bvar 148, bvar 150]),
    bnot (bands [bvar 564, bvar 567, bvar 148, bvar 151]),
    bnot (bands [bvar 564, bvar 568, bvar 148, bvar 152]),
    bnot (bands [bvar 564, bvar 569, bvar 148, bvar 153]),
    bnot (bands [bvar 566, bvar 567, bvar 150, bvar 151]),
    bnot (bands [bvar 566, bvar 569, bvar 150, bvar 153]),
    bnot (bands [bvar 568, bvar 569, bvar 152, bvar 153]),
    bnot (bands [bvar 571, bvar 573, bvar 155, bvar 157]),
    bnot (bands [bvar 572, bvar 573, bvar 156, bvar 157]),
    bnot (bands [bvar 562, bvar 572, bvar 159, bvar 169]),
    bnot (bands [bvar 562, bvar 573, bvar 159, bvar 170]),
    bnot (bands [bvar 564, bvar 567, bvar 161, bvar 164]),
    bnot (bands [bvar 564, bvar 568, bvar 161, bvar 165]),
    bnot (bands [bvar 564, bvar 569, bvar 161, bvar 166]),
    bnot (bands [bvar 564, bvar 570, bvar 161, bvar 167]),
    bnot (bands [bvar 567, bvar 570, bvar 164, bvar 167]),
    bnot (bands [bvar 568, bvar 569, bvar 165, bvar 166]),
    bnot (bands [bvar 568, bvar 570, bvar 165, bvar 167]),
    bnot (bands [bvar 572, bvar 573, bvar 169, bvar 170]),
    bnot (bands [bvar 57, bvar 59, bvar 681, bvar 683]),
    bnot (bands [bvar 57, bvar 63, bvar 681, bvar 687]),
    bnot (bands [bvar 59, bvar 63, bvar 683, bvar 687]),
    bnot (bands [bvar 59, bvar 64, bvar 683, bvar 688]),
    bnot (bands [bvar 562, bvar 573, bvar 172, bvar 183]),
    bnot (bands [bvar 564, bvar 566, bvar 174, bvar 176]),
    bnot (bands [bvar 564, bvar 567, bvar 174, bvar 177]),
    bnot (bands [bvar 564, bvar 568, bvar 174, bvar 178]),
    bnot (bands [bvar 564, bvar 569, bvar 174, bvar 179]),
    bnot (bands [bvar 564, bvar 570, bvar 174, bvar 180]),
    bnot (bands [bvar 564, bvar 571, bvar 174, bvar 181]),
    bnot (bands [bvar 566, bvar 568, bvar 176, bvar 178]),
    bnot (bands [bvar 568, bvar 570, bvar 178, bvar 180]),
    bnot (bands [bvar 568, bvar 571, bvar 178, bvar 181]),
    bnot (bands [bvar 569, bvar 571, bvar 179, bvar 181]),
    bnot (bands [bvar 57, bvar 63, bvar 694, bvar 700]),
    bnot (bands [bvar 57, bvar 64, bvar 694, bvar 701]),
    bnot (bands [bvar 564, bvar 567, bvar 187, bvar 190]),
    bnot (bands [bvar 564, bvar 568, bvar 187, bvar 191]),
    bnot (bands [bvar 564, bvar 569, bvar 187, bvar 192]),
    bnot (bands [bvar 564, bvar 570, bvar 187, bvar 193]),
    bnot (bands [bvar 564, bvar 571, bvar 187, bvar 194]),
    bnot (bands [bvar 564, bvar 572, bvar 187, bvar 195]),
    bnot (bands [bvar 567, bvar 571, bvar 190, bvar 194]),
    bnot (bands [bvar 567, bvar 572, bvar 190, bvar 195]),
    bnot (bands [bvar 568, bvar 570, bvar 191, bvar 193]),
    bnot (bands [bvar 568, bvar 571, bvar 191, bvar 194]),
    bnot (bands [bvar 569, bvar 571, bvar 192, bvar 194]),
    bnot (bands [bvar 571, bvar 572, bvar 194, bvar 195]),
    bnot (bands [bvar 581, bvar 585, bvar 100, bvar 104]),
    bnot (bands [bvar 68, bvar 74, bvar 614, bvar 620]),
    bnot (bands [bvar 68, bvar 75, bvar 614, bvar 621]),
    bnot (bands [bvar 68, bvar 76, bvar 614, bvar 622]),
    bnot (bands [bvar 68, bvar 77, bvar 614, bvar 623]),
    bnot (bands [bvar 69, bvar 74, bvar 615, bvar 620]),
    bnot (bands [bvar 69, bvar 76, bvar 615, bvar 622]),
    bnot (bands [bvar 69, bvar 77, bvar 615, bvar 623]),
    bnot (bands [bvar 69, bvar 79, bvar 615, bvar 625]),
    bnot (bands [bvar 71, bvar 72, bvar 617, bvar 618]),
    bnot (bands [bvar 74, bvar 75, bvar 620, bvar 621]),
    bnot (bands [bvar 74, bvar 76, bvar 620, bvar 622]),
    bnot (bands [bvar 74, bvar 77, bvar 620, bvar 623]),
    bnot (bands [bvar 74, bvar 78, bvar 620, bvar 624]),
    bnot (bands [bvar 74, bvar 79, bvar 620, bvar 625]) ]

def reducedUnionChunk109 : BVLogicalExpr :=
  bands reducedUnionChunk109Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
