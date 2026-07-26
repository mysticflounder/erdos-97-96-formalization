import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk111Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 74, bvar 77, bvar 698, bvar 701]),
    bnot (bands [bvar 76, bvar 78, bvar 700, bvar 702]),
    bnot (bands [bvar 93, bvar 94, bvar 613, bvar 614]),
    bnot (bands [bvar 93, bvar 95, bvar 613, bvar 615]),
    bnot (bands [bvar 93, bvar 97, bvar 613, bvar 617]),
    bnot (bands [bvar 93, bvar 100, bvar 613, bvar 620]),
    bnot (bands [bvar 93, bvar 101, bvar 613, bvar 621]),
    bnot (bands [bvar 93, bvar 102, bvar 613, bvar 622]),
    bnot (bands [bvar 93, bvar 104, bvar 613, bvar 624]),
    bnot (bands [bvar 94, bvar 97, bvar 614, bvar 617]),
    bnot (bands [bvar 94, bvar 100, bvar 614, bvar 620]),
    bnot (bands [bvar 94, bvar 101, bvar 614, bvar 621]),
    bnot (bands [bvar 94, bvar 102, bvar 614, bvar 622]),
    bnot (bands [bvar 94, bvar 103, bvar 614, bvar 623]),
    bnot (bands [bvar 94, bvar 104, bvar 614, bvar 624]),
    bnot (bands [bvar 94, bvar 105, bvar 614, bvar 625]),
    bnot (bands [bvar 95, bvar 97, bvar 615, bvar 617]),
    bnot (bands [bvar 95, bvar 100, bvar 615, bvar 620]),
    bnot (bands [bvar 95, bvar 101, bvar 615, bvar 621]),
    bnot (bands [bvar 95, bvar 102, bvar 615, bvar 622]),
    bnot (bands [bvar 95, bvar 103, bvar 615, bvar 623]),
    bnot (bands [bvar 95, bvar 104, bvar 615, bvar 624]),
    bnot (bands [bvar 95, bvar 105, bvar 615, bvar 625]),
    bnot (bands [bvar 96, bvar 97, bvar 616, bvar 617]),
    bnot (bands [bvar 96, bvar 100, bvar 616, bvar 620]),
    bnot (bands [bvar 96, bvar 101, bvar 616, bvar 621]),
    bnot (bands [bvar 96, bvar 102, bvar 616, bvar 622]),
    bnot (bands [bvar 96, bvar 103, bvar 616, bvar 623]),
    bnot (bands [bvar 96, bvar 104, bvar 616, bvar 624]),
    bnot (bands [bvar 96, bvar 105, bvar 616, bvar 625]),
    bnot (bands [bvar 97, bvar 100, bvar 617, bvar 620]),
    bnot (bands [bvar 97, bvar 101, bvar 617, bvar 621]),
    bnot (bands [bvar 97, bvar 102, bvar 617, bvar 622]),
    bnot (bands [bvar 97, bvar 103, bvar 617, bvar 623]),
    bnot (bands [bvar 97, bvar 104, bvar 617, bvar 624]),
    bnot (bands [bvar 97, bvar 105, bvar 617, bvar 625]),
    bnot (bands [bvar 100, bvar 101, bvar 620, bvar 621]),
    bnot (bands [bvar 100, bvar 102, bvar 620, bvar 622]),
    bnot (bands [bvar 100, bvar 103, bvar 620, bvar 623]),
    bnot (bands [bvar 100, bvar 104, bvar 620, bvar 624]),
    bnot (bands [bvar 100, bvar 105, bvar 620, bvar 625]),
    bnot (bands [bvar 101, bvar 102, bvar 621, bvar 622]),
    bnot (bands [bvar 101, bvar 103, bvar 621, bvar 623]),
    bnot (bands [bvar 101, bvar 104, bvar 621, bvar 624]),
    bnot (bands [bvar 101, bvar 105, bvar 621, bvar 625]),
    bnot (bands [bvar 102, bvar 103, bvar 622, bvar 623]),
    bnot (bands [bvar 102, bvar 104, bvar 622, bvar 624]),
    bnot (bands [bvar 102, bvar 105, bvar 622, bvar 625]),
    bnot (bands [bvar 103, bvar 104, bvar 623, bvar 624]),
    bnot (bands [bvar 103, bvar 105, bvar 623, bvar 625]),
    bnot (bands [bvar 104, bvar 105, bvar 624, bvar 625]),
    bnot (bands [bvar 93, bvar 97, bvar 626, bvar 630]),
    bnot (bands [bvar 93, bvar 105, bvar 626, bvar 638]),
    bnot (bands [bvar 94, bvar 97, bvar 627, bvar 630]),
    bnot (bands [bvar 95, bvar 97, bvar 628, bvar 630]),
    bnot (bands [bvar 96, bvar 97, bvar 629, bvar 630]),
    bnot (bands [bvar 96, bvar 102, bvar 629, bvar 635]),
    bnot (bands [bvar 96, bvar 104, bvar 629, bvar 637]),
    bnot (bands [bvar 97, bvar 102, bvar 630, bvar 635]),
    bnot (bands [bvar 97, bvar 103, bvar 630, bvar 636]),
    bnot (bands [bvar 97, bvar 104, bvar 630, bvar 637]),
    bnot (bands [bvar 103, bvar 104, bvar 636, bvar 637]),
    bnot (bands [bvar 600, bvar 603, bvar 119, bvar 122]),
    bnot (bands [bvar 600, bvar 604, bvar 119, bvar 123]) ]

def reducedUnionChunk111 : BVLogicalExpr :=
  bands reducedUnionChunk111Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
