import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk139Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 5, bvar 6, bvar 540, bvar 541]),
    bnot (bands [bvar 5, bvar 7, bvar 540, bvar 542]),
    bnot (bands [bvar 5, bvar 8, bvar 540, bvar 543]),
    bnot (bands [bvar 5, bvar 9, bvar 540, bvar 544]),
    bnot (bands [bvar 5, bvar 10, bvar 540, bvar 545]),
    bnot (bands [bvar 5, bvar 11, bvar 540, bvar 546]),
    bnot (bands [bvar 5, bvar 12, bvar 540, bvar 547]),
    bnot (bands [bvar 6, bvar 7, bvar 541, bvar 542]),
    bnot (bands [bvar 6, bvar 8, bvar 541, bvar 543]),
    bnot (bands [bvar 6, bvar 9, bvar 541, bvar 544]),
    bnot (bands [bvar 6, bvar 10, bvar 541, bvar 545]),
    bnot (bands [bvar 6, bvar 11, bvar 541, bvar 546]),
    bnot (bands [bvar 6, bvar 12, bvar 541, bvar 547]),
    bnot (bands [bvar 7, bvar 8, bvar 542, bvar 543]),
    bnot (bands [bvar 7, bvar 9, bvar 542, bvar 544]),
    bnot (bands [bvar 7, bvar 10, bvar 542, bvar 545]),
    bnot (bands [bvar 7, bvar 11, bvar 542, bvar 546]),
    bnot (bands [bvar 7, bvar 12, bvar 542, bvar 547]),
    bnot (bands [bvar 10, bvar 11, bvar 545, bvar 546]),
    bnot (bands [bvar 10, bvar 12, bvar 545, bvar 547]),
    bnot (bands [bvar 0, bvar 8, bvar 548, bvar 556]),
    bnot (bands [bvar 0, bvar 11, bvar 548, bvar 559]),
    bnot (bands [bvar 0, bvar 12, bvar 548, bvar 560]),
    bnot (bands [bvar 5, bvar 10, bvar 553, bvar 558]),
    bnot (bands [bvar 8, bvar 12, bvar 556, bvar 560]),
    bnot (bands [bvar 9, bvar 10, bvar 557, bvar 558]),
    bnot (bands [bvar 1, bvar 5, bvar 562, bvar 566]),
    bnot (bands [bvar 1, bvar 6, bvar 562, bvar 567]),
    bnot (bands [bvar 1, bvar 7, bvar 562, bvar 568]),
    bnot (bands [bvar 1, bvar 8, bvar 562, bvar 569]),
    bnot (bands [bvar 1, bvar 9, bvar 562, bvar 570]),
    bnot (bands [bvar 1, bvar 10, bvar 562, bvar 571]),
    bnot (bands [bvar 1, bvar 11, bvar 562, bvar 572]),
    bnot (bands [bvar 1, bvar 12, bvar 562, bvar 573]),
    bnot (bands [bvar 5, bvar 10, bvar 566, bvar 571]),
    bnot (bands [bvar 6, bvar 7, bvar 567, bvar 568]),
    bnot (bands [bvar 6, bvar 8, bvar 567, bvar 569]),
    bnot (bands [bvar 6, bvar 9, bvar 567, bvar 570]),
    bnot (bands [bvar 6, bvar 10, bvar 567, bvar 571]),
    bnot (bands [bvar 6, bvar 11, bvar 567, bvar 572]),
    bnot (bands [bvar 6, bvar 12, bvar 567, bvar 573]),
    bnot (bands [bvar 7, bvar 8, bvar 568, bvar 569]),
    bnot (bands [bvar 7, bvar 9, bvar 568, bvar 570]),
    bnot (bands [bvar 7, bvar 10, bvar 568, bvar 571]),
    bnot (bands [bvar 7, bvar 11, bvar 568, bvar 572]),
    bnot (bands [bvar 7, bvar 12, bvar 568, bvar 573]),
    bnot (bands [bvar 8, bvar 9, bvar 569, bvar 570]),
    bnot (bands [bvar 8, bvar 10, bvar 569, bvar 571]),
    bnot (bands [bvar 8, bvar 11, bvar 569, bvar 572]),
    bnot (bands [bvar 8, bvar 12, bvar 569, bvar 573]),
    bnot (bands [bvar 9, bvar 10, bvar 570, bvar 571]),
    bnot (bands [bvar 9, bvar 11, bvar 570, bvar 572]),
    bnot (bands [bvar 9, bvar 12, bvar 570, bvar 573]),
    bnot (bands [bvar 10, bvar 11, bvar 571, bvar 572]),
    bnot (bands [bvar 10, bvar 12, bvar 571, bvar 573]),
    bnot (bands [bvar 11, bvar 12, bvar 572, bvar 573]),
    bnot (bands [bvar 0, bvar 6, bvar 574, bvar 580]),
    bnot (bands [bvar 0, bvar 8, bvar 574, bvar 582]),
    bnot (bands [bvar 0, bvar 11, bvar 574, bvar 585]),
    bnot (bands [bvar 0, bvar 12, bvar 574, bvar 586]),
    bnot (bands [bvar 1, bvar 5, bvar 575, bvar 579]),
    bnot (bands [bvar 1, bvar 12, bvar 575, bvar 586]),
    bnot (bands [bvar 2, bvar 5, bvar 576, bvar 579]),
    bnot (bands [bvar 5, bvar 9, bvar 579, bvar 583]) ]

def reducedUnionChunk139 : BVLogicalExpr :=
  bands reducedUnionChunk139Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
