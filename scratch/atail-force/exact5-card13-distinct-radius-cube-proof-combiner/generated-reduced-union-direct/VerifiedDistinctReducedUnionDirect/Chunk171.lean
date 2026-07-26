import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk171Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 653, bvar 662]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 653, bvar 663]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 653, bvar 664]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 654, bvar 656]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 654, bvar 657]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 654, bvar 658]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 654, bvar 659]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 654, bvar 660]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 654, bvar 662]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 654, bvar 663]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 654, bvar 664]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 655, bvar 656]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 655, bvar 657]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 655, bvar 658]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 655, bvar 659]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 655, bvar 660]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 655, bvar 662]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 655, bvar 663]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 655, bvar 664]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 656, bvar 657]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 656, bvar 658]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 656, bvar 659]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 656, bvar 660]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 656, bvar 662]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 656, bvar 663]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 656, bvar 664]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 657, bvar 658]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 657, bvar 659]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 657, bvar 660]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 657, bvar 662]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 657, bvar 663]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 657, bvar 664]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 658, bvar 659]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 658, bvar 660]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 658, bvar 662]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 658, bvar 663]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 658, bvar 664]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 659, bvar 660]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 659, bvar 662]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 659, bvar 663]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 659, bvar 664]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 660, bvar 662]) (bveq ((.var 1617 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 660, bvar 663]) (bveq ((.var 1617 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 660, bvar 664]) (bveq ((.var 1617 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 662, bvar 663]) (bveq ((.var 1621 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 662, bvar 664]) (bveq ((.var 1621 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 663, bvar 664]) (bveq ((.var 1622 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 665, bvar 666]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 665, bvar 667]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bands [bvar 665, bvar 668]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 665, bvar 669]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 665, bvar 670]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 665, bvar 671]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 665, bvar 672]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 665, bvar 673]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 665, bvar 674]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 665, bvar 676]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 665, bvar 677]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 666, bvar 667]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bands [bvar 666, bvar 668]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 666, bvar 669]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 666, bvar 670]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 666, bvar 671]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 666, bvar 672]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1614 : BVExpr 7))) ]

def reducedUnionChunk171 : BVLogicalExpr :=
  bands reducedUnionChunk171Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
