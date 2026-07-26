import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk093Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 631, bvar 638, bvar 1177, bvar 1184]),
    bnot (bands [bvar 632, bvar 637, bvar 1178, bvar 1183]),
    bnot (bands [bvar 632, bvar 638, bvar 1178, bvar 1184]),
    bnot (bands [bvar 634, bvar 635, bvar 1180, bvar 1181]),
    bnot (bands [bvar 1133, bvar 1137, bvar 691, bvar 695]),
    bnot (bands [bvar 1134, bvar 1137, bvar 692, bvar 695]),
    bnot (bands [bvar 1135, bvar 1137, bvar 693, bvar 695]),
    bnot (bands [bvar 1136, bvar 1137, bvar 694, bvar 695]),
    bnot (bands [bvar 1137, bvar 1138, bvar 695, bvar 696]),
    bnot (bands [bvar 1137, bvar 1139, bvar 695, bvar 697]),
    bnot (bands [bvar 627, bvar 630, bvar 1199, bvar 1202]),
    bnot (bands [bvar 629, bvar 630, bvar 1201, bvar 1202]),
    bnot (bands [bvar 634, bvar 636, bvar 1206, bvar 1208]),
    bnot (bands [bvar 634, bvar 637, bvar 1206, bvar 1209]),
    bnot (bands [bvar 639, bvar 640, bvar 1159, bvar 1160]),
    bnot (bands [bvar 639, bvar 643, bvar 1159, bvar 1163]),
    bnot (bands [bvar 639, bvar 644, bvar 1159, bvar 1164]),
    bnot (bands [bvar 639, bvar 645, bvar 1159, bvar 1165]),
    bnot (bands [bvar 639, bvar 646, bvar 1159, bvar 1166]),
    bnot (bands [bvar 640, bvar 643, bvar 1160, bvar 1163]),
    bnot (bands [bvar 640, bvar 644, bvar 1160, bvar 1164]),
    bnot (bands [bvar 640, bvar 645, bvar 1160, bvar 1165]),
    bnot (bands [bvar 640, bvar 646, bvar 1160, bvar 1166]),
    bnot (bands [bvar 640, bvar 649, bvar 1160, bvar 1169]),
    bnot (bands [bvar 640, bvar 650, bvar 1160, bvar 1170]),
    bnot (bands [bvar 640, bvar 651, bvar 1160, bvar 1171]),
    bnot (bands [bvar 643, bvar 649, bvar 1163, bvar 1169]),
    bnot (bands [bvar 643, bvar 651, bvar 1163, bvar 1171]),
    bnot (bands [bvar 644, bvar 649, bvar 1164, bvar 1169]),
    bnot (bands [bvar 644, bvar 651, bvar 1164, bvar 1171]),
    bnot (bands [bvar 645, bvar 649, bvar 1165, bvar 1169]),
    bnot (bands [bvar 646, bvar 649, bvar 1166, bvar 1169]),
    bnot (bands [bvar 639, bvar 640, bvar 1172, bvar 1173]),
    bnot (bands [bvar 639, bvar 643, bvar 1172, bvar 1176]),
    bnot (bands [bvar 639, bvar 644, bvar 1172, bvar 1177]),
    bnot (bands [bvar 639, bvar 645, bvar 1172, bvar 1178]),
    bnot (bands [bvar 639, bvar 646, bvar 1172, bvar 1179]),
    bnot (bands [bvar 639, bvar 650, bvar 1172, bvar 1183]),
    bnot (bands [bvar 640, bvar 643, bvar 1173, bvar 1176]),
    bnot (bands [bvar 640, bvar 644, bvar 1173, bvar 1177]),
    bnot (bands [bvar 640, bvar 645, bvar 1173, bvar 1178]),
    bnot (bands [bvar 640, bvar 646, bvar 1173, bvar 1179]),
    bnot (bands [bvar 640, bvar 650, bvar 1173, bvar 1183]),
    bnot (bands [bvar 640, bvar 651, bvar 1173, bvar 1184]),
    bnot (bands [bvar 641, bvar 643, bvar 1174, bvar 1176]),
    bnot (bands [bvar 642, bvar 646, bvar 1175, bvar 1179]),
    bnot (bands [bvar 642, bvar 650, bvar 1175, bvar 1183]),
    bnot (bands [bvar 643, bvar 645, bvar 1176, bvar 1178]),
    bnot (bands [bvar 643, bvar 646, bvar 1176, bvar 1179]),
    bnot (bands [bvar 643, bvar 650, bvar 1176, bvar 1183]),
    bnot (bands [bvar 643, bvar 651, bvar 1176, bvar 1184]),
    bnot (bands [bvar 644, bvar 650, bvar 1177, bvar 1183]),
    bnot (bands [bvar 644, bvar 651, bvar 1177, bvar 1184]),
    bnot (bands [bvar 645, bvar 646, bvar 1178, bvar 1179]),
    bnot (bands [bvar 645, bvar 650, bvar 1178, bvar 1183]),
    bnot (bands [bvar 645, bvar 651, bvar 1178, bvar 1184]),
    bnot (bands [bvar 646, bvar 650, bvar 1179, bvar 1183]),
    bnot (bands [bvar 646, bvar 651, bvar 1179, bvar 1184]),
    bnot (bands [bvar 639, bvar 640, bvar 1185, bvar 1186]),
    bnot (bands [bvar 639, bvar 641, bvar 1185, bvar 1187]),
    bnot (bands [bvar 639, bvar 643, bvar 1185, bvar 1189]),
    bnot (bands [bvar 639, bvar 644, bvar 1185, bvar 1190]),
    bnot (bands [bvar 639, bvar 645, bvar 1185, bvar 1191]),
    bnot (bands [bvar 639, bvar 646, bvar 1185, bvar 1192]) ]

def reducedUnionChunk093 : BVLogicalExpr :=
  bands reducedUnionChunk093Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
