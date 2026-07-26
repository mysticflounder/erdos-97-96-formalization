import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk102Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 536, bvar 539, bvar 146, bvar 149]),
    bnot (bands [bvar 536, bvar 540, bvar 146, bvar 150]),
    bnot (bands [bvar 536, bvar 541, bvar 146, bvar 151]),
    bnot (bands [bvar 536, bvar 542, bvar 146, bvar 152]),
    bnot (bands [bvar 536, bvar 543, bvar 146, bvar 153]),
    bnot (bands [bvar 537, bvar 539, bvar 147, bvar 149]),
    bnot (bands [bvar 537, bvar 540, bvar 147, bvar 150]),
    bnot (bands [bvar 537, bvar 541, bvar 147, bvar 151]),
    bnot (bands [bvar 537, bvar 542, bvar 147, bvar 152]),
    bnot (bands [bvar 537, bvar 543, bvar 147, bvar 153]),
    bnot (bands [bvar 538, bvar 539, bvar 148, bvar 149]),
    bnot (bands [bvar 538, bvar 540, bvar 148, bvar 150]),
    bnot (bands [bvar 538, bvar 542, bvar 148, bvar 152]),
    bnot (bands [bvar 539, bvar 540, bvar 149, bvar 150]),
    bnot (bands [bvar 539, bvar 541, bvar 149, bvar 151]),
    bnot (bands [bvar 539, bvar 542, bvar 149, bvar 152]),
    bnot (bands [bvar 539, bvar 543, bvar 149, bvar 153]),
    bnot (bands [bvar 540, bvar 541, bvar 150, bvar 151]),
    bnot (bands [bvar 540, bvar 542, bvar 150, bvar 152]),
    bnot (bands [bvar 540, bvar 543, bvar 150, bvar 153]),
    bnot (bands [bvar 541, bvar 542, bvar 151, bvar 152]),
    bnot (bands [bvar 541, bvar 543, bvar 151, bvar 153]),
    bnot (bands [bvar 542, bvar 543, bvar 152, bvar 153]),
    bnot (bands [bvar 545, bvar 546, bvar 155, bvar 156]),
    bnot (bands [bvar 545, bvar 547, bvar 155, bvar 157]),
    bnot (bands [bvar 546, bvar 547, bvar 156, bvar 157]),
    bnot (bands [bvar 29, bvar 32, bvar 666, bvar 669]),
    bnot (bands [bvar 29, bvar 33, bvar 666, bvar 670]),
    bnot (bands [bvar 29, bvar 34, bvar 666, bvar 671]),
    bnot (bands [bvar 29, bvar 35, bvar 666, bvar 672]),
    bnot (bands [bvar 29, bvar 36, bvar 666, bvar 673]),
    bnot (bands [bvar 29, bvar 37, bvar 666, bvar 674]),
    bnot (bands [bvar 30, bvar 32, bvar 667, bvar 669]),
    bnot (bands [bvar 30, bvar 33, bvar 667, bvar 670]),
    bnot (bands [bvar 30, bvar 34, bvar 667, bvar 671]),
    bnot (bands [bvar 30, bvar 35, bvar 667, bvar 672]),
    bnot (bands [bvar 30, bvar 36, bvar 667, bvar 673]),
    bnot (bands [bvar 30, bvar 37, bvar 667, bvar 674]),
    bnot (bands [bvar 31, bvar 32, bvar 668, bvar 669]),
    bnot (bands [bvar 31, bvar 33, bvar 668, bvar 670]),
    bnot (bands [bvar 31, bvar 34, bvar 668, bvar 671]),
    bnot (bands [bvar 31, bvar 35, bvar 668, bvar 672]),
    bnot (bands [bvar 31, bvar 36, bvar 668, bvar 673]),
    bnot (bands [bvar 31, bvar 37, bvar 668, bvar 674]),
    bnot (bands [bvar 32, bvar 33, bvar 669, bvar 670]),
    bnot (bands [bvar 32, bvar 34, bvar 669, bvar 671]),
    bnot (bands [bvar 32, bvar 35, bvar 669, bvar 672]),
    bnot (bands [bvar 32, bvar 36, bvar 669, bvar 673]),
    bnot (bands [bvar 32, bvar 37, bvar 669, bvar 674]),
    bnot (bands [bvar 33, bvar 34, bvar 670, bvar 671]),
    bnot (bands [bvar 33, bvar 35, bvar 670, bvar 672]),
    bnot (bands [bvar 33, bvar 36, bvar 670, bvar 673]),
    bnot (bands [bvar 33, bvar 37, bvar 670, bvar 674]),
    bnot (bands [bvar 34, bvar 35, bvar 671, bvar 672]),
    bnot (bands [bvar 34, bvar 36, bvar 671, bvar 673]),
    bnot (bands [bvar 34, bvar 37, bvar 671, bvar 674]),
    bnot (bands [bvar 35, bvar 36, bvar 672, bvar 673]),
    bnot (bands [bvar 35, bvar 37, bvar 672, bvar 674]),
    bnot (bands [bvar 536, bvar 541, bvar 159, bvar 164]),
    bnot (bands [bvar 536, bvar 542, bvar 159, bvar 165]),
    bnot (bands [bvar 536, bvar 543, bvar 159, bvar 166]),
    bnot (bands [bvar 536, bvar 544, bvar 159, bvar 167]),
    bnot (bands [bvar 537, bvar 541, bvar 160, bvar 164]),
    bnot (bands [bvar 537, bvar 542, bvar 160, bvar 165]) ]

def reducedUnionChunk102 : BVLogicalExpr :=
  bands reducedUnionChunk102Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
