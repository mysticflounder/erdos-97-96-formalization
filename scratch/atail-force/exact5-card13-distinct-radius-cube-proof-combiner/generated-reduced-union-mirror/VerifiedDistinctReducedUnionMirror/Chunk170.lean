import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk170Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 175, bvar 179]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 175, bvar 180]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 175, bvar 181]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 175, bvar 183]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 176, bvar 177]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 176, bvar 178]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 176, bvar 179]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 176, bvar 180]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 176, bvar 181]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 176, bvar 183]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 177, bvar 178]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 177, bvar 179]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 177, bvar 180]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 177, bvar 181]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 177, bvar 183]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 178, bvar 179]) (bveq ((.var 1615 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 178, bvar 180]) (bveq ((.var 1615 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 178, bvar 181]) (bveq ((.var 1615 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 178, bvar 183]) (bveq ((.var 1615 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 179, bvar 180]) (bveq ((.var 1619 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 179, bvar 181]) (bveq ((.var 1619 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 179, bvar 183]) (bveq ((.var 1619 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 180, bvar 181]) (bveq ((.var 1622 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 180, bvar 183]) (bveq ((.var 1622 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 181, bvar 183]) (bveq ((.var 1624 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 184, bvar 185]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 184, bvar 186]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bands [bvar 184, bvar 187]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 184, bvar 188]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 184, bvar 189]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 184, bvar 190]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 184, bvar 191]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 184, bvar 192]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 184, bvar 193]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 184, bvar 194]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 184, bvar 195]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 185, bvar 187]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 185, bvar 188]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 185, bvar 189]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 185, bvar 190]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 185, bvar 191]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 185, bvar 192]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 185, bvar 193]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 185, bvar 194]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 185, bvar 195]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 186, bvar 187]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 186, bvar 188]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 186, bvar 189]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 186, bvar 190]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 186, bvar 191]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 186, bvar 192]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 186, bvar 193]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 186, bvar 194]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 186, bvar 195]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 187, bvar 188]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 187, bvar 189]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 187, bvar 190]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 187, bvar 191]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 187, bvar 192]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 187, bvar 193]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 187, bvar 194]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 187, bvar 195]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 188, bvar 189]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 188, bvar 190]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1611 : BVExpr 7))) ]

def reducedUnionChunk170 : BVLogicalExpr :=
  bands reducedUnionChunk170Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
