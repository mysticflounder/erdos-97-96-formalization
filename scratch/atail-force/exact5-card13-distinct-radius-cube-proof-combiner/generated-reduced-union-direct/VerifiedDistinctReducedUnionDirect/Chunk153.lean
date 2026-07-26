import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk153Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 45, bvar 52]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 45, bvar 53]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 46, bvar 47]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bands [bvar 46, bvar 48]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 46, bvar 49]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 46, bvar 50]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 46, bvar 51]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 46, bvar 52]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 46, bvar 53]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 47, bvar 48]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 47, bvar 49]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 47, bvar 50]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 47, bvar 51]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 47, bvar 52]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 47, bvar 53]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 48, bvar 49]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 48, bvar 50]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 48, bvar 51]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 48, bvar 52]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 48, bvar 53]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 49, bvar 50]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 49, bvar 51]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 49, bvar 52]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 49, bvar 53]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 50, bvar 51]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 50, bvar 52]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 50, bvar 53]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 51, bvar 52]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 51, bvar 53]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 52, bvar 53]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 67, bvar 68]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bands [bvar 67, bvar 69]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1572 : BVExpr 7))),
    bimplies (bands [bvar 67, bvar 71]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 67, bvar 72]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 67, bvar 73]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 67, bvar 74]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 67, bvar 75]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 67, bvar 76]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 67, bvar 77]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 67, bvar 78]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 67, bvar 79]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 68, bvar 71]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 68, bvar 72]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 68, bvar 73]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 68, bvar 74]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 68, bvar 75]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 68, bvar 76]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 68, bvar 77]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 68, bvar 78]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 68, bvar 79]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 69, bvar 71]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 69, bvar 72]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 69, bvar 73]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 69, bvar 74]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 69, bvar 75]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 69, bvar 76]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 69, bvar 77]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 69, bvar 78]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 69, bvar 79]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 71, bvar 72]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 71, bvar 73]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 71, bvar 74]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 71, bvar 75]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 71, bvar 76]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1587 : BVExpr 7))) ]

def reducedUnionChunk153 : BVLogicalExpr :=
  bands reducedUnionChunk153Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
