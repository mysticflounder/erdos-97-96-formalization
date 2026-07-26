import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk094Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1159, bvar 1165, bvar 665, bvar 671]),
    bnot (bands [bvar 1159, bvar 1166, bvar 665, bvar 672]),
    bnot (bands [bvar 1159, bvar 1167, bvar 665, bvar 673]),
    bnot (bands [bvar 1159, bvar 1171, bvar 665, bvar 677]),
    bnot (bands [bvar 1160, bvar 1163, bvar 666, bvar 669]),
    bnot (bands [bvar 1160, bvar 1164, bvar 666, bvar 670]),
    bnot (bands [bvar 1160, bvar 1165, bvar 666, bvar 671]),
    bnot (bands [bvar 1160, bvar 1166, bvar 666, bvar 672]),
    bnot (bands [bvar 1160, bvar 1167, bvar 666, bvar 673]),
    bnot (bands [bvar 1160, bvar 1171, bvar 666, bvar 677]),
    bnot (bands [bvar 1161, bvar 1163, bvar 667, bvar 669]),
    bnot (bands [bvar 1161, bvar 1164, bvar 667, bvar 670]),
    bnot (bands [bvar 1161, bvar 1165, bvar 667, bvar 671]),
    bnot (bands [bvar 1161, bvar 1166, bvar 667, bvar 672]),
    bnot (bands [bvar 1161, bvar 1167, bvar 667, bvar 673]),
    bnot (bands [bvar 1161, bvar 1170, bvar 667, bvar 676]),
    bnot (bands [bvar 1161, bvar 1171, bvar 667, bvar 677]),
    bnot (bands [bvar 1162, bvar 1163, bvar 668, bvar 669]),
    bnot (bands [bvar 1162, bvar 1164, bvar 668, bvar 670]),
    bnot (bands [bvar 1162, bvar 1165, bvar 668, bvar 671]),
    bnot (bands [bvar 1162, bvar 1167, bvar 668, bvar 673]),
    bnot (bands [bvar 1162, bvar 1171, bvar 668, bvar 677]),
    bnot (bands [bvar 1163, bvar 1164, bvar 669, bvar 670]),
    bnot (bands [bvar 1163, bvar 1165, bvar 669, bvar 671]),
    bnot (bands [bvar 1163, bvar 1166, bvar 669, bvar 672]),
    bnot (bands [bvar 1163, bvar 1167, bvar 669, bvar 673]),
    bnot (bands [bvar 1163, bvar 1170, bvar 669, bvar 676]),
    bnot (bands [bvar 1163, bvar 1171, bvar 669, bvar 677]),
    bnot (bands [bvar 1164, bvar 1165, bvar 670, bvar 671]),
    bnot (bands [bvar 1164, bvar 1166, bvar 670, bvar 672]),
    bnot (bands [bvar 1164, bvar 1167, bvar 670, bvar 673]),
    bnot (bands [bvar 1164, bvar 1170, bvar 670, bvar 676]),
    bnot (bands [bvar 1164, bvar 1171, bvar 670, bvar 677]),
    bnot (bands [bvar 1165, bvar 1166, bvar 671, bvar 672]),
    bnot (bands [bvar 1165, bvar 1167, bvar 671, bvar 673]),
    bnot (bands [bvar 1165, bvar 1170, bvar 671, bvar 676]),
    bnot (bands [bvar 1165, bvar 1171, bvar 671, bvar 677]),
    bnot (bands [bvar 1166, bvar 1167, bvar 672, bvar 673]),
    bnot (bands [bvar 1166, bvar 1170, bvar 672, bvar 676]),
    bnot (bands [bvar 1166, bvar 1171, bvar 672, bvar 677]),
    bnot (bands [bvar 1167, bvar 1170, bvar 673, bvar 676]),
    bnot (bands [bvar 1167, bvar 1171, bvar 673, bvar 677]),
    bnot (bands [bvar 1170, bvar 1171, bvar 676, bvar 677]),
    bnot (bands [bvar 652, bvar 653, bvar 1172, bvar 1173]),
    bnot (bands [bvar 652, bvar 655, bvar 1172, bvar 1175]),
    bnot (bands [bvar 652, bvar 656, bvar 1172, bvar 1176]),
    bnot (bands [bvar 652, bvar 657, bvar 1172, bvar 1177]),
    bnot (bands [bvar 652, bvar 658, bvar 1172, bvar 1178]),
    bnot (bands [bvar 652, bvar 659, bvar 1172, bvar 1179]),
    bnot (bands [bvar 653, bvar 656, bvar 1173, bvar 1176]),
    bnot (bands [bvar 653, bvar 657, bvar 1173, bvar 1177]),
    bnot (bands [bvar 653, bvar 658, bvar 1173, bvar 1178]),
    bnot (bands [bvar 653, bvar 659, bvar 1173, bvar 1179]),
    bnot (bands [bvar 653, bvar 660, bvar 1173, bvar 1180]),
    bnot (bands [bvar 653, bvar 663, bvar 1173, bvar 1183]),
    bnot (bands [bvar 653, bvar 664, bvar 1173, bvar 1184]),
    bnot (bands [bvar 654, bvar 656, bvar 1174, bvar 1176]),
    bnot (bands [bvar 654, bvar 657, bvar 1174, bvar 1177]),
    bnot (bands [bvar 654, bvar 658, bvar 1174, bvar 1178]),
    bnot (bands [bvar 654, bvar 659, bvar 1174, bvar 1179]),
    bnot (bands [bvar 654, bvar 660, bvar 1174, bvar 1180]),
    bnot (bands [bvar 654, bvar 663, bvar 1174, bvar 1183]),
    bnot (bands [bvar 655, bvar 656, bvar 1175, bvar 1176]),
    bnot (bands [bvar 655, bvar 657, bvar 1175, bvar 1177]) ]

def reducedUnionChunk094 : BVLogicalExpr :=
  bands reducedUnionChunk094Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
