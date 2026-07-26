import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk120Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 636, bvar 638, bvar 155, bvar 157]),
    bnot (bands [bvar 637, bvar 638, bvar 156, bvar 157]),
    bnot (bands [bvar 120, bvar 123, bvar 666, bvar 669]),
    bnot (bands [bvar 120, bvar 125, bvar 666, bvar 671]),
    bnot (bands [bvar 121, bvar 131, bvar 667, bvar 677]),
    bnot (bands [bvar 122, bvar 123, bvar 668, bvar 669]),
    bnot (bands [bvar 122, bvar 125, bvar 668, bvar 671]),
    bnot (bands [bvar 122, bvar 131, bvar 668, bvar 677]),
    bnot (bands [bvar 123, bvar 124, bvar 669, bvar 670]),
    bnot (bands [bvar 123, bvar 125, bvar 669, bvar 671]),
    bnot (bands [bvar 123, bvar 130, bvar 669, bvar 676]),
    bnot (bands [bvar 123, bvar 131, bvar 669, bvar 677]),
    bnot (bands [bvar 124, bvar 125, bvar 670, bvar 671]),
    bnot (bands [bvar 125, bvar 130, bvar 671, bvar 676]),
    bnot (bands [bvar 125, bvar 131, bvar 671, bvar 677]),
    bnot (bands [bvar 127, bvar 128, bvar 673, bvar 674]),
    bnot (bands [bvar 626, bvar 627, bvar 158, bvar 159]),
    bnot (bands [bvar 626, bvar 629, bvar 158, bvar 161]),
    bnot (bands [bvar 626, bvar 630, bvar 158, bvar 162]),
    bnot (bands [bvar 626, bvar 631, bvar 158, bvar 163]),
    bnot (bands [bvar 626, bvar 632, bvar 158, bvar 164]),
    bnot (bands [bvar 626, bvar 638, bvar 158, bvar 170]),
    bnot (bands [bvar 627, bvar 630, bvar 159, bvar 162]),
    bnot (bands [bvar 627, bvar 631, bvar 159, bvar 163]),
    bnot (bands [bvar 627, bvar 632, bvar 159, bvar 164]),
    bnot (bands [bvar 627, bvar 638, bvar 159, bvar 170]),
    bnot (bands [bvar 628, bvar 630, bvar 160, bvar 162]),
    bnot (bands [bvar 628, bvar 631, bvar 160, bvar 163]),
    bnot (bands [bvar 628, bvar 632, bvar 160, bvar 164]),
    bnot (bands [bvar 628, bvar 638, bvar 160, bvar 170]),
    bnot (bands [bvar 629, bvar 630, bvar 161, bvar 162]),
    bnot (bands [bvar 629, bvar 631, bvar 161, bvar 163]),
    bnot (bands [bvar 629, bvar 632, bvar 161, bvar 164]),
    bnot (bands [bvar 629, bvar 638, bvar 161, bvar 170]),
    bnot (bands [bvar 630, bvar 631, bvar 162, bvar 163]),
    bnot (bands [bvar 630, bvar 632, bvar 162, bvar 164]),
    bnot (bands [bvar 630, bvar 637, bvar 162, bvar 169]),
    bnot (bands [bvar 630, bvar 638, bvar 162, bvar 170]),
    bnot (bands [bvar 631, bvar 632, bvar 163, bvar 164]),
    bnot (bands [bvar 631, bvar 637, bvar 163, bvar 169]),
    bnot (bands [bvar 631, bvar 638, bvar 163, bvar 170]),
    bnot (bands [bvar 632, bvar 637, bvar 164, bvar 169]),
    bnot (bands [bvar 632, bvar 638, bvar 164, bvar 170]),
    bnot (bands [bvar 634, bvar 635, bvar 166, bvar 167]),
    bnot (bands [bvar 637, bvar 638, bvar 169, bvar 170]),
    bnot (bands [bvar 119, bvar 123, bvar 678, bvar 682]),
    bnot (bands [bvar 119, bvar 125, bvar 678, bvar 684]),
    bnot (bands [bvar 119, bvar 131, bvar 678, bvar 690]),
    bnot (bands [bvar 120, bvar 124, bvar 679, bvar 683]),
    bnot (bands [bvar 122, bvar 123, bvar 681, bvar 682]),
    bnot (bands [bvar 122, bvar 124, bvar 681, bvar 683]),
    bnot (bands [bvar 122, bvar 125, bvar 681, bvar 684]),
    bnot (bands [bvar 123, bvar 124, bvar 682, bvar 683]),
    bnot (bands [bvar 123, bvar 125, bvar 682, bvar 684]),
    bnot (bands [bvar 123, bvar 131, bvar 682, bvar 690]),
    bnot (bands [bvar 124, bvar 125, bvar 683, bvar 684]),
    bnot (bands [bvar 124, bvar 131, bvar 683, bvar 690]),
    bnot (bands [bvar 125, bvar 131, bvar 684, bvar 690]),
    bnot (bands [bvar 127, bvar 128, bvar 686, bvar 687]),
    bnot (bands [bvar 127, bvar 129, bvar 686, bvar 688]),
    bnot (bands [bvar 128, bvar 129, bvar 687, bvar 688]),
    bnot (bands [bvar 629, bvar 631, bvar 174, bvar 176]),
    bnot (bands [bvar 629, bvar 632, bvar 174, bvar 177]),
    bnot (bands [bvar 629, bvar 638, bvar 174, bvar 183]) ]

def reducedUnionChunk120 : BVLogicalExpr :=
  bands reducedUnionChunk120Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
