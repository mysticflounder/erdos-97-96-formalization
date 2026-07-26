import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk163Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 69, bvar 76]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 69, bvar 77]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 69, bvar 78]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 69, bvar 79]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 71, bvar 72]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 71, bvar 73]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 71, bvar 74]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 71, bvar 75]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 71, bvar 76]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 71, bvar 77]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
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
    bimplies (bands [bvar 93, bvar 94]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 95]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 96]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 97]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 99]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 100]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 101]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 102]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 103]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 104]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 105]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 94, bvar 96]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 94, bvar 97]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 94, bvar 99]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 94, bvar 100]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 94, bvar 101]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 94, bvar 102]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 94, bvar 103]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 94, bvar 104]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 94, bvar 105]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 95, bvar 96]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 95, bvar 97]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 95, bvar 99]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 95, bvar 100]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1600 : BVExpr 7))) ]

def reducedUnionChunk163 : BVLogicalExpr :=
  bands reducedUnionChunk163Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
