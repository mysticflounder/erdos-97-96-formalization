import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk173Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 553, bvar 556]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
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
    bimplies (bands [bvar 555, bvar 556]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 555, bvar 557]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 555, bvar 558]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 555, bvar 559]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 555, bvar 560]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 556, bvar 557]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 556, bvar 558]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 556, bvar 559]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 556, bvar 560]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 557, bvar 558]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 557, bvar 559]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 557, bvar 560]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 558, bvar 559]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 558, bvar 560]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 559, bvar 560]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 562, bvar 566]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bands [bvar 562, bvar 567]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bands [bvar 562, bvar 568]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bands [bvar 562, bvar 569]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bands [bvar 562, bvar 570]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bands [bvar 562, bvar 571]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bands [bvar 562, bvar 572]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bands [bvar 562, bvar 573]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bands [bvar 564, bvar 566]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bands [bvar 564, bvar 567]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bands [bvar 564, bvar 568]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bands [bvar 564, bvar 569]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bands [bvar 564, bvar 570]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bands [bvar 564, bvar 571]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bands [bvar 564, bvar 572]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bands [bvar 564, bvar 573]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bands [bvar 566, bvar 567]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bands [bvar 566, bvar 568]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bands [bvar 566, bvar 569]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bands [bvar 566, bvar 570]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bands [bvar 566, bvar 571]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bands [bvar 566, bvar 572]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bands [bvar 566, bvar 573]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bands [bvar 567, bvar 568]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bands [bvar 567, bvar 569]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bands [bvar 567, bvar 570]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bands [bvar 567, bvar 571]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bands [bvar 567, bvar 572]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bands [bvar 567, bvar 573]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bands [bvar 568, bvar 569]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bands [bvar 568, bvar 570]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bands [bvar 568, bvar 571]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bands [bvar 568, bvar 572]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bands [bvar 568, bvar 573]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bands [bvar 569, bvar 570]) (bveq ((.var 1577 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bands [bvar 569, bvar 571]) (bveq ((.var 1577 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bands [bvar 569, bvar 572]) (bveq ((.var 1577 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bands [bvar 569, bvar 573]) (bveq ((.var 1577 : BVExpr 7)) ((.var 1581 : BVExpr 7))) ]

def reducedUnionChunk173 : BVLogicalExpr :=
  bands reducedUnionChunk173Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
