import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk135Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 5, bvar 12, bvar 1086, bvar 1093]),
    bnot (bands [bvar 6, bvar 9, bvar 1087, bvar 1090]),
    bnot (bands [bvar 6, bvar 10, bvar 1087, bvar 1091]),
    bnot (bands [bvar 6, bvar 11, bvar 1087, bvar 1092]),
    bnot (bands [bvar 6, bvar 12, bvar 1087, bvar 1093]),
    bnot (bands [bvar 7, bvar 9, bvar 1088, bvar 1090]),
    bnot (bands [bvar 7, bvar 10, bvar 1088, bvar 1091]),
    bnot (bands [bvar 7, bvar 11, bvar 1088, bvar 1092]),
    bnot (bands [bvar 7, bvar 12, bvar 1088, bvar 1093]),
    bnot (bands [bvar 8, bvar 9, bvar 1089, bvar 1090]),
    bnot (bands [bvar 8, bvar 10, bvar 1089, bvar 1091]),
    bnot (bands [bvar 8, bvar 11, bvar 1089, bvar 1092]),
    bnot (bands [bvar 8, bvar 12, bvar 1089, bvar 1093]),
    bnot (bands [bvar 9, bvar 11, bvar 1090, bvar 1092]),
    bnot (bands [bvar 9, bvar 12, bvar 1090, bvar 1093]),
    bnot (bands [bvar 10, bvar 11, bvar 1091, bvar 1092]),
    bnot (bands [bvar 10, bvar 12, bvar 1091, bvar 1093]),
    bnot (bands [bvar 11, bvar 12, bvar 1092, bvar 1093]),
    bnot (bands [bvar 5, bvar 6, bvar 33, bvar 34]),
    bnot (bands [bvar 5, bvar 7, bvar 33, bvar 35]),
    bnot (bands [bvar 5, bvar 8, bvar 33, bvar 36]),
    bnot (bands [bvar 5, bvar 9, bvar 33, bvar 37]),
    bnot (bands [bvar 5, bvar 10, bvar 33, bvar 38]),
    bnot (bands [bvar 5, bvar 11, bvar 33, bvar 39]),
    bnot (bands [bvar 5, bvar 12, bvar 33, bvar 40]),
    bnot (bands [bvar 6, bvar 7, bvar 34, bvar 35]),
    bnot (bands [bvar 6, bvar 8, bvar 34, bvar 36]),
    bnot (bands [bvar 6, bvar 9, bvar 34, bvar 37]),
    bnot (bands [bvar 6, bvar 10, bvar 34, bvar 38]),
    bnot (bands [bvar 6, bvar 11, bvar 34, bvar 39]),
    bnot (bands [bvar 6, bvar 12, bvar 34, bvar 40]),
    bnot (bands [bvar 7, bvar 8, bvar 35, bvar 36]),
    bnot (bands [bvar 7, bvar 9, bvar 35, bvar 37]),
    bnot (bands [bvar 7, bvar 10, bvar 35, bvar 38]),
    bnot (bands [bvar 7, bvar 11, bvar 35, bvar 39]),
    bnot (bands [bvar 7, bvar 12, bvar 35, bvar 40]),
    bnot (bands [bvar 8, bvar 9, bvar 36, bvar 37]),
    bnot (bands [bvar 8, bvar 10, bvar 36, bvar 38]),
    bnot (bands [bvar 8, bvar 12, bvar 36, bvar 40]),
    bnot (bands [bvar 9, bvar 10, bvar 37, bvar 38]),
    bnot (bands [bvar 9, bvar 11, bvar 37, bvar 39]),
    bnot (bands [bvar 10, bvar 11, bvar 38, bvar 39]),
    bnot (bands [bvar 10, bvar 12, bvar 38, bvar 40]),
    bnot (bands [bvar 11, bvar 12, bvar 39, bvar 40]),
    bnot (bands [bvar 1, bvar 5, bvar 55, bvar 59]),
    bnot (bands [bvar 1, bvar 6, bvar 55, bvar 60]),
    bnot (bands [bvar 1, bvar 10, bvar 55, bvar 64]),
    bnot (bands [bvar 1, bvar 12, bvar 55, bvar 66]),
    bnot (bands [bvar 5, bvar 12, bvar 59, bvar 66]),
    bnot (bands [bvar 0, bvar 5, bvar 67, bvar 72]),
    bnot (bands [bvar 0, bvar 6, bvar 67, bvar 73]),
    bnot (bands [bvar 0, bvar 7, bvar 67, bvar 74]),
    bnot (bands [bvar 0, bvar 8, bvar 67, bvar 75]),
    bnot (bands [bvar 0, bvar 9, bvar 67, bvar 76]),
    bnot (bands [bvar 0, bvar 10, bvar 67, bvar 77]),
    bnot (bands [bvar 0, bvar 11, bvar 67, bvar 78]),
    bnot (bands [bvar 0, bvar 12, bvar 67, bvar 79]),
    bnot (bands [bvar 1, bvar 6, bvar 68, bvar 73]),
    bnot (bands [bvar 1, bvar 7, bvar 68, bvar 74]),
    bnot (bands [bvar 1, bvar 8, bvar 68, bvar 75]),
    bnot (bands [bvar 1, bvar 9, bvar 68, bvar 76]),
    bnot (bands [bvar 1, bvar 10, bvar 68, bvar 77]),
    bnot (bands [bvar 1, bvar 11, bvar 68, bvar 78]),
    bnot (bands [bvar 2, bvar 6, bvar 69, bvar 73]) ]

def reducedUnionChunk135 : BVLogicalExpr :=
  bands reducedUnionChunk135Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
