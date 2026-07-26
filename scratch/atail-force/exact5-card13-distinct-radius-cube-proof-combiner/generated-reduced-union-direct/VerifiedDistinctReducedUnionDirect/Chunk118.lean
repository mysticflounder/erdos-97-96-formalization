import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk118Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 657, bvar 659, bvar 163, bvar 165]),
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
    bnot (bands [bvar 145, bvar 147, bvar 678, bvar 680]),
    bnot (bands [bvar 145, bvar 149, bvar 678, bvar 682]),
    bnot (bands [bvar 145, bvar 150, bvar 678, bvar 683]),
    bnot (bands [bvar 145, bvar 151, bvar 678, bvar 684]),
    bnot (bands [bvar 145, bvar 152, bvar 678, bvar 685]),
    bnot (bands [bvar 145, bvar 153, bvar 678, bvar 686]),
    bnot (bands [bvar 146, bvar 149, bvar 679, bvar 682]),
    bnot (bands [bvar 146, bvar 150, bvar 679, bvar 683]),
    bnot (bands [bvar 146, bvar 151, bvar 679, bvar 684]),
    bnot (bands [bvar 146, bvar 152, bvar 679, bvar 685]),
    bnot (bands [bvar 146, bvar 153, bvar 679, bvar 686]),
    bnot (bands [bvar 146, bvar 157, bvar 679, bvar 690]),
    bnot (bands [bvar 147, bvar 149, bvar 680, bvar 682]),
    bnot (bands [bvar 147, bvar 151, bvar 680, bvar 684]),
    bnot (bands [bvar 147, bvar 152, bvar 680, bvar 685]),
    bnot (bands [bvar 147, bvar 153, bvar 680, bvar 686]),
    bnot (bands [bvar 147, bvar 157, bvar 680, bvar 690]),
    bnot (bands [bvar 148, bvar 149, bvar 681, bvar 682]),
    bnot (bands [bvar 148, bvar 152, bvar 681, bvar 685]),
    bnot (bands [bvar 148, bvar 157, bvar 681, bvar 690]),
    bnot (bands [bvar 149, bvar 150, bvar 682, bvar 683]),
    bnot (bands [bvar 149, bvar 151, bvar 682, bvar 684]),
    bnot (bands [bvar 149, bvar 152, bvar 682, bvar 685]),
    bnot (bands [bvar 149, bvar 153, bvar 682, bvar 686]),
    bnot (bands [bvar 149, bvar 157, bvar 682, bvar 690]),
    bnot (bands [bvar 150, bvar 152, bvar 683, bvar 685]),
    bnot (bands [bvar 150, bvar 153, bvar 683, bvar 686]),
    bnot (bands [bvar 150, bvar 157, bvar 683, bvar 690]),
    bnot (bands [bvar 151, bvar 152, bvar 684, bvar 685]),
    bnot (bands [bvar 151, bvar 153, bvar 684, bvar 686]),
    bnot (bands [bvar 151, bvar 157, bvar 684, bvar 690]),
    bnot (bands [bvar 152, bvar 153, bvar 685, bvar 686]),
    bnot (bands [bvar 152, bvar 157, bvar 685, bvar 690]),
    bnot (bands [bvar 153, bvar 157, bvar 686, bvar 690]),
    bnot (bands [bvar 652, bvar 653, bvar 171, bvar 172]),
    bnot (bands [bvar 652, bvar 654, bvar 171, bvar 173]),
    bnot (bands [bvar 652, bvar 656, bvar 171, bvar 175]),
    bnot (bands [bvar 652, bvar 658, bvar 171, bvar 177]),
    bnot (bands [bvar 652, bvar 659, bvar 171, bvar 178]),
    bnot (bands [bvar 652, bvar 660, bvar 171, bvar 179]),
    bnot (bands [bvar 652, bvar 664, bvar 171, bvar 183]),
    bnot (bands [bvar 653, bvar 656, bvar 172, bvar 175]),
    bnot (bands [bvar 653, bvar 658, bvar 172, bvar 177]),
    bnot (bands [bvar 653, bvar 659, bvar 172, bvar 178]),
    bnot (bands [bvar 653, bvar 660, bvar 172, bvar 179]),
    bnot (bands [bvar 653, bvar 664, bvar 172, bvar 183]),
    bnot (bands [bvar 654, bvar 656, bvar 173, bvar 175]),
    bnot (bands [bvar 654, bvar 658, bvar 173, bvar 177]),
    bnot (bands [bvar 654, bvar 659, bvar 173, bvar 178]) ]

def reducedUnionChunk118 : BVLogicalExpr :=
  bands reducedUnionChunk118Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
