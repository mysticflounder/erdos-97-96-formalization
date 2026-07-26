import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk101Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 685, bvar 688, bvar 1205, bvar 1208]),
    bnot (bands [bvar 686, bvar 687, bvar 1206, bvar 1207]),
    bnot (bands [bvar 686, bvar 688, bvar 1206, bvar 1208]),
    bnot (bands [bvar 687, bvar 688, bvar 1207, bvar 1208]),
    bnot (bands [bvar 1094, bvar 1103, bvar 613, bvar 622]),
    bnot (bands [bvar 1096, bvar 1103, bvar 615, bvar 622]),
    bnot (bands [bvar 1096, bvar 1104, bvar 615, bvar 623]),
    bnot (bands [bvar 1096, bvar 1106, bvar 615, bvar 625]),
    bnot (bands [bvar 1097, bvar 1103, bvar 616, bvar 622]),
    bnot (bands [bvar 1097, bvar 1104, bvar 616, bvar 623]),
    bnot (bands [bvar 1097, bvar 1106, bvar 616, bvar 625]),
    bnot (bands [bvar 1103, bvar 1106, bvar 622, bvar 625]),
    bnot (bands [bvar 1104, bvar 1106, bvar 623, bvar 625]),
    bnot (bands [bvar 1095, bvar 1103, bvar 640, bvar 648]),
    bnot (bands [bvar 1095, bvar 1104, bvar 640, bvar 649]),
    bnot (bands [bvar 1095, bvar 1105, bvar 640, bvar 650]),
    bnot (bands [bvar 1107, bvar 1108, bvar 639, bvar 640]),
    bnot (bands [bvar 1108, bvar 1110, bvar 640, bvar 642]),
    bnot (bands [bvar 1108, bvar 1116, bvar 640, bvar 648]),
    bnot (bands [bvar 1108, bvar 1117, bvar 640, bvar 649]),
    bnot (bands [bvar 1108, bvar 1118, bvar 640, bvar 650]),
    bnot (bands [bvar 1120, bvar 1121, bvar 639, bvar 640]),
    bnot (bands [bvar 1121, bvar 1123, bvar 640, bvar 642]),
    bnot (bands [bvar 1121, bvar 1129, bvar 640, bvar 648]),
    bnot (bands [bvar 1121, bvar 1130, bvar 640, bvar 649]),
    bnot (bands [bvar 1121, bvar 1131, bvar 640, bvar 650]),
    bnot (bands [bvar 1121, bvar 1132, bvar 640, bvar 651]),
    bnot (bands [bvar 1133, bvar 1134, bvar 639, bvar 640]),
    bnot (bands [bvar 1134, bvar 1143, bvar 640, bvar 649]),
    bnot (bands [bvar 1134, bvar 1144, bvar 640, bvar 650]),
    bnot (bands [bvar 1043, bvar 1046, bvar 640, bvar 643]),
    bnot (bands [bvar 1043, bvar 1048, bvar 640, bvar 645]),
    bnot (bands [bvar 1043, bvar 1047, bvar 679, bvar 683]),
    bnot (bands [bvar 1043, bvar 1048, bvar 679, bvar 684]),
    bnot (bands [bvar 1043, bvar 1049, bvar 679, bvar 685]),
    bnot (bands [bvar 1044, bvar 1047, bvar 680, bvar 683]),
    bnot (bands [bvar 1044, bvar 1048, bvar 680, bvar 684]),
    bnot (bands [bvar 1044, bvar 1049, bvar 680, bvar 685]),
    bnot (bands [bvar 1045, bvar 1048, bvar 681, bvar 684]),
    bnot (bands [bvar 1045, bvar 1049, bvar 681, bvar 685]),
    bnot (bands [bvar 1046, bvar 1047, bvar 682, bvar 683]),
    bnot (bands [bvar 1046, bvar 1048, bvar 682, bvar 684]),
    bnot (bands [bvar 1046, bvar 1049, bvar 682, bvar 685]),
    bnot (bands [bvar 1047, bvar 1048, bvar 683, bvar 684]),
    bnot (bands [bvar 1047, bvar 1049, bvar 683, bvar 685]),
    bnot (bands [bvar 1048, bvar 1049, bvar 684, bvar 685]),
    bnot (bands [bvar 640, bvar 645, bvar 1186, bvar 1191]),
    bnot (bands [bvar 640, bvar 645, bvar 1199, bvar 1204]),
    bnot (bands [bvar 656, bvar 657, bvar 1189, bvar 1190]),
    bnot (bands [bvar 657, bvar 658, bvar 1190, bvar 1191]),
    bnot (bands [bvar 679, bvar 685, bvar 1199, bvar 1205]),
    bnot (bands [bvar 680, bvar 683, bvar 1200, bvar 1203]),
    bnot (bands [bvar 680, bvar 684, bvar 1200, bvar 1204]),
    bnot (bands [bvar 680, bvar 685, bvar 1200, bvar 1205]),
    bnot (bands [bvar 681, bvar 682, bvar 1201, bvar 1202]),
    bnot (bands [bvar 682, bvar 683, bvar 1202, bvar 1203]),
    bnot (bands [bvar 682, bvar 684, bvar 1202, bvar 1204]),
    bnot (bands [bvar 684, bvar 685, bvar 1204, bvar 1205]),
    bnot (bands [bvar 1047, bvar 1053, bvar 566, bvar 572]),
    bnot (bands [bvar 1049, bvar 1054, bvar 568, bvar 573]),
    bnot (bands [bvar 1048, bvar 1050, bvar 580, bvar 582]),
    bnot (bands [bvar 1048, bvar 1052, bvar 580, bvar 584]),
    bnot (bands [bvar 1049, bvar 1050, bvar 581, bvar 582]),
    bnot (bands [bvar 1050, bvar 1052, bvar 582, bvar 584]) ]

def reducedUnionChunk101 : BVLogicalExpr :=
  bands reducedUnionChunk101Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
