import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk158Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 122, bvar 131]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 123, bvar 124]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 123, bvar 125]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 123, bvar 127]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 123, bvar 128]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 123, bvar 129]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 123, bvar 130]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 123, bvar 131]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 124, bvar 125]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 124, bvar 127]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 124, bvar 128]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 124, bvar 129]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 124, bvar 130]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 124, bvar 131]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 125, bvar 127]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 125, bvar 128]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 125, bvar 129]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 125, bvar 130]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 125, bvar 131]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 127, bvar 128]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 127, bvar 129]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 127, bvar 130]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 127, bvar 131]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 128, bvar 129]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 128, bvar 130]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 128, bvar 131]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 129, bvar 130]) (bveq ((.var 1614 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 129, bvar 131]) (bveq ((.var 1614 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 130, bvar 131]) (bveq ((.var 1615 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 132, bvar 135]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 132, bvar 136]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 132, bvar 137]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 132, bvar 138]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 132, bvar 139]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 132, bvar 141]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 132, bvar 142]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 132, bvar 143]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 132, bvar 144]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 133, bvar 138]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 133, bvar 139]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 134, bvar 138]) (bveq ((.var 1577 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 134, bvar 139]) (bveq ((.var 1577 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 135, bvar 136]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 135, bvar 138]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 135, bvar 139]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 135, bvar 141]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 135, bvar 142]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 135, bvar 143]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 135, bvar 144]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 136, bvar 138]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 136, bvar 139]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 136, bvar 141]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 136, bvar 142]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 136, bvar 143]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 136, bvar 144]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 137, bvar 141]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 137, bvar 142]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 137, bvar 143]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 137, bvar 144]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 138, bvar 139]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 138, bvar 141]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 138, bvar 142]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 138, bvar 143]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 138, bvar 144]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1620 : BVExpr 7))) ]

def reducedUnionChunk158 : BVLogicalExpr :=
  bands reducedUnionChunk158Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
