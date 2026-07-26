import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk114Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 600, bvar 603, bvar 158, bvar 161]),
    bnot (bands [bvar 600, bvar 604, bvar 158, bvar 162]),
    bnot (bands [bvar 600, bvar 611, bvar 158, bvar 169]),
    bnot (bands [bvar 601, bvar 604, bvar 159, bvar 162]),
    bnot (bands [bvar 602, bvar 604, bvar 160, bvar 162]),
    bnot (bands [bvar 602, bvar 612, bvar 160, bvar 170]),
    bnot (bands [bvar 603, bvar 604, bvar 161, bvar 162]),
    bnot (bands [bvar 603, bvar 611, bvar 161, bvar 169]),
    bnot (bands [bvar 603, bvar 612, bvar 161, bvar 170]),
    bnot (bands [bvar 604, bvar 611, bvar 162, bvar 169]),
    bnot (bands [bvar 604, bvar 612, bvar 162, bvar 170]),
    bnot (bands [bvar 607, bvar 608, bvar 165, bvar 166]),
    bnot (bands [bvar 607, bvar 609, bvar 165, bvar 167]),
    bnot (bands [bvar 608, bvar 609, bvar 166, bvar 167]),
    bnot (bands [bvar 611, bvar 612, bvar 169, bvar 170]),
    bnot (bands [bvar 99, bvar 101, bvar 684, bvar 686]),
    bnot (bands [bvar 600, bvar 601, bvar 171, bvar 172]),
    bnot (bands [bvar 600, bvar 602, bvar 171, bvar 173]),
    bnot (bands [bvar 606, bvar 608, bvar 177, bvar 179]),
    bnot (bands [bvar 606, bvar 610, bvar 177, bvar 181]),
    bnot (bands [bvar 607, bvar 609, bvar 178, bvar 180]),
    bnot (bands [bvar 93, bvar 94, bvar 691, bvar 692]),
    bnot (bands [bvar 93, bvar 96, bvar 691, bvar 694]),
    bnot (bands [bvar 93, bvar 97, bvar 691, bvar 695]),
    bnot (bands [bvar 94, bvar 97, bvar 692, bvar 695]),
    bnot (bands [bvar 95, bvar 97, bvar 693, bvar 695]),
    bnot (bands [bvar 96, bvar 97, bvar 694, bvar 695]),
    bnot (bands [bvar 99, bvar 100, bvar 697, bvar 698]),
    bnot (bands [bvar 99, bvar 101, bvar 697, bvar 699]),
    bnot (bands [bvar 99, bvar 102, bvar 697, bvar 700]),
    bnot (bands [bvar 99, bvar 103, bvar 697, bvar 701]),
    bnot (bands [bvar 99, bvar 104, bvar 697, bvar 702]),
    bnot (bands [bvar 100, bvar 101, bvar 698, bvar 699]),
    bnot (bands [bvar 100, bvar 102, bvar 698, bvar 700]),
    bnot (bands [bvar 100, bvar 103, bvar 698, bvar 701]),
    bnot (bands [bvar 100, bvar 104, bvar 698, bvar 702]),
    bnot (bands [bvar 101, bvar 102, bvar 699, bvar 700]),
    bnot (bands [bvar 101, bvar 103, bvar 699, bvar 701]),
    bnot (bands [bvar 101, bvar 104, bvar 699, bvar 702]),
    bnot (bands [bvar 102, bvar 103, bvar 700, bvar 701]),
    bnot (bands [bvar 102, bvar 104, bvar 700, bvar 702]),
    bnot (bands [bvar 103, bvar 104, bvar 701, bvar 702]),
    bnot (bands [bvar 600, bvar 601, bvar 184, bvar 185]),
    bnot (bands [bvar 607, bvar 611, bvar 191, bvar 195]),
    bnot (bands [bvar 107, bvar 110, bvar 627, bvar 630]),
    bnot (bands [bvar 108, bvar 110, bvar 628, bvar 630]),
    bnot (bands [bvar 108, bvar 111, bvar 628, bvar 631]),
    bnot (bands [bvar 108, bvar 114, bvar 628, bvar 634]),
    bnot (bands [bvar 108, bvar 115, bvar 628, bvar 635]),
    bnot (bands [bvar 108, bvar 116, bvar 628, bvar 636]),
    bnot (bands [bvar 109, bvar 110, bvar 629, bvar 630]),
    bnot (bands [bvar 109, bvar 111, bvar 629, bvar 631]),
    bnot (bands [bvar 109, bvar 114, bvar 629, bvar 634]),
    bnot (bands [bvar 109, bvar 115, bvar 629, bvar 635]),
    bnot (bands [bvar 109, bvar 116, bvar 629, bvar 636]),
    bnot (bands [bvar 109, bvar 117, bvar 629, bvar 637]),
    bnot (bands [bvar 109, bvar 118, bvar 629, bvar 638]),
    bnot (bands [bvar 110, bvar 111, bvar 630, bvar 631]),
    bnot (bands [bvar 110, bvar 115, bvar 630, bvar 635]),
    bnot (bands [bvar 110, bvar 116, bvar 630, bvar 636]),
    bnot (bands [bvar 110, bvar 118, bvar 630, bvar 638]),
    bnot (bands [bvar 111, bvar 114, bvar 631, bvar 634]),
    bnot (bands [bvar 111, bvar 115, bvar 631, bvar 635]),
    bnot (bands [bvar 111, bvar 116, bvar 631, bvar 636]) ]

def reducedUnionChunk114 : BVLogicalExpr :=
  bands reducedUnionChunk114Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
