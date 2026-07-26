import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk148Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 1164, bvar 1165]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 1164, bvar 1166]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 1164, bvar 1167]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 1164, bvar 1169]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 1164, bvar 1170]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 1164, bvar 1171]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1165, bvar 1166]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 1165, bvar 1167]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 1165, bvar 1169]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 1165, bvar 1170]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 1165, bvar 1171]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1166, bvar 1167]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 1166, bvar 1169]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 1166, bvar 1170]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 1166, bvar 1171]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1167, bvar 1169]) (bveq ((.var 1617 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 1167, bvar 1170]) (bveq ((.var 1617 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 1167, bvar 1171]) (bveq ((.var 1617 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1169, bvar 1170]) (bveq ((.var 1621 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 1169, bvar 1171]) (bveq ((.var 1621 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1170, bvar 1171]) (bveq ((.var 1622 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1172, bvar 1173]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 1172, bvar 1174]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bands [bvar 1172, bvar 1175]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 1172, bvar 1176]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1172, bvar 1177]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 1172, bvar 1178]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 1172, bvar 1179]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 1172, bvar 1180]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 1172, bvar 1181]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 1172, bvar 1183]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1172, bvar 1184]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1173, bvar 1174]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bands [bvar 1173, bvar 1175]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 1173, bvar 1176]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1173, bvar 1177]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 1173, bvar 1178]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 1173, bvar 1179]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 1173, bvar 1180]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 1173, bvar 1181]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 1173, bvar 1183]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1173, bvar 1184]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1174, bvar 1175]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 1174, bvar 1176]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1174, bvar 1177]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 1174, bvar 1178]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 1174, bvar 1179]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 1174, bvar 1180]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 1174, bvar 1181]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 1174, bvar 1183]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1174, bvar 1184]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1175, bvar 1176]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1175, bvar 1177]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 1175, bvar 1178]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 1175, bvar 1179]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 1175, bvar 1180]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 1175, bvar 1181]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 1175, bvar 1183]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1175, bvar 1184]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1176, bvar 1177]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 1176, bvar 1178]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 1176, bvar 1179]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 1176, bvar 1180]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 1176, bvar 1181]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1621 : BVExpr 7))) ]

def reducedUnionChunk148 : BVLogicalExpr :=
  bands reducedUnionChunk148Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
