import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk091Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 614, bvar 625, bvar 1186, bvar 1197]),
    bnot (bands [bvar 615, bvar 618, bvar 1187, bvar 1190]),
    bnot (bands [bvar 616, bvar 617, bvar 1188, bvar 1189]),
    bnot (bands [bvar 617, bvar 618, bvar 1189, bvar 1190]),
    bnot (bands [bvar 617, bvar 625, bvar 1189, bvar 1197]),
    bnot (bands [bvar 618, bvar 625, bvar 1190, bvar 1197]),
    bnot (bands [bvar 620, bvar 621, bvar 1192, bvar 1193]),
    bnot (bands [bvar 620, bvar 622, bvar 1192, bvar 1194]),
    bnot (bands [bvar 620, bvar 623, bvar 1192, bvar 1195]),
    bnot (bands [bvar 621, bvar 622, bvar 1193, bvar 1194]),
    bnot (bands [bvar 621, bvar 623, bvar 1193, bvar 1195]),
    bnot (bands [bvar 1120, bvar 1121, bvar 691, bvar 692]),
    bnot (bands [bvar 1120, bvar 1122, bvar 691, bvar 693]),
    bnot (bands [bvar 1120, bvar 1123, bvar 691, bvar 694]),
    bnot (bands [bvar 1120, bvar 1124, bvar 691, bvar 695]),
    bnot (bands [bvar 1121, bvar 1125, bvar 692, bvar 696]),
    bnot (bands [bvar 1122, bvar 1124, bvar 693, bvar 695]),
    bnot (bands [bvar 1123, bvar 1125, bvar 694, bvar 696]),
    bnot (bands [bvar 1127, bvar 1131, bvar 698, bvar 702]),
    bnot (bands [bvar 1128, bvar 1130, bvar 699, bvar 701]),
    bnot (bands [bvar 1130, bvar 1131, bvar 701, bvar 702]),
    bnot (bands [bvar 615, bvar 617, bvar 1200, bvar 1202]),
    bnot (bands [bvar 620, bvar 621, bvar 1205, bvar 1206]),
    bnot (bands [bvar 620, bvar 624, bvar 1205, bvar 1209]),
    bnot (bands [bvar 621, bvar 624, bvar 1206, bvar 1209]),
    bnot (bands [bvar 1133, bvar 1134, bvar 639, bvar 640]),
    bnot (bands [bvar 1133, bvar 1137, bvar 639, bvar 643]),
    bnot (bands [bvar 1133, bvar 1139, bvar 639, bvar 645]),
    bnot (bands [bvar 1134, bvar 1137, bvar 640, bvar 643]),
    bnot (bands [bvar 1134, bvar 1139, bvar 640, bvar 645]),
    bnot (bands [bvar 1134, bvar 1142, bvar 640, bvar 648]),
    bnot (bands [bvar 1134, bvar 1143, bvar 640, bvar 649]),
    bnot (bands [bvar 1134, bvar 1145, bvar 640, bvar 651]),
    bnot (bands [bvar 1137, bvar 1142, bvar 643, bvar 648]),
    bnot (bands [bvar 1137, bvar 1143, bvar 643, bvar 649]),
    bnot (bands [bvar 1137, bvar 1144, bvar 643, bvar 650]),
    bnot (bands [bvar 1137, bvar 1145, bvar 643, bvar 651]),
    bnot (bands [bvar 1139, bvar 1143, bvar 645, bvar 649]),
    bnot (bands [bvar 1133, bvar 1134, bvar 652, bvar 653]),
    bnot (bands [bvar 1133, bvar 1135, bvar 652, bvar 654]),
    bnot (bands [bvar 1133, bvar 1136, bvar 652, bvar 655]),
    bnot (bands [bvar 1133, bvar 1137, bvar 652, bvar 656]),
    bnot (bands [bvar 1133, bvar 1138, bvar 652, bvar 657]),
    bnot (bands [bvar 1133, bvar 1139, bvar 652, bvar 658]),
    bnot (bands [bvar 1133, bvar 1143, bvar 652, bvar 662]),
    bnot (bands [bvar 1133, bvar 1145, bvar 652, bvar 664]),
    bnot (bands [bvar 1134, bvar 1137, bvar 653, bvar 656]),
    bnot (bands [bvar 1134, bvar 1138, bvar 653, bvar 657]),
    bnot (bands [bvar 1134, bvar 1139, bvar 653, bvar 658]),
    bnot (bands [bvar 1134, bvar 1143, bvar 653, bvar 662]),
    bnot (bands [bvar 1134, bvar 1145, bvar 653, bvar 664]),
    bnot (bands [bvar 1135, bvar 1137, bvar 654, bvar 656]),
    bnot (bands [bvar 1135, bvar 1138, bvar 654, bvar 657]),
    bnot (bands [bvar 1135, bvar 1139, bvar 654, bvar 658]),
    bnot (bands [bvar 1135, bvar 1143, bvar 654, bvar 662]),
    bnot (bands [bvar 1135, bvar 1144, bvar 654, bvar 663]),
    bnot (bands [bvar 1135, bvar 1145, bvar 654, bvar 664]),
    bnot (bands [bvar 1136, bvar 1137, bvar 655, bvar 656]),
    bnot (bands [bvar 1136, bvar 1138, bvar 655, bvar 657]),
    bnot (bands [bvar 1136, bvar 1139, bvar 655, bvar 658]),
    bnot (bands [bvar 1136, bvar 1143, bvar 655, bvar 662]),
    bnot (bands [bvar 1136, bvar 1144, bvar 655, bvar 663]),
    bnot (bands [bvar 1136, bvar 1145, bvar 655, bvar 664]),
    bnot (bands [bvar 1137, bvar 1138, bvar 656, bvar 657]) ]

def reducedUnionChunk091 : BVLogicalExpr :=
  bands reducedUnionChunk091Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
