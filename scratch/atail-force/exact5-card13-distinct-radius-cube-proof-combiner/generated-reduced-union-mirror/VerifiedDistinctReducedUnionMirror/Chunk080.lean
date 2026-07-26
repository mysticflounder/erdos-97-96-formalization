import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk080Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1047, bvar 1051, bvar 696, bvar 700]),
    bnot (bands [bvar 1047, bvar 1052, bvar 696, bvar 701]),
    bnot (bands [bvar 1047, bvar 1053, bvar 696, bvar 702]),
    bnot (bands [bvar 1048, bvar 1049, bvar 697, bvar 698]),
    bnot (bands [bvar 1048, bvar 1050, bvar 697, bvar 699]),
    bnot (bands [bvar 1048, bvar 1051, bvar 697, bvar 700]),
    bnot (bands [bvar 1048, bvar 1052, bvar 697, bvar 701]),
    bnot (bands [bvar 1048, bvar 1053, bvar 697, bvar 702]),
    bnot (bands [bvar 1049, bvar 1050, bvar 698, bvar 699]),
    bnot (bands [bvar 1049, bvar 1051, bvar 698, bvar 700]),
    bnot (bands [bvar 1049, bvar 1052, bvar 698, bvar 701]),
    bnot (bands [bvar 1049, bvar 1053, bvar 698, bvar 702]),
    bnot (bands [bvar 1050, bvar 1052, bvar 699, bvar 701]),
    bnot (bands [bvar 536, bvar 541, bvar 1199, bvar 1204]),
    bnot (bands [bvar 537, bvar 541, bvar 1200, bvar 1204]),
    bnot (bands [bvar 537, bvar 542, bvar 1200, bvar 1205]),
    bnot (bands [bvar 539, bvar 540, bvar 1202, bvar 1203]),
    bnot (bands [bvar 539, bvar 542, bvar 1202, bvar 1205]),
    bnot (bands [bvar 539, bvar 543, bvar 1202, bvar 1206]),
    bnot (bands [bvar 540, bvar 542, bvar 1203, bvar 1205]),
    bnot (bands [bvar 540, bvar 543, bvar 1203, bvar 1206]),
    bnot (bands [bvar 541, bvar 542, bvar 1204, bvar 1205]),
    bnot (bands [bvar 541, bvar 543, bvar 1204, bvar 1206]),
    bnot (bands [bvar 541, bvar 544, bvar 1204, bvar 1207]),
    bnot (bands [bvar 542, bvar 543, bvar 1205, bvar 1206]),
    bnot (bands [bvar 542, bvar 544, bvar 1205, bvar 1207]),
    bnot (bands [bvar 1058, bvar 1060, bvar 564, bvar 566]),
    bnot (bands [bvar 1058, bvar 1066, bvar 564, bvar 572]),
    bnot (bands [bvar 1058, bvar 1067, bvar 564, bvar 573]),
    bnot (bands [bvar 1060, bvar 1064, bvar 566, bvar 570]),
    bnot (bands [bvar 548, bvar 556, bvar 1094, bvar 1102]),
    bnot (bands [bvar 548, bvar 559, bvar 1094, bvar 1105]),
    bnot (bands [bvar 548, bvar 560, bvar 1094, bvar 1106]),
    bnot (bands [bvar 553, bvar 558, bvar 1099, bvar 1104]),
    bnot (bands [bvar 556, bvar 560, bvar 1102, bvar 1106]),
    bnot (bands [bvar 557, bvar 558, bvar 1103, bvar 1104]),
    bnot (bands [bvar 1057, bvar 1059, bvar 615, bvar 617]),
    bnot (bands [bvar 1058, bvar 1059, bvar 616, bvar 617]),
    bnot (bands [bvar 1059, bvar 1060, bvar 617, bvar 618]),
    bnot (bands [bvar 1062, bvar 1063, bvar 620, bvar 621]),
    bnot (bands [bvar 1062, bvar 1064, bvar 620, bvar 622]),
    bnot (bands [bvar 1062, bvar 1065, bvar 620, bvar 623]),
    bnot (bands [bvar 1062, bvar 1066, bvar 620, bvar 624]),
    bnot (bands [bvar 1062, bvar 1067, bvar 620, bvar 625]),
    bnot (bands [bvar 1063, bvar 1064, bvar 621, bvar 622]),
    bnot (bands [bvar 1063, bvar 1065, bvar 621, bvar 623]),
    bnot (bands [bvar 1063, bvar 1066, bvar 621, bvar 624]),
    bnot (bands [bvar 1063, bvar 1067, bvar 621, bvar 625]),
    bnot (bands [bvar 1064, bvar 1065, bvar 622, bvar 623]),
    bnot (bands [bvar 1064, bvar 1066, bvar 622, bvar 624]),
    bnot (bands [bvar 1064, bvar 1067, bvar 622, bvar 625]),
    bnot (bands [bvar 1065, bvar 1066, bvar 623, bvar 624]),
    bnot (bands [bvar 1065, bvar 1067, bvar 623, bvar 625]),
    bnot (bands [bvar 1055, bvar 1066, bvar 639, bvar 650]),
    atMost [bands [bvar 1055, bvar 652], bands [bvar 1056, bvar 653], bands [bvar 1057, bvar 654], bands [bvar 1058, bvar 655], bands [bvar 1059, bvar 656], bands [bvar 1060, bvar 657], bands [bvar 1061, bvar 658], bands [bvar 1062, bvar 659], bands [bvar 1063, bvar 660], bands [bvar 1064, bvar 661], bands [bvar 1065, bvar 662], bands [bvar 1066, bvar 663], bands [bvar 1067, bvar 664]] 2,
    bnot (bands [bvar 1055, bvar 1065, bvar 652, bvar 662]),
    bnot (bands [bvar 1057, bvar 1059, bvar 654, bvar 656]),
    bnot (bands [bvar 1057, bvar 1060, bvar 654, bvar 657]),
    bnot (bands [bvar 1057, bvar 1062, bvar 654, bvar 659]),
    bnot (bands [bvar 1058, bvar 1059, bvar 655, bvar 656]),
    bnot (bands [bvar 1058, bvar 1060, bvar 655, bvar 657]),
    bnot (bands [bvar 1058, bvar 1062, bvar 655, bvar 659]),
    bnot (bands [bvar 1059, bvar 1060, bvar 656, bvar 657]),
    bnot (bands [bvar 1059, bvar 1062, bvar 656, bvar 659]) ]

def reducedUnionChunk080 : BVLogicalExpr :=
  bands reducedUnionChunk080Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
