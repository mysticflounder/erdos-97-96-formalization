import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk119Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 119, bvar 122, bvar 652, bvar 655]),
    bnot (bands [bvar 119, bvar 123, bvar 652, bvar 656]),
    bnot (bands [bvar 119, bvar 125, bvar 652, bvar 658]),
    bnot (bands [bvar 119, bvar 129, bvar 652, bvar 662]),
    bnot (bands [bvar 119, bvar 130, bvar 652, bvar 663]),
    bnot (bands [bvar 119, bvar 131, bvar 652, bvar 664]),
    bnot (bands [bvar 120, bvar 123, bvar 653, bvar 656]),
    bnot (bands [bvar 120, bvar 125, bvar 653, bvar 658]),
    bnot (bands [bvar 120, bvar 129, bvar 653, bvar 662]),
    bnot (bands [bvar 120, bvar 130, bvar 653, bvar 663]),
    bnot (bands [bvar 120, bvar 131, bvar 653, bvar 664]),
    bnot (bands [bvar 121, bvar 123, bvar 654, bvar 656]),
    bnot (bands [bvar 121, bvar 125, bvar 654, bvar 658]),
    bnot (bands [bvar 121, bvar 129, bvar 654, bvar 662]),
    bnot (bands [bvar 121, bvar 131, bvar 654, bvar 664]),
    bnot (bands [bvar 122, bvar 123, bvar 655, bvar 656]),
    bnot (bands [bvar 122, bvar 125, bvar 655, bvar 658]),
    bnot (bands [bvar 122, bvar 130, bvar 655, bvar 663]),
    bnot (bands [bvar 122, bvar 131, bvar 655, bvar 664]),
    bnot (bands [bvar 123, bvar 124, bvar 656, bvar 657]),
    bnot (bands [bvar 123, bvar 125, bvar 656, bvar 658]),
    bnot (bands [bvar 123, bvar 129, bvar 656, bvar 662]),
    bnot (bands [bvar 123, bvar 130, bvar 656, bvar 663]),
    bnot (bands [bvar 123, bvar 131, bvar 656, bvar 664]),
    bnot (bands [bvar 124, bvar 125, bvar 657, bvar 658]),
    bnot (bands [bvar 124, bvar 129, bvar 657, bvar 662]),
    bnot (bands [bvar 124, bvar 130, bvar 657, bvar 663]),
    bnot (bands [bvar 124, bvar 131, bvar 657, bvar 664]),
    bnot (bands [bvar 125, bvar 129, bvar 658, bvar 662]),
    bnot (bands [bvar 125, bvar 130, bvar 658, bvar 663]),
    bnot (bands [bvar 125, bvar 131, bvar 658, bvar 664]),
    bnot (bands [bvar 129, bvar 130, bvar 662, bvar 663]),
    bnot (bands [bvar 129, bvar 131, bvar 662, bvar 664]),
    bnot (bands [bvar 130, bvar 131, bvar 663, bvar 664]),
    bnot (bands [bvar 626, bvar 630, bvar 145, bvar 149]),
    bnot (bands [bvar 626, bvar 631, bvar 145, bvar 150]),
    bnot (bands [bvar 626, bvar 632, bvar 145, bvar 151]),
    bnot (bands [bvar 627, bvar 630, bvar 146, bvar 149]),
    bnot (bands [bvar 627, bvar 631, bvar 146, bvar 150]),
    bnot (bands [bvar 627, bvar 632, bvar 146, bvar 151]),
    bnot (bands [bvar 627, bvar 636, bvar 146, bvar 155]),
    bnot (bands [bvar 627, bvar 638, bvar 146, bvar 157]),
    bnot (bands [bvar 628, bvar 630, bvar 147, bvar 149]),
    bnot (bands [bvar 628, bvar 631, bvar 147, bvar 150]),
    bnot (bands [bvar 628, bvar 632, bvar 147, bvar 151]),
    bnot (bands [bvar 628, bvar 638, bvar 147, bvar 157]),
    bnot (bands [bvar 629, bvar 630, bvar 148, bvar 149]),
    bnot (bands [bvar 629, bvar 631, bvar 148, bvar 150]),
    bnot (bands [bvar 629, bvar 632, bvar 148, bvar 151]),
    bnot (bands [bvar 629, bvar 636, bvar 148, bvar 155]),
    bnot (bands [bvar 629, bvar 638, bvar 148, bvar 157]),
    bnot (bands [bvar 630, bvar 631, bvar 149, bvar 150]),
    bnot (bands [bvar 630, bvar 632, bvar 149, bvar 151]),
    bnot (bands [bvar 630, bvar 636, bvar 149, bvar 155]),
    bnot (bands [bvar 630, bvar 637, bvar 149, bvar 156]),
    bnot (bands [bvar 630, bvar 638, bvar 149, bvar 157]),
    bnot (bands [bvar 631, bvar 632, bvar 150, bvar 151]),
    bnot (bands [bvar 631, bvar 636, bvar 150, bvar 155]),
    bnot (bands [bvar 631, bvar 637, bvar 150, bvar 156]),
    bnot (bands [bvar 631, bvar 638, bvar 150, bvar 157]),
    bnot (bands [bvar 632, bvar 636, bvar 151, bvar 155]),
    bnot (bands [bvar 632, bvar 637, bvar 151, bvar 156]),
    bnot (bands [bvar 632, bvar 638, bvar 151, bvar 157]),
    bnot (bands [bvar 636, bvar 637, bvar 155, bvar 156]) ]

def reducedUnionChunk119 : BVLogicalExpr :=
  bands reducedUnionChunk119Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
