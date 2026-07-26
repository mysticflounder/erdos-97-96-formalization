import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk096Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1166, bvar 1171, bvar 685, bvar 690]),
    bnot (bands [bvar 1167, bvar 1171, bvar 686, bvar 690]),
    bnot (bands [bvar 652, bvar 653, bvar 1185, bvar 1186]),
    bnot (bands [bvar 652, bvar 656, bvar 1185, bvar 1189]),
    bnot (bands [bvar 652, bvar 657, bvar 1185, bvar 1190]),
    bnot (bands [bvar 652, bvar 658, bvar 1185, bvar 1191]),
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
    bnot (bands [bvar 658, bvar 664, bvar 1191, bvar 1197]),
    bnot (bands [bvar 659, bvar 660, bvar 1192, bvar 1193]),
    bnot (bands [bvar 660, bvar 664, bvar 1193, bvar 1197]),
    bnot (bands [bvar 1159, bvar 1163, bvar 691, bvar 695]),
    bnot (bands [bvar 1159, bvar 1165, bvar 691, bvar 697]),
    bnot (bands [bvar 1159, bvar 1167, bvar 691, bvar 699]),
    bnot (bands [bvar 1160, bvar 1163, bvar 692, bvar 695]),
    bnot (bands [bvar 1160, bvar 1165, bvar 692, bvar 697]),
    bnot (bands [bvar 1161, bvar 1163, bvar 693, bvar 695]),
    bnot (bands [bvar 1163, bvar 1164, bvar 695, bvar 696]),
    bnot (bands [bvar 1163, bvar 1165, bvar 695, bvar 697]),
    bnot (bands [bvar 1163, bvar 1166, bvar 695, bvar 698]),
    bnot (bands [bvar 1163, bvar 1167, bvar 695, bvar 699]),
    bnot (bands [bvar 1164, bvar 1167, bvar 696, bvar 699]),
    atMost [bands [bvar 652, bvar 1198], bands [bvar 653, bvar 1199], bands [bvar 654, bvar 1200], bands [bvar 655, bvar 1201], bands [bvar 656, bvar 1202], bands [bvar 657, bvar 1203], bands [bvar 658, bvar 1204], bands [bvar 659, bvar 1205], bands [bvar 660, bvar 1206], bands [bvar 661, bvar 1207], bands [bvar 662, bvar 1208], bands [bvar 663, bvar 1209], bands [bvar 664, bvar 1210]] 2,
    bnot (bands [bvar 652, bvar 656, bvar 1198, bvar 1202]),
    bnot (bands [bvar 652, bvar 657, bvar 1198, bvar 1203]),
    bnot (bands [bvar 653, bvar 656, bvar 1199, bvar 1202]),
    bnot (bands [bvar 653, bvar 657, bvar 1199, bvar 1203]),
    bnot (bands [bvar 653, bvar 658, bvar 1199, bvar 1204]),
    bnot (bands [bvar 653, bvar 659, bvar 1199, bvar 1205]),
    bnot (bands [bvar 654, bvar 657, bvar 1200, bvar 1203]),
    bnot (bands [bvar 655, bvar 657, bvar 1201, bvar 1203]),
    bnot (bands [bvar 655, bvar 660, bvar 1201, bvar 1206]),
    bnot (bands [bvar 656, bvar 657, bvar 1202, bvar 1203]),
    bnot (bands [bvar 656, bvar 658, bvar 1202, bvar 1204]),
    bnot (bands [bvar 656, bvar 659, bvar 1202, bvar 1205]),
    bnot (bands [bvar 656, bvar 660, bvar 1202, bvar 1206]),
    bnot (bands [bvar 657, bvar 658, bvar 1203, bvar 1204]),
    bnot (bands [bvar 657, bvar 659, bvar 1203, bvar 1205]),
    bnot (bands [bvar 657, bvar 660, bvar 1203, bvar 1206]),
    bnot (bands [bvar 658, bvar 659, bvar 1204, bvar 1205]) ]

def reducedUnionChunk096 : BVLogicalExpr :=
  bands reducedUnionChunk096Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
