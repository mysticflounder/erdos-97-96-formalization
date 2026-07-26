import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk128Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 161, bvar 167, bvar 694, bvar 700]),
    bnot (bands [bvar 162, bvar 163, bvar 695, bvar 696]),
    bnot (bands [bvar 162, bvar 164, bvar 695, bvar 697]),
    bnot (bands [bvar 162, bvar 165, bvar 695, bvar 698]),
    bnot (bands [bvar 162, bvar 166, bvar 695, bvar 699]),
    bnot (bands [bvar 162, bvar 167, bvar 695, bvar 700]),
    bnot (bands [bvar 163, bvar 164, bvar 696, bvar 697]),
    bnot (bands [bvar 163, bvar 165, bvar 696, bvar 698]),
    bnot (bands [bvar 163, bvar 166, bvar 696, bvar 699]),
    bnot (bands [bvar 163, bvar 167, bvar 696, bvar 700]),
    bnot (bands [bvar 164, bvar 165, bvar 697, bvar 698]),
    bnot (bands [bvar 164, bvar 166, bvar 697, bvar 699]),
    bnot (bands [bvar 164, bvar 167, bvar 697, bvar 700]),
    bnot (bands [bvar 165, bvar 166, bvar 698, bvar 699]),
    bnot (bands [bvar 165, bvar 167, bvar 698, bvar 700]),
    bnot (bands [bvar 166, bvar 167, bvar 699, bvar 700]),
    bnot (bands [bvar 665, bvar 666, bvar 184, bvar 185]),
    bnot (bands [bvar 665, bvar 667, bvar 184, bvar 186]),
    bnot (bands [bvar 665, bvar 669, bvar 184, bvar 188]),
    bnot (bands [bvar 665, bvar 670, bvar 184, bvar 189]),
    bnot (bands [bvar 665, bvar 671, bvar 184, bvar 190]),
    bnot (bands [bvar 665, bvar 672, bvar 184, bvar 191]),
    bnot (bands [bvar 665, bvar 673, bvar 184, bvar 192]),
    bnot (bands [bvar 666, bvar 669, bvar 185, bvar 188]),
    bnot (bands [bvar 666, bvar 670, bvar 185, bvar 189]),
    bnot (bands [bvar 666, bvar 671, bvar 185, bvar 190]),
    bnot (bands [bvar 666, bvar 672, bvar 185, bvar 191]),
    bnot (bands [bvar 666, bvar 673, bvar 185, bvar 192]),
    bnot (bands [bvar 666, bvar 674, bvar 185, bvar 193]),
    bnot (bands [bvar 667, bvar 669, bvar 186, bvar 188]),
    bnot (bands [bvar 667, bvar 670, bvar 186, bvar 189]),
    bnot (bands [bvar 667, bvar 672, bvar 186, bvar 191]),
    bnot (bands [bvar 667, bvar 673, bvar 186, bvar 192]),
    bnot (bands [bvar 668, bvar 673, bvar 187, bvar 192]),
    bnot (bands [bvar 669, bvar 670, bvar 188, bvar 189]),
    bnot (bands [bvar 669, bvar 671, bvar 188, bvar 190]),
    bnot (bands [bvar 669, bvar 672, bvar 188, bvar 191]),
    bnot (bands [bvar 669, bvar 673, bvar 188, bvar 192]),
    bnot (bands [bvar 669, bvar 674, bvar 188, bvar 193]),
    bnot (bands [bvar 670, bvar 671, bvar 189, bvar 190]),
    bnot (bands [bvar 670, bvar 672, bvar 189, bvar 191]),
    bnot (bands [bvar 670, bvar 673, bvar 189, bvar 192]),
    bnot (bands [bvar 671, bvar 672, bvar 190, bvar 191]),
    bnot (bands [bvar 671, bvar 673, bvar 190, bvar 192]),
    bnot (bands [bvar 671, bvar 674, bvar 190, bvar 193]),
    bnot (bands [bvar 672, bvar 673, bvar 191, bvar 192]),
    bnot (bands [bvar 672, bvar 674, bvar 191, bvar 193]),
    bnot (bands [bvar 673, bvar 674, bvar 192, bvar 193]),
    bnot (bands [bvar 171, bvar 172, bvar 691, bvar 692]),
    bnot (bands [bvar 171, bvar 173, bvar 691, bvar 693]),
    bnot (bands [bvar 171, bvar 175, bvar 691, bvar 695]),
    bnot (bands [bvar 171, bvar 176, bvar 691, bvar 696]),
    bnot (bands [bvar 171, bvar 177, bvar 691, bvar 697]),
    bnot (bands [bvar 171, bvar 178, bvar 691, bvar 698]),
    bnot (bands [bvar 171, bvar 179, bvar 691, bvar 699]),
    bnot (bands [bvar 171, bvar 180, bvar 691, bvar 700]),
    bnot (bands [bvar 171, bvar 181, bvar 691, bvar 701]),
    bnot (bands [bvar 172, bvar 175, bvar 692, bvar 695]),
    bnot (bands [bvar 172, bvar 176, bvar 692, bvar 696]),
    bnot (bands [bvar 172, bvar 177, bvar 692, bvar 697]),
    bnot (bands [bvar 172, bvar 178, bvar 692, bvar 698]),
    bnot (bands [bvar 172, bvar 179, bvar 692, bvar 699]),
    bnot (bands [bvar 172, bvar 180, bvar 692, bvar 700]),
    bnot (bands [bvar 172, bvar 181, bvar 692, bvar 701]) ]

def reducedUnionChunk128 : BVLogicalExpr :=
  bands reducedUnionChunk128Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
