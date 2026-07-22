/-
Generated packed-source bridge for verified right chunk 025.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk025_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1600 : (!((rowBit rows 1 8 3 && rowBit rows 1 8 10 && rowBit rows 2 9 3 && rowBit rows 2 9 10))) = true)
    (h1601 : (!((rowBit rows 1 8 3 && rowBit rows 1 8 12 && rowBit rows 2 9 3 && rowBit rows 2 9 12))) = true)
    (h1602 : (!((rowBit rows 1 8 4 && rowBit rows 1 8 10 && rowBit rows 2 9 4 && rowBit rows 2 9 10))) = true)
    (h1603 : (!((rowBit rows 1 8 4 && rowBit rows 1 8 11 && rowBit rows 2 9 4 && rowBit rows 2 9 11))) = true)
    (h1604 : (!((rowBit rows 1 8 4 && rowBit rows 1 8 12 && rowBit rows 2 9 4 && rowBit rows 2 9 12))) = true)
    (h1605 : (!((rowBit rows 1 8 5 && rowBit rows 1 8 10 && rowBit rows 2 9 5 && rowBit rows 2 9 10))) = true)
    (h1606 : (!((rowBit rows 1 8 6 && rowBit rows 1 8 10 && rowBit rows 2 9 6 && rowBit rows 2 9 10))) = true)
    (h1607 : (!((rowBit rows 1 8 7 && rowBit rows 1 8 10 && rowBit rows 2 9 7 && rowBit rows 2 9 10))) = true)
    (h1608 : (!((rowBit rows 1 8 7 && rowBit rows 1 8 11 && rowBit rows 2 9 7 && rowBit rows 2 9 11))) = true)
    (h1609 : (!((rowBit rows 1 8 7 && rowBit rows 1 8 12 && rowBit rows 2 9 7 && rowBit rows 2 9 12))) = true)
    (h1610 : (!((rowBit rows 1 9 0 && rowBit rows 1 9 8 && rowBit rows 2 11 0 && rowBit rows 2 11 8))) = true)
    (h1611 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 8 && rowBit rows 1 11 0 && rowBit rows 1 11 8))) = true)
    (h1612 : (!((rowBit rows 1 10 2 && rowBit rows 1 10 9 && rowBit rows 2 11 2 && rowBit rows 2 11 9))) = true)
    (h1613 : (!((rowBit rows 2 10 2 && rowBit rows 2 10 9 && rowBit rows 1 11 2 && rowBit rows 1 11 9))) = true)
    (h1614 : (!((rowBit rows 1 10 2 && rowBit rows 1 10 9 && rowBit rows 2 12 2 && rowBit rows 2 12 9))) = true)
    (h1615 : (!((rowBit rows 2 10 2 && rowBit rows 2 10 9 && rowBit rows 1 12 2 && rowBit rows 1 12 9))) = true)
    (h1616 : (!((rowBit rows 1 11 2 && rowBit rows 1 11 9 && rowBit rows 2 12 2 && rowBit rows 2 12 9))) = true)
    (h1617 : (!((rowBit rows 2 11 2 && rowBit rows 2 11 9 && rowBit rows 1 12 2 && rowBit rows 1 12 9))) = true)
    (h1618 : (!((rowBit rows 2 4 10 && rowBit rows 2 4 12 && rowBit rows 1 5 10 && rowBit rows 1 5 12))) = true)
    (h1619 : (!((rowBit rows 1 8 3 && rowBit rows 1 8 4 && rowBit rows 2 9 3 && rowBit rows 2 9 4))) = true)
    (h1620 : (!((rowBit rows 1 8 3 && rowBit rows 1 8 7 && rowBit rows 2 9 3 && rowBit rows 2 9 7))) = true)
    (h1621 : (!((firstRowBit b1 5 && firstRowBit b1 10 && rowBit rows 0 0 5 && rowBit rows 0 0 10))) = true)
    (h1622 : (!((firstRowBit b1 0 && firstRowBit b1 5 && rowBit rows 0 1 0 && rowBit rows 0 1 5))) = true)
    (h1623 : (!((firstRowBit b1 0 && firstRowBit b1 6 && rowBit rows 0 1 0 && rowBit rows 0 1 6))) = true)
    (h1624 : (!((firstRowBit b1 0 && firstRowBit b1 7 && rowBit rows 0 1 0 && rowBit rows 0 1 7))) = true)
    (h1625 : (!((firstRowBit b1 0 && firstRowBit b1 8 && rowBit rows 0 1 0 && rowBit rows 0 1 8))) = true)
    (h1626 : (!((firstRowBit b1 0 && firstRowBit b1 9 && rowBit rows 0 1 0 && rowBit rows 0 1 9))) = true)
    (h1627 : (!((firstRowBit b1 0 && firstRowBit b1 10 && rowBit rows 0 1 0 && rowBit rows 0 1 10))) = true)
    (h1628 : (!((firstRowBit b1 0 && firstRowBit b1 11 && rowBit rows 0 1 0 && rowBit rows 0 1 11))) = true)
    (h1629 : (!((firstRowBit b1 0 && firstRowBit b1 12 && rowBit rows 0 1 0 && rowBit rows 0 1 12))) = true)
    (h1630 : (!((firstRowBit b1 5 && firstRowBit b1 11 && rowBit rows 0 1 5 && rowBit rows 0 1 11))) = true)
    (h1631 : (!((firstRowBit b1 7 && firstRowBit b1 11 && rowBit rows 0 1 7 && rowBit rows 0 1 11))) = true)
    (h1632 : (!((firstRowBit b1 8 && firstRowBit b1 10 && rowBit rows 0 1 8 && rowBit rows 0 1 10))) = true)
    (h1633 : (!((firstRowBit b1 0 && firstRowBit b1 5 && rowBit rows 0 2 0 && rowBit rows 0 2 5))) = true)
    (h1634 : (!((firstRowBit b1 0 && firstRowBit b1 6 && rowBit rows 0 2 0 && rowBit rows 0 2 6))) = true)
    (h1635 : (!((firstRowBit b1 0 && firstRowBit b1 7 && rowBit rows 0 2 0 && rowBit rows 0 2 7))) = true)
    (h1636 : (!((firstRowBit b1 0 && firstRowBit b1 8 && rowBit rows 0 2 0 && rowBit rows 0 2 8))) = true)
    (h1637 : (!((firstRowBit b1 0 && firstRowBit b1 9 && rowBit rows 0 2 0 && rowBit rows 0 2 9))) = true)
    (h1638 : (!((firstRowBit b1 0 && firstRowBit b1 10 && rowBit rows 0 2 0 && rowBit rows 0 2 10))) = true)
    (h1639 : (!((firstRowBit b1 0 && firstRowBit b1 11 && rowBit rows 0 2 0 && rowBit rows 0 2 11))) = true)
    (h1640 : (!((firstRowBit b1 0 && firstRowBit b1 12 && rowBit rows 0 2 0 && rowBit rows 0 2 12))) = true)
    (h1641 : (!((firstRowBit b1 1 && firstRowBit b1 5 && rowBit rows 0 2 1 && rowBit rows 0 2 5))) = true)
    (h1642 : (!((firstRowBit b1 1 && firstRowBit b1 6 && rowBit rows 0 2 1 && rowBit rows 0 2 6))) = true)
    (h1643 : (!((firstRowBit b1 1 && firstRowBit b1 7 && rowBit rows 0 2 1 && rowBit rows 0 2 7))) = true)
    (h1644 : (!((firstRowBit b1 1 && firstRowBit b1 8 && rowBit rows 0 2 1 && rowBit rows 0 2 8))) = true)
    (h1645 : (!((firstRowBit b1 1 && firstRowBit b1 9 && rowBit rows 0 2 1 && rowBit rows 0 2 9))) = true)
    (h1646 : (!((firstRowBit b1 1 && firstRowBit b1 10 && rowBit rows 0 2 1 && rowBit rows 0 2 10))) = true)
    (h1647 : (!((firstRowBit b1 1 && firstRowBit b1 11 && rowBit rows 0 2 1 && rowBit rows 0 2 11))) = true)
    (h1648 : (!((firstRowBit b1 1 && firstRowBit b1 12 && rowBit rows 0 2 1 && rowBit rows 0 2 12))) = true)
    (h1649 : (!((firstRowBit b1 7 && firstRowBit b1 9 && rowBit rows 0 2 7 && rowBit rows 0 2 9))) = true)
    (h1650 : (!((firstRowBit b1 0 && firstRowBit b1 5 && rowBit rows 0 3 0 && rowBit rows 0 3 5))) = true)
    (h1651 : (!((firstRowBit b1 0 && firstRowBit b1 11 && rowBit rows 0 3 0 && rowBit rows 0 3 11))) = true)
    (h1652 : (!((firstRowBit b1 1 && firstRowBit b1 5 && rowBit rows 0 3 1 && rowBit rows 0 3 5))) = true)
    (h1653 : (!((firstRowBit b1 2 && firstRowBit b1 5 && rowBit rows 0 3 2 && rowBit rows 0 3 5))) = true)
    (h1654 : (!((firstRowBit b1 2 && firstRowBit b1 9 && rowBit rows 0 3 2 && rowBit rows 0 3 9))) = true)
    (h1655 : (!((firstRowBit b1 0 && firstRowBit b1 6 && rowBit rows 0 5 0 && rowBit rows 0 5 6))) = true)
    (h1656 : (!((firstRowBit b1 0 && firstRowBit b1 7 && rowBit rows 0 5 0 && rowBit rows 0 5 7))) = true)
    (h1657 : (!((firstRowBit b1 0 && firstRowBit b1 8 && rowBit rows 0 5 0 && rowBit rows 0 5 8))) = true)
    (h1658 : (!((firstRowBit b1 0 && firstRowBit b1 10 && rowBit rows 0 5 0 && rowBit rows 0 5 10))) = true)
    (h1659 : (!((firstRowBit b1 0 && firstRowBit b1 12 && rowBit rows 0 5 0 && rowBit rows 0 5 12))) = true)
    (h1660 : (!((firstRowBit b1 1 && firstRowBit b1 6 && rowBit rows 0 5 1 && rowBit rows 0 5 6))) = true)
    (h1661 : (!((firstRowBit b1 1 && firstRowBit b1 7 && rowBit rows 0 5 1 && rowBit rows 0 5 7))) = true)
    (h1662 : (!((firstRowBit b1 1 && firstRowBit b1 8 && rowBit rows 0 5 1 && rowBit rows 0 5 8))) = true)
    (h1663 : (!((firstRowBit b1 2 && firstRowBit b1 6 && rowBit rows 0 5 2 && rowBit rows 0 5 6))) = true) :
    ∀ item ∈ sourceChunk025Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk025Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1600
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1601
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1602
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1603
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1604
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1605
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1606
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1607
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1608
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1609
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1610
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1611
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1612
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1613
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1614
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1615
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1616
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1617
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1618
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1619
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1620
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1621
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1622
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1623
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1624
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1625
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1626
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1627
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1628
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1629
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1630
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1631
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1632
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1633
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1634
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1635
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1636
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1637
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1638
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1639
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1640
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1641
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1642
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1643
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1644
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1645
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1646
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1647
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1648
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1649
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1650
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1651
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1652
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1653
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1654
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1655
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1656
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1657
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1658
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1659
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1660
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1661
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1662
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1663

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
