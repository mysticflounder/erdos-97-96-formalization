import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk116Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 135, bvar 144, bvar 681, bvar 690]),
    bnot (bands [bvar 137, bvar 144, bvar 683, bvar 690]),
    bnot (bands [bvar 139, bvar 144, bvar 685, bvar 690]),
    bnot (bands [bvar 639, bvar 640, bvar 171, bvar 172]),
    bnot (bands [bvar 639, bvar 643, bvar 171, bvar 175]),
    bnot (bands [bvar 639, bvar 644, bvar 171, bvar 176]),
    bnot (bands [bvar 639, bvar 645, bvar 171, bvar 177]),
    bnot (bands [bvar 639, bvar 646, bvar 171, bvar 178]),
    bnot (bands [bvar 639, bvar 651, bvar 171, bvar 183]),
    bnot (bands [bvar 640, bvar 643, bvar 172, bvar 175]),
    bnot (bands [bvar 640, bvar 645, bvar 172, bvar 177]),
    bnot (bands [bvar 640, bvar 646, bvar 172, bvar 178]),
    bnot (bands [bvar 640, bvar 651, bvar 172, bvar 183]),
    bnot (bands [bvar 643, bvar 651, bvar 175, bvar 183]),
    bnot (bands [bvar 644, bvar 651, bvar 176, bvar 183]),
    bnot (bands [bvar 645, bvar 651, bvar 177, bvar 183]),
    bnot (bands [bvar 132, bvar 135, bvar 691, bvar 694]),
    bnot (bands [bvar 132, bvar 136, bvar 691, bvar 695]),
    bnot (bands [bvar 132, bvar 137, bvar 691, bvar 696]),
    bnot (bands [bvar 132, bvar 138, bvar 691, bvar 697]),
    bnot (bands [bvar 132, bvar 139, bvar 691, bvar 698]),
    bnot (bands [bvar 133, bvar 136, bvar 692, bvar 695]),
    bnot (bands [bvar 133, bvar 138, bvar 692, bvar 697]),
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
    bnot (bands [bvar 639, bvar 644, bvar 184, bvar 189]),
    bnot (bands [bvar 639, bvar 645, bvar 184, bvar 190]),
    bnot (bands [bvar 639, bvar 646, bvar 184, bvar 191]),
    bnot (bands [bvar 640, bvar 643, bvar 185, bvar 188]),
    bnot (bands [bvar 640, bvar 645, bvar 185, bvar 190]),
    bnot (bands [bvar 640, bvar 646, bvar 185, bvar 191]),
    bnot (bands [bvar 648, bvar 650, bvar 193, bvar 195]),
    bnot (bands [bvar 145, bvar 146, bvar 665, bvar 666]),
    bnot (bands [bvar 145, bvar 147, bvar 665, bvar 667]),
    bnot (bands [bvar 145, bvar 148, bvar 665, bvar 668]),
    bnot (bands [bvar 145, bvar 149, bvar 665, bvar 669]),
    bnot (bands [bvar 145, bvar 150, bvar 665, bvar 670]),
    bnot (bands [bvar 145, bvar 151, bvar 665, bvar 671]),
    bnot (bands [bvar 145, bvar 152, bvar 665, bvar 672]),
    bnot (bands [bvar 145, bvar 153, bvar 665, bvar 673]),
    bnot (bands [bvar 145, bvar 156, bvar 665, bvar 676]),
    bnot (bands [bvar 145, bvar 157, bvar 665, bvar 677]),
    bnot (bands [bvar 146, bvar 149, bvar 666, bvar 669]),
    bnot (bands [bvar 146, bvar 150, bvar 666, bvar 670]),
    bnot (bands [bvar 146, bvar 151, bvar 666, bvar 671]),
    bnot (bands [bvar 146, bvar 152, bvar 666, bvar 672]),
    bnot (bands [bvar 146, bvar 153, bvar 666, bvar 673]),
    bnot (bands [bvar 146, bvar 156, bvar 666, bvar 676]),
    bnot (bands [bvar 146, bvar 157, bvar 666, bvar 677]),
    bnot (bands [bvar 147, bvar 149, bvar 667, bvar 669]),
    bnot (bands [bvar 147, bvar 150, bvar 667, bvar 670]),
    bnot (bands [bvar 147, bvar 151, bvar 667, bvar 671]),
    bnot (bands [bvar 147, bvar 152, bvar 667, bvar 672]),
    bnot (bands [bvar 147, bvar 153, bvar 667, bvar 673]),
    bnot (bands [bvar 147, bvar 156, bvar 667, bvar 676]) ]

def reducedUnionChunk116 : BVLogicalExpr :=
  bands reducedUnionChunk116Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
