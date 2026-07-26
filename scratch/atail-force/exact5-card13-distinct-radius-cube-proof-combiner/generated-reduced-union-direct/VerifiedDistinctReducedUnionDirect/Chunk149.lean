import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk149Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 1176, bvar 1183]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1176, bvar 1184]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1177, bvar 1178]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 1177, bvar 1179]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 1177, bvar 1180]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 1177, bvar 1181]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 1177, bvar 1183]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1177, bvar 1184]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1178, bvar 1179]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 1178, bvar 1180]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 1178, bvar 1181]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 1178, bvar 1183]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1178, bvar 1184]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1179, bvar 1180]) (bveq ((.var 1614 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 1179, bvar 1181]) (bveq ((.var 1614 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 1179, bvar 1183]) (bveq ((.var 1614 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1179, bvar 1184]) (bveq ((.var 1614 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1180, bvar 1181]) (bveq ((.var 1618 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 1180, bvar 1183]) (bveq ((.var 1618 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1180, bvar 1184]) (bveq ((.var 1618 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1181, bvar 1183]) (bveq ((.var 1621 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1181, bvar 1184]) (bveq ((.var 1621 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1183, bvar 1184]) (bveq ((.var 1624 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1185, bvar 1186]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 1185, bvar 1187]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bands [bvar 1185, bvar 1188]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 1185, bvar 1189]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1185, bvar 1190]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 1185, bvar 1191]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 1185, bvar 1192]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 1185, bvar 1193]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 1185, bvar 1194]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 1185, bvar 1195]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1185, bvar 1197]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1186, bvar 1187]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bands [bvar 1186, bvar 1188]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 1186, bvar 1189]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1186, bvar 1190]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 1186, bvar 1191]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 1186, bvar 1192]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 1186, bvar 1193]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 1186, bvar 1194]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 1186, bvar 1195]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1186, bvar 1197]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1187, bvar 1188]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 1187, bvar 1189]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1187, bvar 1190]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 1187, bvar 1191]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 1187, bvar 1192]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 1187, bvar 1193]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 1187, bvar 1194]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 1187, bvar 1195]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1187, bvar 1197]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1188, bvar 1189]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1188, bvar 1190]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 1188, bvar 1191]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 1188, bvar 1192]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 1188, bvar 1193]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 1188, bvar 1194]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 1188, bvar 1195]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1188, bvar 1197]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1189, bvar 1190]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 1189, bvar 1191]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 1189, bvar 1192]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1615 : BVExpr 7))) ]

def reducedUnionChunk149 : BVLogicalExpr :=
  bands reducedUnionChunk149Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
