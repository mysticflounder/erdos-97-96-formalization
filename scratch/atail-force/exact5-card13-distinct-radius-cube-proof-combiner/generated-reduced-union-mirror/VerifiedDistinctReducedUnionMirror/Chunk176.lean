import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk176Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 608, bvar 610]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 608, bvar 611]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 608, bvar 612]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 609, bvar 610]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 609, bvar 611]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 609, bvar 612]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 610, bvar 611]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 610, bvar 612]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 611, bvar 612]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 613, bvar 614]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bands [bvar 613, bvar 615]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bands [bvar 613, bvar 616]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 613, bvar 617]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
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
    bimplies (bands [bvar 620, bvar 625]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1611 : BVExpr 7))) ]

def reducedUnionChunk176 : BVLogicalExpr :=
  bands reducedUnionChunk176Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
