import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk154Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 71, bvar 77]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 71, bvar 78]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 71, bvar 79]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 72, bvar 73]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 72, bvar 74]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 72, bvar 75]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 72, bvar 76]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 72, bvar 77]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 72, bvar 78]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 72, bvar 79]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 73, bvar 74]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 73, bvar 75]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 73, bvar 76]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 73, bvar 77]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 73, bvar 78]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 73, bvar 79]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 74, bvar 75]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 74, bvar 76]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 74, bvar 77]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 74, bvar 78]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 74, bvar 79]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 75, bvar 76]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 75, bvar 77]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 75, bvar 78]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 75, bvar 79]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 76, bvar 77]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 76, bvar 78]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 76, bvar 79]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 77, bvar 78]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 77, bvar 79]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 78, bvar 79]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 80, bvar 81]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bands [bvar 80, bvar 82]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bands [bvar 80, bvar 83]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 80, bvar 85]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 80, bvar 86]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 80, bvar 87]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 80, bvar 88]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 80, bvar 89]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 80, bvar 90]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 80, bvar 91]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 80, bvar 92]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 81, bvar 83]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 81, bvar 85]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 81, bvar 87]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 81, bvar 89]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 81, bvar 90]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 81, bvar 91]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 81, bvar 92]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 82, bvar 83]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 82, bvar 85]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 82, bvar 86]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 82, bvar 87]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 82, bvar 88]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 82, bvar 89]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 82, bvar 90]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 82, bvar 91]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 82, bvar 92]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 83, bvar 85]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 83, bvar 86]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 83, bvar 87]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 83, bvar 88]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 83, bvar 89]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 83, bvar 90]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1596 : BVExpr 7))) ]

def reducedUnionChunk154 : BVLogicalExpr :=
  bands reducedUnionChunk154Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
