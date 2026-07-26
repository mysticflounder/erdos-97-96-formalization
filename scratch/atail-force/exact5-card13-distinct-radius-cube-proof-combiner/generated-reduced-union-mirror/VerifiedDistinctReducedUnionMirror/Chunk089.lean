import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk089Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 615, bvar 622, bvar 1135, bvar 1142]),
    bnot (bands [bvar 616, bvar 617, bvar 1136, bvar 1137]),
    bnot (bands [bvar 616, bvar 621, bvar 1136, bvar 1141]),
    bnot (bands [bvar 616, bvar 622, bvar 1136, bvar 1142]),
    bnot (bands [bvar 616, bvar 624, bvar 1136, bvar 1144]),
    bnot (bands [bvar 617, bvar 622, bvar 1137, bvar 1142]),
    bnot (bands [bvar 617, bvar 624, bvar 1137, bvar 1144]),
    bnot (bands [bvar 618, bvar 622, bvar 1138, bvar 1142]),
    bnot (bands [bvar 618, bvar 623, bvar 1138, bvar 1143]),
    bnot (bands [bvar 618, bvar 624, bvar 1138, bvar 1144]),
    bnot (bands [bvar 622, bvar 623, bvar 1142, bvar 1143]),
    bnot (bands [bvar 622, bvar 624, bvar 1142, bvar 1144]),
    bnot (bands [bvar 1120, bvar 1121, bvar 639, bvar 640]),
    bnot (bands [bvar 1120, bvar 1124, bvar 639, bvar 643]),
    bnot (bands [bvar 1120, bvar 1125, bvar 639, bvar 644]),
    bnot (bands [bvar 1120, bvar 1129, bvar 639, bvar 648]),
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
    bnot (bands [bvar 1130, bvar 1131, bvar 649, bvar 650]),
    bnot (bands [bvar 614, bvar 616, bvar 1147, bvar 1149]),
    bnot (bands [bvar 1120, bvar 1121, bvar 652, bvar 653]),
    bnot (bands [bvar 1120, bvar 1122, bvar 652, bvar 654]),
    bnot (bands [bvar 1120, bvar 1124, bvar 652, bvar 656]),
    bnot (bands [bvar 1120, bvar 1125, bvar 652, bvar 657]),
    bnot (bands [bvar 1120, bvar 1130, bvar 652, bvar 662]),
    bnot (bands [bvar 1120, bvar 1131, bvar 652, bvar 663]),
    bnot (bands [bvar 1120, bvar 1132, bvar 652, bvar 664]),
    bnot (bands [bvar 1121, bvar 1124, bvar 653, bvar 656]),
    bnot (bands [bvar 1121, bvar 1125, bvar 653, bvar 657]),
    bnot (bands [bvar 1122, bvar 1124, bvar 654, bvar 656]),
    bnot (bands [bvar 1122, bvar 1125, bvar 654, bvar 657]),
    bnot (bands [bvar 1122, bvar 1131, bvar 654, bvar 663]),
    bnot (bands [bvar 1123, bvar 1124, bvar 655, bvar 656]),
    bnot (bands [bvar 1123, bvar 1125, bvar 655, bvar 657]),
    bnot (bands [bvar 1124, bvar 1125, bvar 656, bvar 657]),
    bnot (bands [bvar 1124, bvar 1130, bvar 656, bvar 662]),
    bnot (bands [bvar 1124, bvar 1131, bvar 656, bvar 663]),
    bnot (bands [bvar 1124, bvar 1132, bvar 656, bvar 664]),
    bnot (bands [bvar 1125, bvar 1130, bvar 657, bvar 662]),
    bnot (bands [bvar 1125, bvar 1131, bvar 657, bvar 663]),
    bnot (bands [bvar 1125, bvar 1132, bvar 657, bvar 664]),
    bnot (bands [bvar 1127, bvar 1128, bvar 659, bvar 660]),
    bnot (bands [bvar 1130, bvar 1131, bvar 662, bvar 663]),
    bnot (bands [bvar 1130, bvar 1132, bvar 662, bvar 664]),
    bnot (bands [bvar 1131, bvar 1132, bvar 663, bvar 664]),
    bnot (bands [bvar 613, bvar 614, bvar 1159, bvar 1160]),
    bnot (bands [bvar 613, bvar 615, bvar 1159, bvar 1161]),
    bnot (bands [bvar 613, bvar 616, bvar 1159, bvar 1162]),
    bnot (bands [bvar 613, bvar 617, bvar 1159, bvar 1163]),
    bnot (bands [bvar 613, bvar 623, bvar 1159, bvar 1169]),
    bnot (bands [bvar 613, bvar 624, bvar 1159, bvar 1170]),
    bnot (bands [bvar 613, bvar 625, bvar 1159, bvar 1171]),
    bnot (bands [bvar 614, bvar 617, bvar 1160, bvar 1163]) ]

def reducedUnionChunk089 : BVLogicalExpr :=
  bands reducedUnionChunk089Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
