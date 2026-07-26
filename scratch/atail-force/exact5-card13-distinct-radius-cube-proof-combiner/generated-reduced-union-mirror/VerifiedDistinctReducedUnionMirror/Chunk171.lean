import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk171Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 188, bvar 191]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 188, bvar 192]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 188, bvar 193]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 188, bvar 194]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 188, bvar 195]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 189, bvar 190]) (bveq ((.var 1605 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 189, bvar 191]) (bveq ((.var 1605 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 189, bvar 192]) (bveq ((.var 1605 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 189, bvar 193]) (bveq ((.var 1605 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 189, bvar 194]) (bveq ((.var 1605 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 189, bvar 195]) (bveq ((.var 1605 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 190, bvar 191]) (bveq ((.var 1611 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 190, bvar 192]) (bveq ((.var 1611 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 190, bvar 193]) (bveq ((.var 1611 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 190, bvar 194]) (bveq ((.var 1611 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 190, bvar 195]) (bveq ((.var 1611 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 191, bvar 192]) (bveq ((.var 1616 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 191, bvar 193]) (bveq ((.var 1616 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 191, bvar 194]) (bveq ((.var 1616 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 191, bvar 195]) (bveq ((.var 1616 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 192, bvar 193]) (bveq ((.var 1620 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 192, bvar 194]) (bveq ((.var 1620 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 192, bvar 195]) (bveq ((.var 1620 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 193, bvar 194]) (bveq ((.var 1623 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 193, bvar 195]) (bveq ((.var 1623 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 194, bvar 195]) (bveq ((.var 1625 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 536, bvar 537]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bands [bvar 536, bvar 538]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bands [bvar 536, bvar 539]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bands [bvar 536, bvar 540]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bands [bvar 536, bvar 541]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bands [bvar 536, bvar 542]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bands [bvar 536, bvar 543]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bands [bvar 536, bvar 544]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bands [bvar 536, bvar 545]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 536, bvar 546]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 536, bvar 547]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 537, bvar 539]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bands [bvar 537, bvar 540]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bands [bvar 537, bvar 541]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bands [bvar 537, bvar 542]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bands [bvar 537, bvar 543]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bands [bvar 537, bvar 544]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bands [bvar 537, bvar 545]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 537, bvar 546]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 537, bvar 547]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 538, bvar 539]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bands [bvar 538, bvar 540]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bands [bvar 538, bvar 541]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bands [bvar 538, bvar 542]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bands [bvar 538, bvar 543]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bands [bvar 538, bvar 544]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bands [bvar 538, bvar 545]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 538, bvar 546]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 538, bvar 547]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 539, bvar 540]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bands [bvar 539, bvar 541]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bands [bvar 539, bvar 542]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bands [bvar 539, bvar 543]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bands [bvar 539, bvar 544]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bands [bvar 539, bvar 545]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 539, bvar 546]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 539, bvar 547]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 540, bvar 541]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1554 : BVExpr 7))) ]

def reducedUnionChunk171 : BVLogicalExpr :=
  bands reducedUnionChunk171Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
