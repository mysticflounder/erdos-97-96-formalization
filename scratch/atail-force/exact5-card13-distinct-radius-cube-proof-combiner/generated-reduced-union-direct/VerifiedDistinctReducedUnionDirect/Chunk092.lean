import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk092Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1135, bvar 1138, bvar 654, bvar 657]),
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
    bnot (bands [bvar 1137, bvar 1138, bvar 656, bvar 657]),
    bnot (bands [bvar 1137, bvar 1139, bvar 656, bvar 658]),
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
    bnot (bands [bvar 1133, bvar 1135, bvar 665, bvar 667]),
    bnot (bands [bvar 1133, bvar 1136, bvar 665, bvar 668]),
    bnot (bands [bvar 1133, bvar 1137, bvar 665, bvar 669]),
    bnot (bands [bvar 1133, bvar 1139, bvar 665, bvar 671]),
    bnot (bands [bvar 1133, bvar 1145, bvar 665, bvar 677]),
    bnot (bands [bvar 1134, bvar 1137, bvar 666, bvar 669]),
    bnot (bands [bvar 1134, bvar 1139, bvar 666, bvar 671]),
    bnot (bands [bvar 1135, bvar 1137, bvar 667, bvar 669]),
    bnot (bands [bvar 1135, bvar 1139, bvar 667, bvar 671]),
    bnot (bands [bvar 1136, bvar 1137, bvar 668, bvar 669]),
    bnot (bands [bvar 1136, bvar 1138, bvar 668, bvar 670]),
    bnot (bands [bvar 1136, bvar 1139, bvar 668, bvar 671]),
    bnot (bands [bvar 1136, bvar 1144, bvar 668, bvar 676]),
    bnot (bands [bvar 1136, bvar 1145, bvar 668, bvar 677]),
    bnot (bands [bvar 1137, bvar 1138, bvar 669, bvar 670]),
    bnot (bands [bvar 1137, bvar 1139, bvar 669, bvar 671]),
    bnot (bands [bvar 1137, bvar 1144, bvar 669, bvar 676]),
    bnot (bands [bvar 1137, bvar 1145, bvar 669, bvar 677]),
    bnot (bands [bvar 1138, bvar 1139, bvar 670, bvar 671]),
    bnot (bands [bvar 1138, bvar 1144, bvar 670, bvar 676]),
    bnot (bands [bvar 1138, bvar 1145, bvar 670, bvar 677]),
    bnot (bands [bvar 1139, bvar 1144, bvar 671, bvar 676]),
    bnot (bands [bvar 1139, bvar 1145, bvar 671, bvar 677]),
    bnot (bands [bvar 1141, bvar 1142, bvar 673, bvar 674]),
    bnot (bands [bvar 1144, bvar 1145, bvar 676, bvar 677]),
    atMost [bands [bvar 626, bvar 1172], bands [bvar 627, bvar 1173], bands [bvar 628, bvar 1174], bands [bvar 629, bvar 1175], bands [bvar 630, bvar 1176], bands [bvar 631, bvar 1177], bands [bvar 632, bvar 1178], bands [bvar 633, bvar 1179], bands [bvar 634, bvar 1180], bands [bvar 635, bvar 1181], bands [bvar 636, bvar 1182], bands [bvar 637, bvar 1183], bands [bvar 638, bvar 1184]] 2,
    bnot (bands [bvar 628, bvar 630, bvar 1174, bvar 1176]),
    bnot (bands [bvar 628, bvar 631, bvar 1174, bvar 1177]),
    bnot (bands [bvar 629, bvar 630, bvar 1175, bvar 1176]),
    bnot (bands [bvar 629, bvar 631, bvar 1175, bvar 1177]),
    bnot (bands [bvar 629, bvar 632, bvar 1175, bvar 1178]),
    bnot (bands [bvar 629, bvar 637, bvar 1175, bvar 1183]),
    bnot (bands [bvar 630, bvar 631, bvar 1176, bvar 1177]),
    bnot (bands [bvar 630, bvar 632, bvar 1176, bvar 1178]),
    bnot (bands [bvar 630, bvar 637, bvar 1176, bvar 1183]),
    bnot (bands [bvar 630, bvar 638, bvar 1176, bvar 1184]),
    bnot (bands [bvar 631, bvar 632, bvar 1177, bvar 1178]),
    bnot (bands [bvar 631, bvar 637, bvar 1177, bvar 1183]) ]

def reducedUnionChunk092 : BVLogicalExpr :=
  bands reducedUnionChunk092Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
