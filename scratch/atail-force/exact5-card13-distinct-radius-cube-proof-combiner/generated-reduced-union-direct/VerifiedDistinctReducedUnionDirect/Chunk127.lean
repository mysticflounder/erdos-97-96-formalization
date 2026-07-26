import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk127Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 6, bvar 11, bvar 1048, bvar 1053]),
    bnot (bands [bvar 6, bvar 12, bvar 1048, bvar 1054]),
    bnot (bands [bvar 7, bvar 9, bvar 1049, bvar 1051]),
    bnot (bands [bvar 7, bvar 10, bvar 1049, bvar 1052]),
    bnot (bands [bvar 7, bvar 11, bvar 1049, bvar 1053]),
    bnot (bands [bvar 7, bvar 12, bvar 1049, bvar 1054]),
    bnot (bands [bvar 6, bvar 10, bvar 1061, bvar 1065]),
    bnot (bands [bvar 6, bvar 11, bvar 1061, bvar 1066]),
    bnot (bands [bvar 7, bvar 9, bvar 1062, bvar 1064]),
    bnot (bands [bvar 8, bvar 10, bvar 1063, bvar 1065]),
    bnot (bands [bvar 9, bvar 10, bvar 1064, bvar 1065]),
    bnot (bands [bvar 9, bvar 12, bvar 1064, bvar 1067]),
    bnot (bands [bvar 10, bvar 12, bvar 1065, bvar 1067]),
    bnot (bands [bvar 11, bvar 12, bvar 1066, bvar 1067]),
    bnot (bands [bvar 5, bvar 9, bvar 1086, bvar 1090]),
    bnot (bands [bvar 5, bvar 10, bvar 1086, bvar 1091]),
    bnot (bands [bvar 5, bvar 11, bvar 1086, bvar 1092]),
    bnot (bands [bvar 5, bvar 12, bvar 1086, bvar 1093]),
    bnot (bands [bvar 6, bvar 9, bvar 1087, bvar 1090]),
    bnot (bands [bvar 6, bvar 10, bvar 1087, bvar 1091]),
    bnot (bands [bvar 6, bvar 11, bvar 1087, bvar 1092]),
    bnot (bands [bvar 6, bvar 12, bvar 1087, bvar 1093]),
    bnot (bands [bvar 7, bvar 9, bvar 1088, bvar 1090]),
    bnot (bands [bvar 7, bvar 11, bvar 1088, bvar 1092]),
    bnot (bands [bvar 7, bvar 12, bvar 1088, bvar 1093]),
    bnot (bands [bvar 8, bvar 9, bvar 1089, bvar 1090]),
    bnot (bands [bvar 8, bvar 10, bvar 1089, bvar 1091]),
    bnot (bands [bvar 8, bvar 12, bvar 1089, bvar 1093]),
    bnot (bands [bvar 9, bvar 12, bvar 1090, bvar 1093]),
    bnot (bands [bvar 10, bvar 12, bvar 1091, bvar 1093]),
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
    bnot (bands [bvar 8, bvar 11, bvar 36, bvar 39]),
    bnot (bands [bvar 8, bvar 12, bvar 36, bvar 40]),
    bnot (bands [bvar 9, bvar 10, bvar 37, bvar 38]),
    bnot (bands [bvar 9, bvar 11, bvar 37, bvar 39]),
    bnot (bands [bvar 9, bvar 12, bvar 37, bvar 40]),
    bnot (bands [bvar 10, bvar 11, bvar 38, bvar 39]),
    bnot (bands [bvar 10, bvar 12, bvar 38, bvar 40]),
    bnot (bands [bvar 11, bvar 12, bvar 39, bvar 40]),
    bnot (bands [bvar 0, bvar 8, bvar 41, bvar 49]),
    bnot (bands [bvar 0, bvar 9, bvar 41, bvar 50]),
    bnot (bands [bvar 0, bvar 11, bvar 41, bvar 52]),
    bnot (bands [bvar 11, bvar 12, bvar 52, bvar 53]),
    bnot (bands [bvar 1, bvar 5, bvar 55, bvar 59]),
    bnot (bands [bvar 1, bvar 10, bvar 55, bvar 64]) ]

def reducedUnionChunk127 : BVLogicalExpr :=
  bands reducedUnionChunk127Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
