import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk091Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1120, bvar 1124, bvar 691, bvar 695]),
    bnot (bands [bvar 1120, bvar 1125, bvar 691, bvar 696]),
    bnot (bands [bvar 1121, bvar 1124, bvar 692, bvar 695]),
    bnot (bands [bvar 1122, bvar 1125, bvar 693, bvar 696]),
    bnot (bands [bvar 1123, bvar 1124, bvar 694, bvar 695]),
    bnot (bands [bvar 1123, bvar 1125, bvar 694, bvar 696]),
    bnot (bands [bvar 1124, bvar 1125, bvar 695, bvar 696]),
    bnot (bands [bvar 1127, bvar 1128, bvar 698, bvar 699]),
    bnot (bands [bvar 1127, bvar 1129, bvar 698, bvar 700]),
    bnot (bands [bvar 1127, bvar 1130, bvar 698, bvar 701]),
    bnot (bands [bvar 1127, bvar 1131, bvar 698, bvar 702]),
    bnot (bands [bvar 1128, bvar 1129, bvar 699, bvar 700]),
    bnot (bands [bvar 1128, bvar 1130, bvar 699, bvar 701]),
    bnot (bands [bvar 1128, bvar 1131, bvar 699, bvar 702]),
    bnot (bands [bvar 1129, bvar 1130, bvar 700, bvar 701]),
    bnot (bands [bvar 1129, bvar 1131, bvar 700, bvar 702]),
    atMost [bands [bvar 613, bvar 1198], bands [bvar 614, bvar 1199], bands [bvar 615, bvar 1200], bands [bvar 616, bvar 1201], bands [bvar 617, bvar 1202], bands [bvar 618, bvar 1203], bands [bvar 619, bvar 1204], bands [bvar 620, bvar 1205], bands [bvar 621, bvar 1206], bands [bvar 622, bvar 1207], bands [bvar 623, bvar 1208], bands [bvar 624, bvar 1209], bands [bvar 625, bvar 1210]] 2,
    bnot (bands [bvar 620, bvar 623, bvar 1205, bvar 1208]),
    bnot (bands [bvar 620, bvar 624, bvar 1205, bvar 1209]),
    bnot (bands [bvar 1133, bvar 1134, bvar 639, bvar 640]),
    bnot (bands [bvar 1133, bvar 1137, bvar 639, bvar 643]),
    bnot (bands [bvar 1133, bvar 1138, bvar 639, bvar 644]),
    bnot (bands [bvar 1133, bvar 1139, bvar 639, bvar 645]),
    bnot (bands [bvar 1133, bvar 1142, bvar 639, bvar 648]),
    bnot (bands [bvar 1133, bvar 1143, bvar 639, bvar 649]),
    bnot (bands [bvar 1133, bvar 1145, bvar 639, bvar 651]),
    bnot (bands [bvar 1134, bvar 1137, bvar 640, bvar 643]),
    bnot (bands [bvar 1134, bvar 1138, bvar 640, bvar 644]),
    bnot (bands [bvar 1134, bvar 1139, bvar 640, bvar 645]),
    bnot (bands [bvar 1134, bvar 1142, bvar 640, bvar 648]),
    bnot (bands [bvar 1134, bvar 1143, bvar 640, bvar 649]),
    bnot (bands [bvar 1134, bvar 1144, bvar 640, bvar 650]),
    bnot (bands [bvar 1134, bvar 1145, bvar 640, bvar 651]),
    bnot (bands [bvar 1135, bvar 1137, bvar 641, bvar 643]),
    bnot (bands [bvar 1136, bvar 1137, bvar 642, bvar 643]),
    bnot (bands [bvar 1136, bvar 1142, bvar 642, bvar 648]),
    bnot (bands [bvar 1136, bvar 1143, bvar 642, bvar 649]),
    bnot (bands [bvar 1137, bvar 1139, bvar 643, bvar 645]),
    bnot (bands [bvar 1137, bvar 1142, bvar 643, bvar 648]),
    bnot (bands [bvar 1137, bvar 1143, bvar 643, bvar 649]),
    bnot (bands [bvar 1137, bvar 1144, bvar 643, bvar 650]),
    bnot (bands [bvar 1137, bvar 1145, bvar 643, bvar 651]),
    bnot (bands [bvar 1138, bvar 1142, bvar 644, bvar 648]),
    bnot (bands [bvar 1138, bvar 1143, bvar 644, bvar 649]),
    bnot (bands [bvar 1138, bvar 1145, bvar 644, bvar 651]),
    bnot (bands [bvar 1139, bvar 1142, bvar 645, bvar 648]),
    bnot (bands [bvar 1139, bvar 1143, bvar 645, bvar 649]),
    bnot (bands [bvar 1139, bvar 1144, bvar 645, bvar 650]),
    bnot (bands [bvar 1139, bvar 1145, bvar 645, bvar 651]),
    bnot (bands [bvar 1133, bvar 1134, bvar 652, bvar 653]),
    bnot (bands [bvar 1133, bvar 1135, bvar 652, bvar 654]),
    bnot (bands [bvar 1133, bvar 1136, bvar 652, bvar 655]),
    bnot (bands [bvar 1133, bvar 1137, bvar 652, bvar 656]),
    bnot (bands [bvar 1133, bvar 1138, bvar 652, bvar 657]),
    bnot (bands [bvar 1133, bvar 1139, bvar 652, bvar 658]),
    bnot (bands [bvar 1133, bvar 1143, bvar 652, bvar 662]),
    bnot (bands [bvar 1133, bvar 1144, bvar 652, bvar 663]),
    bnot (bands [bvar 1133, bvar 1145, bvar 652, bvar 664]),
    bnot (bands [bvar 1134, bvar 1137, bvar 653, bvar 656]),
    bnot (bands [bvar 1134, bvar 1138, bvar 653, bvar 657]),
    bnot (bands [bvar 1134, bvar 1139, bvar 653, bvar 658]),
    bnot (bands [bvar 1134, bvar 1143, bvar 653, bvar 662]),
    bnot (bands [bvar 1134, bvar 1144, bvar 653, bvar 663]),
    bnot (bands [bvar 1135, bvar 1137, bvar 654, bvar 656]) ]

def reducedUnionChunk091 : BVLogicalExpr :=
  bands reducedUnionChunk091Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
