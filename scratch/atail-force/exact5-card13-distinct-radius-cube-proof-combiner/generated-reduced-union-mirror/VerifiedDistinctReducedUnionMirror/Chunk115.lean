import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk115Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 111, bvar 117, bvar 631, bvar 637]),
    bnot (bands [bvar 111, bvar 118, bvar 631, bvar 638]),
    bnot (bands [bvar 114, bvar 115, bvar 634, bvar 635]),
    bnot (bands [bvar 114, bvar 116, bvar 634, bvar 636]),
    bnot (bands [bvar 115, bvar 116, bvar 635, bvar 636]),
    bnot (bands [bvar 115, bvar 117, bvar 635, bvar 637]),
    bnot (bands [bvar 613, bvar 614, bvar 119, bvar 120]),
    bnot (bands [bvar 613, bvar 615, bvar 119, bvar 121]),
    bnot (bands [bvar 613, bvar 616, bvar 119, bvar 122]),
    bnot (bands [bvar 613, bvar 617, bvar 119, bvar 123]),
    bnot (bands [bvar 613, bvar 618, bvar 119, bvar 124]),
    bnot (bands [bvar 613, bvar 621, bvar 119, bvar 127]),
    bnot (bands [bvar 613, bvar 622, bvar 119, bvar 128]),
    bnot (bands [bvar 613, bvar 623, bvar 119, bvar 129]),
    bnot (bands [bvar 613, bvar 624, bvar 119, bvar 130]),
    bnot (bands [bvar 613, bvar 625, bvar 119, bvar 131]),
    bnot (bands [bvar 614, bvar 617, bvar 120, bvar 123]),
    bnot (bands [bvar 614, bvar 621, bvar 120, bvar 127]),
    bnot (bands [bvar 614, bvar 623, bvar 120, bvar 129]),
    bnot (bands [bvar 614, bvar 624, bvar 120, bvar 130]),
    bnot (bands [bvar 614, bvar 625, bvar 120, bvar 131]),
    bnot (bands [bvar 615, bvar 617, bvar 121, bvar 123]),
    bnot (bands [bvar 615, bvar 621, bvar 121, bvar 127]),
    bnot (bands [bvar 615, bvar 622, bvar 121, bvar 128]),
    bnot (bands [bvar 615, bvar 623, bvar 121, bvar 129]),
    bnot (bands [bvar 615, bvar 624, bvar 121, bvar 130]),
    bnot (bands [bvar 615, bvar 625, bvar 121, bvar 131]),
    bnot (bands [bvar 616, bvar 617, bvar 122, bvar 123]),
    bnot (bands [bvar 616, bvar 621, bvar 122, bvar 127]),
    bnot (bands [bvar 616, bvar 622, bvar 122, bvar 128]),
    bnot (bands [bvar 616, bvar 623, bvar 122, bvar 129]),
    bnot (bands [bvar 616, bvar 624, bvar 122, bvar 130]),
    bnot (bands [bvar 616, bvar 625, bvar 122, bvar 131]),
    bnot (bands [bvar 617, bvar 618, bvar 123, bvar 124]),
    bnot (bands [bvar 617, bvar 621, bvar 123, bvar 127]),
    bnot (bands [bvar 617, bvar 622, bvar 123, bvar 128]),
    bnot (bands [bvar 617, bvar 623, bvar 123, bvar 129]),
    bnot (bands [bvar 617, bvar 624, bvar 123, bvar 130]),
    bnot (bands [bvar 617, bvar 625, bvar 123, bvar 131]),
    bnot (bands [bvar 618, bvar 621, bvar 124, bvar 127]),
    bnot (bands [bvar 618, bvar 622, bvar 124, bvar 128]),
    bnot (bands [bvar 618, bvar 623, bvar 124, bvar 129]),
    bnot (bands [bvar 618, bvar 624, bvar 124, bvar 130]),
    bnot (bands [bvar 618, bvar 625, bvar 124, bvar 131]),
    bnot (bands [bvar 621, bvar 622, bvar 127, bvar 128]),
    bnot (bands [bvar 621, bvar 623, bvar 127, bvar 129]),
    bnot (bands [bvar 621, bvar 624, bvar 127, bvar 130]),
    bnot (bands [bvar 621, bvar 625, bvar 127, bvar 131]),
    bnot (bands [bvar 622, bvar 623, bvar 128, bvar 129]),
    bnot (bands [bvar 622, bvar 624, bvar 128, bvar 130]),
    bnot (bands [bvar 622, bvar 625, bvar 128, bvar 131]),
    bnot (bands [bvar 623, bvar 624, bvar 129, bvar 130]),
    bnot (bands [bvar 623, bvar 625, bvar 129, bvar 131]),
    bnot (bands [bvar 624, bvar 625, bvar 130, bvar 131]),
    bnot (bands [bvar 106, bvar 107, bvar 639, bvar 640]),
    bnot (bands [bvar 107, bvar 110, bvar 640, bvar 643]),
    bnot (bands [bvar 107, bvar 115, bvar 640, bvar 648]),
    bnot (bands [bvar 107, bvar 116, bvar 640, bvar 649]),
    bnot (bands [bvar 107, bvar 118, bvar 640, bvar 651]),
    bnot (bands [bvar 110, bvar 115, bvar 643, bvar 648]),
    bnot (bands [bvar 613, bvar 616, bvar 132, bvar 135]),
    bnot (bands [bvar 613, bvar 617, bvar 132, bvar 136]),
    bnot (bands [bvar 613, bvar 618, bvar 132, bvar 137]),
    bnot (bands [bvar 613, bvar 622, bvar 132, bvar 141]) ]

def reducedUnionChunk115 : BVLogicalExpr :=
  bands reducedUnionChunk115Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
