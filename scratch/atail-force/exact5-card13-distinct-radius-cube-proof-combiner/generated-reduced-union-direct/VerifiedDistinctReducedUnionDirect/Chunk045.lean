import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk045Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 652, bvar 653, bvar 665, bvar 666]),
    bnot (bands [bvar 652, bvar 654, bvar 665, bvar 667]),
    bnot (bands [bvar 652, bvar 655, bvar 665, bvar 668]),
    bnot (bands [bvar 652, bvar 656, bvar 665, bvar 669]),
    bnot (bands [bvar 652, bvar 657, bvar 665, bvar 670]),
    bnot (bands [bvar 652, bvar 658, bvar 665, bvar 671]),
    bnot (bands [bvar 652, bvar 659, bvar 665, bvar 672]),
    bnot (bands [bvar 652, bvar 660, bvar 665, bvar 673]),
    bnot (bands [bvar 652, bvar 663, bvar 665, bvar 676]),
    bnot (bands [bvar 653, bvar 656, bvar 666, bvar 669]),
    bnot (bands [bvar 653, bvar 657, bvar 666, bvar 670]),
    bnot (bands [bvar 653, bvar 658, bvar 666, bvar 671]),
    bnot (bands [bvar 653, bvar 659, bvar 666, bvar 672]),
    bnot (bands [bvar 653, bvar 660, bvar 666, bvar 673]),
    bnot (bands [bvar 653, bvar 663, bvar 666, bvar 676]),
    bnot (bands [bvar 653, bvar 664, bvar 666, bvar 677]),
    bnot (bands [bvar 654, bvar 656, bvar 667, bvar 669]),
    bnot (bands [bvar 654, bvar 657, bvar 667, bvar 670]),
    bnot (bands [bvar 654, bvar 658, bvar 667, bvar 671]),
    bnot (bands [bvar 654, bvar 659, bvar 667, bvar 672]),
    bnot (bands [bvar 654, bvar 660, bvar 667, bvar 673]),
    bnot (bands [bvar 654, bvar 663, bvar 667, bvar 676]),
    bnot (bands [bvar 654, bvar 664, bvar 667, bvar 677]),
    bnot (bands [bvar 655, bvar 656, bvar 668, bvar 669]),
    bnot (bands [bvar 655, bvar 657, bvar 668, bvar 670]),
    bnot (bands [bvar 655, bvar 658, bvar 668, bvar 671]),
    bnot (bands [bvar 655, bvar 659, bvar 668, bvar 672]),
    bnot (bands [bvar 655, bvar 660, bvar 668, bvar 673]),
    bnot (bands [bvar 655, bvar 664, bvar 668, bvar 677]),
    bnot (bands [bvar 656, bvar 657, bvar 669, bvar 670]),
    bnot (bands [bvar 656, bvar 658, bvar 669, bvar 671]),
    bnot (bands [bvar 656, bvar 659, bvar 669, bvar 672]),
    bnot (bands [bvar 656, bvar 660, bvar 669, bvar 673]),
    bnot (bands [bvar 656, bvar 663, bvar 669, bvar 676]),
    bnot (bands [bvar 656, bvar 664, bvar 669, bvar 677]),
    bnot (bands [bvar 657, bvar 658, bvar 670, bvar 671]),
    bnot (bands [bvar 657, bvar 659, bvar 670, bvar 672]),
    bnot (bands [bvar 657, bvar 660, bvar 670, bvar 673]),
    bnot (bands [bvar 657, bvar 663, bvar 670, bvar 676]),
    bnot (bands [bvar 657, bvar 664, bvar 670, bvar 677]),
    bnot (bands [bvar 658, bvar 659, bvar 671, bvar 672]),
    bnot (bands [bvar 658, bvar 660, bvar 671, bvar 673]),
    bnot (bands [bvar 658, bvar 663, bvar 671, bvar 676]),
    bnot (bands [bvar 658, bvar 664, bvar 671, bvar 677]),
    bnot (bands [bvar 659, bvar 660, bvar 672, bvar 673]),
    bnot (bands [bvar 659, bvar 663, bvar 672, bvar 676]),
    bnot (bands [bvar 659, bvar 664, bvar 672, bvar 677]),
    bnot (bands [bvar 660, bvar 663, bvar 673, bvar 676]),
    bnot (bands [bvar 660, bvar 664, bvar 673, bvar 677]),
    bnot (bands [bvar 663, bvar 664, bvar 676, bvar 677]),
    bnot (bands [bvar 652, bvar 657, bvar 678, bvar 683]),
    bnot (bands [bvar 652, bvar 659, bvar 678, bvar 685]),
    bnot (bands [bvar 653, bvar 656, bvar 679, bvar 682]),
    bnot (bands [bvar 653, bvar 657, bvar 679, bvar 683]),
    bnot (bands [bvar 653, bvar 658, bvar 679, bvar 684]),
    bnot (bands [bvar 654, bvar 656, bvar 680, bvar 682]),
    bnot (bands [bvar 654, bvar 657, bvar 680, bvar 683]),
    bnot (bands [bvar 654, bvar 658, bvar 680, bvar 684]),
    bnot (bands [bvar 654, bvar 659, bvar 680, bvar 685]),
    bnot (bands [bvar 654, bvar 660, bvar 680, bvar 686]),
    bnot (bands [bvar 655, bvar 656, bvar 681, bvar 682]),
    bnot (bands [bvar 655, bvar 657, bvar 681, bvar 683]),
    bnot (bands [bvar 655, bvar 658, bvar 681, bvar 684]),
    bnot (bands [bvar 655, bvar 659, bvar 681, bvar 685]) ]

def reducedUnionChunk045 : BVLogicalExpr :=
  bands reducedUnionChunk045Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
