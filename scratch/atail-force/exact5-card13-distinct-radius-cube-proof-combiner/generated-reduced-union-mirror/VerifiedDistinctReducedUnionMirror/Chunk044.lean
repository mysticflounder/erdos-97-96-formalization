import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk044Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 639, bvar 640, bvar 691, bvar 692]),
    bnot (bands [bvar 639, bvar 643, bvar 691, bvar 695]),
    bnot (bands [bvar 639, bvar 645, bvar 691, bvar 697]),
    bnot (bands [bvar 639, bvar 646, bvar 691, bvar 698]),
    bnot (bands [bvar 640, bvar 643, bvar 692, bvar 695]),
    bnot (bands [bvar 640, bvar 645, bvar 692, bvar 697]),
    bnot (bands [bvar 640, bvar 646, bvar 692, bvar 698]),
    bnot (bands [bvar 652, bvar 658, bvar 665, bvar 671]),
    bnot (bands [bvar 652, bvar 659, bvar 665, bvar 672]),
    bnot (bands [bvar 653, bvar 656, bvar 666, bvar 669]),
    bnot (bands [bvar 653, bvar 657, bvar 666, bvar 670]),
    bnot (bands [bvar 653, bvar 658, bvar 666, bvar 671]),
    bnot (bands [bvar 653, bvar 659, bvar 666, bvar 672]),
    bnot (bands [bvar 653, bvar 660, bvar 666, bvar 673]),
    bnot (bands [bvar 653, bvar 663, bvar 666, bvar 676]),
    bnot (bands [bvar 653, bvar 664, bvar 666, bvar 677]),
    bnot (bands [bvar 654, bvar 658, bvar 667, bvar 671]),
    bnot (bands [bvar 654, bvar 659, bvar 667, bvar 672]),
    bnot (bands [bvar 655, bvar 656, bvar 668, bvar 669]),
    bnot (bands [bvar 655, bvar 657, bvar 668, bvar 670]),
    bnot (bands [bvar 655, bvar 658, bvar 668, bvar 671]),
    bnot (bands [bvar 655, bvar 659, bvar 668, bvar 672]),
    bnot (bands [bvar 655, bvar 663, bvar 668, bvar 676]),
    bnot (bands [bvar 656, bvar 657, bvar 669, bvar 670]),
    bnot (bands [bvar 656, bvar 658, bvar 669, bvar 671]),
    bnot (bands [bvar 656, bvar 659, bvar 669, bvar 672]),
    bnot (bands [bvar 656, bvar 663, bvar 669, bvar 676]),
    bnot (bands [bvar 656, bvar 664, bvar 669, bvar 677]),
    bnot (bands [bvar 657, bvar 659, bvar 670, bvar 672]),
    bnot (bands [bvar 657, bvar 663, bvar 670, bvar 676]),
    bnot (bands [bvar 658, bvar 659, bvar 671, bvar 672]),
    bnot (bands [bvar 658, bvar 660, bvar 671, bvar 673]),
    bnot (bands [bvar 658, bvar 664, bvar 671, bvar 677]),
    bnot (bands [bvar 659, bvar 663, bvar 672, bvar 676]),
    bnot (bands [bvar 659, bvar 664, bvar 672, bvar 677]),
    bnot (bands [bvar 663, bvar 664, bvar 676, bvar 677]),
    bnot (bands [bvar 652, bvar 656, bvar 678, bvar 682]),
    bnot (bands [bvar 652, bvar 657, bvar 678, bvar 683]),
    bnot (bands [bvar 652, bvar 658, bvar 678, bvar 684]),
    bnot (bands [bvar 652, bvar 659, bvar 678, bvar 685]),
    bnot (bands [bvar 652, bvar 660, bvar 678, bvar 686]),
    bnot (bands [bvar 653, bvar 656, bvar 679, bvar 682]),
    bnot (bands [bvar 653, bvar 657, bvar 679, bvar 683]),
    bnot (bands [bvar 653, bvar 658, bvar 679, bvar 684]),
    bnot (bands [bvar 653, bvar 660, bvar 679, bvar 686]),
    bnot (bands [bvar 653, bvar 664, bvar 679, bvar 690]),
    bnot (bands [bvar 654, bvar 657, bvar 680, bvar 683]),
    bnot (bands [bvar 654, bvar 658, bvar 680, bvar 684]),
    bnot (bands [bvar 654, bvar 659, bvar 680, bvar 685]),
    bnot (bands [bvar 654, bvar 660, bvar 680, bvar 686]),
    bnot (bands [bvar 654, bvar 664, bvar 680, bvar 690]),
    bnot (bands [bvar 655, bvar 656, bvar 681, bvar 682]),
    bnot (bands [bvar 655, bvar 657, bvar 681, bvar 683]),
    bnot (bands [bvar 655, bvar 658, bvar 681, bvar 684]),
    bnot (bands [bvar 655, bvar 659, bvar 681, bvar 685]),
    bnot (bands [bvar 655, bvar 660, bvar 681, bvar 686]),
    bnot (bands [bvar 655, bvar 664, bvar 681, bvar 690]),
    bnot (bands [bvar 656, bvar 657, bvar 682, bvar 683]),
    bnot (bands [bvar 656, bvar 658, bvar 682, bvar 684]),
    bnot (bands [bvar 656, bvar 659, bvar 682, bvar 685]),
    bnot (bands [bvar 656, bvar 660, bvar 682, bvar 686]),
    bnot (bands [bvar 656, bvar 664, bvar 682, bvar 690]),
    bnot (bands [bvar 657, bvar 658, bvar 683, bvar 684]),
    bnot (bands [bvar 657, bvar 659, bvar 683, bvar 685]) ]

def reducedUnionChunk044 : BVLogicalExpr :=
  bands reducedUnionChunk044Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
