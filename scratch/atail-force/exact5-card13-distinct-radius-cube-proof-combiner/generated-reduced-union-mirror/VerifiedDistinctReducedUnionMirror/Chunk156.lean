import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk156Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 1135, bvar 1141]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 1135, bvar 1142]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 1135, bvar 1143]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 1135, bvar 1144]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 1135, bvar 1145]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 1136, bvar 1137]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 1136, bvar 1138]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 1136, bvar 1139]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 1136, bvar 1141]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 1136, bvar 1142]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 1136, bvar 1143]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 1136, bvar 1144]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 1136, bvar 1145]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 1137, bvar 1138]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 1137, bvar 1139]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 1137, bvar 1141]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 1137, bvar 1142]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 1137, bvar 1143]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 1137, bvar 1144]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 1137, bvar 1145]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 1138, bvar 1139]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 1138, bvar 1141]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 1138, bvar 1142]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 1138, bvar 1143]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 1138, bvar 1144]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 1138, bvar 1145]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 1139, bvar 1141]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 1139, bvar 1142]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 1139, bvar 1143]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 1139, bvar 1144]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 1139, bvar 1145]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 1141, bvar 1142]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 1141, bvar 1143]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 1141, bvar 1144]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 1141, bvar 1145]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 1142, bvar 1143]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 1142, bvar 1144]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 1142, bvar 1145]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 1143, bvar 1144]) (bveq ((.var 1614 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 1143, bvar 1145]) (bveq ((.var 1614 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 1144, bvar 1145]) (bveq ((.var 1615 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 1159, bvar 1160]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 1159, bvar 1161]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bands [bvar 1159, bvar 1162]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 1159, bvar 1163]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1159, bvar 1164]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 1159, bvar 1165]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 1159, bvar 1166]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 1159, bvar 1167]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 1159, bvar 1169]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 1159, bvar 1170]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 1159, bvar 1171]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1160, bvar 1161]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bands [bvar 1160, bvar 1162]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 1160, bvar 1163]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1160, bvar 1164]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 1160, bvar 1165]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 1160, bvar 1166]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 1160, bvar 1167]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 1160, bvar 1169]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 1160, bvar 1170]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 1160, bvar 1171]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1161, bvar 1162]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 1161, bvar 1163]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1595 : BVExpr 7))) ]

def reducedUnionChunk156 : BVLogicalExpr :=
  bands reducedUnionChunk156Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
