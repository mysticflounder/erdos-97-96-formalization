import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk126Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 145, bvar 153, bvar 691, bvar 699]),
    bnot (bands [bvar 146, bvar 149, bvar 692, bvar 695]),
    bnot (bands [bvar 146, bvar 151, bvar 692, bvar 697]),
    bnot (bands [bvar 146, bvar 152, bvar 692, bvar 698]),
    bnot (bands [bvar 146, bvar 153, bvar 692, bvar 699]),
    bnot (bands [bvar 147, bvar 149, bvar 693, bvar 695]),
    bnot (bands [bvar 147, bvar 151, bvar 693, bvar 697]),
    bnot (bands [bvar 147, bvar 152, bvar 693, bvar 698]),
    bnot (bands [bvar 147, bvar 153, bvar 693, bvar 699]),
    bnot (bands [bvar 148, bvar 149, bvar 694, bvar 695]),
    bnot (bands [bvar 148, bvar 152, bvar 694, bvar 698]),
    bnot (bands [bvar 148, bvar 153, bvar 694, bvar 699]),
    bnot (bands [bvar 149, bvar 150, bvar 695, bvar 696]),
    bnot (bands [bvar 149, bvar 151, bvar 695, bvar 697]),
    bnot (bands [bvar 149, bvar 152, bvar 695, bvar 698]),
    bnot (bands [bvar 149, bvar 153, bvar 695, bvar 699]),
    bnot (bands [bvar 150, bvar 153, bvar 696, bvar 699]),
    bnot (bands [bvar 151, bvar 152, bvar 697, bvar 698]),
    bnot (bands [bvar 151, bvar 153, bvar 697, bvar 699]),
    bnot (bands [bvar 152, bvar 153, bvar 698, bvar 699]),
    bnot (bands [bvar 155, bvar 156, bvar 701, bvar 702]),
    bnot (bands [bvar 652, bvar 653, bvar 184, bvar 185]),
    bnot (bands [bvar 652, bvar 657, bvar 184, bvar 189]),
    bnot (bands [bvar 652, bvar 658, bvar 184, bvar 190]),
    bnot (bands [bvar 652, bvar 660, bvar 184, bvar 192]),
    bnot (bands [bvar 653, bvar 657, bvar 185, bvar 189]),
    bnot (bands [bvar 653, bvar 658, bvar 185, bvar 190]),
    bnot (bands [bvar 653, bvar 659, bvar 185, bvar 191]),
    bnot (bands [bvar 653, bvar 660, bvar 185, bvar 192]),
    bnot (bands [bvar 654, bvar 657, bvar 186, bvar 189]),
    bnot (bands [bvar 654, bvar 660, bvar 186, bvar 192]),
    bnot (bands [bvar 655, bvar 657, bvar 187, bvar 189]),
    bnot (bands [bvar 655, bvar 658, bvar 187, bvar 190]),
    bnot (bands [bvar 656, bvar 657, bvar 188, bvar 189]),
    bnot (bands [bvar 657, bvar 658, bvar 189, bvar 190]),
    bnot (bands [bvar 657, bvar 659, bvar 189, bvar 191]),
    bnot (bands [bvar 657, bvar 660, bvar 189, bvar 192]),
    bnot (bands [bvar 658, bvar 659, bvar 190, bvar 191]),
    bnot (bands [bvar 658, bvar 660, bvar 190, bvar 192]),
    bnot (bands [bvar 158, bvar 166, bvar 678, bvar 686]),
    bnot (bands [bvar 159, bvar 162, bvar 679, bvar 682]),
    bnot (bands [bvar 159, bvar 166, bvar 679, bvar 686]),
    bnot (bands [bvar 160, bvar 166, bvar 680, bvar 686]),
    bnot (bands [bvar 161, bvar 162, bvar 681, bvar 682]),
    bnot (bands [bvar 161, bvar 163, bvar 681, bvar 683]),
    bnot (bands [bvar 161, bvar 164, bvar 681, bvar 684]),
    bnot (bands [bvar 161, bvar 165, bvar 681, bvar 685]),
    bnot (bands [bvar 161, bvar 166, bvar 681, bvar 686]),
    bnot (bands [bvar 162, bvar 163, bvar 682, bvar 683]),
    bnot (bands [bvar 162, bvar 164, bvar 682, bvar 684]),
    bnot (bands [bvar 162, bvar 165, bvar 682, bvar 685]),
    bnot (bands [bvar 162, bvar 166, bvar 682, bvar 686]),
    bnot (bands [bvar 163, bvar 164, bvar 683, bvar 684]),
    bnot (bands [bvar 163, bvar 165, bvar 683, bvar 685]),
    bnot (bands [bvar 163, bvar 166, bvar 683, bvar 686]),
    bnot (bands [bvar 163, bvar 167, bvar 683, bvar 687]),
    bnot (bands [bvar 163, bvar 170, bvar 683, bvar 690]),
    bnot (bands [bvar 164, bvar 165, bvar 684, bvar 685]),
    bnot (bands [bvar 164, bvar 166, bvar 684, bvar 686]),
    bnot (bands [bvar 165, bvar 166, bvar 685, bvar 686]),
    bnot (bands [bvar 165, bvar 170, bvar 685, bvar 690]),
    bnot (bands [bvar 665, bvar 666, bvar 171, bvar 172]),
    bnot (bands [bvar 665, bvar 667, bvar 171, bvar 173]),
    bnot (bands [bvar 665, bvar 668, bvar 171, bvar 174]) ]

def reducedUnionChunk126 : BVLogicalExpr :=
  bands reducedUnionChunk126Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
