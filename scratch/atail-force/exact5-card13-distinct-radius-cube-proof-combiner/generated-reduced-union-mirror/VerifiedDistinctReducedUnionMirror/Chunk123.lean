import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk123Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 640, bvar 651, bvar 172, bvar 183]),
    bnot (bands [bvar 643, bvar 645, bvar 175, bvar 177]),
    bnot (bands [bvar 643, bvar 646, bvar 175, bvar 178]),
    bnot (bands [bvar 643, bvar 651, bvar 175, bvar 183]),
    bnot (bands [bvar 645, bvar 646, bvar 177, bvar 178]),
    bnot (bands [bvar 645, bvar 651, bvar 177, bvar 183]),
    bnot (bands [bvar 132, bvar 133, bvar 691, bvar 692]),
    bnot (bands [bvar 132, bvar 135, bvar 691, bvar 694]),
    bnot (bands [bvar 132, bvar 136, bvar 691, bvar 695]),
    bnot (bands [bvar 132, bvar 137, bvar 691, bvar 696]),
    bnot (bands [bvar 132, bvar 138, bvar 691, bvar 697]),
    bnot (bands [bvar 132, bvar 139, bvar 691, bvar 698]),
    bnot (bands [bvar 133, bvar 139, bvar 692, bvar 698]),
    bnot (bands [bvar 134, bvar 139, bvar 693, bvar 698]),
    bnot (bands [bvar 135, bvar 136, bvar 694, bvar 695]),
    bnot (bands [bvar 135, bvar 137, bvar 694, bvar 696]),
    bnot (bands [bvar 135, bvar 138, bvar 694, bvar 697]),
    bnot (bands [bvar 135, bvar 139, bvar 694, bvar 698]),
    bnot (bands [bvar 136, bvar 138, bvar 695, bvar 697]),
    bnot (bands [bvar 136, bvar 139, bvar 695, bvar 698]),
    bnot (bands [bvar 138, bvar 139, bvar 697, bvar 698]),
    bnot (bands [bvar 639, bvar 640, bvar 184, bvar 185]),
    bnot (bands [bvar 639, bvar 643, bvar 184, bvar 188]),
    bnot (bands [bvar 639, bvar 645, bvar 184, bvar 190]),
    bnot (bands [bvar 640, bvar 643, bvar 185, bvar 188]),
    bnot (bands [bvar 640, bvar 645, bvar 185, bvar 190]),
    bnot (bands [bvar 145, bvar 146, bvar 665, bvar 666]),
    bnot (bands [bvar 145, bvar 149, bvar 665, bvar 669]),
    bnot (bands [bvar 145, bvar 151, bvar 665, bvar 671]),
    bnot (bands [bvar 145, bvar 152, bvar 665, bvar 672]),
    bnot (bands [bvar 145, bvar 153, bvar 665, bvar 673]),
    bnot (bands [bvar 145, bvar 156, bvar 665, bvar 676]),
    bnot (bands [bvar 146, bvar 149, bvar 666, bvar 669]),
    bnot (bands [bvar 146, bvar 150, bvar 666, bvar 670]),
    bnot (bands [bvar 146, bvar 151, bvar 666, bvar 671]),
    bnot (bands [bvar 146, bvar 152, bvar 666, bvar 672]),
    bnot (bands [bvar 146, bvar 153, bvar 666, bvar 673]),
    bnot (bands [bvar 146, bvar 156, bvar 666, bvar 676]),
    bnot (bands [bvar 147, bvar 149, bvar 667, bvar 669]),
    bnot (bands [bvar 147, bvar 153, bvar 667, bvar 673]),
    bnot (bands [bvar 148, bvar 149, bvar 668, bvar 669]),
    bnot (bands [bvar 148, bvar 150, bvar 668, bvar 670]),
    bnot (bands [bvar 148, bvar 153, bvar 668, bvar 673]),
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
    bnot (bands [bvar 151, bvar 153, bvar 671, bvar 673]),
    bnot (bands [bvar 151, bvar 156, bvar 671, bvar 676]),
    bnot (bands [bvar 151, bvar 157, bvar 671, bvar 677]),
    bnot (bands [bvar 152, bvar 153, bvar 672, bvar 673]),
    bnot (bands [bvar 152, bvar 156, bvar 672, bvar 676]),
    bnot (bands [bvar 153, bvar 156, bvar 673, bvar 676]),
    bnot (bands [bvar 153, bvar 157, bvar 673, bvar 677]),
    bnot (bands [bvar 156, bvar 157, bvar 676, bvar 677]),
    bnot (bands [bvar 652, bvar 653, bvar 158, bvar 159]),
    bnot (bands [bvar 652, bvar 654, bvar 158, bvar 160]),
    bnot (bands [bvar 652, bvar 655, bvar 158, bvar 161]) ]

def reducedUnionChunk123 : BVLogicalExpr :=
  bands reducedUnionChunk123Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
