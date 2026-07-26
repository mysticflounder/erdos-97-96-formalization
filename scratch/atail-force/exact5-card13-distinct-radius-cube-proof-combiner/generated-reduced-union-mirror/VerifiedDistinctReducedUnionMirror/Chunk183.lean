import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk183Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 0, bvar 11]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 0, bvar 12]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1, bvar 2]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bands [bvar 1, bvar 3]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 1, bvar 5]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 1, bvar 6]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 1, bvar 7]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 1, bvar 8]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 1, bvar 9]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1, bvar 10]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1, bvar 11]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1, bvar 12]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 2, bvar 3]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 2, bvar 5]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 2, bvar 6]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 2, bvar 7]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 2, bvar 8]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 2, bvar 9]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 2, bvar 10]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 2, bvar 11]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 2, bvar 12]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 3, bvar 5]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 3, bvar 6]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 3, bvar 7]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 3, bvar 8]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 3, bvar 9]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 3, bvar 10]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 3, bvar 11]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 3, bvar 12]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 5, bvar 6]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 5, bvar 7]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 5, bvar 8]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 5, bvar 9]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 5, bvar 10]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 5, bvar 11]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 5, bvar 12]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 6, bvar 7]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 6, bvar 8]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 6, bvar 9]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 6, bvar 10]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 6, bvar 11]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 6, bvar 12]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 7, bvar 8]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 7, bvar 9]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 7, bvar 10]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 7, bvar 11]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 7, bvar 12]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 8, bvar 9]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 8, bvar 10]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 8, bvar 11]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 8, bvar 12]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 9, bvar 10]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 9, bvar 11]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 9, bvar 12]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 10, bvar 11]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 10, bvar 12]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 11, bvar 12]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1653, bvar 1654]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 1653, bvar 1655]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bands [bvar 1653, bvar 1656]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 1653, bvar 1657]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 1653, bvar 1658]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 1653, bvar 1659]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 1653, bvar 1660]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1612 : BVExpr 7))) ]

def reducedUnionChunk183 : BVLogicalExpr :=
  bands reducedUnionChunk183Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
