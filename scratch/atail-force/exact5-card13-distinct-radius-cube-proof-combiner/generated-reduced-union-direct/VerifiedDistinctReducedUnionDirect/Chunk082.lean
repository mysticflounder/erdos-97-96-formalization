import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk082Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 580, bvar 584, bvar 1100, bvar 1104]),
    bnot (bands [bvar 581, bvar 585, bvar 1101, bvar 1105]),
    bnot (bands [bvar 582, bvar 583, bvar 1102, bvar 1103]),
    bnot (bands [bvar 582, bvar 584, bvar 1102, bvar 1104]),
    bnot (bands [bvar 582, bvar 585, bvar 1102, bvar 1105]),
    bnot (bands [bvar 583, bvar 584, bvar 1103, bvar 1104]),
    bnot (bands [bvar 583, bvar 585, bvar 1103, bvar 1105]),
    bnot (bands [bvar 584, bvar 586, bvar 1104, bvar 1106]),
    bnot (bands [bvar 1081, bvar 1087, bvar 600, bvar 606]),
    bnot (bands [bvar 1081, bvar 1089, bvar 600, bvar 608]),
    bnot (bands [bvar 1081, bvar 1090, bvar 600, bvar 609]),
    bnot (bands [bvar 1087, bvar 1090, bvar 606, bvar 609]),
    bnot (bands [bvar 1087, bvar 1091, bvar 606, bvar 610]),
    bnot (bands [bvar 1087, bvar 1092, bvar 606, bvar 611]),
    bnot (bands [bvar 1087, bvar 1093, bvar 606, bvar 612]),
    bnot (bands [bvar 1089, bvar 1090, bvar 608, bvar 609]),
    bnot (bands [bvar 1089, bvar 1091, bvar 608, bvar 610]),
    bnot (bands [bvar 1089, bvar 1092, bvar 608, bvar 611]),
    bnot (bands [bvar 1089, bvar 1093, bvar 608, bvar 612]),
    bnot (bands [bvar 1090, bvar 1091, bvar 609, bvar 610]),
    bnot (bands [bvar 1090, bvar 1092, bvar 609, bvar 611]),
    atMost [bands [bvar 1081, bvar 613], bands [bvar 1082, bvar 614], bands [bvar 1083, bvar 615], bands [bvar 1084, bvar 616], bands [bvar 1085, bvar 617], bands [bvar 1086, bvar 618], bands [bvar 1087, bvar 619], bands [bvar 1088, bvar 620], bands [bvar 1089, bvar 621], bands [bvar 1090, bvar 622], bands [bvar 1091, bvar 623], bands [bvar 1092, bvar 624], bands [bvar 1093, bvar 625]] 2,
    bnot (bands [bvar 1081, bvar 1091, bvar 613, bvar 623]),
    bnot (bands [bvar 1081, bvar 1092, bvar 613, bvar 624]),
    bnot (bands [bvar 1082, bvar 1088, bvar 614, bvar 620]),
    bnot (bands [bvar 1082, bvar 1089, bvar 614, bvar 621]),
    bnot (bands [bvar 1082, bvar 1091, bvar 614, bvar 623]),
    bnot (bands [bvar 1082, bvar 1092, bvar 614, bvar 624]),
    bnot (bands [bvar 1082, bvar 1093, bvar 614, bvar 625]),
    bnot (bands [bvar 1083, bvar 1088, bvar 615, bvar 620]),
    bnot (bands [bvar 1083, bvar 1092, bvar 615, bvar 624]),
    bnot (bands [bvar 1083, bvar 1093, bvar 615, bvar 625]),
    bnot (bands [bvar 1085, bvar 1086, bvar 617, bvar 618]),
    bnot (bands [bvar 1088, bvar 1089, bvar 620, bvar 621]),
    bnot (bands [bvar 1088, bvar 1090, bvar 620, bvar 622]),
    bnot (bands [bvar 1088, bvar 1091, bvar 620, bvar 623]),
    bnot (bands [bvar 1088, bvar 1092, bvar 620, bvar 624]),
    bnot (bands [bvar 1088, bvar 1093, bvar 620, bvar 625]),
    bnot (bands [bvar 1089, bvar 1090, bvar 621, bvar 622]),
    bnot (bands [bvar 1089, bvar 1091, bvar 621, bvar 623]),
    bnot (bands [bvar 1089, bvar 1092, bvar 621, bvar 624]),
    bnot (bands [bvar 1089, bvar 1093, bvar 621, bvar 625]),
    bnot (bands [bvar 1090, bvar 1091, bvar 622, bvar 623]),
    bnot (bands [bvar 1090, bvar 1092, bvar 622, bvar 624]),
    bnot (bands [bvar 1090, bvar 1093, bvar 622, bvar 625]),
    bnot (bands [bvar 1091, bvar 1092, bvar 623, bvar 624]),
    bnot (bands [bvar 1091, bvar 1093, bvar 623, bvar 625]),
    bnot (bands [bvar 1092, bvar 1093, bvar 624, bvar 625]),
    atMost [bands [bvar 574, bvar 1120], bands [bvar 575, bvar 1121], bands [bvar 576, bvar 1122], bands [bvar 577, bvar 1123], bands [bvar 578, bvar 1124], bands [bvar 579, bvar 1125], bands [bvar 580, bvar 1126], bands [bvar 581, bvar 1127], bands [bvar 582, bvar 1128], bands [bvar 583, bvar 1129], bands [bvar 584, bvar 1130], bands [bvar 585, bvar 1131], bands [bvar 586, bvar 1132]] 2,
    bnot (bands [bvar 581, bvar 582, bvar 1127, bvar 1128]),
    bnot (bands [bvar 581, bvar 584, bvar 1127, bvar 1130]),
    bnot (bands [bvar 581, bvar 585, bvar 1127, bvar 1131]),
    bnot (bands [bvar 582, bvar 584, bvar 1128, bvar 1130]),
    bnot (bands [bvar 582, bvar 585, bvar 1128, bvar 1131]),
    bnot (bands [bvar 582, bvar 586, bvar 1128, bvar 1132]),
    bnot (bands [bvar 584, bvar 586, bvar 1130, bvar 1132]),
    atMost [bands [bvar 1081, bvar 639], bands [bvar 1082, bvar 640], bands [bvar 1083, bvar 641], bands [bvar 1084, bvar 642], bands [bvar 1085, bvar 643], bands [bvar 1086, bvar 644], bands [bvar 1087, bvar 645], bands [bvar 1088, bvar 646], bands [bvar 1089, bvar 647], bands [bvar 1090, bvar 648], bands [bvar 1091, bvar 649], bands [bvar 1092, bvar 650], bands [bvar 1093, bvar 651]] 2,
    bnot (bands [bvar 1081, bvar 1082, bvar 639, bvar 640]),
    bnot (bands [bvar 1081, bvar 1090, bvar 639, bvar 648]),
    bnot (bands [bvar 1082, bvar 1090, bvar 640, bvar 648]),
    bnot (bands [bvar 1082, bvar 1091, bvar 640, bvar 649]),
    bnot (bands [bvar 1082, bvar 1092, bvar 640, bvar 650]),
    bnot (bands [bvar 1082, bvar 1093, bvar 640, bvar 651]),
    atMost [bands [bvar 1081, bvar 652], bands [bvar 1082, bvar 653], bands [bvar 1083, bvar 654], bands [bvar 1084, bvar 655], bands [bvar 1085, bvar 656], bands [bvar 1086, bvar 657], bands [bvar 1087, bvar 658], bands [bvar 1088, bvar 659], bands [bvar 1089, bvar 660], bands [bvar 1090, bvar 661], bands [bvar 1091, bvar 662], bands [bvar 1092, bvar 663], bands [bvar 1093, bvar 664]] 2 ]

def reducedUnionChunk082 : BVLogicalExpr :=
  bands reducedUnionChunk082Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
