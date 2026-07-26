import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk130Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 2, bvar 11, bvar 160, bvar 169]),
    bnot (bands [bvar 2, bvar 12, bvar 160, bvar 170]),
    bnot (bands [bvar 3, bvar 12, bvar 161, bvar 170]),
    bnot (bands [bvar 7, bvar 9, bvar 165, bvar 167]),
    bnot (bands [bvar 8, bvar 9, bvar 166, bvar 167]),
    bnot (bands [bvar 11, bvar 12, bvar 169, bvar 170]),
    bnot (bands [bvar 0, bvar 12, bvar 171, bvar 183]),
    bnot (bands [bvar 1, bvar 12, bvar 172, bvar 183]),
    bnot (bands [bvar 2, bvar 12, bvar 173, bvar 183]),
    bnot (bands [bvar 3, bvar 12, bvar 174, bvar 183]),
    bnot (bands [bvar 5, bvar 10, bvar 176, bvar 181]),
    bnot (bands [bvar 6, bvar 7, bvar 177, bvar 178]),
    bnot (bands [bvar 6, bvar 8, bvar 177, bvar 179]),
    bnot (bands [bvar 6, bvar 9, bvar 177, bvar 180]),
    bnot (bands [bvar 6, bvar 10, bvar 177, bvar 181]),
    bnot (bands [bvar 7, bvar 9, bvar 178, bvar 180]),
    bnot (bands [bvar 7, bvar 10, bvar 178, bvar 181]),
    bnot (bands [bvar 8, bvar 9, bvar 179, bvar 180]),
    bnot (bands [bvar 8, bvar 10, bvar 179, bvar 181]),
    bnot (bands [bvar 9, bvar 10, bvar 180, bvar 181]),
    bnot (bands [bvar 6, bvar 8, bvar 190, bvar 192]),
    bnot (bands [bvar 6, bvar 10, bvar 190, bvar 194]),
    bnot (bands [bvar 6, bvar 11, bvar 190, bvar 195]),
    bnot (bands [bvar 7, bvar 10, bvar 191, bvar 194]),
    bnot (bands [bvar 7, bvar 11, bvar 191, bvar 195]),
    bnot (bands [bvar 8, bvar 10, bvar 192, bvar 194]),
    bnot (bands [bvar 9, bvar 11, bvar 193, bvar 195]),
    bnot (bands [bvar 10, bvar 11, bvar 194, bvar 195]),
    bnot (bands [bvar 3, bvar 10, bvar 135, bvar 142]),
    bnot (bands [bvar 3, bvar 12, bvar 135, bvar 144]),
    bnot (bands [bvar 6, bvar 12, bvar 34, bvar 40]),
    bnot (bands [bvar 5, bvar 12, bvar 59, bvar 66]),
    bnot (bands [bvar 5, bvar 9, bvar 72, bvar 76]),
    bnot (bands [bvar 5, bvar 11, bvar 72, bvar 78]),
    bnot (bands [bvar 6, bvar 11, bvar 73, bvar 78]),
    bnot (bands [bvar 8, bvar 12, bvar 75, bvar 79]),
    bnot (bands [bvar 9, bvar 11, bvar 76, bvar 78]),
    bnot (bands [bvar 11, bvar 12, bvar 78, bvar 79]),
    bnot (bands [bvar 5, bvar 6, bvar 540, bvar 541]),
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
    bnot (bands [bvar 8, bvar 10, bvar 543, bvar 545]),
    bnot (bands [bvar 9, bvar 12, bvar 544, bvar 547]),
    bnot (bands [bvar 10, bvar 11, bvar 545, bvar 546]),
    bnot (bands [bvar 10, bvar 12, bvar 545, bvar 547]),
    bnot (bands [bvar 1, bvar 5, bvar 562, bvar 566]),
    bnot (bands [bvar 1, bvar 6, bvar 562, bvar 567]),
    bnot (bands [bvar 1, bvar 7, bvar 562, bvar 568]),
    bnot (bands [bvar 1, bvar 8, bvar 562, bvar 569]) ]

def reducedUnionChunk130 : BVLogicalExpr :=
  bands reducedUnionChunk130Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
