import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk082Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 564, bvar 566, bvar 1123, bvar 1125]),
    bnot (bands [bvar 568, bvar 573, bvar 1127, bvar 1132]),
    bnot (bands [bvar 562, bvar 573, bvar 1134, bvar 1145]),
    bnot (bands [bvar 564, bvar 566, bvar 1136, bvar 1138]),
    bnot (bands [bvar 1069, bvar 1077, bvar 640, bvar 648]),
    bnot (bands [bvar 1069, bvar 1080, bvar 640, bvar 651]),
    bnot (bands [bvar 564, bvar 566, bvar 1162, bvar 1164]),
    bnot (bands [bvar 564, bvar 566, bvar 1175, bvar 1177]),
    bnot (bands [bvar 1071, bvar 1078, bvar 681, bvar 688]),
    bnot (bands [bvar 562, bvar 573, bvar 1186, bvar 1197]),
    bnot (bands [bvar 564, bvar 570, bvar 1188, bvar 1194]),
    bnot (bands [bvar 564, bvar 566, bvar 1201, bvar 1203]),
    bnot (bands [bvar 566, bvar 570, bvar 1203, bvar 1207]),
    bnot (bands [bvar 574, bvar 585, bvar 1094, bvar 1105]),
    bnot (bands [bvar 574, bvar 586, bvar 1094, bvar 1106]),
    bnot (bands [bvar 575, bvar 579, bvar 1095, bvar 1099]),
    bnot (bands [bvar 575, bvar 586, bvar 1095, bvar 1106]),
    bnot (bands [bvar 576, bvar 584, bvar 1096, bvar 1104]),
    bnot (bands [bvar 579, bvar 583, bvar 1099, bvar 1103]),
    bnot (bands [bvar 579, bvar 584, bvar 1099, bvar 1104]),
    bnot (bands [bvar 579, bvar 586, bvar 1099, bvar 1106]),
    bnot (bands [bvar 580, bvar 583, bvar 1100, bvar 1103]),
    bnot (bands [bvar 580, bvar 585, bvar 1100, bvar 1105]),
    bnot (bands [bvar 580, bvar 586, bvar 1100, bvar 1106]),
    bnot (bands [bvar 581, bvar 583, bvar 1101, bvar 1103]),
    bnot (bands [bvar 581, bvar 585, bvar 1101, bvar 1105]),
    bnot (bands [bvar 582, bvar 583, bvar 1102, bvar 1103]),
    bnot (bands [bvar 582, bvar 584, bvar 1102, bvar 1104]),
    bnot (bands [bvar 582, bvar 585, bvar 1102, bvar 1105]),
    bnot (bands [bvar 582, bvar 586, bvar 1102, bvar 1106]),
    bnot (bands [bvar 583, bvar 584, bvar 1103, bvar 1104]),
    bnot (bands [bvar 583, bvar 585, bvar 1103, bvar 1105]),
    bnot (bands [bvar 584, bvar 585, bvar 1104, bvar 1105]),
    bnot (bands [bvar 584, bvar 586, bvar 1104, bvar 1106]),
    bnot (bands [bvar 585, bvar 586, bvar 1105, bvar 1106]),
    bnot (bands [bvar 1088, bvar 1089, bvar 620, bvar 621]),
    bnot (bands [bvar 1090, bvar 1091, bvar 635, bvar 636]),
    atMost [bands [bvar 1081, bvar 639], bands [bvar 1082, bvar 640], bands [bvar 1083, bvar 641], bands [bvar 1084, bvar 642], bands [bvar 1085, bvar 643], bands [bvar 1086, bvar 644], bands [bvar 1087, bvar 645], bands [bvar 1088, bvar 646], bands [bvar 1089, bvar 647], bands [bvar 1090, bvar 648], bands [bvar 1091, bvar 649], bands [bvar 1092, bvar 650], bands [bvar 1093, bvar 651]] 2,
    bnot (bands [bvar 1081, bvar 1082, bvar 639, bvar 640]),
    bnot (bands [bvar 1081, bvar 1091, bvar 639, bvar 649]),
    bnot (bands [bvar 1082, bvar 1090, bvar 640, bvar 648]),
    bnot (bands [bvar 1082, bvar 1091, bvar 640, bvar 649]),
    bnot (bands [bvar 1082, bvar 1092, bvar 640, bvar 650]),
    bnot (bands [bvar 1082, bvar 1093, bvar 640, bvar 651]),
    bnot (bands [bvar 1081, bvar 1083, bvar 665, bvar 667]),
    bnot (bands [bvar 1081, bvar 1093, bvar 665, bvar 677]),
    bnot (bands [bvar 1082, bvar 1092, bvar 666, bvar 676]),
    bnot (bands [bvar 1085, bvar 1086, bvar 669, bvar 670]),
    bnot (bands [bvar 1085, bvar 1087, bvar 669, bvar 671]),
    bnot (bands [bvar 1085, bvar 1088, bvar 669, bvar 672]),
    bnot (bands [bvar 1085, bvar 1089, bvar 669, bvar 673]),
    bnot (bands [bvar 1085, bvar 1090, bvar 669, bvar 674]),
    bnot (bands [bvar 1086, bvar 1088, bvar 670, bvar 672]),
    bnot (bands [bvar 1086, bvar 1089, bvar 670, bvar 673]),
    bnot (bands [bvar 1086, bvar 1090, bvar 670, bvar 674]),
    bnot (bands [bvar 1087, bvar 1089, bvar 671, bvar 673]),
    bnot (bands [bvar 1087, bvar 1090, bvar 671, bvar 674]),
    bnot (bands [bvar 1088, bvar 1089, bvar 672, bvar 673]),
    bnot (bands [bvar 1088, bvar 1090, bvar 672, bvar 674]),
    bnot (bands [bvar 1089, bvar 1090, bvar 673, bvar 674]),
    bnot (bands [bvar 1092, bvar 1093, bvar 676, bvar 677]),
    bnot (bands [bvar 1081, bvar 1082, bvar 678, bvar 679]),
    bnot (bands [bvar 1081, bvar 1083, bvar 678, bvar 680]),
    bnot (bands [bvar 1081, bvar 1093, bvar 678, bvar 690]) ]

def reducedUnionChunk082 : BVLogicalExpr :=
  bands reducedUnionChunk082Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
