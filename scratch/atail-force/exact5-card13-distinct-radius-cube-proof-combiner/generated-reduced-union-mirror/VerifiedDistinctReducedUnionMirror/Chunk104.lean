import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk104Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 30, bvar 34, bvar 654, bvar 658]),
    bnot (bands [bvar 30, bvar 35, bvar 654, bvar 659]),
    bnot (bands [bvar 31, bvar 32, bvar 655, bvar 656]),
    bnot (bands [bvar 31, bvar 33, bvar 655, bvar 657]),
    bnot (bands [bvar 31, bvar 34, bvar 655, bvar 658]),
    bnot (bands [bvar 31, bvar 35, bvar 655, bvar 659]),
    bnot (bands [bvar 32, bvar 33, bvar 656, bvar 657]),
    bnot (bands [bvar 32, bvar 34, bvar 656, bvar 658]),
    bnot (bands [bvar 32, bvar 35, bvar 656, bvar 659]),
    bnot (bands [bvar 32, bvar 36, bvar 656, bvar 660]),
    bnot (bands [bvar 33, bvar 34, bvar 657, bvar 658]),
    bnot (bands [bvar 33, bvar 35, bvar 657, bvar 659]),
    bnot (bands [bvar 33, bvar 36, bvar 657, bvar 660]),
    bnot (bands [bvar 34, bvar 35, bvar 658, bvar 659]),
    bnot (bands [bvar 34, bvar 36, bvar 658, bvar 660]),
    bnot (bands [bvar 35, bvar 36, bvar 659, bvar 660]),
    bnot (bands [bvar 38, bvar 39, bvar 662, bvar 663]),
    bnot (bands [bvar 38, bvar 40, bvar 662, bvar 664]),
    bnot (bands [bvar 536, bvar 540, bvar 146, bvar 150]),
    bnot (bands [bvar 536, bvar 541, bvar 146, bvar 151]),
    bnot (bands [bvar 536, bvar 542, bvar 146, bvar 152]),
    bnot (bands [bvar 536, bvar 543, bvar 146, bvar 153]),
    bnot (bands [bvar 537, bvar 539, bvar 147, bvar 149]),
    bnot (bands [bvar 537, bvar 541, bvar 147, bvar 151]),
    bnot (bands [bvar 537, bvar 542, bvar 147, bvar 152]),
    bnot (bands [bvar 537, bvar 543, bvar 147, bvar 153]),
    bnot (bands [bvar 538, bvar 540, bvar 148, bvar 150]),
    bnot (bands [bvar 539, bvar 540, bvar 149, bvar 150]),
    bnot (bands [bvar 539, bvar 541, bvar 149, bvar 151]),
    bnot (bands [bvar 539, bvar 542, bvar 149, bvar 152]),
    bnot (bands [bvar 540, bvar 541, bvar 150, bvar 151]),
    bnot (bands [bvar 540, bvar 542, bvar 150, bvar 152]),
    bnot (bands [bvar 540, bvar 543, bvar 150, bvar 153]),
    bnot (bands [bvar 541, bvar 542, bvar 151, bvar 152]),
    bnot (bands [bvar 541, bvar 543, bvar 151, bvar 153]),
    bnot (bands [bvar 542, bvar 543, bvar 152, bvar 153]),
    bnot (bands [bvar 29, bvar 33, bvar 666, bvar 670]),
    bnot (bands [bvar 29, bvar 34, bvar 666, bvar 671]),
    bnot (bands [bvar 29, bvar 35, bvar 666, bvar 672]),
    bnot (bands [bvar 29, bvar 36, bvar 666, bvar 673]),
    bnot (bands [bvar 29, bvar 37, bvar 666, bvar 674]),
    bnot (bands [bvar 30, bvar 33, bvar 667, bvar 670]),
    bnot (bands [bvar 30, bvar 34, bvar 667, bvar 671]),
    bnot (bands [bvar 30, bvar 35, bvar 667, bvar 672]),
    bnot (bands [bvar 30, bvar 36, bvar 667, bvar 673]),
    bnot (bands [bvar 30, bvar 37, bvar 667, bvar 674]),
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
    bnot (bands [bvar 35, bvar 36, bvar 672, bvar 673]) ]

def reducedUnionChunk104 : BVLogicalExpr :=
  bands reducedUnionChunk104Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
