import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk093Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 626, bvar 627, bvar 1185, bvar 1186]),
    bnot (bands [bvar 626, bvar 629, bvar 1185, bvar 1188]),
    bnot (bands [bvar 626, bvar 632, bvar 1185, bvar 1191]),
    bnot (bands [bvar 629, bvar 638, bvar 1188, bvar 1197]),
    bnot (bands [bvar 634, bvar 636, bvar 1193, bvar 1195]),
    bnot (bands [bvar 626, bvar 630, bvar 1198, bvar 1202]),
    bnot (bands [bvar 626, bvar 631, bvar 1198, bvar 1203]),
    bnot (bands [bvar 629, bvar 630, bvar 1201, bvar 1202]),
    bnot (bands [bvar 635, bvar 636, bvar 1207, bvar 1208]),
    bnot (bands [bvar 639, bvar 640, bvar 1159, bvar 1160]),
    bnot (bands [bvar 639, bvar 643, bvar 1159, bvar 1163]),
    bnot (bands [bvar 639, bvar 645, bvar 1159, bvar 1165]),
    bnot (bands [bvar 639, bvar 646, bvar 1159, bvar 1166]),
    bnot (bands [bvar 639, bvar 649, bvar 1159, bvar 1169]),
    bnot (bands [bvar 640, bvar 643, bvar 1160, bvar 1163]),
    bnot (bands [bvar 640, bvar 645, bvar 1160, bvar 1165]),
    bnot (bands [bvar 640, bvar 646, bvar 1160, bvar 1166]),
    bnot (bands [bvar 640, bvar 649, bvar 1160, bvar 1169]),
    bnot (bands [bvar 640, bvar 651, bvar 1160, bvar 1171]),
    bnot (bands [bvar 643, bvar 645, bvar 1163, bvar 1165]),
    bnot (bands [bvar 643, bvar 649, bvar 1163, bvar 1169]),
    bnot (bands [bvar 643, bvar 651, bvar 1163, bvar 1171]),
    bnot (bands [bvar 644, bvar 649, bvar 1164, bvar 1169]),
    bnot (bands [bvar 645, bvar 649, bvar 1165, bvar 1169]),
    bnot (bands [bvar 645, bvar 651, bvar 1165, bvar 1171]),
    bnot (bands [bvar 646, bvar 649, bvar 1166, bvar 1169]),
    bnot (bands [bvar 646, bvar 651, bvar 1166, bvar 1171]),
    bnot (bands [bvar 639, bvar 640, bvar 1172, bvar 1173]),
    bnot (bands [bvar 639, bvar 644, bvar 1172, bvar 1177]),
    bnot (bands [bvar 639, bvar 650, bvar 1172, bvar 1183]),
    bnot (bands [bvar 639, bvar 651, bvar 1172, bvar 1184]),
    bnot (bands [bvar 640, bvar 643, bvar 1173, bvar 1176]),
    bnot (bands [bvar 640, bvar 644, bvar 1173, bvar 1177]),
    bnot (bands [bvar 640, bvar 650, bvar 1173, bvar 1183]),
    bnot (bands [bvar 640, bvar 651, bvar 1173, bvar 1184]),
    bnot (bands [bvar 639, bvar 640, bvar 1185, bvar 1186]),
    bnot (bands [bvar 639, bvar 643, bvar 1185, bvar 1189]),
    bnot (bands [bvar 639, bvar 645, bvar 1185, bvar 1191]),
    bnot (bands [bvar 639, bvar 646, bvar 1185, bvar 1192]),
    bnot (bands [bvar 640, bvar 643, bvar 1186, bvar 1189]),
    bnot (bands [bvar 640, bvar 645, bvar 1186, bvar 1191]),
    bnot (bands [bvar 640, bvar 646, bvar 1186, bvar 1192]),
    bnot (bands [bvar 640, bvar 651, bvar 1186, bvar 1197]),
    bnot (bands [bvar 643, bvar 645, bvar 1189, bvar 1191]),
    bnot (bands [bvar 643, bvar 651, bvar 1189, bvar 1197]),
    bnot (bands [bvar 645, bvar 651, bvar 1191, bvar 1197]),
    bnot (bands [bvar 646, bvar 651, bvar 1192, bvar 1197]),
    bnot (bands [bvar 639, bvar 640, bvar 1198, bvar 1199]),
    bnot (bands [bvar 639, bvar 643, bvar 1198, bvar 1202]),
    bnot (bands [bvar 639, bvar 644, bvar 1198, bvar 1203]),
    bnot (bands [bvar 639, bvar 645, bvar 1198, bvar 1204]),
    bnot (bands [bvar 639, bvar 646, bvar 1198, bvar 1205]),
    bnot (bands [bvar 640, bvar 643, bvar 1199, bvar 1202]),
    bnot (bands [bvar 640, bvar 644, bvar 1199, bvar 1203]),
    bnot (bands [bvar 640, bvar 645, bvar 1199, bvar 1204]),
    bnot (bands [bvar 640, bvar 646, bvar 1199, bvar 1205]),
    bnot (bands [bvar 643, bvar 645, bvar 1202, bvar 1204]),
    bnot (bands [bvar 643, bvar 646, bvar 1202, bvar 1205]),
    bnot (bands [bvar 645, bvar 646, bvar 1204, bvar 1205]),
    bnot (bands [bvar 1159, bvar 1160, bvar 665, bvar 666]),
    bnot (bands [bvar 1159, bvar 1161, bvar 665, bvar 667]),
    bnot (bands [bvar 1159, bvar 1162, bvar 665, bvar 668]),
    bnot (bands [bvar 1159, bvar 1163, bvar 665, bvar 669]),
    bnot (bands [bvar 1159, bvar 1164, bvar 665, bvar 670]) ]

def reducedUnionChunk093 : BVLogicalExpr :=
  bands reducedUnionChunk093Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
