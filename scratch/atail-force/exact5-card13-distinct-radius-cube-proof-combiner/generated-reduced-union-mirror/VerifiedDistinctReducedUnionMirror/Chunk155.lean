import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk155Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 1122, bvar 1130]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 1122, bvar 1131]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 1122, bvar 1132]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1123, bvar 1124]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 1123, bvar 1125]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 1123, bvar 1127]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 1123, bvar 1128]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 1123, bvar 1129]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 1123, bvar 1130]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 1123, bvar 1131]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 1123, bvar 1132]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1124, bvar 1125]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 1124, bvar 1127]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 1124, bvar 1128]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 1124, bvar 1129]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 1124, bvar 1130]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 1124, bvar 1131]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 1124, bvar 1132]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1125, bvar 1127]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 1125, bvar 1128]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 1125, bvar 1129]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 1125, bvar 1130]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 1125, bvar 1131]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 1125, bvar 1132]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1127, bvar 1128]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 1127, bvar 1129]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 1127, bvar 1130]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 1127, bvar 1131]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 1127, bvar 1132]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1128, bvar 1129]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 1128, bvar 1130]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 1128, bvar 1131]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 1128, bvar 1132]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1129, bvar 1130]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 1129, bvar 1131]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 1129, bvar 1132]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1130, bvar 1131]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 1130, bvar 1132]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1131, bvar 1132]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1133, bvar 1134]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 1133, bvar 1135]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bands [bvar 1133, bvar 1136]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 1133, bvar 1137]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 1133, bvar 1138]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 1133, bvar 1139]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 1133, bvar 1141]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 1133, bvar 1142]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 1133, bvar 1143]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 1133, bvar 1144]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 1133, bvar 1145]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 1134, bvar 1135]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bands [bvar 1134, bvar 1136]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 1134, bvar 1137]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 1134, bvar 1138]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 1134, bvar 1139]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 1134, bvar 1141]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 1134, bvar 1142]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 1134, bvar 1143]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 1134, bvar 1144]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 1134, bvar 1145]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 1135, bvar 1136]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 1135, bvar 1137]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 1135, bvar 1138]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 1135, bvar 1139]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1606 : BVExpr 7))) ]

def reducedUnionChunk155 : BVLogicalExpr :=
  bands reducedUnionChunk155Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
