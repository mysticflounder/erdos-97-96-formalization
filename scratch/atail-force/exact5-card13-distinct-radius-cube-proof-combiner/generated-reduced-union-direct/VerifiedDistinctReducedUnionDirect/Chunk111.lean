import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk111Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 600, bvar 604, bvar 184, bvar 188]),
    bnot (bands [bvar 601, bvar 604, bvar 185, bvar 188]),
    bnot (bands [bvar 602, bvar 604, bvar 186, bvar 188]),
    bnot (bands [bvar 603, bvar 604, bvar 187, bvar 188]),
    bnot (bands [bvar 606, bvar 608, bvar 190, bvar 192]),
    bnot (bands [bvar 606, bvar 609, bvar 190, bvar 193]),
    bnot (bands [bvar 606, bvar 610, bvar 190, bvar 194]),
    bnot (bands [bvar 607, bvar 608, bvar 191, bvar 192]),
    bnot (bands [bvar 607, bvar 610, bvar 191, bvar 194]),
    bnot (bands [bvar 608, bvar 610, bvar 192, bvar 194]),
    bnot (bands [bvar 608, bvar 611, bvar 192, bvar 195]),
    bnot (bands [bvar 609, bvar 610, bvar 193, bvar 194]),
    bnot (bands [bvar 609, bvar 611, bvar 193, bvar 195]),
    bnot (bands [bvar 610, bvar 611, bvar 194, bvar 195]),
    bnot (bands [bvar 616, bvar 617, bvar 122, bvar 123]),
    bnot (bands [bvar 616, bvar 621, bvar 122, bvar 127]),
    bnot (bands [bvar 616, bvar 625, bvar 122, bvar 131]),
    bnot (bands [bvar 617, bvar 621, bvar 123, bvar 127]),
    bnot (bands [bvar 617, bvar 623, bvar 123, bvar 129]),
    bnot (bands [bvar 617, bvar 624, bvar 123, bvar 130]),
    bnot (bands [bvar 621, bvar 623, bvar 127, bvar 129]),
    bnot (bands [bvar 621, bvar 625, bvar 127, bvar 131]),
    bnot (bands [bvar 623, bvar 625, bvar 129, bvar 131]),
    bnot (bands [bvar 107, bvar 110, bvar 640, bvar 643]),
    bnot (bands [bvar 107, bvar 115, bvar 640, bvar 648]),
    bnot (bands [bvar 107, bvar 116, bvar 640, bvar 649]),
    bnot (bands [bvar 107, bvar 118, bvar 640, bvar 651]),
    bnot (bands [bvar 110, bvar 116, bvar 643, bvar 649]),
    bnot (bands [bvar 613, bvar 616, bvar 132, bvar 135]),
    bnot (bands [bvar 613, bvar 617, bvar 132, bvar 136]),
    bnot (bands [bvar 613, bvar 618, bvar 132, bvar 137]),
    bnot (bands [bvar 613, bvar 622, bvar 132, bvar 141]),
    bnot (bands [bvar 613, bvar 624, bvar 132, bvar 143]),
    bnot (bands [bvar 613, bvar 625, bvar 132, bvar 144]),
    bnot (bands [bvar 614, bvar 618, bvar 133, bvar 137]),
    bnot (bands [bvar 615, bvar 618, bvar 134, bvar 137]),
    bnot (bands [bvar 616, bvar 617, bvar 135, bvar 136]),
    bnot (bands [bvar 616, bvar 618, bvar 135, bvar 137]),
    bnot (bands [bvar 616, bvar 622, bvar 135, bvar 141]),
    bnot (bands [bvar 616, bvar 623, bvar 135, bvar 142]),
    bnot (bands [bvar 616, bvar 624, bvar 135, bvar 143]),
    bnot (bands [bvar 616, bvar 625, bvar 135, bvar 144]),
    bnot (bands [bvar 617, bvar 622, bvar 136, bvar 141]),
    bnot (bands [bvar 617, bvar 623, bvar 136, bvar 142]),
    bnot (bands [bvar 617, bvar 624, bvar 136, bvar 143]),
    bnot (bands [bvar 617, bvar 625, bvar 136, bvar 144]),
    bnot (bands [bvar 618, bvar 622, bvar 137, bvar 141]),
    bnot (bands [bvar 618, bvar 623, bvar 137, bvar 142]),
    bnot (bands [bvar 618, bvar 624, bvar 137, bvar 143]),
    bnot (bands [bvar 623, bvar 624, bvar 142, bvar 143]),
    bnot (bands [bvar 106, bvar 108, bvar 652, bvar 654]),
    bnot (bands [bvar 106, bvar 110, bvar 652, bvar 656]),
    bnot (bands [bvar 106, bvar 111, bvar 652, bvar 657]),
    bnot (bands [bvar 106, bvar 116, bvar 652, bvar 662]),
    bnot (bands [bvar 106, bvar 117, bvar 652, bvar 663]),
    bnot (bands [bvar 107, bvar 110, bvar 653, bvar 656]),
    bnot (bands [bvar 107, bvar 111, bvar 653, bvar 657]),
    bnot (bands [bvar 107, bvar 117, bvar 653, bvar 663]),
    bnot (bands [bvar 107, bvar 118, bvar 653, bvar 664]),
    bnot (bands [bvar 108, bvar 110, bvar 654, bvar 656]),
    bnot (bands [bvar 108, bvar 111, bvar 654, bvar 657]),
    bnot (bands [bvar 108, bvar 117, bvar 654, bvar 663]),
    bnot (bands [bvar 108, bvar 118, bvar 654, bvar 664]),
    bnot (bands [bvar 109, bvar 110, bvar 655, bvar 656]) ]

def reducedUnionChunk111 : BVLogicalExpr :=
  bands reducedUnionChunk111Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
