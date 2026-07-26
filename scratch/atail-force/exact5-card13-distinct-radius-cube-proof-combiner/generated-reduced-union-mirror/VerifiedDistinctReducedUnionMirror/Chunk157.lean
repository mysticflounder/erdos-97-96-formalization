import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk157Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 1161, bvar 1164]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 1161, bvar 1165]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 1161, bvar 1166]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 1161, bvar 1167]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 1161, bvar 1169]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 1161, bvar 1170]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 1161, bvar 1171]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1162, bvar 1163]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1162, bvar 1164]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 1162, bvar 1165]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 1162, bvar 1166]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 1162, bvar 1167]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 1162, bvar 1169]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 1162, bvar 1170]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 1162, bvar 1171]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1163, bvar 1164]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 1163, bvar 1165]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 1163, bvar 1166]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 1163, bvar 1167]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 1163, bvar 1169]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 1163, bvar 1170]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 1163, bvar 1171]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1164, bvar 1165]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
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
    bimplies (bands [bvar 1173, bvar 1184]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1625 : BVExpr 7))) ]

def reducedUnionChunk157 : BVLogicalExpr :=
  bands reducedUnionChunk157Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
