import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk118Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 108, bvar 110, bvar 693, bvar 695]),
    bnot (bands [bvar 108, bvar 111, bvar 693, bvar 696]),
    bnot (bands [bvar 109, bvar 110, bvar 694, bvar 695]),
    bnot (bands [bvar 109, bvar 111, bvar 694, bvar 696]),
    bnot (bands [bvar 110, bvar 111, bvar 695, bvar 696]),
    bnot (bands [bvar 113, bvar 114, bvar 698, bvar 699]),
    bnot (bands [bvar 113, bvar 115, bvar 698, bvar 700]),
    bnot (bands [bvar 113, bvar 116, bvar 698, bvar 701]),
    bnot (bands [bvar 113, bvar 117, bvar 698, bvar 702]),
    bnot (bands [bvar 114, bvar 115, bvar 699, bvar 700]),
    bnot (bands [bvar 114, bvar 116, bvar 699, bvar 701]),
    bnot (bands [bvar 114, bvar 117, bvar 699, bvar 702]),
    bnot (bands [bvar 115, bvar 116, bvar 700, bvar 701]),
    bnot (bands [bvar 115, bvar 117, bvar 700, bvar 702]),
    bnot (bands [bvar 613, bvar 614, bvar 184, bvar 185]),
    bnot (bands [bvar 613, bvar 615, bvar 184, bvar 186]),
    bnot (bands [bvar 613, bvar 616, bvar 184, bvar 187]),
    bnot (bands [bvar 613, bvar 617, bvar 184, bvar 188]),
    bnot (bands [bvar 614, bvar 617, bvar 185, bvar 188]),
    bnot (bands [bvar 616, bvar 617, bvar 187, bvar 188]),
    bnot (bands [bvar 621, bvar 623, bvar 192, bvar 194]),
    bnot (bands [bvar 621, bvar 624, bvar 192, bvar 195]),
    bnot (bands [bvar 622, bvar 623, bvar 193, bvar 194]),
    bnot (bands [bvar 623, bvar 624, bvar 194, bvar 195]),
    bnot (bands [bvar 119, bvar 120, bvar 639, bvar 640]),
    bnot (bands [bvar 119, bvar 124, bvar 639, bvar 644]),
    bnot (bands [bvar 119, bvar 131, bvar 639, bvar 651]),
    bnot (bands [bvar 120, bvar 123, bvar 640, bvar 643]),
    bnot (bands [bvar 120, bvar 129, bvar 640, bvar 649]),
    bnot (bands [bvar 120, bvar 130, bvar 640, bvar 650]),
    bnot (bands [bvar 120, bvar 131, bvar 640, bvar 651]),
    bnot (bands [bvar 121, bvar 130, bvar 641, bvar 650]),
    bnot (bands [bvar 123, bvar 129, bvar 643, bvar 649]),
    bnot (bands [bvar 123, bvar 130, bvar 643, bvar 650]),
    bnot (bands [bvar 124, bvar 129, bvar 644, bvar 649]),
    bnot (bands [bvar 124, bvar 130, bvar 644, bvar 650]),
    bnot (bands [bvar 124, bvar 131, bvar 644, bvar 651]),
    bnot (bands [bvar 626, bvar 629, bvar 132, bvar 135]),
    bnot (bands [bvar 626, bvar 630, bvar 132, bvar 136]),
    bnot (bands [bvar 626, bvar 631, bvar 132, bvar 137]),
    bnot (bands [bvar 626, bvar 632, bvar 132, bvar 138]),
    bnot (bands [bvar 626, bvar 635, bvar 132, bvar 141]),
    bnot (bands [bvar 626, bvar 636, bvar 132, bvar 142]),
    bnot (bands [bvar 626, bvar 637, bvar 132, bvar 143]),
    bnot (bands [bvar 627, bvar 636, bvar 133, bvar 142]),
    bnot (bands [bvar 628, bvar 636, bvar 134, bvar 142]),
    bnot (bands [bvar 629, bvar 630, bvar 135, bvar 136]),
    bnot (bands [bvar 629, bvar 631, bvar 135, bvar 137]),
    bnot (bands [bvar 629, bvar 632, bvar 135, bvar 138]),
    bnot (bands [bvar 629, bvar 635, bvar 135, bvar 141]),
    bnot (bands [bvar 629, bvar 636, bvar 135, bvar 142]),
    bnot (bands [bvar 629, bvar 637, bvar 135, bvar 143]),
    bnot (bands [bvar 629, bvar 638, bvar 135, bvar 144]),
    bnot (bands [bvar 630, bvar 635, bvar 136, bvar 141]),
    bnot (bands [bvar 630, bvar 636, bvar 136, bvar 142]),
    bnot (bands [bvar 630, bvar 637, bvar 136, bvar 143]),
    bnot (bands [bvar 630, bvar 638, bvar 136, bvar 144]),
    bnot (bands [bvar 631, bvar 635, bvar 137, bvar 141]),
    bnot (bands [bvar 631, bvar 636, bvar 137, bvar 142]),
    bnot (bands [bvar 631, bvar 637, bvar 137, bvar 143]),
    bnot (bands [bvar 631, bvar 638, bvar 137, bvar 144]),
    bnot (bands [bvar 632, bvar 636, bvar 138, bvar 142]),
    bnot (bands [bvar 632, bvar 637, bvar 138, bvar 143]),
    bnot (bands [bvar 119, bvar 120, bvar 652, bvar 653]) ]

def reducedUnionChunk118 : BVLogicalExpr :=
  bands reducedUnionChunk118Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
