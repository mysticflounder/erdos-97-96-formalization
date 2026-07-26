import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk034Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 537, bvar 540, bvar 628, bvar 631]),
    bnot (bands [bvar 537, bvar 541, bvar 628, bvar 632]),
    bnot (bands [bvar 538, bvar 540, bvar 629, bvar 631]),
    bnot (bands [bvar 539, bvar 540, bvar 630, bvar 631]),
    bnot (bands [bvar 539, bvar 541, bvar 630, bvar 632]),
    bnot (bands [bvar 540, bvar 541, bvar 631, bvar 632]),
    bnot (bands [bvar 543, bvar 545, bvar 634, bvar 636]),
    bnot (bands [bvar 544, bvar 547, bvar 635, bvar 638]),
    bnot (bands [bvar 545, bvar 547, bvar 636, bvar 638]),
    bnot (bands [bvar 536, bvar 539, bvar 640, bvar 643]),
    bnot (bands [bvar 536, bvar 541, bvar 640, bvar 645]),
    bnot (bands [bvar 536, bvar 542, bvar 640, bvar 646]),
    bnot (bands [bvar 539, bvar 541, bvar 643, bvar 645]),
    bnot (bands [bvar 539, bvar 542, bvar 643, bvar 646]),
    bnot (bands [bvar 536, bvar 539, bvar 653, bvar 656]),
    bnot (bands [bvar 536, bvar 540, bvar 653, bvar 657]),
    bnot (bands [bvar 536, bvar 541, bvar 653, bvar 658]),
    bnot (bands [bvar 536, bvar 542, bvar 653, bvar 659]),
    bnot (bands [bvar 536, bvar 543, bvar 653, bvar 660]),
    bnot (bands [bvar 537, bvar 539, bvar 654, bvar 656]),
    bnot (bands [bvar 537, bvar 540, bvar 654, bvar 657]),
    bnot (bands [bvar 537, bvar 541, bvar 654, bvar 658]),
    bnot (bands [bvar 537, bvar 542, bvar 654, bvar 659]),
    bnot (bands [bvar 537, bvar 543, bvar 654, bvar 660]),
    bnot (bands [bvar 538, bvar 539, bvar 655, bvar 656]),
    bnot (bands [bvar 538, bvar 540, bvar 655, bvar 657]),
    bnot (bands [bvar 538, bvar 541, bvar 655, bvar 658]),
    bnot (bands [bvar 538, bvar 542, bvar 655, bvar 659]),
    bnot (bands [bvar 539, bvar 540, bvar 656, bvar 657]),
    bnot (bands [bvar 539, bvar 541, bvar 656, bvar 658]),
    bnot (bands [bvar 539, bvar 542, bvar 656, bvar 659]),
    bnot (bands [bvar 539, bvar 543, bvar 656, bvar 660]),
    bnot (bands [bvar 540, bvar 541, bvar 657, bvar 658]),
    bnot (bands [bvar 540, bvar 542, bvar 657, bvar 659]),
    bnot (bands [bvar 540, bvar 543, bvar 657, bvar 660]),
    bnot (bands [bvar 541, bvar 542, bvar 658, bvar 659]),
    bnot (bands [bvar 541, bvar 543, bvar 658, bvar 660]),
    bnot (bands [bvar 542, bvar 543, bvar 659, bvar 660]),
    bnot (bands [bvar 546, bvar 547, bvar 663, bvar 664]),
    bnot (bands [bvar 536, bvar 539, bvar 666, bvar 669]),
    bnot (bands [bvar 536, bvar 540, bvar 666, bvar 670]),
    bnot (bands [bvar 536, bvar 541, bvar 666, bvar 671]),
    bnot (bands [bvar 536, bvar 542, bvar 666, bvar 672]),
    bnot (bands [bvar 536, bvar 543, bvar 666, bvar 673]),
    bnot (bands [bvar 536, bvar 544, bvar 666, bvar 674]),
    bnot (bands [bvar 537, bvar 540, bvar 667, bvar 670]),
    bnot (bands [bvar 537, bvar 541, bvar 667, bvar 671]),
    bnot (bands [bvar 537, bvar 542, bvar 667, bvar 672]),
    bnot (bands [bvar 537, bvar 543, bvar 667, bvar 673]),
    bnot (bands [bvar 537, bvar 544, bvar 667, bvar 674]),
    bnot (bands [bvar 538, bvar 539, bvar 668, bvar 669]),
    bnot (bands [bvar 538, bvar 540, bvar 668, bvar 670]),
    bnot (bands [bvar 538, bvar 541, bvar 668, bvar 671]),
    bnot (bands [bvar 538, bvar 542, bvar 668, bvar 672]),
    bnot (bands [bvar 538, bvar 544, bvar 668, bvar 674]),
    bnot (bands [bvar 539, bvar 540, bvar 669, bvar 670]),
    bnot (bands [bvar 539, bvar 541, bvar 669, bvar 671]),
    bnot (bands [bvar 539, bvar 542, bvar 669, bvar 672]),
    bnot (bands [bvar 539, bvar 543, bvar 669, bvar 673]),
    bnot (bands [bvar 539, bvar 544, bvar 669, bvar 674]),
    bnot (bands [bvar 540, bvar 541, bvar 670, bvar 671]),
    bnot (bands [bvar 540, bvar 542, bvar 670, bvar 672]),
    bnot (bands [bvar 540, bvar 543, bvar 670, bvar 673]),
    bnot (bands [bvar 540, bvar 544, bvar 670, bvar 674]) ]

def reducedUnionChunk034 : BVLogicalExpr :=
  bands reducedUnionChunk034Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
