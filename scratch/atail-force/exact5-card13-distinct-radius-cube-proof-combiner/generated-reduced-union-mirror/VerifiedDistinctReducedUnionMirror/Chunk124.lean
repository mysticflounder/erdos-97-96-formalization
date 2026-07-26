import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk124Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 652, bvar 656, bvar 158, bvar 162]),
    bnot (bands [bvar 652, bvar 657, bvar 158, bvar 163]),
    bnot (bands [bvar 652, bvar 658, bvar 158, bvar 164]),
    bnot (bands [bvar 652, bvar 659, bvar 158, bvar 165]),
    bnot (bands [bvar 652, bvar 660, bvar 158, bvar 166]),
    bnot (bands [bvar 652, bvar 663, bvar 158, bvar 169]),
    bnot (bands [bvar 652, bvar 664, bvar 158, bvar 170]),
    bnot (bands [bvar 653, bvar 656, bvar 159, bvar 162]),
    bnot (bands [bvar 653, bvar 657, bvar 159, bvar 163]),
    bnot (bands [bvar 653, bvar 658, bvar 159, bvar 164]),
    bnot (bands [bvar 653, bvar 659, bvar 159, bvar 165]),
    bnot (bands [bvar 653, bvar 660, bvar 159, bvar 166]),
    bnot (bands [bvar 653, bvar 663, bvar 159, bvar 169]),
    bnot (bands [bvar 653, bvar 664, bvar 159, bvar 170]),
    bnot (bands [bvar 654, bvar 656, bvar 160, bvar 162]),
    bnot (bands [bvar 654, bvar 657, bvar 160, bvar 163]),
    bnot (bands [bvar 654, bvar 658, bvar 160, bvar 164]),
    bnot (bands [bvar 654, bvar 659, bvar 160, bvar 165]),
    bnot (bands [bvar 654, bvar 660, bvar 160, bvar 166]),
    bnot (bands [bvar 654, bvar 663, bvar 160, bvar 169]),
    bnot (bands [bvar 654, bvar 664, bvar 160, bvar 170]),
    bnot (bands [bvar 655, bvar 656, bvar 161, bvar 162]),
    bnot (bands [bvar 655, bvar 657, bvar 161, bvar 163]),
    bnot (bands [bvar 655, bvar 658, bvar 161, bvar 164]),
    bnot (bands [bvar 655, bvar 659, bvar 161, bvar 165]),
    bnot (bands [bvar 655, bvar 660, bvar 161, bvar 166]),
    bnot (bands [bvar 655, bvar 663, bvar 161, bvar 169]),
    bnot (bands [bvar 655, bvar 664, bvar 161, bvar 170]),
    bnot (bands [bvar 656, bvar 657, bvar 162, bvar 163]),
    bnot (bands [bvar 656, bvar 658, bvar 162, bvar 164]),
    bnot (bands [bvar 656, bvar 659, bvar 162, bvar 165]),
    bnot (bands [bvar 656, bvar 660, bvar 162, bvar 166]),
    bnot (bands [bvar 656, bvar 663, bvar 162, bvar 169]),
    bnot (bands [bvar 656, bvar 664, bvar 162, bvar 170]),
    bnot (bands [bvar 657, bvar 658, bvar 163, bvar 164]),
    bnot (bands [bvar 657, bvar 659, bvar 163, bvar 165]),
    bnot (bands [bvar 657, bvar 660, bvar 163, bvar 166]),
    bnot (bands [bvar 657, bvar 663, bvar 163, bvar 169]),
    bnot (bands [bvar 657, bvar 664, bvar 163, bvar 170]),
    bnot (bands [bvar 658, bvar 659, bvar 164, bvar 165]),
    bnot (bands [bvar 658, bvar 660, bvar 164, bvar 166]),
    bnot (bands [bvar 658, bvar 663, bvar 164, bvar 169]),
    bnot (bands [bvar 658, bvar 664, bvar 164, bvar 170]),
    bnot (bands [bvar 659, bvar 660, bvar 165, bvar 166]),
    bnot (bands [bvar 659, bvar 663, bvar 165, bvar 169]),
    bnot (bands [bvar 659, bvar 664, bvar 165, bvar 170]),
    bnot (bands [bvar 660, bvar 663, bvar 166, bvar 169]),
    bnot (bands [bvar 660, bvar 664, bvar 166, bvar 170]),
    bnot (bands [bvar 663, bvar 664, bvar 169, bvar 170]),
    bnot (bands [bvar 145, bvar 146, bvar 678, bvar 679]),
    bnot (bands [bvar 145, bvar 150, bvar 678, bvar 683]),
    bnot (bands [bvar 145, bvar 151, bvar 678, bvar 684]),
    bnot (bands [bvar 145, bvar 152, bvar 678, bvar 685]),
    bnot (bands [bvar 145, bvar 153, bvar 678, bvar 686]),
    bnot (bands [bvar 145, bvar 157, bvar 678, bvar 690]),
    bnot (bands [bvar 146, bvar 150, bvar 679, bvar 683]),
    bnot (bands [bvar 146, bvar 151, bvar 679, bvar 684]),
    bnot (bands [bvar 146, bvar 152, bvar 679, bvar 685]),
    bnot (bands [bvar 146, bvar 153, bvar 679, bvar 686]),
    bnot (bands [bvar 146, bvar 157, bvar 679, bvar 690]),
    bnot (bands [bvar 147, bvar 150, bvar 680, bvar 683]),
    bnot (bands [bvar 147, bvar 151, bvar 680, bvar 684]),
    bnot (bands [bvar 148, bvar 149, bvar 681, bvar 682]),
    bnot (bands [bvar 148, bvar 150, bvar 681, bvar 683]) ]

def reducedUnionChunk124 : BVLogicalExpr :=
  bands reducedUnionChunk124Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
