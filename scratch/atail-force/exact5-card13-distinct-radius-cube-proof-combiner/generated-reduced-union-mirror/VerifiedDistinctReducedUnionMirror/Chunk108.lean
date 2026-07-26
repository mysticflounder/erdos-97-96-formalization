import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk108Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 550, bvar 552, bvar 186, bvar 188]),
    bnot (bands [bvar 562, bvar 566, bvar 68, bvar 72]),
    bnot (bands [bvar 562, bvar 567, bvar 68, bvar 73]),
    bnot (bands [bvar 562, bvar 568, bvar 68, bvar 74]),
    bnot (bands [bvar 562, bvar 569, bvar 68, bvar 75]),
    bnot (bands [bvar 562, bvar 571, bvar 68, bvar 77]),
    bnot (bands [bvar 562, bvar 572, bvar 68, bvar 78]),
    bnot (bands [bvar 562, bvar 573, bvar 68, bvar 79]),
    bnot (bands [bvar 567, bvar 569, bvar 73, bvar 75]),
    bnot (bands [bvar 567, bvar 571, bvar 73, bvar 77]),
    bnot (bands [bvar 567, bvar 572, bvar 73, bvar 78]),
    bnot (bands [bvar 568, bvar 571, bvar 74, bvar 77]),
    bnot (bands [bvar 568, bvar 572, bvar 74, bvar 78]),
    bnot (bands [bvar 568, bvar 573, bvar 74, bvar 79]),
    bnot (bands [bvar 569, bvar 572, bvar 75, bvar 78]),
    bnot (bands [bvar 572, bvar 573, bvar 78, bvar 79]),
    bnot (bands [bvar 562, bvar 567, bvar 94, bvar 99]),
    bnot (bands [bvar 562, bvar 568, bvar 94, bvar 100]),
    bnot (bands [bvar 562, bvar 569, bvar 94, bvar 101]),
    bnot (bands [bvar 562, bvar 570, bvar 94, bvar 102]),
    bnot (bands [bvar 562, bvar 571, bvar 94, bvar 103]),
    bnot (bands [bvar 562, bvar 572, bvar 94, bvar 104]),
    bnot (bands [bvar 567, bvar 568, bvar 99, bvar 100]),
    bnot (bands [bvar 567, bvar 571, bvar 99, bvar 103]),
    bnot (bands [bvar 568, bvar 569, bvar 100, bvar 101]),
    bnot (bands [bvar 568, bvar 570, bvar 100, bvar 102]),
    bnot (bands [bvar 568, bvar 571, bvar 100, bvar 103]),
    bnot (bands [bvar 568, bvar 572, bvar 100, bvar 104]),
    bnot (bands [bvar 569, bvar 570, bvar 101, bvar 102]),
    bnot (bands [bvar 569, bvar 572, bvar 101, bvar 104]),
    bnot (bands [bvar 570, bvar 572, bvar 102, bvar 104]),
    bnot (bands [bvar 562, bvar 568, bvar 107, bvar 113]),
    bnot (bands [bvar 562, bvar 569, bvar 107, bvar 114]),
    bnot (bands [bvar 562, bvar 570, bvar 107, bvar 115]),
    bnot (bands [bvar 562, bvar 571, bvar 107, bvar 116]),
    bnot (bands [bvar 562, bvar 572, bvar 107, bvar 117]),
    bnot (bands [bvar 562, bvar 573, bvar 107, bvar 118]),
    bnot (bands [bvar 568, bvar 571, bvar 113, bvar 116]),
    bnot (bands [bvar 569, bvar 570, bvar 114, bvar 115]),
    bnot (bands [bvar 569, bvar 571, bvar 114, bvar 116]),
    bnot (bands [bvar 569, bvar 572, bvar 114, bvar 117]),
    bnot (bands [bvar 569, bvar 573, bvar 114, bvar 118]),
    bnot (bands [bvar 570, bvar 571, bvar 115, bvar 116]),
    bnot (bands [bvar 571, bvar 572, bvar 116, bvar 117]),
    bnot (bands [bvar 572, bvar 573, bvar 117, bvar 118]),
    bnot (bands [bvar 562, bvar 569, bvar 120, bvar 127]),
    bnot (bands [bvar 562, bvar 570, bvar 120, bvar 128]),
    bnot (bands [bvar 562, bvar 571, bvar 120, bvar 129]),
    bnot (bands [bvar 562, bvar 572, bvar 120, bvar 130]),
    bnot (bands [bvar 562, bvar 573, bvar 120, bvar 131]),
    bnot (bands [bvar 564, bvar 566, bvar 122, bvar 124]),
    bnot (bands [bvar 564, bvar 567, bvar 122, bvar 125]),
    bnot (bands [bvar 569, bvar 570, bvar 127, bvar 128]),
    bnot (bands [bvar 569, bvar 571, bvar 127, bvar 129]),
    bnot (bands [bvar 569, bvar 572, bvar 127, bvar 130]),
    bnot (bands [bvar 570, bvar 573, bvar 128, bvar 131]),
    bnot (bands [bvar 571, bvar 572, bvar 129, bvar 130]),
    bnot (bands [bvar 55, bvar 65, bvar 640, bvar 650]),
    bnot (bands [bvar 562, bvar 570, bvar 133, bvar 141]),
    bnot (bands [bvar 562, bvar 571, bvar 133, bvar 142]),
    bnot (bands [bvar 562, bvar 572, bvar 133, bvar 143]),
    bnot (bands [bvar 564, bvar 568, bvar 135, bvar 139]),
    bnot (bands [bvar 562, bvar 571, bvar 146, bvar 155]),
    bnot (bands [bvar 562, bvar 572, bvar 146, bvar 156]) ]

def reducedUnionChunk108 : BVLogicalExpr :=
  bands reducedUnionChunk108Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
