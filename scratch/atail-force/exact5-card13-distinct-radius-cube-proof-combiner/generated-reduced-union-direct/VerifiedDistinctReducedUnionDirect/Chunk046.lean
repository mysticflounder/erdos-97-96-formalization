import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk046Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 655, bvar 660, bvar 681, bvar 686]),
    bnot (bands [bvar 656, bvar 657, bvar 682, bvar 683]),
    bnot (bands [bvar 656, bvar 658, bvar 682, bvar 684]),
    bnot (bands [bvar 656, bvar 659, bvar 682, bvar 685]),
    bnot (bands [bvar 656, bvar 660, bvar 682, bvar 686]),
    bnot (bands [bvar 657, bvar 658, bvar 683, bvar 684]),
    bnot (bands [bvar 657, bvar 659, bvar 683, bvar 685]),
    bnot (bands [bvar 657, bvar 660, bvar 683, bvar 686]),
    bnot (bands [bvar 657, bvar 664, bvar 683, bvar 690]),
    bnot (bands [bvar 658, bvar 659, bvar 684, bvar 685]),
    bnot (bands [bvar 658, bvar 660, bvar 684, bvar 686]),
    bnot (bands [bvar 659, bvar 660, bvar 685, bvar 686]),
    bnot (bands [bvar 659, bvar 664, bvar 685, bvar 690]),
    bnot (bands [bvar 652, bvar 656, bvar 691, bvar 695]),
    bnot (bands [bvar 652, bvar 658, bvar 691, bvar 697]),
    bnot (bands [bvar 653, bvar 656, bvar 692, bvar 695]),
    bnot (bands [bvar 653, bvar 657, bvar 692, bvar 696]),
    bnot (bands [bvar 653, bvar 658, bvar 692, bvar 697]),
    bnot (bands [bvar 653, bvar 659, bvar 692, bvar 698]),
    bnot (bands [bvar 654, bvar 656, bvar 693, bvar 695]),
    bnot (bands [bvar 654, bvar 657, bvar 693, bvar 696]),
    bnot (bands [bvar 654, bvar 660, bvar 693, bvar 699]),
    bnot (bands [bvar 655, bvar 656, bvar 694, bvar 695]),
    bnot (bands [bvar 656, bvar 657, bvar 695, bvar 696]),
    bnot (bands [bvar 656, bvar 658, bvar 695, bvar 697]),
    bnot (bands [bvar 656, bvar 659, bvar 695, bvar 698]),
    bnot (bands [bvar 656, bvar 660, bvar 695, bvar 699]),
    bnot (bands [bvar 657, bvar 658, bvar 696, bvar 697]),
    bnot (bands [bvar 657, bvar 660, bvar 696, bvar 699]),
    bnot (bands [bvar 658, bvar 659, bvar 697, bvar 698]),
    bnot (bands [bvar 658, bvar 660, bvar 697, bvar 699]),
    bnot (bands [bvar 659, bvar 660, bvar 698, bvar 699]),
    bnot (bands [bvar 662, bvar 663, bvar 701, bvar 702]),
    bnot (bands [bvar 665, bvar 666, bvar 678, bvar 679]),
    bnot (bands [bvar 665, bvar 669, bvar 678, bvar 682]),
    bnot (bands [bvar 665, bvar 670, bvar 678, bvar 683]),
    bnot (bands [bvar 665, bvar 671, bvar 678, bvar 684]),
    bnot (bands [bvar 665, bvar 672, bvar 678, bvar 685]),
    bnot (bands [bvar 665, bvar 673, bvar 678, bvar 686]),
    bnot (bands [bvar 666, bvar 669, bvar 679, bvar 682]),
    bnot (bands [bvar 666, bvar 670, bvar 679, bvar 683]),
    bnot (bands [bvar 666, bvar 671, bvar 679, bvar 684]),
    bnot (bands [bvar 666, bvar 672, bvar 679, bvar 685]),
    bnot (bands [bvar 666, bvar 673, bvar 679, bvar 686]),
    bnot (bands [bvar 666, bvar 674, bvar 679, bvar 687]),
    bnot (bands [bvar 666, bvar 677, bvar 679, bvar 690]),
    bnot (bands [bvar 667, bvar 669, bvar 680, bvar 682]),
    bnot (bands [bvar 667, bvar 670, bvar 680, bvar 683]),
    bnot (bands [bvar 667, bvar 671, bvar 680, bvar 684]),
    bnot (bands [bvar 667, bvar 672, bvar 680, bvar 685]),
    bnot (bands [bvar 667, bvar 673, bvar 680, bvar 686]),
    bnot (bands [bvar 667, bvar 677, bvar 680, bvar 690]),
    bnot (bands [bvar 668, bvar 669, bvar 681, bvar 682]),
    bnot (bands [bvar 668, bvar 670, bvar 681, bvar 683]),
    bnot (bands [bvar 668, bvar 671, bvar 681, bvar 684]),
    bnot (bands [bvar 668, bvar 672, bvar 681, bvar 685]),
    bnot (bands [bvar 668, bvar 673, bvar 681, bvar 686]),
    bnot (bands [bvar 669, bvar 670, bvar 682, bvar 683]),
    bnot (bands [bvar 669, bvar 671, bvar 682, bvar 684]),
    bnot (bands [bvar 669, bvar 672, bvar 682, bvar 685]),
    bnot (bands [bvar 669, bvar 673, bvar 682, bvar 686]),
    bnot (bands [bvar 669, bvar 674, bvar 682, bvar 687]),
    bnot (bands [bvar 669, bvar 677, bvar 682, bvar 690]),
    bnot (bands [bvar 670, bvar 671, bvar 683, bvar 684]) ]

def reducedUnionChunk046 : BVLogicalExpr :=
  bands reducedUnionChunk046Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
