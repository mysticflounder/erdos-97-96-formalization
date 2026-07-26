import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk112Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 600, bvar 608, bvar 119, bvar 127]),
    bnot (bands [bvar 600, bvar 609, bvar 119, bvar 128]),
    bnot (bands [bvar 600, bvar 610, bvar 119, bvar 129]),
    bnot (bands [bvar 600, bvar 611, bvar 119, bvar 130]),
    bnot (bands [bvar 600, bvar 612, bvar 119, bvar 131]),
    bnot (bands [bvar 601, bvar 604, bvar 120, bvar 123]),
    bnot (bands [bvar 601, bvar 608, bvar 120, bvar 127]),
    bnot (bands [bvar 601, bvar 610, bvar 120, bvar 129]),
    bnot (bands [bvar 601, bvar 611, bvar 120, bvar 130]),
    bnot (bands [bvar 601, bvar 612, bvar 120, bvar 131]),
    bnot (bands [bvar 602, bvar 604, bvar 121, bvar 123]),
    bnot (bands [bvar 602, bvar 608, bvar 121, bvar 127]),
    bnot (bands [bvar 602, bvar 609, bvar 121, bvar 128]),
    bnot (bands [bvar 602, bvar 610, bvar 121, bvar 129]),
    bnot (bands [bvar 602, bvar 611, bvar 121, bvar 130]),
    bnot (bands [bvar 602, bvar 612, bvar 121, bvar 131]),
    bnot (bands [bvar 603, bvar 604, bvar 122, bvar 123]),
    bnot (bands [bvar 603, bvar 608, bvar 122, bvar 127]),
    bnot (bands [bvar 603, bvar 609, bvar 122, bvar 128]),
    bnot (bands [bvar 603, bvar 610, bvar 122, bvar 129]),
    bnot (bands [bvar 603, bvar 611, bvar 122, bvar 130]),
    bnot (bands [bvar 603, bvar 612, bvar 122, bvar 131]),
    bnot (bands [bvar 604, bvar 608, bvar 123, bvar 127]),
    bnot (bands [bvar 604, bvar 609, bvar 123, bvar 128]),
    bnot (bands [bvar 604, bvar 610, bvar 123, bvar 129]),
    bnot (bands [bvar 604, bvar 611, bvar 123, bvar 130]),
    bnot (bands [bvar 604, bvar 612, bvar 123, bvar 131]),
    bnot (bands [bvar 608, bvar 609, bvar 127, bvar 128]),
    bnot (bands [bvar 608, bvar 610, bvar 127, bvar 129]),
    bnot (bands [bvar 608, bvar 611, bvar 127, bvar 130]),
    bnot (bands [bvar 608, bvar 612, bvar 127, bvar 131]),
    bnot (bands [bvar 609, bvar 610, bvar 128, bvar 129]),
    bnot (bands [bvar 609, bvar 611, bvar 128, bvar 130]),
    bnot (bands [bvar 609, bvar 612, bvar 128, bvar 131]),
    bnot (bands [bvar 610, bvar 611, bvar 129, bvar 130]),
    bnot (bands [bvar 610, bvar 612, bvar 129, bvar 131]),
    bnot (bands [bvar 611, bvar 612, bvar 130, bvar 131]),
    bnot (bands [bvar 93, bvar 94, bvar 639, bvar 640]),
    bnot (bands [bvar 93, bvar 97, bvar 639, bvar 643]),
    bnot (bands [bvar 93, bvar 102, bvar 639, bvar 648]),
    bnot (bands [bvar 93, bvar 104, bvar 639, bvar 650]),
    bnot (bands [bvar 93, bvar 105, bvar 639, bvar 651]),
    bnot (bands [bvar 94, bvar 97, bvar 640, bvar 643]),
    bnot (bands [bvar 94, bvar 102, bvar 640, bvar 648]),
    bnot (bands [bvar 94, bvar 103, bvar 640, bvar 649]),
    bnot (bands [bvar 94, bvar 104, bvar 640, bvar 650]),
    bnot (bands [bvar 94, bvar 105, bvar 640, bvar 651]),
    bnot (bands [bvar 96, bvar 102, bvar 642, bvar 648]),
    bnot (bands [bvar 97, bvar 102, bvar 643, bvar 648]),
    bnot (bands [bvar 97, bvar 103, bvar 643, bvar 649]),
    bnot (bands [bvar 97, bvar 104, bvar 643, bvar 650]),
    bnot (bands [bvar 97, bvar 105, bvar 643, bvar 651]),
    bnot (bands [bvar 600, bvar 603, bvar 132, bvar 135]),
    bnot (bands [bvar 600, bvar 604, bvar 132, bvar 136]),
    bnot (bands [bvar 600, bvar 609, bvar 132, bvar 141]),
    bnot (bands [bvar 600, bvar 610, bvar 132, bvar 142]),
    bnot (bands [bvar 600, bvar 611, bvar 132, bvar 143]),
    bnot (bands [bvar 601, bvar 609, bvar 133, bvar 141]),
    bnot (bands [bvar 603, bvar 604, bvar 135, bvar 136]),
    bnot (bands [bvar 603, bvar 609, bvar 135, bvar 141]),
    bnot (bands [bvar 603, bvar 610, bvar 135, bvar 142]),
    bnot (bands [bvar 603, bvar 611, bvar 135, bvar 143]),
    bnot (bands [bvar 603, bvar 612, bvar 135, bvar 144]),
    bnot (bands [bvar 604, bvar 609, bvar 136, bvar 141]) ]

def reducedUnionChunk112 : BVLogicalExpr :=
  bands reducedUnionChunk112Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
