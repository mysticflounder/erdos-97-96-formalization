import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk092Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1137, bvar 1139, bvar 656, bvar 658]),
    bnot (bands [bvar 1137, bvar 1143, bvar 656, bvar 662]),
    bnot (bands [bvar 1137, bvar 1144, bvar 656, bvar 663]),
    bnot (bands [bvar 1137, bvar 1145, bvar 656, bvar 664]),
    bnot (bands [bvar 1138, bvar 1139, bvar 657, bvar 658]),
    bnot (bands [bvar 1138, bvar 1143, bvar 657, bvar 662]),
    bnot (bands [bvar 1138, bvar 1144, bvar 657, bvar 663]),
    bnot (bands [bvar 1138, bvar 1145, bvar 657, bvar 664]),
    bnot (bands [bvar 1139, bvar 1143, bvar 658, bvar 662]),
    bnot (bands [bvar 1139, bvar 1144, bvar 658, bvar 663]),
    bnot (bands [bvar 1139, bvar 1145, bvar 658, bvar 664]),
    bnot (bands [bvar 1143, bvar 1144, bvar 662, bvar 663]),
    bnot (bands [bvar 1143, bvar 1145, bvar 662, bvar 664]),
    bnot (bands [bvar 1144, bvar 1145, bvar 663, bvar 664]),
    bnot (bands [bvar 627, bvar 638, bvar 1160, bvar 1171]),
    bnot (bands [bvar 629, bvar 630, bvar 1162, bvar 1163]),
    bnot (bands [bvar 629, bvar 631, bvar 1162, bvar 1164]),
    bnot (bands [bvar 629, bvar 632, bvar 1162, bvar 1165]),
    bnot (bands [bvar 629, bvar 636, bvar 1162, bvar 1169]),
    bnot (bands [bvar 629, bvar 638, bvar 1162, bvar 1171]),
    bnot (bands [bvar 630, bvar 632, bvar 1163, bvar 1165]),
    bnot (bands [bvar 630, bvar 636, bvar 1163, bvar 1169]),
    bnot (bands [bvar 630, bvar 637, bvar 1163, bvar 1170]),
    bnot (bands [bvar 630, bvar 638, bvar 1163, bvar 1171]),
    bnot (bands [bvar 631, bvar 638, bvar 1164, bvar 1171]),
    bnot (bands [bvar 632, bvar 636, bvar 1165, bvar 1169]),
    bnot (bands [bvar 632, bvar 637, bvar 1165, bvar 1170]),
    bnot (bands [bvar 636, bvar 637, bvar 1169, bvar 1170]),
    bnot (bands [bvar 1133, bvar 1137, bvar 665, bvar 669]),
    bnot (bands [bvar 1133, bvar 1139, bvar 665, bvar 671]),
    bnot (bands [bvar 1134, bvar 1145, bvar 666, bvar 677]),
    bnot (bands [bvar 1136, bvar 1137, bvar 668, bvar 669]),
    bnot (bands [bvar 1136, bvar 1139, bvar 668, bvar 671]),
    bnot (bands [bvar 1136, bvar 1145, bvar 668, bvar 677]),
    bnot (bands [bvar 1137, bvar 1139, bvar 669, bvar 671]),
    bnot (bands [bvar 1138, bvar 1144, bvar 670, bvar 676]),
    bnot (bands [bvar 1138, bvar 1145, bvar 670, bvar 677]),
    bnot (bands [bvar 1139, bvar 1145, bvar 671, bvar 677]),
    bnot (bands [bvar 1141, bvar 1142, bvar 673, bvar 674]),
    bnot (bands [bvar 626, bvar 627, bvar 1172, bvar 1173]),
    bnot (bands [bvar 626, bvar 630, bvar 1172, bvar 1176]),
    bnot (bands [bvar 626, bvar 631, bvar 1172, bvar 1177]),
    bnot (bands [bvar 626, bvar 632, bvar 1172, bvar 1178]),
    bnot (bands [bvar 626, bvar 638, bvar 1172, bvar 1184]),
    bnot (bands [bvar 627, bvar 630, bvar 1173, bvar 1176]),
    bnot (bands [bvar 627, bvar 631, bvar 1173, bvar 1177]),
    bnot (bands [bvar 627, bvar 632, bvar 1173, bvar 1178]),
    bnot (bands [bvar 627, bvar 637, bvar 1173, bvar 1183]),
    bnot (bands [bvar 628, bvar 630, bvar 1174, bvar 1176]),
    bnot (bands [bvar 628, bvar 631, bvar 1174, bvar 1177]),
    bnot (bands [bvar 629, bvar 630, bvar 1175, bvar 1176]),
    bnot (bands [bvar 629, bvar 631, bvar 1175, bvar 1177]),
    bnot (bands [bvar 629, bvar 632, bvar 1175, bvar 1178]),
    bnot (bands [bvar 629, bvar 638, bvar 1175, bvar 1184]),
    bnot (bands [bvar 630, bvar 631, bvar 1176, bvar 1177]),
    bnot (bands [bvar 630, bvar 632, bvar 1176, bvar 1178]),
    bnot (bands [bvar 630, bvar 637, bvar 1176, bvar 1183]),
    bnot (bands [bvar 630, bvar 638, bvar 1176, bvar 1184]),
    bnot (bands [bvar 631, bvar 632, bvar 1177, bvar 1178]),
    bnot (bands [bvar 631, bvar 637, bvar 1177, bvar 1183]),
    bnot (bands [bvar 631, bvar 638, bvar 1177, bvar 1184]),
    bnot (bands [bvar 632, bvar 637, bvar 1178, bvar 1183]),
    bnot (bands [bvar 632, bvar 638, bvar 1178, bvar 1184]),
    bnot (bands [bvar 637, bvar 638, bvar 1183, bvar 1184]) ]

def reducedUnionChunk092 : BVLogicalExpr :=
  bands reducedUnionChunk092Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
