import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk168Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 613, bvar 617]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 613, bvar 618]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 613, bvar 620]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 613, bvar 621]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 613, bvar 622]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 613, bvar 623]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 613, bvar 624]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 613, bvar 625]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 614, bvar 615]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bands [bvar 614, bvar 616]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 614, bvar 617]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 614, bvar 618]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 614, bvar 620]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 614, bvar 621]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 614, bvar 622]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 614, bvar 623]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 614, bvar 624]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 614, bvar 625]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 615, bvar 617]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 615, bvar 618]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 615, bvar 620]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 615, bvar 621]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 615, bvar 622]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 615, bvar 623]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 615, bvar 624]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 615, bvar 625]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 616, bvar 617]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 616, bvar 618]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 616, bvar 620]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 616, bvar 621]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 616, bvar 622]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 616, bvar 623]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 616, bvar 624]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 616, bvar 625]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 617, bvar 618]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 617, bvar 620]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 617, bvar 621]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 617, bvar 622]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 617, bvar 623]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 617, bvar 624]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 617, bvar 625]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 618, bvar 620]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 618, bvar 621]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 618, bvar 622]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 618, bvar 623]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 618, bvar 624]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 618, bvar 625]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 620, bvar 621]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 620, bvar 622]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 620, bvar 623]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 620, bvar 624]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 620, bvar 625]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 621, bvar 622]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 621, bvar 623]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 621, bvar 624]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 621, bvar 625]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 622, bvar 623]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 622, bvar 624]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 622, bvar 625]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 623, bvar 624]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 623, bvar 625]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 624, bvar 625]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 626, bvar 627]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 626, bvar 628]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1576 : BVExpr 7))) ]

def reducedUnionChunk168 : BVLogicalExpr :=
  bands reducedUnionChunk168Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
