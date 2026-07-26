import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk174Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 692, bvar 697]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 692, bvar 698]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 692, bvar 699]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 692, bvar 700]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 692, bvar 701]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 692, bvar 702]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 693, bvar 695]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 693, bvar 696]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 693, bvar 697]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 693, bvar 698]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 693, bvar 699]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 693, bvar 700]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 693, bvar 701]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 693, bvar 702]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 694, bvar 695]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 694, bvar 696]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 694, bvar 697]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 694, bvar 698]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 694, bvar 699]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 694, bvar 700]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 694, bvar 701]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 694, bvar 702]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 695, bvar 696]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 695, bvar 697]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 695, bvar 698]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 695, bvar 699]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 695, bvar 700]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 695, bvar 701]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 695, bvar 702]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 696, bvar 697]) (bveq ((.var 1605 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 696, bvar 698]) (bveq ((.var 1605 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 696, bvar 699]) (bveq ((.var 1605 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 696, bvar 700]) (bveq ((.var 1605 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 696, bvar 701]) (bveq ((.var 1605 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 696, bvar 702]) (bveq ((.var 1605 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 697, bvar 698]) (bveq ((.var 1611 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 697, bvar 699]) (bveq ((.var 1611 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 697, bvar 700]) (bveq ((.var 1611 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 697, bvar 701]) (bveq ((.var 1611 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 697, bvar 702]) (bveq ((.var 1611 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 698, bvar 699]) (bveq ((.var 1616 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 698, bvar 700]) (bveq ((.var 1616 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 698, bvar 701]) (bveq ((.var 1616 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 698, bvar 702]) (bveq ((.var 1616 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 699, bvar 700]) (bveq ((.var 1620 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 699, bvar 701]) (bveq ((.var 1620 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 699, bvar 702]) (bveq ((.var 1620 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 700, bvar 701]) (bveq ((.var 1623 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 700, bvar 702]) (bveq ((.var 1623 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 701, bvar 702]) (bveq ((.var 1625 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 0, bvar 1]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bands [bvar 0, bvar 2]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bands [bvar 0, bvar 3]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 0, bvar 5]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 0, bvar 6]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 0, bvar 7]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 0, bvar 8]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 0, bvar 9]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 0, bvar 10]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 0, bvar 11]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 0, bvar 12]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1, bvar 2]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bands [bvar 1, bvar 3]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 1, bvar 5]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1591 : BVExpr 7))) ]

def reducedUnionChunk174 : BVLogicalExpr :=
  bands reducedUnionChunk174Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
