import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk177Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 621, bvar 622]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
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
    bimplies (bands [bvar 626, bvar 628]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bands [bvar 626, bvar 629]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 626, bvar 630]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 626, bvar 631]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 626, bvar 632]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 626, bvar 634]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 626, bvar 635]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 626, bvar 636]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 626, bvar 637]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 626, bvar 638]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 627, bvar 628]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bands [bvar 627, bvar 629]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 627, bvar 630]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 627, bvar 631]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 627, bvar 632]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 627, bvar 634]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 627, bvar 635]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 627, bvar 636]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 627, bvar 637]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 627, bvar 638]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 628, bvar 630]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 628, bvar 631]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 628, bvar 632]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 628, bvar 634]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 628, bvar 635]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 628, bvar 636]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 628, bvar 637]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 628, bvar 638]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 629, bvar 630]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 629, bvar 631]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 629, bvar 632]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 629, bvar 634]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 629, bvar 635]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 629, bvar 636]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 629, bvar 637]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 629, bvar 638]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 630, bvar 631]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 630, bvar 632]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 630, bvar 634]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 630, bvar 635]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 630, bvar 636]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 630, bvar 637]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 630, bvar 638]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 631, bvar 632]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 631, bvar 634]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 631, bvar 635]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 631, bvar 636]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 631, bvar 637]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 631, bvar 638]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 632, bvar 634]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 632, bvar 635]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 632, bvar 636]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 632, bvar 637]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1615 : BVExpr 7))) ]

def reducedUnionChunk177 : BVLogicalExpr :=
  bands reducedUnionChunk177Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
