import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk107Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 32, bvar 38, bvar 695, bvar 701]),
    bnot (bands [bvar 32, bvar 39, bvar 695, bvar 702]),
    bnot (bands [bvar 33, bvar 34, bvar 696, bvar 697]),
    bnot (bands [bvar 33, bvar 35, bvar 696, bvar 698]),
    bnot (bands [bvar 33, bvar 36, bvar 696, bvar 699]),
    bnot (bands [bvar 33, bvar 37, bvar 696, bvar 700]),
    bnot (bands [bvar 33, bvar 38, bvar 696, bvar 701]),
    bnot (bands [bvar 33, bvar 39, bvar 696, bvar 702]),
    bnot (bands [bvar 34, bvar 35, bvar 697, bvar 698]),
    bnot (bands [bvar 34, bvar 36, bvar 697, bvar 699]),
    bnot (bands [bvar 34, bvar 37, bvar 697, bvar 700]),
    bnot (bands [bvar 34, bvar 38, bvar 697, bvar 701]),
    bnot (bands [bvar 34, bvar 39, bvar 697, bvar 702]),
    bnot (bands [bvar 35, bvar 36, bvar 698, bvar 699]),
    bnot (bands [bvar 35, bvar 37, bvar 698, bvar 700]),
    bnot (bands [bvar 35, bvar 38, bvar 698, bvar 701]),
    bnot (bands [bvar 35, bvar 39, bvar 698, bvar 702]),
    bnot (bands [bvar 536, bvar 539, bvar 185, bvar 188]),
    bnot (bands [bvar 536, bvar 540, bvar 185, bvar 189]),
    bnot (bands [bvar 536, bvar 541, bvar 185, bvar 190]),
    bnot (bands [bvar 536, bvar 542, bvar 185, bvar 191]),
    bnot (bands [bvar 536, bvar 543, bvar 185, bvar 192]),
    bnot (bands [bvar 536, bvar 545, bvar 185, bvar 194]),
    bnot (bands [bvar 536, bvar 546, bvar 185, bvar 195]),
    bnot (bands [bvar 537, bvar 539, bvar 186, bvar 188]),
    bnot (bands [bvar 537, bvar 540, bvar 186, bvar 189]),
    bnot (bands [bvar 537, bvar 541, bvar 186, bvar 190]),
    bnot (bands [bvar 537, bvar 542, bvar 186, bvar 191]),
    bnot (bands [bvar 537, bvar 543, bvar 186, bvar 192]),
    bnot (bands [bvar 537, bvar 544, bvar 186, bvar 193]),
    bnot (bands [bvar 537, bvar 545, bvar 186, bvar 194]),
    bnot (bands [bvar 537, bvar 546, bvar 186, bvar 195]),
    bnot (bands [bvar 538, bvar 540, bvar 187, bvar 189]),
    bnot (bands [bvar 538, bvar 541, bvar 187, bvar 190]),
    bnot (bands [bvar 539, bvar 540, bvar 188, bvar 189]),
    bnot (bands [bvar 539, bvar 541, bvar 188, bvar 190]),
    bnot (bands [bvar 539, bvar 542, bvar 188, bvar 191]),
    bnot (bands [bvar 539, bvar 543, bvar 188, bvar 192]),
    bnot (bands [bvar 539, bvar 544, bvar 188, bvar 193]),
    bnot (bands [bvar 539, bvar 545, bvar 188, bvar 194]),
    bnot (bands [bvar 539, bvar 546, bvar 188, bvar 195]),
    bnot (bands [bvar 540, bvar 541, bvar 189, bvar 190]),
    bnot (bands [bvar 540, bvar 542, bvar 189, bvar 191]),
    bnot (bands [bvar 540, bvar 543, bvar 189, bvar 192]),
    bnot (bands [bvar 540, bvar 544, bvar 189, bvar 193]),
    bnot (bands [bvar 540, bvar 545, bvar 189, bvar 194]),
    bnot (bands [bvar 540, bvar 546, bvar 189, bvar 195]),
    bnot (bands [bvar 541, bvar 542, bvar 190, bvar 191]),
    bnot (bands [bvar 541, bvar 543, bvar 190, bvar 192]),
    bnot (bands [bvar 541, bvar 544, bvar 190, bvar 193]),
    bnot (bands [bvar 541, bvar 545, bvar 190, bvar 194]),
    bnot (bands [bvar 541, bvar 546, bvar 190, bvar 195]),
    bnot (bands [bvar 542, bvar 543, bvar 191, bvar 192]),
    bnot (bands [bvar 542, bvar 544, bvar 191, bvar 193]),
    bnot (bands [bvar 542, bvar 545, bvar 191, bvar 194]),
    bnot (bands [bvar 542, bvar 546, bvar 191, bvar 195]),
    bnot (bands [bvar 543, bvar 546, bvar 192, bvar 195]),
    bnot (bands [bvar 545, bvar 546, bvar 194, bvar 195]),
    bnot (bands [bvar 44, bvar 46, bvar 564, bvar 566]),
    bnot (bands [bvar 551, bvar 553, bvar 57, bvar 59]),
    bnot (bands [bvar 551, bvar 552, bvar 96, bvar 97]),
    bnot (bands [bvar 551, bvar 553, bvar 135, bvar 137]),
    bnot (bands [bvar 551, bvar 554, bvar 135, bvar 138]),
    bnot (bands [bvar 46, bvar 49, bvar 670, bvar 673]) ]

def reducedUnionChunk107 : BVLogicalExpr :=
  bands reducedUnionChunk107Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
