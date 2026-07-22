/-
Generated packed-source bridge for verified middle chunk 026.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk026_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1664 : (!((firstRowBit b1 2 && firstRowBit b1 7 && rowBit rows 0 5 2 && rowBit rows 0 5 7))) = true)
    (h1665 : (!((firstRowBit b1 2 && firstRowBit b1 8 && rowBit rows 0 5 2 && rowBit rows 0 5 8))) = true)
    (h1666 : (!((firstRowBit b1 3 && firstRowBit b1 6 && rowBit rows 0 5 3 && rowBit rows 0 5 6))) = true)
    (h1667 : (!((firstRowBit b1 3 && firstRowBit b1 7 && rowBit rows 0 5 3 && rowBit rows 0 5 7))) = true)
    (h1668 : (!((firstRowBit b1 3 && firstRowBit b1 8 && rowBit rows 0 5 3 && rowBit rows 0 5 8))) = true)
    (h1669 : (!((firstRowBit b1 6 && firstRowBit b1 9 && rowBit rows 0 5 6 && rowBit rows 0 5 9))) = true)
    (h1670 : (!((firstRowBit b1 6 && firstRowBit b1 10 && rowBit rows 0 5 6 && rowBit rows 0 5 10))) = true)
    (h1671 : (!((firstRowBit b1 6 && firstRowBit b1 11 && rowBit rows 0 5 6 && rowBit rows 0 5 11))) = true)
    (h1672 : (!((firstRowBit b1 6 && firstRowBit b1 12 && rowBit rows 0 5 6 && rowBit rows 0 5 12))) = true)
    (h1673 : (!((firstRowBit b1 7 && firstRowBit b1 9 && rowBit rows 0 5 7 && rowBit rows 0 5 9))) = true)
    (h1674 : (!((firstRowBit b1 7 && firstRowBit b1 12 && rowBit rows 0 5 7 && rowBit rows 0 5 12))) = true)
    (h1675 : (!((firstRowBit b1 8 && firstRowBit b1 9 && rowBit rows 0 5 8 && rowBit rows 0 5 9))) = true)
    (h1676 : (!((firstRowBit b1 8 && firstRowBit b1 10 && rowBit rows 0 5 8 && rowBit rows 0 5 10))) = true)
    (h1677 : (!((firstRowBit b1 8 && firstRowBit b1 11 && rowBit rows 0 5 8 && rowBit rows 0 5 11))) = true)
    (h1678 : (!((firstRowBit b1 8 && firstRowBit b1 12 && rowBit rows 0 5 8 && rowBit rows 0 5 12))) = true)
    (h1679 : (!((firstRowBit b1 10 && firstRowBit b1 11 && rowBit rows 0 5 10 && rowBit rows 0 5 11))) = true)
    (h1680 : (!((firstRowBit b1 10 && firstRowBit b1 12 && rowBit rows 0 5 10 && rowBit rows 0 5 12))) = true)
    (h1681 : (!((firstRowBit b1 0 && firstRowBit b1 7 && rowBit rows 0 6 0 && rowBit rows 0 6 7))) = true)
    (h1682 : (!((firstRowBit b1 0 && firstRowBit b1 8 && rowBit rows 0 6 0 && rowBit rows 0 6 8))) = true)
    (h1683 : (!((firstRowBit b1 0 && firstRowBit b1 9 && rowBit rows 0 6 0 && rowBit rows 0 6 9))) = true)
    (h1684 : (!((firstRowBit b1 0 && firstRowBit b1 10 && rowBit rows 0 6 0 && rowBit rows 0 6 10))) = true)
    (h1685 : (!((firstRowBit b1 1 && firstRowBit b1 7 && rowBit rows 0 6 1 && rowBit rows 0 6 7))) = true)
    (h1686 : (!((firstRowBit b1 1 && firstRowBit b1 8 && rowBit rows 0 6 1 && rowBit rows 0 6 8))) = true)
    (h1687 : (!((firstRowBit b1 2 && firstRowBit b1 7 && rowBit rows 0 6 2 && rowBit rows 0 6 7))) = true)
    (h1688 : (!((firstRowBit b1 2 && firstRowBit b1 8 && rowBit rows 0 6 2 && rowBit rows 0 6 8))) = true)
    (h1689 : (!((firstRowBit b1 3 && firstRowBit b1 8 && rowBit rows 0 6 3 && rowBit rows 0 6 8))) = true)
    (h1690 : (!((firstRowBit b1 7 && firstRowBit b1 9 && rowBit rows 0 6 7 && rowBit rows 0 6 9))) = true)
    (h1691 : (!((firstRowBit b1 7 && firstRowBit b1 10 && rowBit rows 0 6 7 && rowBit rows 0 6 10))) = true)
    (h1692 : (!((firstRowBit b1 7 && firstRowBit b1 11 && rowBit rows 0 6 7 && rowBit rows 0 6 11))) = true)
    (h1693 : (!((firstRowBit b1 7 && firstRowBit b1 12 && rowBit rows 0 6 7 && rowBit rows 0 6 12))) = true)
    (h1694 : (!((firstRowBit b1 8 && firstRowBit b1 9 && rowBit rows 0 6 8 && rowBit rows 0 6 9))) = true)
    (h1695 : (!((firstRowBit b1 8 && firstRowBit b1 10 && rowBit rows 0 6 8 && rowBit rows 0 6 10))) = true)
    (h1696 : (!((firstRowBit b1 8 && firstRowBit b1 11 && rowBit rows 0 6 8 && rowBit rows 0 6 11))) = true)
    (h1697 : (!((firstRowBit b1 8 && firstRowBit b1 12 && rowBit rows 0 6 8 && rowBit rows 0 6 12))) = true)
    (h1698 : (!((firstRowBit b1 9 && firstRowBit b1 12 && rowBit rows 0 6 9 && rowBit rows 0 6 12))) = true)
    (h1699 : (!((firstRowBit b1 10 && firstRowBit b1 12 && rowBit rows 0 6 10 && rowBit rows 0 6 12))) = true)
    (h1700 : (!((firstRowBit b1 0 && firstRowBit b1 8 && rowBit rows 0 7 0 && rowBit rows 0 7 8))) = true)
    (h1701 : (!((firstRowBit b1 8 && firstRowBit b1 10 && rowBit rows 0 7 8 && rowBit rows 0 7 10))) = true)
    (h1702 : (!((firstRowBit b1 8 && firstRowBit b1 12 && rowBit rows 0 7 8 && rowBit rows 0 7 12))) = true)
    (h1703 : (!((firstRowBit b1 0 && firstRowBit b1 11 && rowBit rows 0 10 0 && rowBit rows 0 10 11))) = true)
    (h1704 : (!((firstRowBit b1 0 && firstRowBit b1 12 && rowBit rows 0 10 0 && rowBit rows 0 10 12))) = true)
    (h1705 : (!((firstRowBit b1 1 && firstRowBit b1 11 && rowBit rows 0 10 1 && rowBit rows 0 10 11))) = true)
    (h1706 : (!((firstRowBit b1 2 && firstRowBit b1 11 && rowBit rows 0 10 2 && rowBit rows 0 10 11))) = true)
    (h1707 : (!((firstRowBit b1 2 && firstRowBit b1 12 && rowBit rows 0 10 2 && rowBit rows 0 10 12))) = true)
    (h1708 : (!((firstRowBit b1 3 && firstRowBit b1 12 && rowBit rows 0 10 3 && rowBit rows 0 10 12))) = true)
    (h1709 : (!((firstRowBit b1 5 && firstRowBit b1 9 && rowBit rows 0 10 5 && rowBit rows 0 10 9))) = true)
    (h1710 : (!((firstRowBit b1 6 && firstRowBit b1 9 && rowBit rows 0 10 6 && rowBit rows 0 10 9))) = true)
    (h1711 : (!((firstRowBit b1 8 && firstRowBit b1 9 && rowBit rows 0 10 8 && rowBit rows 0 10 9))) = true)
    (h1712 : (!((firstRowBit b1 11 && firstRowBit b1 12 && rowBit rows 0 10 11 && rowBit rows 0 10 12))) = true)
    (h1713 : (!((firstRowBit b1 0 && firstRowBit b1 12 && rowBit rows 0 11 0 && rowBit rows 0 11 12))) = true)
    (h1714 : (!((firstRowBit b1 1 && firstRowBit b1 12 && rowBit rows 0 11 1 && rowBit rows 0 11 12))) = true)
    (h1715 : (!((firstRowBit b1 2 && firstRowBit b1 12 && rowBit rows 0 11 2 && rowBit rows 0 11 12))) = true)
    (h1716 : (!((firstRowBit b1 3 && firstRowBit b1 12 && rowBit rows 0 11 3 && rowBit rows 0 11 12))) = true)
    (h1717 : (!((firstRowBit b1 5 && firstRowBit b1 9 && rowBit rows 0 11 5 && rowBit rows 0 11 9))) = true)
    (h1718 : (!((firstRowBit b1 5 && firstRowBit b1 10 && rowBit rows 0 11 5 && rowBit rows 0 11 10))) = true)
    (h1719 : (!((firstRowBit b1 6 && firstRowBit b1 9 && rowBit rows 0 11 6 && rowBit rows 0 11 9))) = true)
    (h1720 : (!((firstRowBit b1 6 && firstRowBit b1 10 && rowBit rows 0 11 6 && rowBit rows 0 11 10))) = true)
    (h1721 : (!((firstRowBit b1 7 && firstRowBit b1 10 && rowBit rows 0 11 7 && rowBit rows 0 11 10))) = true)
    (h1722 : (!((firstRowBit b1 8 && firstRowBit b1 9 && rowBit rows 0 11 8 && rowBit rows 0 11 9))) = true)
    (h1723 : (!((firstRowBit b1 8 && firstRowBit b1 10 && rowBit rows 0 11 8 && rowBit rows 0 11 10))) = true)
    (h1724 : (!((firstRowBit b1 9 && firstRowBit b1 10 && rowBit rows 0 11 9 && rowBit rows 0 11 10))) = true)
    (h1725 : (!((firstRowBit b1 9 && firstRowBit b1 10 && rowBit rows 0 12 9 && rowBit rows 0 12 10))) = true)
    (h1726 : (!((firstRowBit b1 0 && firstRowBit b1 9 && rowBit rows 0 5 0 && rowBit rows 0 5 9))) = true)
    (h1727 : (!((firstRowBit b1 0 && firstRowBit b1 11 && rowBit rows 0 5 0 && rowBit rows 0 5 11))) = true) :
    ∀ item ∈ sourceChunk026Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk026Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1664
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1665
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1666
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1667
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1668
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1669
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1670
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1671
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1672
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1673
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1674
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1675
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1676
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1677
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1678
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1679
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1680
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1681
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1682
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1683
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1684
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1685
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1686
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1687
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1688
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1689
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1690
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1691
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1692
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1693
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1694
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1695
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1696
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1697
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1698
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1699
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1700
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1701
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1702
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1703
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1704
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1705
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1706
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1707
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1708
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1709
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1710
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1711
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1712
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1713
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1714
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1715
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1716
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1717
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1718
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1719
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1720
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1721
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1722
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1723
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1724
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1725
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1726
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1727

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
