import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk087Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1118, bvar 1119, bvar 624, bvar 625]),
    bnot (bands [bvar 600, bvar 610, bvar 1120, bvar 1130]),
    bnot (bands [bvar 610, bvar 612, bvar 1130, bvar 1132]),
    bnot (bands [bvar 1107, bvar 1110, bvar 626, bvar 629]),
    bnot (bands [bvar 1107, bvar 1111, bvar 626, bvar 630]),
    bnot (bands [bvar 1107, bvar 1115, bvar 626, bvar 634]),
    bnot (bands [bvar 1107, bvar 1116, bvar 626, bvar 635]),
    bnot (bands [bvar 1107, bvar 1118, bvar 626, bvar 637]),
    bnot (bands [bvar 1107, bvar 1119, bvar 626, bvar 638]),
    bnot (bands [bvar 1108, bvar 1111, bvar 627, bvar 630]),
    bnot (bands [bvar 1108, bvar 1115, bvar 627, bvar 634]),
    bnot (bands [bvar 1108, bvar 1116, bvar 627, bvar 635]),
    bnot (bands [bvar 1108, bvar 1117, bvar 627, bvar 636]),
    bnot (bands [bvar 1108, bvar 1119, bvar 627, bvar 638]),
    bnot (bands [bvar 1109, bvar 1111, bvar 628, bvar 630]),
    bnot (bands [bvar 1109, bvar 1115, bvar 628, bvar 634]),
    bnot (bands [bvar 1109, bvar 1116, bvar 628, bvar 635]),
    bnot (bands [bvar 1109, bvar 1117, bvar 628, bvar 636]),
    bnot (bands [bvar 1109, bvar 1119, bvar 628, bvar 638]),
    bnot (bands [bvar 1110, bvar 1111, bvar 629, bvar 630]),
    bnot (bands [bvar 1110, bvar 1115, bvar 629, bvar 634]),
    bnot (bands [bvar 1110, bvar 1116, bvar 629, bvar 635]),
    bnot (bands [bvar 1110, bvar 1117, bvar 629, bvar 636]),
    bnot (bands [bvar 1110, bvar 1118, bvar 629, bvar 637]),
    bnot (bands [bvar 1110, bvar 1119, bvar 629, bvar 638]),
    bnot (bands [bvar 1111, bvar 1115, bvar 630, bvar 634]),
    bnot (bands [bvar 1111, bvar 1116, bvar 630, bvar 635]),
    bnot (bands [bvar 1111, bvar 1117, bvar 630, bvar 636]),
    bnot (bands [bvar 1111, bvar 1118, bvar 630, bvar 637]),
    bnot (bands [bvar 1111, bvar 1119, bvar 630, bvar 638]),
    bnot (bands [bvar 1115, bvar 1116, bvar 634, bvar 635]),
    bnot (bands [bvar 1115, bvar 1117, bvar 634, bvar 636]),
    bnot (bands [bvar 1115, bvar 1118, bvar 634, bvar 637]),
    bnot (bands [bvar 1115, bvar 1119, bvar 634, bvar 638]),
    bnot (bands [bvar 1116, bvar 1117, bvar 635, bvar 636]),
    bnot (bands [bvar 1116, bvar 1118, bvar 635, bvar 637]),
    bnot (bands [bvar 1116, bvar 1119, bvar 635, bvar 638]),
    bnot (bands [bvar 1117, bvar 1118, bvar 636, bvar 637]),
    bnot (bands [bvar 1117, bvar 1119, bvar 636, bvar 638]),
    bnot (bands [bvar 1118, bvar 1119, bvar 637, bvar 638]),
    bnot (bands [bvar 1107, bvar 1108, bvar 639, bvar 640]),
    bnot (bands [bvar 1108, bvar 1109, bvar 640, bvar 641]),
    bnot (bands [bvar 1108, bvar 1111, bvar 640, bvar 643]),
    bnot (bands [bvar 1108, bvar 1117, bvar 640, bvar 649]),
    bnot (bands [bvar 1111, bvar 1118, bvar 643, bvar 650]),
    bnot (bands [bvar 1113, bvar 1114, bvar 645, bvar 646]),
    bnot (bands [bvar 1107, bvar 1111, bvar 652, bvar 656]),
    bnot (bands [bvar 1108, bvar 1111, bvar 653, bvar 656]),
    bnot (bands [bvar 1109, bvar 1111, bvar 654, bvar 656]),
    bnot (bands [bvar 1110, bvar 1111, bvar 655, bvar 656]),
    bnot (bands [bvar 1110, bvar 1118, bvar 655, bvar 663]),
    bnot (bands [bvar 1111, bvar 1117, bvar 656, bvar 662]),
    bnot (bands [bvar 1111, bvar 1118, bvar 656, bvar 663]),
    bnot (bands [bvar 1111, bvar 1119, bvar 656, bvar 664]),
    bnot (bands [bvar 1113, bvar 1114, bvar 658, bvar 659]),
    bnot (bands [bvar 1113, bvar 1115, bvar 658, bvar 660]),
    bnot (bands [bvar 1114, bvar 1115, bvar 659, bvar 660]),
    bnot (bands [bvar 1117, bvar 1118, bvar 662, bvar 663]),
    bnot (bands [bvar 1117, bvar 1119, bvar 662, bvar 664]),
    bnot (bands [bvar 1118, bvar 1119, bvar 663, bvar 664]),
    bnot (bands [bvar 603, bvar 604, bvar 1162, bvar 1163]),
    bnot (bands [bvar 1110, bvar 1111, bvar 668, bvar 669]),
    bnot (bands [bvar 1114, bvar 1115, bvar 672, bvar 673]),
    bnot (bands [bvar 1115, bvar 1116, bvar 673, bvar 674]) ]

def reducedUnionChunk087 : BVLogicalExpr :=
  bands reducedUnionChunk087Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
