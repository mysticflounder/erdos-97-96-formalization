import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk106Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 562, bvar 570, bvar 68, bvar 76]),
    bnot (bands [bvar 562, bvar 571, bvar 68, bvar 77]),
    bnot (bands [bvar 562, bvar 572, bvar 68, bvar 78]),
    bnot (bands [bvar 562, bvar 573, bvar 68, bvar 79]),
    bnot (bands [bvar 566, bvar 567, bvar 72, bvar 73]),
    bnot (bands [bvar 567, bvar 571, bvar 73, bvar 77]),
    bnot (bands [bvar 567, bvar 572, bvar 73, bvar 78]),
    bnot (bands [bvar 567, bvar 573, bvar 73, bvar 79]),
    bnot (bands [bvar 568, bvar 571, bvar 74, bvar 77]),
    bnot (bands [bvar 568, bvar 572, bvar 74, bvar 78]),
    bnot (bands [bvar 570, bvar 572, bvar 76, bvar 78]),
    bnot (bands [bvar 562, bvar 567, bvar 81, bvar 86]),
    bnot (bands [bvar 562, bvar 569, bvar 81, bvar 88]),
    bnot (bands [bvar 567, bvar 569, bvar 86, bvar 88]),
    bnot (bands [bvar 562, bvar 567, bvar 94, bvar 99]),
    bnot (bands [bvar 562, bvar 568, bvar 94, bvar 100]),
    bnot (bands [bvar 562, bvar 569, bvar 94, bvar 101]),
    bnot (bands [bvar 562, bvar 570, bvar 94, bvar 102]),
    bnot (bands [bvar 562, bvar 571, bvar 94, bvar 103]),
    bnot (bands [bvar 562, bvar 572, bvar 94, bvar 104]),
    bnot (bands [bvar 562, bvar 573, bvar 94, bvar 105]),
    bnot (bands [bvar 567, bvar 569, bvar 99, bvar 101]),
    bnot (bands [bvar 567, bvar 572, bvar 99, bvar 104]),
    bnot (bands [bvar 568, bvar 570, bvar 100, bvar 102]),
    bnot (bands [bvar 568, bvar 571, bvar 100, bvar 103]),
    bnot (bands [bvar 568, bvar 573, bvar 100, bvar 105]),
    bnot (bands [bvar 569, bvar 572, bvar 101, bvar 104]),
    bnot (bands [bvar 569, bvar 573, bvar 101, bvar 105]),
    bnot (bands [bvar 562, bvar 568, bvar 107, bvar 113]),
    bnot (bands [bvar 562, bvar 569, bvar 107, bvar 114]),
    bnot (bands [bvar 562, bvar 570, bvar 107, bvar 115]),
    bnot (bands [bvar 562, bvar 571, bvar 107, bvar 116]),
    bnot (bands [bvar 562, bvar 573, bvar 107, bvar 118]),
    bnot (bands [bvar 564, bvar 566, bvar 109, bvar 111]),
    bnot (bands [bvar 568, bvar 571, bvar 113, bvar 116]),
    bnot (bands [bvar 568, bvar 573, bvar 113, bvar 118]),
    bnot (bands [bvar 562, bvar 569, bvar 120, bvar 127]),
    bnot (bands [bvar 562, bvar 570, bvar 120, bvar 128]),
    bnot (bands [bvar 562, bvar 571, bvar 120, bvar 129]),
    bnot (bands [bvar 562, bvar 572, bvar 120, bvar 130]),
    bnot (bands [bvar 562, bvar 573, bvar 120, bvar 131]),
    bnot (bands [bvar 564, bvar 567, bvar 122, bvar 125]),
    bnot (bands [bvar 569, bvar 571, bvar 127, bvar 129]),
    bnot (bands [bvar 569, bvar 573, bvar 127, bvar 131]),
    bnot (bands [bvar 570, bvar 572, bvar 128, bvar 130]),
    bnot (bands [bvar 571, bvar 573, bvar 129, bvar 131]),
    bnot (bands [bvar 55, bvar 65, bvar 640, bvar 650]),
    bnot (bands [bvar 562, bvar 571, bvar 133, bvar 142]),
    bnot (bands [bvar 562, bvar 573, bvar 133, bvar 144]),
    bnot (bands [bvar 571, bvar 573, bvar 142, bvar 144]),
    bnot (bands [bvar 562, bvar 571, bvar 146, bvar 155]),
    bnot (bands [bvar 562, bvar 572, bvar 146, bvar 156]),
    bnot (bands [bvar 562, bvar 573, bvar 146, bvar 157]),
    bnot (bands [bvar 564, bvar 567, bvar 148, bvar 151]),
    bnot (bands [bvar 564, bvar 568, bvar 148, bvar 152]),
    bnot (bands [bvar 564, bvar 569, bvar 148, bvar 153]),
    bnot (bands [bvar 567, bvar 569, bvar 151, bvar 153]),
    bnot (bands [bvar 568, bvar 569, bvar 152, bvar 153]),
    bnot (bands [bvar 571, bvar 573, bvar 155, bvar 157]),
    bnot (bands [bvar 572, bvar 573, bvar 156, bvar 157]),
    bnot (bands [bvar 562, bvar 572, bvar 159, bvar 169]),
    bnot (bands [bvar 562, bvar 573, bvar 159, bvar 170]),
    bnot (bands [bvar 564, bvar 567, bvar 161, bvar 164]),
    bnot (bands [bvar 564, bvar 568, bvar 161, bvar 165]) ]

def reducedUnionChunk106 : BVLogicalExpr :=
  bands reducedUnionChunk106Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
