import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk173Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 679, bvar 685]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 679, bvar 686]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 679, bvar 687]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 679, bvar 688]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 679, bvar 690]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 680, bvar 682]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 680, bvar 683]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 680, bvar 684]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 680, bvar 685]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 680, bvar 686]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 680, bvar 687]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 680, bvar 688]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 680, bvar 690]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 681, bvar 682]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 681, bvar 683]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 681, bvar 684]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 681, bvar 685]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 681, bvar 686]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 681, bvar 687]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 681, bvar 688]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 681, bvar 690]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 682, bvar 683]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 682, bvar 684]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 682, bvar 685]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 682, bvar 686]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 682, bvar 687]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 682, bvar 688]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 682, bvar 690]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 683, bvar 684]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 683, bvar 685]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 683, bvar 686]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 683, bvar 687]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 683, bvar 688]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 683, bvar 690]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 684, bvar 685]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 684, bvar 686]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 684, bvar 687]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 684, bvar 688]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 684, bvar 690]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 685, bvar 686]) (bveq ((.var 1615 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 685, bvar 687]) (bveq ((.var 1615 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 685, bvar 688]) (bveq ((.var 1615 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 685, bvar 690]) (bveq ((.var 1615 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 686, bvar 687]) (bveq ((.var 1619 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 686, bvar 688]) (bveq ((.var 1619 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 686, bvar 690]) (bveq ((.var 1619 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 687, bvar 688]) (bveq ((.var 1622 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 687, bvar 690]) (bveq ((.var 1622 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 688, bvar 690]) (bveq ((.var 1624 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 691, bvar 692]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 691, bvar 693]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bands [bvar 691, bvar 694]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 691, bvar 695]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 691, bvar 696]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 691, bvar 697]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 691, bvar 698]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 691, bvar 699]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 691, bvar 700]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 691, bvar 701]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 691, bvar 702]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 692, bvar 693]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bands [bvar 692, bvar 694]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 692, bvar 695]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 692, bvar 696]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1605 : BVExpr 7))) ]

def reducedUnionChunk173 : BVLogicalExpr :=
  bands reducedUnionChunk173Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
