import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk189Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bors [bveq ((.var 13 : BVExpr 4)) ((.const 2#4)), bveq ((.var 14 : BVExpr 4)) ((.const 2#4)), bveq ((.var 15 : BVExpr 4)) ((.const 2#4)), bveq ((.var 16 : BVExpr 4)) ((.const 2#4)), bveq ((.var 17 : BVExpr 4)) ((.const 2#4)), bveq ((.var 18 : BVExpr 4)) ((.const 2#4)), bveq ((.var 19 : BVExpr 4)) ((.const 2#4)), bveq ((.var 20 : BVExpr 4)) ((.const 2#4)), bveq ((.var 21 : BVExpr 4)) ((.const 2#4)), bveq ((.var 22 : BVExpr 4)) ((.const 2#4)), bveq ((.var 23 : BVExpr 4)) ((.const 2#4)), bveq ((.var 24 : BVExpr 4)) ((.const 2#4)), bveq ((.var 25 : BVExpr 4)) ((.const 2#4))], bnot (bands [bvar 1071, bvar 1076, bvar 1077, bvar 1080])]) (bnot (bands [bveq ((.var 1572 : BVExpr 7)) ((.var 1577 : BVExpr 7)), bveq ((.var 1572 : BVExpr 7)) ((.var 1578 : BVExpr 7)), bveq ((.var 1572 : BVExpr 7)) ((.var 1581 : BVExpr 7))])),
    bimplies (bands [bors [bveq ((.var 13 : BVExpr 4)) ((.const 2#4)), bveq ((.var 14 : BVExpr 4)) ((.const 2#4)), bveq ((.var 15 : BVExpr 4)) ((.const 2#4)), bveq ((.var 16 : BVExpr 4)) ((.const 2#4)), bveq ((.var 17 : BVExpr 4)) ((.const 2#4)), bveq ((.var 18 : BVExpr 4)) ((.const 2#4)), bveq ((.var 19 : BVExpr 4)) ((.const 2#4)), bveq ((.var 20 : BVExpr 4)) ((.const 2#4)), bveq ((.var 21 : BVExpr 4)) ((.const 2#4)), bveq ((.var 22 : BVExpr 4)) ((.const 2#4)), bveq ((.var 23 : BVExpr 4)) ((.const 2#4)), bveq ((.var 24 : BVExpr 4)) ((.const 2#4)), bveq ((.var 25 : BVExpr 4)) ((.const 2#4))], bnot (bands [bvar 1071, bvar 1076, bvar 1078, bvar 1079])]) (bnot (bands [bveq ((.var 1572 : BVExpr 7)) ((.var 1577 : BVExpr 7)), bveq ((.var 1572 : BVExpr 7)) ((.var 1579 : BVExpr 7)), bveq ((.var 1572 : BVExpr 7)) ((.var 1580 : BVExpr 7))])),
    bimplies (bands [bors [bveq ((.var 13 : BVExpr 4)) ((.const 2#4)), bveq ((.var 14 : BVExpr 4)) ((.const 2#4)), bveq ((.var 15 : BVExpr 4)) ((.const 2#4)), bveq ((.var 16 : BVExpr 4)) ((.const 2#4)), bveq ((.var 17 : BVExpr 4)) ((.const 2#4)), bveq ((.var 18 : BVExpr 4)) ((.const 2#4)), bveq ((.var 19 : BVExpr 4)) ((.const 2#4)), bveq ((.var 20 : BVExpr 4)) ((.const 2#4)), bveq ((.var 21 : BVExpr 4)) ((.const 2#4)), bveq ((.var 22 : BVExpr 4)) ((.const 2#4)), bveq ((.var 23 : BVExpr 4)) ((.const 2#4)), bveq ((.var 24 : BVExpr 4)) ((.const 2#4)), bveq ((.var 25 : BVExpr 4)) ((.const 2#4))], bnot (bands [bvar 1071, bvar 1076, bvar 1078, bvar 1080])]) (bnot (bands [bveq ((.var 1572 : BVExpr 7)) ((.var 1577 : BVExpr 7)), bveq ((.var 1572 : BVExpr 7)) ((.var 1579 : BVExpr 7)), bveq ((.var 1572 : BVExpr 7)) ((.var 1581 : BVExpr 7))])),
    bimplies (bands [bors [bveq ((.var 13 : BVExpr 4)) ((.const 2#4)), bveq ((.var 14 : BVExpr 4)) ((.const 2#4)), bveq ((.var 15 : BVExpr 4)) ((.const 2#4)), bveq ((.var 16 : BVExpr 4)) ((.const 2#4)), bveq ((.var 17 : BVExpr 4)) ((.const 2#4)), bveq ((.var 18 : BVExpr 4)) ((.const 2#4)), bveq ((.var 19 : BVExpr 4)) ((.const 2#4)), bveq ((.var 20 : BVExpr 4)) ((.const 2#4)), bveq ((.var 21 : BVExpr 4)) ((.const 2#4)), bveq ((.var 22 : BVExpr 4)) ((.const 2#4)), bveq ((.var 23 : BVExpr 4)) ((.const 2#4)), bveq ((.var 24 : BVExpr 4)) ((.const 2#4)), bveq ((.var 25 : BVExpr 4)) ((.const 2#4))], bnot (bands [bvar 1071, bvar 1076, bvar 1079, bvar 1080])]) (bnot (bands [bveq ((.var 1572 : BVExpr 7)) ((.var 1577 : BVExpr 7)), bveq ((.var 1572 : BVExpr 7)) ((.var 1580 : BVExpr 7)), bveq ((.var 1572 : BVExpr 7)) ((.var 1581 : BVExpr 7))])),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1576 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1571 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1571 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1571 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1551 : BVExpr 7))) ]

def reducedUnionChunk189 : BVLogicalExpr :=
  bands reducedUnionChunk189Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
