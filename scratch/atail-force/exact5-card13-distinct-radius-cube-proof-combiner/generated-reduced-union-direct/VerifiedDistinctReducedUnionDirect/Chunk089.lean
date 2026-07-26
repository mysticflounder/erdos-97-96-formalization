import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk089Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 606, bvar 611, bvar 1204, bvar 1209]),
    bnot (bands [bvar 613, bvar 622, bvar 1133, bvar 1142]),
    bnot (bands [bvar 613, bvar 625, bvar 1133, bvar 1145]),
    bnot (bands [bvar 614, bvar 624, bvar 1134, bvar 1144]),
    bnot (bands [bvar 615, bvar 622, bvar 1135, bvar 1142]),
    bnot (bands [bvar 616, bvar 617, bvar 1136, bvar 1137]),
    bnot (bands [bvar 616, bvar 618, bvar 1136, bvar 1138]),
    bnot (bands [bvar 616, bvar 621, bvar 1136, bvar 1141]),
    bnot (bands [bvar 616, bvar 622, bvar 1136, bvar 1142]),
    bnot (bands [bvar 616, bvar 623, bvar 1136, bvar 1143]),
    bnot (bands [bvar 616, bvar 624, bvar 1136, bvar 1144]),
    bnot (bands [bvar 616, bvar 625, bvar 1136, bvar 1145]),
    bnot (bands [bvar 617, bvar 618, bvar 1137, bvar 1138]),
    bnot (bands [bvar 617, bvar 621, bvar 1137, bvar 1141]),
    bnot (bands [bvar 617, bvar 623, bvar 1137, bvar 1143]),
    bnot (bands [bvar 617, bvar 624, bvar 1137, bvar 1144]),
    bnot (bands [bvar 617, bvar 625, bvar 1137, bvar 1145]),
    bnot (bands [bvar 618, bvar 621, bvar 1138, bvar 1141]),
    bnot (bands [bvar 618, bvar 623, bvar 1138, bvar 1143]),
    bnot (bands [bvar 618, bvar 624, bvar 1138, bvar 1144]),
    bnot (bands [bvar 618, bvar 625, bvar 1138, bvar 1145]),
    bnot (bands [bvar 621, bvar 623, bvar 1141, bvar 1143]),
    bnot (bands [bvar 621, bvar 624, bvar 1141, bvar 1144]),
    bnot (bands [bvar 621, bvar 625, bvar 1141, bvar 1145]),
    bnot (bands [bvar 622, bvar 624, bvar 1142, bvar 1144]),
    bnot (bands [bvar 622, bvar 625, bvar 1142, bvar 1145]),
    bnot (bands [bvar 623, bvar 624, bvar 1143, bvar 1144]),
    bnot (bands [bvar 623, bvar 625, bvar 1143, bvar 1145]),
    bnot (bands [bvar 624, bvar 625, bvar 1144, bvar 1145]),
    atMost [bands [bvar 1120, bvar 639], bands [bvar 1121, bvar 640], bands [bvar 1122, bvar 641], bands [bvar 1123, bvar 642], bands [bvar 1124, bvar 643], bands [bvar 1125, bvar 644], bands [bvar 1126, bvar 645], bands [bvar 1127, bvar 646], bands [bvar 1128, bvar 647], bands [bvar 1129, bvar 648], bands [bvar 1130, bvar 649], bands [bvar 1131, bvar 650], bands [bvar 1132, bvar 651]] 2,
    bnot (bands [bvar 1120, bvar 1121, bvar 639, bvar 640]),
    bnot (bands [bvar 1120, bvar 1124, bvar 639, bvar 643]),
    bnot (bands [bvar 1120, bvar 1129, bvar 639, bvar 648]),
    bnot (bands [bvar 1120, bvar 1131, bvar 639, bvar 650]),
    bnot (bands [bvar 1120, bvar 1132, bvar 639, bvar 651]),
    bnot (bands [bvar 1121, bvar 1124, bvar 640, bvar 643]),
    bnot (bands [bvar 1121, bvar 1125, bvar 640, bvar 644]),
    bnot (bands [bvar 1121, bvar 1129, bvar 640, bvar 648]),
    bnot (bands [bvar 1121, bvar 1130, bvar 640, bvar 649]),
    bnot (bands [bvar 1121, bvar 1131, bvar 640, bvar 650]),
    bnot (bands [bvar 1121, bvar 1132, bvar 640, bvar 651]),
    bnot (bands [bvar 1124, bvar 1129, bvar 643, bvar 648]),
    bnot (bands [bvar 1124, bvar 1130, bvar 643, bvar 649]),
    bnot (bands [bvar 1124, bvar 1131, bvar 643, bvar 650]),
    bnot (bands [bvar 1124, bvar 1132, bvar 643, bvar 651]),
    bnot (bands [bvar 1125, bvar 1129, bvar 644, bvar 648]),
    bnot (bands [bvar 1125, bvar 1130, bvar 644, bvar 649]),
    bnot (bands [bvar 1125, bvar 1131, bvar 644, bvar 650]),
    bnot (bands [bvar 1125, bvar 1132, bvar 644, bvar 651]),
    bnot (bands [bvar 1120, bvar 1124, bvar 652, bvar 656]),
    bnot (bands [bvar 1121, bvar 1124, bvar 653, bvar 656]),
    bnot (bands [bvar 1122, bvar 1124, bvar 654, bvar 656]),
    bnot (bands [bvar 1122, bvar 1130, bvar 654, bvar 662]),
    bnot (bands [bvar 1123, bvar 1124, bvar 655, bvar 656]),
    bnot (bands [bvar 1124, bvar 1125, bvar 656, bvar 657]),
    bnot (bands [bvar 1124, bvar 1130, bvar 656, bvar 662]),
    bnot (bands [bvar 1124, bvar 1131, bvar 656, bvar 663]),
    bnot (bands [bvar 1124, bvar 1132, bvar 656, bvar 664]),
    bnot (bands [bvar 1125, bvar 1130, bvar 657, bvar 662]),
    bnot (bands [bvar 1125, bvar 1131, bvar 657, bvar 663]),
    bnot (bands [bvar 1127, bvar 1128, bvar 659, bvar 660]),
    bnot (bands [bvar 1130, bvar 1131, bvar 662, bvar 663]),
    bnot (bands [bvar 1130, bvar 1132, bvar 662, bvar 664]),
    bnot (bands [bvar 614, bvar 618, bvar 1160, bvar 1164]) ]

def reducedUnionChunk089 : BVLogicalExpr :=
  bands reducedUnionChunk089Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
