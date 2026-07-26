import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk150Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 1189, bvar 1193]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 1189, bvar 1194]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 1189, bvar 1195]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1189, bvar 1197]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1190, bvar 1191]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 1190, bvar 1192]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 1190, bvar 1193]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 1190, bvar 1194]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 1190, bvar 1195]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1190, bvar 1197]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1191, bvar 1192]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 1191, bvar 1193]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 1191, bvar 1194]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 1191, bvar 1195]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1191, bvar 1197]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1192, bvar 1193]) (bveq ((.var 1615 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 1192, bvar 1194]) (bveq ((.var 1615 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 1192, bvar 1195]) (bveq ((.var 1615 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1192, bvar 1197]) (bveq ((.var 1615 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1193, bvar 1194]) (bveq ((.var 1619 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 1193, bvar 1195]) (bveq ((.var 1619 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1193, bvar 1197]) (bveq ((.var 1619 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1194, bvar 1195]) (bveq ((.var 1622 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 1194, bvar 1197]) (bveq ((.var 1622 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1195, bvar 1197]) (bveq ((.var 1624 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1198, bvar 1199]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 1198, bvar 1200]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bands [bvar 1198, bvar 1201]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 1198, bvar 1202]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1198, bvar 1203]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 1198, bvar 1204]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1198, bvar 1205]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 1198, bvar 1206]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 1198, bvar 1207]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1198, bvar 1208]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1198, bvar 1209]) (bveq ((.var 1560 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1199, bvar 1200]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bands [bvar 1199, bvar 1201]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 1199, bvar 1202]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1199, bvar 1203]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 1199, bvar 1204]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1199, bvar 1205]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 1199, bvar 1206]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 1199, bvar 1207]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1199, bvar 1208]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1199, bvar 1209]) (bveq ((.var 1571 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1200, bvar 1201]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 1200, bvar 1202]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1200, bvar 1203]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 1200, bvar 1204]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1200, bvar 1205]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 1200, bvar 1206]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 1200, bvar 1207]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1200, bvar 1208]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1200, bvar 1209]) (bveq ((.var 1581 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1201, bvar 1202]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1201, bvar 1203]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 1201, bvar 1204]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1201, bvar 1205]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 1201, bvar 1206]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 1201, bvar 1207]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1201, bvar 1208]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1201, bvar 1209]) (bveq ((.var 1590 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1202, bvar 1203]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1605 : BVExpr 7))) ]

def reducedUnionChunk150 : BVLogicalExpr :=
  bands reducedUnionChunk150Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
