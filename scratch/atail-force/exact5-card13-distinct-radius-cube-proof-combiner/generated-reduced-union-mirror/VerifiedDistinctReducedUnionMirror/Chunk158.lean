import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk158Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 1174, bvar 1175]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
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
    bimplies (bands [bvar 1176, bvar 1181]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 1176, bvar 1183]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
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
    bimplies (bands [bvar 1186, bvar 1194]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1622 : BVExpr 7))) ]

def reducedUnionChunk158 : BVLogicalExpr :=
  bands reducedUnionChunk158Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
