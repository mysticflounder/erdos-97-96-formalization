import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk042Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 627, bvar 635, bvar 640, bvar 648]),
    bnot (bands [bvar 627, bvar 636, bvar 640, bvar 649]),
    bnot (bands [bvar 627, bvar 638, bvar 640, bvar 651]),
    bnot (bands [bvar 630, bvar 632, bvar 643, bvar 645]),
    bnot (bands [bvar 630, bvar 635, bvar 643, bvar 648]),
    bnot (bands [bvar 630, bvar 636, bvar 643, bvar 649]),
    bnot (bands [bvar 630, bvar 638, bvar 643, bvar 651]),
    bnot (bands [bvar 632, bvar 635, bvar 645, bvar 648]),
    bnot (bands [bvar 632, bvar 636, bvar 645, bvar 649]),
    bnot (bands [bvar 632, bvar 638, bvar 645, bvar 651]),
    bnot (bands [bvar 626, bvar 627, bvar 652, bvar 653]),
    bnot (bands [bvar 626, bvar 630, bvar 652, bvar 656]),
    bnot (bands [bvar 626, bvar 631, bvar 652, bvar 657]),
    bnot (bands [bvar 626, bvar 632, bvar 652, bvar 658]),
    bnot (bands [bvar 626, bvar 638, bvar 652, bvar 664]),
    bnot (bands [bvar 627, bvar 630, bvar 653, bvar 656]),
    bnot (bands [bvar 627, bvar 631, bvar 653, bvar 657]),
    bnot (bands [bvar 627, bvar 632, bvar 653, bvar 658]),
    bnot (bands [bvar 627, bvar 637, bvar 653, bvar 663]),
    bnot (bands [bvar 628, bvar 630, bvar 654, bvar 656]),
    bnot (bands [bvar 628, bvar 631, bvar 654, bvar 657]),
    bnot (bands [bvar 628, bvar 632, bvar 654, bvar 658]),
    bnot (bands [bvar 629, bvar 630, bvar 655, bvar 656]),
    bnot (bands [bvar 629, bvar 631, bvar 655, bvar 657]),
    bnot (bands [bvar 629, bvar 632, bvar 655, bvar 658]),
    bnot (bands [bvar 629, bvar 636, bvar 655, bvar 662]),
    bnot (bands [bvar 629, bvar 637, bvar 655, bvar 663]),
    bnot (bands [bvar 630, bvar 631, bvar 656, bvar 657]),
    bnot (bands [bvar 630, bvar 632, bvar 656, bvar 658]),
    bnot (bands [bvar 630, bvar 636, bvar 656, bvar 662]),
    bnot (bands [bvar 630, bvar 637, bvar 656, bvar 663]),
    bnot (bands [bvar 630, bvar 638, bvar 656, bvar 664]),
    bnot (bands [bvar 631, bvar 632, bvar 657, bvar 658]),
    bnot (bands [bvar 631, bvar 636, bvar 657, bvar 662]),
    bnot (bands [bvar 631, bvar 637, bvar 657, bvar 663]),
    bnot (bands [bvar 631, bvar 638, bvar 657, bvar 664]),
    bnot (bands [bvar 632, bvar 636, bvar 658, bvar 662]),
    bnot (bands [bvar 632, bvar 638, bvar 658, bvar 664]),
    bnot (bands [bvar 636, bvar 638, bvar 662, bvar 664]),
    bnot (bands [bvar 637, bvar 638, bvar 663, bvar 664]),
    bnot (bands [bvar 626, bvar 629, bvar 665, bvar 668]),
    bnot (bands [bvar 626, bvar 630, bvar 665, bvar 669]),
    bnot (bands [bvar 627, bvar 631, bvar 666, bvar 670]),
    bnot (bands [bvar 628, bvar 630, bvar 667, bvar 669]),
    bnot (bands [bvar 628, bvar 631, bvar 667, bvar 670]),
    bnot (bands [bvar 629, bvar 630, bvar 668, bvar 669]),
    bnot (bands [bvar 629, bvar 631, bvar 668, bvar 670]),
    bnot (bands [bvar 629, bvar 632, bvar 668, bvar 671]),
    bnot (bands [bvar 629, bvar 637, bvar 668, bvar 676]),
    bnot (bands [bvar 630, bvar 631, bvar 669, bvar 670]),
    bnot (bands [bvar 630, bvar 637, bvar 669, bvar 676]),
    bnot (bands [bvar 630, bvar 638, bvar 669, bvar 677]),
    bnot (bands [bvar 631, bvar 632, bvar 670, bvar 671]),
    bnot (bands [bvar 631, bvar 638, bvar 670, bvar 677]),
    bnot (bands [bvar 632, bvar 638, bvar 671, bvar 677]),
    bnot (bands [bvar 637, bvar 638, bvar 676, bvar 677]),
    bnot (bands [bvar 626, bvar 629, bvar 678, bvar 681]),
    bnot (bands [bvar 626, bvar 631, bvar 678, bvar 683]),
    bnot (bands [bvar 627, bvar 632, bvar 679, bvar 684]),
    bnot (bands [bvar 627, bvar 638, bvar 679, bvar 690]),
    bnot (bands [bvar 628, bvar 631, bvar 680, bvar 683]),
    bnot (bands [bvar 629, bvar 630, bvar 681, bvar 682]),
    bnot (bands [bvar 629, bvar 631, bvar 681, bvar 683]),
    bnot (bands [bvar 629, bvar 632, bvar 681, bvar 684]) ]

def reducedUnionChunk042 : BVLogicalExpr :=
  bands reducedUnionChunk042Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
