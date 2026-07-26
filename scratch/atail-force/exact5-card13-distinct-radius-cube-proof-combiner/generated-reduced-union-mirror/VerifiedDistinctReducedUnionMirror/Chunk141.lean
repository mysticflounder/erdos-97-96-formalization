import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk141Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 11, bvar 12, bvar 611, bvar 612]),
    bnot (bands [bvar 0, bvar 2, bvar 613, bvar 615]),
    bnot (bands [bvar 0, bvar 3, bvar 613, bvar 616]),
    bnot (bands [bvar 0, bvar 8, bvar 613, bvar 621]),
    bnot (bands [bvar 0, bvar 9, bvar 613, bvar 622]),
    bnot (bands [bvar 0, bvar 10, bvar 613, bvar 623]),
    bnot (bands [bvar 0, bvar 11, bvar 613, bvar 624]),
    bnot (bands [bvar 0, bvar 12, bvar 613, bvar 625]),
    bnot (bands [bvar 1, bvar 8, bvar 614, bvar 621]),
    bnot (bands [bvar 1, bvar 9, bvar 614, bvar 622]),
    bnot (bands [bvar 1, bvar 10, bvar 614, bvar 623]),
    bnot (bands [bvar 1, bvar 11, bvar 614, bvar 624]),
    bnot (bands [bvar 1, bvar 12, bvar 614, bvar 625]),
    bnot (bands [bvar 2, bvar 7, bvar 615, bvar 620]),
    bnot (bands [bvar 2, bvar 8, bvar 615, bvar 621]),
    bnot (bands [bvar 2, bvar 9, bvar 615, bvar 622]),
    bnot (bands [bvar 2, bvar 10, bvar 615, bvar 623]),
    bnot (bands [bvar 2, bvar 11, bvar 615, bvar 624]),
    bnot (bands [bvar 2, bvar 12, bvar 615, bvar 625]),
    bnot (bands [bvar 3, bvar 7, bvar 616, bvar 620]),
    bnot (bands [bvar 3, bvar 8, bvar 616, bvar 621]),
    bnot (bands [bvar 3, bvar 9, bvar 616, bvar 622]),
    bnot (bands [bvar 3, bvar 10, bvar 616, bvar 623]),
    bnot (bands [bvar 3, bvar 11, bvar 616, bvar 624]),
    bnot (bands [bvar 3, bvar 12, bvar 616, bvar 625]),
    bnot (bands [bvar 7, bvar 8, bvar 620, bvar 621]),
    bnot (bands [bvar 7, bvar 9, bvar 620, bvar 622]),
    bnot (bands [bvar 7, bvar 10, bvar 620, bvar 623]),
    bnot (bands [bvar 7, bvar 11, bvar 620, bvar 624]),
    bnot (bands [bvar 7, bvar 12, bvar 620, bvar 625]),
    bnot (bands [bvar 8, bvar 9, bvar 621, bvar 622]),
    bnot (bands [bvar 8, bvar 10, bvar 621, bvar 623]),
    bnot (bands [bvar 8, bvar 11, bvar 621, bvar 624]),
    bnot (bands [bvar 8, bvar 12, bvar 621, bvar 625]),
    bnot (bands [bvar 9, bvar 10, bvar 622, bvar 623]),
    bnot (bands [bvar 9, bvar 11, bvar 622, bvar 624]),
    bnot (bands [bvar 9, bvar 12, bvar 622, bvar 625]),
    bnot (bands [bvar 10, bvar 11, bvar 623, bvar 624]),
    bnot (bands [bvar 10, bvar 12, bvar 623, bvar 625]),
    bnot (bands [bvar 11, bvar 12, bvar 624, bvar 625]),
    bnot (bands [bvar 0, bvar 10, bvar 626, bvar 636]),
    bnot (bands [bvar 0, bvar 11, bvar 626, bvar 637]),
    bnot (bands [bvar 1, bvar 9, bvar 627, bvar 635]),
    bnot (bands [bvar 1, bvar 11, bvar 627, bvar 637]),
    bnot (bands [bvar 1, bvar 12, bvar 627, bvar 638]),
    bnot (bands [bvar 2, bvar 9, bvar 628, bvar 635]),
    bnot (bands [bvar 2, bvar 10, bvar 628, bvar 636]),
    bnot (bands [bvar 2, bvar 11, bvar 628, bvar 637]),
    bnot (bands [bvar 2, bvar 12, bvar 628, bvar 638]),
    bnot (bands [bvar 3, bvar 10, bvar 629, bvar 636]),
    bnot (bands [bvar 3, bvar 11, bvar 629, bvar 637]),
    bnot (bands [bvar 3, bvar 12, bvar 629, bvar 638]),
    bnot (bands [bvar 8, bvar 9, bvar 634, bvar 635]),
    bnot (bands [bvar 8, bvar 10, bvar 634, bvar 636]),
    bnot (bands [bvar 9, bvar 10, bvar 635, bvar 636]),
    bnot (bands [bvar 9, bvar 11, bvar 635, bvar 637]),
    bnot (bands [bvar 9, bvar 12, bvar 635, bvar 638]),
    bnot (bands [bvar 10, bvar 11, bvar 636, bvar 637]),
    bnot (bands [bvar 10, bvar 12, bvar 636, bvar 638]),
    bnot (bands [bvar 11, bvar 12, bvar 637, bvar 638]),
    bnot (bands [bvar 0, bvar 1, bvar 639, bvar 640]),
    bnot (bands [bvar 1, bvar 9, bvar 640, bvar 648]),
    bnot (bands [bvar 1, bvar 10, bvar 640, bvar 649]),
    bnot (bands [bvar 1, bvar 11, bvar 640, bvar 650]) ]

def reducedUnionChunk141 : BVLogicalExpr :=
  bands reducedUnionChunk141Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
