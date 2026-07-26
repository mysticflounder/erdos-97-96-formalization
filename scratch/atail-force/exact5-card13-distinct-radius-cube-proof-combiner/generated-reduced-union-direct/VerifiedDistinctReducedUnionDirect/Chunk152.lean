import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk152Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 33, bvar 34]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bands [bvar 33, bvar 35]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bands [bvar 33, bvar 36]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bands [bvar 33, bvar 37]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bands [bvar 33, bvar 38]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 33, bvar 39]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 33, bvar 40]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 34, bvar 35]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bands [bvar 34, bvar 36]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bands [bvar 34, bvar 37]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bands [bvar 34, bvar 38]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 34, bvar 39]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 34, bvar 40]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 35, bvar 36]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bands [bvar 35, bvar 37]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bands [bvar 35, bvar 38]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 35, bvar 39]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 35, bvar 40]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 36, bvar 37]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bands [bvar 36, bvar 38]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 36, bvar 39]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 36, bvar 40]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 37, bvar 38]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 37, bvar 39]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 37, bvar 40]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 38, bvar 39]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 38, bvar 40]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 39, bvar 40]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 41, bvar 43]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1561 : BVExpr 7))),
    bimplies (bands [bvar 41, bvar 44]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bands [bvar 41, bvar 45]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bands [bvar 41, bvar 46]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bands [bvar 41, bvar 47]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bands [bvar 41, bvar 48]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 41, bvar 49]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 41, bvar 50]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 41, bvar 51]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 41, bvar 52]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 41, bvar 53]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 43, bvar 44]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bands [bvar 43, bvar 45]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bands [bvar 43, bvar 46]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bands [bvar 43, bvar 47]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bands [bvar 43, bvar 48]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 43, bvar 49]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 43, bvar 50]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 43, bvar 51]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 43, bvar 52]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 43, bvar 53]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 44, bvar 45]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bands [bvar 44, bvar 46]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bands [bvar 44, bvar 47]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bands [bvar 44, bvar 48]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 44, bvar 49]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 44, bvar 50]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 44, bvar 51]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 44, bvar 52]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 44, bvar 53]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 45, bvar 46]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bands [bvar 45, bvar 47]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bands [bvar 45, bvar 48]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 45, bvar 49]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 45, bvar 50]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 45, bvar 51]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1569 : BVExpr 7))) ]

def reducedUnionChunk152 : BVLogicalExpr :=
  bands reducedUnionChunk152Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
