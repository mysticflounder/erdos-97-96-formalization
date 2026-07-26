import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk095Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 653, bvar 660, bvar 1173, bvar 1180]),
    bnot (bands [bvar 653, bvar 663, bvar 1173, bvar 1183]),
    bnot (bands [bvar 654, bvar 656, bvar 1174, bvar 1176]),
    bnot (bands [bvar 654, bvar 657, bvar 1174, bvar 1177]),
    bnot (bands [bvar 654, bvar 658, bvar 1174, bvar 1178]),
    bnot (bands [bvar 654, bvar 659, bvar 1174, bvar 1179]),
    bnot (bands [bvar 654, bvar 663, bvar 1174, bvar 1183]),
    bnot (bands [bvar 655, bvar 656, bvar 1175, bvar 1176]),
    bnot (bands [bvar 655, bvar 657, bvar 1175, bvar 1177]),
    bnot (bands [bvar 655, bvar 658, bvar 1175, bvar 1178]),
    bnot (bands [bvar 655, bvar 659, bvar 1175, bvar 1179]),
    bnot (bands [bvar 655, bvar 663, bvar 1175, bvar 1183]),
    bnot (bands [bvar 656, bvar 657, bvar 1176, bvar 1177]),
    bnot (bands [bvar 656, bvar 658, bvar 1176, bvar 1178]),
    bnot (bands [bvar 656, bvar 659, bvar 1176, bvar 1179]),
    bnot (bands [bvar 656, bvar 660, bvar 1176, bvar 1180]),
    bnot (bands [bvar 656, bvar 663, bvar 1176, bvar 1183]),
    bnot (bands [bvar 656, bvar 664, bvar 1176, bvar 1184]),
    bnot (bands [bvar 657, bvar 658, bvar 1177, bvar 1178]),
    bnot (bands [bvar 657, bvar 659, bvar 1177, bvar 1179]),
    bnot (bands [bvar 657, bvar 660, bvar 1177, bvar 1180]),
    bnot (bands [bvar 657, bvar 663, bvar 1177, bvar 1183]),
    bnot (bands [bvar 657, bvar 664, bvar 1177, bvar 1184]),
    bnot (bands [bvar 658, bvar 659, bvar 1178, bvar 1179]),
    bnot (bands [bvar 658, bvar 660, bvar 1178, bvar 1180]),
    bnot (bands [bvar 658, bvar 663, bvar 1178, bvar 1183]),
    bnot (bands [bvar 658, bvar 664, bvar 1178, bvar 1184]),
    bnot (bands [bvar 659, bvar 660, bvar 1179, bvar 1180]),
    bnot (bands [bvar 659, bvar 663, bvar 1179, bvar 1183]),
    bnot (bands [bvar 659, bvar 664, bvar 1179, bvar 1184]),
    bnot (bands [bvar 660, bvar 663, bvar 1180, bvar 1183]),
    bnot (bands [bvar 652, bvar 653, bvar 1185, bvar 1186]),
    bnot (bands [bvar 652, bvar 654, bvar 1185, bvar 1187]),
    bnot (bands [bvar 652, bvar 656, bvar 1185, bvar 1189]),
    bnot (bands [bvar 652, bvar 657, bvar 1185, bvar 1190]),
    bnot (bands [bvar 652, bvar 659, bvar 1185, bvar 1192]),
    bnot (bands [bvar 653, bvar 656, bvar 1186, bvar 1189]),
    bnot (bands [bvar 653, bvar 657, bvar 1186, bvar 1190]),
    bnot (bands [bvar 653, bvar 658, bvar 1186, bvar 1191]),
    bnot (bands [bvar 653, bvar 659, bvar 1186, bvar 1192]),
    bnot (bands [bvar 653, bvar 660, bvar 1186, bvar 1193]),
    bnot (bands [bvar 654, bvar 656, bvar 1187, bvar 1189]),
    bnot (bands [bvar 654, bvar 657, bvar 1187, bvar 1190]),
    bnot (bands [bvar 654, bvar 658, bvar 1187, bvar 1191]),
    bnot (bands [bvar 654, bvar 659, bvar 1187, bvar 1192]),
    bnot (bands [bvar 654, bvar 660, bvar 1187, bvar 1193]),
    bnot (bands [bvar 655, bvar 656, bvar 1188, bvar 1189]),
    bnot (bands [bvar 655, bvar 657, bvar 1188, bvar 1190]),
    bnot (bands [bvar 655, bvar 658, bvar 1188, bvar 1191]),
    bnot (bands [bvar 655, bvar 659, bvar 1188, bvar 1192]),
    bnot (bands [bvar 655, bvar 660, bvar 1188, bvar 1193]),
    bnot (bands [bvar 656, bvar 657, bvar 1189, bvar 1190]),
    bnot (bands [bvar 656, bvar 658, bvar 1189, bvar 1191]),
    bnot (bands [bvar 656, bvar 659, bvar 1189, bvar 1192]),
    bnot (bands [bvar 656, bvar 660, bvar 1189, bvar 1193]),
    bnot (bands [bvar 656, bvar 664, bvar 1189, bvar 1197]),
    bnot (bands [bvar 657, bvar 658, bvar 1190, bvar 1191]),
    bnot (bands [bvar 657, bvar 659, bvar 1190, bvar 1192]),
    bnot (bands [bvar 657, bvar 660, bvar 1190, bvar 1193]),
    bnot (bands [bvar 658, bvar 659, bvar 1191, bvar 1192]),
    bnot (bands [bvar 658, bvar 660, bvar 1191, bvar 1193]),
    bnot (bands [bvar 659, bvar 660, bvar 1192, bvar 1193]),
    bnot (bands [bvar 659, bvar 664, bvar 1192, bvar 1197]),
    bnot (bands [bvar 1172, bvar 1173, bvar 678, bvar 679]) ]

def reducedUnionChunk095 : BVLogicalExpr :=
  bands reducedUnionChunk095Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
