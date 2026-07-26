import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk040Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 613, bvar 615, bvar 626, bvar 628]),
    bnot (bands [bvar 613, bvar 616, bvar 626, bvar 629]),
    bnot (bands [bvar 613, bvar 617, bvar 626, bvar 630]),
    bnot (bands [bvar 613, bvar 618, bvar 626, bvar 631]),
    bnot (bands [bvar 613, bvar 621, bvar 626, bvar 634]),
    bnot (bands [bvar 613, bvar 622, bvar 626, bvar 635]),
    bnot (bands [bvar 613, bvar 623, bvar 626, bvar 636]),
    bnot (bands [bvar 613, bvar 624, bvar 626, bvar 637]),
    bnot (bands [bvar 613, bvar 625, bvar 626, bvar 638]),
    bnot (bands [bvar 614, bvar 617, bvar 627, bvar 630]),
    bnot (bands [bvar 614, bvar 623, bvar 627, bvar 636]),
    bnot (bands [bvar 614, bvar 624, bvar 627, bvar 637]),
    bnot (bands [bvar 614, bvar 625, bvar 627, bvar 638]),
    bnot (bands [bvar 615, bvar 617, bvar 628, bvar 630]),
    bnot (bands [bvar 615, bvar 622, bvar 628, bvar 635]),
    bnot (bands [bvar 615, bvar 624, bvar 628, bvar 637]),
    bnot (bands [bvar 615, bvar 625, bvar 628, bvar 638]),
    bnot (bands [bvar 616, bvar 617, bvar 629, bvar 630]),
    bnot (bands [bvar 616, bvar 621, bvar 629, bvar 634]),
    bnot (bands [bvar 616, bvar 622, bvar 629, bvar 635]),
    bnot (bands [bvar 616, bvar 623, bvar 629, bvar 636]),
    bnot (bands [bvar 616, bvar 624, bvar 629, bvar 637]),
    bnot (bands [bvar 616, bvar 625, bvar 629, bvar 638]),
    bnot (bands [bvar 617, bvar 618, bvar 630, bvar 631]),
    bnot (bands [bvar 617, bvar 621, bvar 630, bvar 634]),
    bnot (bands [bvar 617, bvar 622, bvar 630, bvar 635]),
    bnot (bands [bvar 617, bvar 623, bvar 630, bvar 636]),
    bnot (bands [bvar 617, bvar 624, bvar 630, bvar 637]),
    bnot (bands [bvar 617, bvar 625, bvar 630, bvar 638]),
    bnot (bands [bvar 618, bvar 622, bvar 631, bvar 635]),
    bnot (bands [bvar 618, bvar 623, bvar 631, bvar 636]),
    bnot (bands [bvar 618, bvar 624, bvar 631, bvar 637]),
    bnot (bands [bvar 618, bvar 625, bvar 631, bvar 638]),
    bnot (bands [bvar 621, bvar 623, bvar 634, bvar 636]),
    bnot (bands [bvar 621, bvar 624, bvar 634, bvar 637]),
    bnot (bands [bvar 621, bvar 625, bvar 634, bvar 638]),
    bnot (bands [bvar 622, bvar 623, bvar 635, bvar 636]),
    bnot (bands [bvar 622, bvar 624, bvar 635, bvar 637]),
    bnot (bands [bvar 622, bvar 625, bvar 635, bvar 638]),
    bnot (bands [bvar 623, bvar 624, bvar 636, bvar 637]),
    bnot (bands [bvar 623, bvar 625, bvar 636, bvar 638]),
    bnot (bands [bvar 624, bvar 625, bvar 637, bvar 638]),
    bnot (bands [bvar 613, bvar 614, bvar 639, bvar 640]),
    bnot (bands [bvar 613, bvar 617, bvar 639, bvar 643]),
    bnot (bands [bvar 613, bvar 618, bvar 639, bvar 644]),
    bnot (bands [bvar 613, bvar 622, bvar 639, bvar 648]),
    bnot (bands [bvar 613, bvar 623, bvar 639, bvar 649]),
    bnot (bands [bvar 613, bvar 625, bvar 639, bvar 651]),
    bnot (bands [bvar 614, bvar 617, bvar 640, bvar 643]),
    bnot (bands [bvar 614, bvar 618, bvar 640, bvar 644]),
    bnot (bands [bvar 614, bvar 622, bvar 640, bvar 648]),
    bnot (bands [bvar 614, bvar 623, bvar 640, bvar 649]),
    bnot (bands [bvar 614, bvar 624, bvar 640, bvar 650]),
    bnot (bands [bvar 614, bvar 625, bvar 640, bvar 651]),
    bnot (bands [bvar 615, bvar 622, bvar 641, bvar 648]),
    bnot (bands [bvar 616, bvar 623, bvar 642, bvar 649]),
    bnot (bands [bvar 616, bvar 624, bvar 642, bvar 650]),
    bnot (bands [bvar 617, bvar 622, bvar 643, bvar 648]),
    bnot (bands [bvar 617, bvar 624, bvar 643, bvar 650]),
    bnot (bands [bvar 617, bvar 625, bvar 643, bvar 651]),
    bnot (bands [bvar 618, bvar 622, bvar 644, bvar 648]),
    bnot (bands [bvar 618, bvar 623, bvar 644, bvar 649]),
    bnot (bands [bvar 618, bvar 624, bvar 644, bvar 650]),
    bnot (bands [bvar 618, bvar 625, bvar 644, bvar 651]) ]

def reducedUnionChunk040 : BVLogicalExpr :=
  bands reducedUnionChunk040Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
