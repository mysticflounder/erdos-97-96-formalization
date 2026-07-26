import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk129Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 173, bvar 175, bvar 693, bvar 695]),
    bnot (bands [bvar 173, bvar 176, bvar 693, bvar 696]),
    bnot (bands [bvar 173, bvar 177, bvar 693, bvar 697]),
    bnot (bands [bvar 173, bvar 178, bvar 693, bvar 698]),
    bnot (bands [bvar 173, bvar 179, bvar 693, bvar 699]),
    bnot (bands [bvar 173, bvar 180, bvar 693, bvar 700]),
    bnot (bands [bvar 174, bvar 175, bvar 694, bvar 695]),
    bnot (bands [bvar 174, bvar 176, bvar 694, bvar 696]),
    bnot (bands [bvar 174, bvar 177, bvar 694, bvar 697]),
    bnot (bands [bvar 175, bvar 176, bvar 695, bvar 696]),
    bnot (bands [bvar 175, bvar 177, bvar 695, bvar 697]),
    bnot (bands [bvar 175, bvar 178, bvar 695, bvar 698]),
    bnot (bands [bvar 175, bvar 179, bvar 695, bvar 699]),
    bnot (bands [bvar 175, bvar 180, bvar 695, bvar 700]),
    bnot (bands [bvar 175, bvar 181, bvar 695, bvar 701]),
    bnot (bands [bvar 176, bvar 177, bvar 696, bvar 697]),
    bnot (bands [bvar 176, bvar 178, bvar 696, bvar 698]),
    bnot (bands [bvar 176, bvar 179, bvar 696, bvar 699]),
    bnot (bands [bvar 176, bvar 180, bvar 696, bvar 700]),
    bnot (bands [bvar 176, bvar 181, bvar 696, bvar 701]),
    bnot (bands [bvar 177, bvar 178, bvar 697, bvar 698]),
    bnot (bands [bvar 177, bvar 179, bvar 697, bvar 699]),
    bnot (bands [bvar 177, bvar 180, bvar 697, bvar 700]),
    bnot (bands [bvar 177, bvar 181, bvar 697, bvar 701]),
    bnot (bands [bvar 178, bvar 179, bvar 698, bvar 699]),
    bnot (bands [bvar 178, bvar 180, bvar 698, bvar 700]),
    bnot (bands [bvar 179, bvar 180, bvar 699, bvar 700]),
    bnot (bands [bvar 179, bvar 181, bvar 699, bvar 701]),
    bnot (bands [bvar 678, bvar 679, bvar 184, bvar 185]),
    bnot (bands [bvar 678, bvar 680, bvar 184, bvar 186]),
    bnot (bands [bvar 678, bvar 681, bvar 184, bvar 187]),
    bnot (bands [bvar 678, bvar 682, bvar 184, bvar 188]),
    bnot (bands [bvar 678, bvar 683, bvar 184, bvar 189]),
    bnot (bands [bvar 678, bvar 684, bvar 184, bvar 190]),
    bnot (bands [bvar 678, bvar 685, bvar 184, bvar 191]),
    bnot (bands [bvar 678, bvar 686, bvar 184, bvar 192]),
    bnot (bands [bvar 678, bvar 687, bvar 184, bvar 193]),
    bnot (bands [bvar 678, bvar 688, bvar 184, bvar 194]),
    bnot (bands [bvar 679, bvar 682, bvar 185, bvar 188]),
    bnot (bands [bvar 679, bvar 684, bvar 185, bvar 190]),
    bnot (bands [bvar 679, bvar 685, bvar 185, bvar 191]),
    bnot (bands [bvar 679, bvar 686, bvar 185, bvar 192]),
    bnot (bands [bvar 679, bvar 687, bvar 185, bvar 193]),
    bnot (bands [bvar 679, bvar 688, bvar 185, bvar 194]),
    bnot (bands [bvar 680, bvar 682, bvar 186, bvar 188]),
    bnot (bands [bvar 680, bvar 684, bvar 186, bvar 190]),
    bnot (bands [bvar 680, bvar 685, bvar 186, bvar 191]),
    bnot (bands [bvar 680, bvar 686, bvar 186, bvar 192]),
    bnot (bands [bvar 680, bvar 687, bvar 186, bvar 193]),
    bnot (bands [bvar 680, bvar 688, bvar 186, bvar 194]),
    bnot (bands [bvar 681, bvar 682, bvar 187, bvar 188]),
    bnot (bands [bvar 681, bvar 684, bvar 187, bvar 190]),
    bnot (bands [bvar 681, bvar 685, bvar 187, bvar 191]),
    bnot (bands [bvar 681, bvar 687, bvar 187, bvar 193]),
    bnot (bands [bvar 682, bvar 683, bvar 188, bvar 189]),
    bnot (bands [bvar 682, bvar 684, bvar 188, bvar 190]),
    bnot (bands [bvar 682, bvar 685, bvar 188, bvar 191]),
    bnot (bands [bvar 682, bvar 686, bvar 188, bvar 192]),
    bnot (bands [bvar 682, bvar 687, bvar 188, bvar 193]),
    bnot (bands [bvar 682, bvar 688, bvar 188, bvar 194]),
    bnot (bands [bvar 683, bvar 684, bvar 189, bvar 190]),
    bnot (bands [bvar 683, bvar 685, bvar 189, bvar 191]),
    bnot (bands [bvar 683, bvar 686, bvar 189, bvar 192]),
    bnot (bands [bvar 683, bvar 687, bvar 189, bvar 193]) ]

def reducedUnionChunk129 : BVLogicalExpr :=
  bands reducedUnionChunk129Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
