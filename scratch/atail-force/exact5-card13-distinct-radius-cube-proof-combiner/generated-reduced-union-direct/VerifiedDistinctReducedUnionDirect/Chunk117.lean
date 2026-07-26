import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk117Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 147, bvar 157, bvar 667, bvar 677]),
    bnot (bands [bvar 148, bvar 149, bvar 668, bvar 669]),
    bnot (bands [bvar 148, bvar 150, bvar 668, bvar 670]),
    bnot (bands [bvar 148, bvar 151, bvar 668, bvar 671]),
    bnot (bands [bvar 148, bvar 152, bvar 668, bvar 672]),
    bnot (bands [bvar 148, bvar 153, bvar 668, bvar 673]),
    bnot (bands [bvar 148, bvar 156, bvar 668, bvar 676]),
    bnot (bands [bvar 148, bvar 157, bvar 668, bvar 677]),
    bnot (bands [bvar 149, bvar 150, bvar 669, bvar 670]),
    bnot (bands [bvar 149, bvar 151, bvar 669, bvar 671]),
    bnot (bands [bvar 149, bvar 152, bvar 669, bvar 672]),
    bnot (bands [bvar 149, bvar 153, bvar 669, bvar 673]),
    bnot (bands [bvar 149, bvar 156, bvar 669, bvar 676]),
    bnot (bands [bvar 149, bvar 157, bvar 669, bvar 677]),
    bnot (bands [bvar 150, bvar 151, bvar 670, bvar 671]),
    bnot (bands [bvar 150, bvar 152, bvar 670, bvar 672]),
    bnot (bands [bvar 150, bvar 153, bvar 670, bvar 673]),
    bnot (bands [bvar 150, bvar 156, bvar 670, bvar 676]),
    bnot (bands [bvar 150, bvar 157, bvar 670, bvar 677]),
    bnot (bands [bvar 151, bvar 152, bvar 671, bvar 672]),
    bnot (bands [bvar 151, bvar 153, bvar 671, bvar 673]),
    bnot (bands [bvar 151, bvar 156, bvar 671, bvar 676]),
    bnot (bands [bvar 151, bvar 157, bvar 671, bvar 677]),
    bnot (bands [bvar 152, bvar 153, bvar 672, bvar 673]),
    bnot (bands [bvar 152, bvar 156, bvar 672, bvar 676]),
    bnot (bands [bvar 152, bvar 157, bvar 672, bvar 677]),
    bnot (bands [bvar 153, bvar 156, bvar 673, bvar 676]),
    bnot (bands [bvar 153, bvar 157, bvar 673, bvar 677]),
    bnot (bands [bvar 156, bvar 157, bvar 676, bvar 677]),
    bnot (bands [bvar 652, bvar 653, bvar 158, bvar 159]),
    bnot (bands [bvar 652, bvar 654, bvar 158, bvar 160]),
    bnot (bands [bvar 652, bvar 655, bvar 158, bvar 161]),
    bnot (bands [bvar 652, bvar 656, bvar 158, bvar 162]),
    bnot (bands [bvar 652, bvar 657, bvar 158, bvar 163]),
    bnot (bands [bvar 652, bvar 658, bvar 158, bvar 164]),
    bnot (bands [bvar 652, bvar 659, bvar 158, bvar 165]),
    bnot (bands [bvar 652, bvar 660, bvar 158, bvar 166]),
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
    bnot (bands [bvar 655, bvar 660, bvar 161, bvar 166]),
    bnot (bands [bvar 655, bvar 663, bvar 161, bvar 169]),
    bnot (bands [bvar 655, bvar 664, bvar 161, bvar 170]),
    bnot (bands [bvar 656, bvar 657, bvar 162, bvar 163]),
    bnot (bands [bvar 656, bvar 658, bvar 162, bvar 164]),
    bnot (bands [bvar 656, bvar 659, bvar 162, bvar 165]),
    bnot (bands [bvar 656, bvar 660, bvar 162, bvar 166]),
    bnot (bands [bvar 656, bvar 663, bvar 162, bvar 169]),
    bnot (bands [bvar 656, bvar 664, bvar 162, bvar 170]),
    bnot (bands [bvar 657, bvar 658, bvar 163, bvar 164]) ]

def reducedUnionChunk117 : BVLogicalExpr :=
  bands reducedUnionChunk117Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
