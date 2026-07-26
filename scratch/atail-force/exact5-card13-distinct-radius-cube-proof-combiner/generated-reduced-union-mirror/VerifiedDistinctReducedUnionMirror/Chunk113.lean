import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk113Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 604, bvar 610, bvar 136, bvar 142]),
    bnot (bands [bvar 604, bvar 611, bvar 136, bvar 143]),
    bnot (bands [bvar 604, bvar 612, bvar 136, bvar 144]),
    bnot (bands [bvar 609, bvar 611, bvar 141, bvar 143]),
    bnot (bands [bvar 609, bvar 612, bvar 141, bvar 144]),
    bnot (bands [bvar 610, bvar 611, bvar 142, bvar 143]),
    bnot (bands [bvar 610, bvar 612, bvar 142, bvar 144]),
    bnot (bands [bvar 93, bvar 94, bvar 652, bvar 653]),
    bnot (bands [bvar 93, bvar 96, bvar 652, bvar 655]),
    bnot (bands [bvar 93, bvar 97, bvar 652, bvar 656]),
    bnot (bands [bvar 93, bvar 103, bvar 652, bvar 662]),
    bnot (bands [bvar 93, bvar 104, bvar 652, bvar 663]),
    bnot (bands [bvar 94, bvar 97, bvar 653, bvar 656]),
    bnot (bands [bvar 94, bvar 103, bvar 653, bvar 662]),
    bnot (bands [bvar 94, bvar 104, bvar 653, bvar 663]),
    bnot (bands [bvar 94, bvar 105, bvar 653, bvar 664]),
    bnot (bands [bvar 95, bvar 97, bvar 654, bvar 656]),
    bnot (bands [bvar 95, bvar 104, bvar 654, bvar 663]),
    bnot (bands [bvar 95, bvar 105, bvar 654, bvar 664]),
    bnot (bands [bvar 96, bvar 97, bvar 655, bvar 656]),
    bnot (bands [bvar 96, bvar 103, bvar 655, bvar 662]),
    bnot (bands [bvar 96, bvar 105, bvar 655, bvar 664]),
    bnot (bands [bvar 97, bvar 103, bvar 656, bvar 662]),
    bnot (bands [bvar 97, bvar 104, bvar 656, bvar 663]),
    bnot (bands [bvar 97, bvar 105, bvar 656, bvar 664]),
    bnot (bands [bvar 99, bvar 100, bvar 658, bvar 659]),
    bnot (bands [bvar 99, bvar 101, bvar 658, bvar 660]),
    bnot (bands [bvar 100, bvar 101, bvar 659, bvar 660]),
    bnot (bands [bvar 103, bvar 104, bvar 662, bvar 663]),
    bnot (bands [bvar 103, bvar 105, bvar 662, bvar 664]),
    bnot (bands [bvar 104, bvar 105, bvar 663, bvar 664]),
    bnot (bands [bvar 600, bvar 601, bvar 145, bvar 146]),
    bnot (bands [bvar 600, bvar 603, bvar 145, bvar 148]),
    bnot (bands [bvar 600, bvar 604, bvar 145, bvar 149]),
    bnot (bands [bvar 600, bvar 610, bvar 145, bvar 155]),
    bnot (bands [bvar 600, bvar 611, bvar 145, bvar 156]),
    bnot (bands [bvar 600, bvar 612, bvar 145, bvar 157]),
    bnot (bands [bvar 601, bvar 604, bvar 146, bvar 149]),
    bnot (bands [bvar 601, bvar 610, bvar 146, bvar 155]),
    bnot (bands [bvar 601, bvar 612, bvar 146, bvar 157]),
    bnot (bands [bvar 602, bvar 604, bvar 147, bvar 149]),
    bnot (bands [bvar 602, bvar 610, bvar 147, bvar 155]),
    bnot (bands [bvar 602, bvar 611, bvar 147, bvar 156]),
    bnot (bands [bvar 602, bvar 612, bvar 147, bvar 157]),
    bnot (bands [bvar 603, bvar 604, bvar 148, bvar 149]),
    bnot (bands [bvar 603, bvar 611, bvar 148, bvar 156]),
    bnot (bands [bvar 603, bvar 612, bvar 148, bvar 157]),
    bnot (bands [bvar 604, bvar 610, bvar 149, bvar 155]),
    bnot (bands [bvar 604, bvar 611, bvar 149, bvar 156]),
    bnot (bands [bvar 604, bvar 612, bvar 149, bvar 157]),
    bnot (bands [bvar 610, bvar 611, bvar 155, bvar 156]),
    bnot (bands [bvar 610, bvar 612, bvar 155, bvar 157]),
    bnot (bands [bvar 611, bvar 612, bvar 156, bvar 157]),
    bnot (bands [bvar 93, bvar 97, bvar 665, bvar 669]),
    bnot (bands [bvar 93, bvar 104, bvar 665, bvar 676]),
    bnot (bands [bvar 93, bvar 105, bvar 665, bvar 677]),
    bnot (bands [bvar 94, bvar 97, bvar 666, bvar 669]),
    bnot (bands [bvar 94, bvar 105, bvar 666, bvar 677]),
    bnot (bands [bvar 95, bvar 97, bvar 667, bvar 669]),
    bnot (bands [bvar 97, bvar 105, bvar 669, bvar 677]),
    bnot (bands [bvar 99, bvar 100, bvar 671, bvar 672]),
    bnot (bands [bvar 99, bvar 101, bvar 671, bvar 673]),
    bnot (bands [bvar 100, bvar 101, bvar 672, bvar 673]),
    bnot (bands [bvar 100, bvar 102, bvar 672, bvar 674]) ]

def reducedUnionChunk113 : BVLogicalExpr :=
  bands reducedUnionChunk113Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
