import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk164Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 542, bvar 544]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bands [bvar 542, bvar 545]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 542, bvar 546]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 542, bvar 547]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 543, bvar 544]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bands [bvar 543, bvar 545]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 543, bvar 546]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 543, bvar 547]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 544, bvar 545]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 544, bvar 546]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 544, bvar 547]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 545, bvar 546]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 545, bvar 547]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 546, bvar 547]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 548, bvar 550]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1561 : BVExpr 7))),
    bimplies (bands [bvar 548, bvar 551]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bands [bvar 548, bvar 552]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bands [bvar 548, bvar 553]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bands [bvar 548, bvar 554]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bands [bvar 548, bvar 555]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 548, bvar 556]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 548, bvar 557]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 548, bvar 558]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 548, bvar 559]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 548, bvar 560]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 550, bvar 552]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bands [bvar 550, bvar 553]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bands [bvar 550, bvar 554]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bands [bvar 550, bvar 555]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 550, bvar 556]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 550, bvar 557]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 550, bvar 558]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 550, bvar 559]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 550, bvar 560]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 551, bvar 552]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bands [bvar 551, bvar 553]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bands [bvar 551, bvar 555]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 551, bvar 556]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 551, bvar 557]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 551, bvar 558]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 551, bvar 559]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 551, bvar 560]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 552, bvar 553]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bands [bvar 552, bvar 554]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bands [bvar 552, bvar 555]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 552, bvar 556]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 552, bvar 557]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 552, bvar 558]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 552, bvar 559]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 552, bvar 560]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 553, bvar 554]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bands [bvar 553, bvar 555]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 553, bvar 556]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 553, bvar 557]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 553, bvar 558]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 553, bvar 559]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 553, bvar 560]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 554, bvar 555]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 554, bvar 556]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 554, bvar 557]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 554, bvar 558]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 554, bvar 559]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 554, bvar 560]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 555, bvar 556]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1567 : BVExpr 7))) ]

def reducedUnionChunk164 : BVLogicalExpr :=
  bands reducedUnionChunk164Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
