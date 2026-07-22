/-
Generated packed-source bridge for verified right chunk 027.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk027_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1728 : (!((firstRowBit b1 1 && firstRowBit b1 9 && rowBit rows 0 5 1 && rowBit rows 0 5 9))) = true)
    (h1729 : (!((firstRowBit b1 1 && firstRowBit b1 10 && rowBit rows 0 5 1 && rowBit rows 0 5 10))) = true)
    (h1730 : (!((firstRowBit b1 1 && firstRowBit b1 11 && rowBit rows 0 5 1 && rowBit rows 0 5 11))) = true)
    (h1731 : (!((firstRowBit b1 2 && firstRowBit b1 9 && rowBit rows 0 5 2 && rowBit rows 0 5 9))) = true)
    (h1732 : (!((firstRowBit b1 2 && firstRowBit b1 10 && rowBit rows 0 5 2 && rowBit rows 0 5 10))) = true)
    (h1733 : (!((firstRowBit b1 2 && firstRowBit b1 11 && rowBit rows 0 5 2 && rowBit rows 0 5 11))) = true)
    (h1734 : (!((firstRowBit b1 2 && firstRowBit b1 12 && rowBit rows 0 5 2 && rowBit rows 0 5 12))) = true)
    (h1735 : (!((firstRowBit b1 3 && firstRowBit b1 9 && rowBit rows 0 5 3 && rowBit rows 0 5 9))) = true)
    (h1736 : (!((firstRowBit b1 3 && firstRowBit b1 11 && rowBit rows 0 5 3 && rowBit rows 0 5 11))) = true)
    (h1737 : (!((firstRowBit b1 3 && firstRowBit b1 12 && rowBit rows 0 5 3 && rowBit rows 0 5 12))) = true)
    (h1738 : (!((firstRowBit b1 9 && firstRowBit b1 10 && rowBit rows 0 5 9 && rowBit rows 0 5 10))) = true)
    (h1739 : (!((firstRowBit b1 9 && firstRowBit b1 11 && rowBit rows 0 5 9 && rowBit rows 0 5 11))) = true)
    (h1740 : (!((firstRowBit b1 9 && firstRowBit b1 12 && rowBit rows 0 5 9 && rowBit rows 0 5 12))) = true)
    (h1741 : (!((firstRowBit b1 11 && firstRowBit b1 12 && rowBit rows 0 5 11 && rowBit rows 0 5 12))) = true)
    (h1742 : (!((firstRowBit b1 0 && firstRowBit b1 11 && rowBit rows 0 6 0 && rowBit rows 0 6 11))) = true)
    (h1743 : (!((firstRowBit b1 0 && firstRowBit b1 12 && rowBit rows 0 6 0 && rowBit rows 0 6 12))) = true)
    (h1744 : (!((firstRowBit b1 1 && firstRowBit b1 9 && rowBit rows 0 6 1 && rowBit rows 0 6 9))) = true)
    (h1745 : (!((firstRowBit b1 1 && firstRowBit b1 10 && rowBit rows 0 6 1 && rowBit rows 0 6 10))) = true)
    (h1746 : (!((firstRowBit b1 1 && firstRowBit b1 11 && rowBit rows 0 6 1 && rowBit rows 0 6 11))) = true)
    (h1747 : (!((firstRowBit b1 2 && firstRowBit b1 9 && rowBit rows 0 6 2 && rowBit rows 0 6 9))) = true)
    (h1748 : (!((firstRowBit b1 2 && firstRowBit b1 10 && rowBit rows 0 6 2 && rowBit rows 0 6 10))) = true)
    (h1749 : (!((firstRowBit b1 2 && firstRowBit b1 11 && rowBit rows 0 6 2 && rowBit rows 0 6 11))) = true)
    (h1750 : (!((firstRowBit b1 2 && firstRowBit b1 12 && rowBit rows 0 6 2 && rowBit rows 0 6 12))) = true)
    (h1751 : (!((firstRowBit b1 3 && firstRowBit b1 9 && rowBit rows 0 6 3 && rowBit rows 0 6 9))) = true)
    (h1752 : (!((firstRowBit b1 3 && firstRowBit b1 10 && rowBit rows 0 6 3 && rowBit rows 0 6 10))) = true)
    (h1753 : (!((firstRowBit b1 9 && firstRowBit b1 10 && rowBit rows 0 6 9 && rowBit rows 0 6 10))) = true)
    (h1754 : (!((firstRowBit b1 9 && firstRowBit b1 11 && rowBit rows 0 6 9 && rowBit rows 0 6 11))) = true)
    (h1755 : (!((firstRowBit b1 10 && firstRowBit b1 11 && rowBit rows 0 6 10 && rowBit rows 0 6 11))) = true)
    (h1756 : (!((firstRowBit b1 11 && firstRowBit b1 12 && rowBit rows 0 6 11 && rowBit rows 0 6 12))) = true)
    (h1757 : (!((firstRowBit b1 5 && firstRowBit b1 9 && rowBit rows 0 0 5 && rowBit rows 0 0 9))) = true)
    (h1758 : (!((firstRowBit b1 5 && firstRowBit b1 11 && rowBit rows 0 0 5 && rowBit rows 0 0 11))) = true)
    (h1759 : (!((firstRowBit b1 5 && firstRowBit b1 12 && rowBit rows 0 0 5 && rowBit rows 0 0 12))) = true)
    (h1760 : (!((firstRowBit b1 6 && firstRowBit b1 9 && rowBit rows 0 0 6 && rowBit rows 0 0 9))) = true)
    (h1761 : (!((firstRowBit b1 6 && firstRowBit b1 10 && rowBit rows 0 0 6 && rowBit rows 0 0 10))) = true)
    (h1762 : (!((firstRowBit b1 6 && firstRowBit b1 11 && rowBit rows 0 0 6 && rowBit rows 0 0 11))) = true)
    (h1763 : (!((firstRowBit b1 6 && firstRowBit b1 12 && rowBit rows 0 0 6 && rowBit rows 0 0 12))) = true)
    (h1764 : (!((firstRowBit b1 7 && firstRowBit b1 9 && rowBit rows 0 0 7 && rowBit rows 0 0 9))) = true)
    (h1765 : (!((firstRowBit b1 7 && firstRowBit b1 10 && rowBit rows 0 0 7 && rowBit rows 0 0 10))) = true)
    (h1766 : (!((firstRowBit b1 7 && firstRowBit b1 11 && rowBit rows 0 0 7 && rowBit rows 0 0 11))) = true)
    (h1767 : (!((firstRowBit b1 7 && firstRowBit b1 12 && rowBit rows 0 0 7 && rowBit rows 0 0 12))) = true)
    (h1768 : (!((firstRowBit b1 5 && firstRowBit b1 9 && rowBit rows 0 1 5 && rowBit rows 0 1 9))) = true)
    (h1769 : (!((firstRowBit b1 5 && firstRowBit b1 10 && rowBit rows 0 1 5 && rowBit rows 0 1 10))) = true)
    (h1770 : (!((firstRowBit b1 5 && firstRowBit b1 12 && rowBit rows 0 1 5 && rowBit rows 0 1 12))) = true)
    (h1771 : (!((firstRowBit b1 6 && firstRowBit b1 10 && rowBit rows 0 1 6 && rowBit rows 0 1 10))) = true)
    (h1772 : (!((firstRowBit b1 6 && firstRowBit b1 12 && rowBit rows 0 1 6 && rowBit rows 0 1 12))) = true)
    (h1773 : (!((firstRowBit b1 7 && firstRowBit b1 12 && rowBit rows 0 1 7 && rowBit rows 0 1 12))) = true)
    (h1774 : (!((firstRowBit b1 8 && firstRowBit b1 9 && rowBit rows 0 1 8 && rowBit rows 0 1 9))) = true)
    (h1775 : (!((firstRowBit b1 8 && firstRowBit b1 12 && rowBit rows 0 1 8 && rowBit rows 0 1 12))) = true)
    (h1776 : (!((firstRowBit b1 9 && firstRowBit b1 10 && rowBit rows 0 1 9 && rowBit rows 0 1 10))) = true)
    (h1777 : (!((firstRowBit b1 9 && firstRowBit b1 11 && rowBit rows 0 1 9 && rowBit rows 0 1 11))) = true)
    (h1778 : (!((firstRowBit b1 9 && firstRowBit b1 12 && rowBit rows 0 1 9 && rowBit rows 0 1 12))) = true)
    (h1779 : (!((firstRowBit b1 10 && firstRowBit b1 11 && rowBit rows 0 1 10 && rowBit rows 0 1 11))) = true)
    (h1780 : (!((firstRowBit b1 10 && firstRowBit b1 12 && rowBit rows 0 1 10 && rowBit rows 0 1 12))) = true)
    (h1781 : (!((firstRowBit b1 11 && firstRowBit b1 12 && rowBit rows 0 1 11 && rowBit rows 0 1 12))) = true)
    (h1782 : (!((firstRowBit b1 5 && firstRowBit b1 9 && rowBit rows 0 2 5 && rowBit rows 0 2 9))) = true)
    (h1783 : (!((firstRowBit b1 5 && firstRowBit b1 10 && rowBit rows 0 2 5 && rowBit rows 0 2 10))) = true)
    (h1784 : (!((firstRowBit b1 5 && firstRowBit b1 11 && rowBit rows 0 2 5 && rowBit rows 0 2 11))) = true)
    (h1785 : (!((firstRowBit b1 5 && firstRowBit b1 12 && rowBit rows 0 2 5 && rowBit rows 0 2 12))) = true)
    (h1786 : (!((firstRowBit b1 6 && firstRowBit b1 9 && rowBit rows 0 2 6 && rowBit rows 0 2 9))) = true)
    (h1787 : (!((firstRowBit b1 6 && firstRowBit b1 10 && rowBit rows 0 2 6 && rowBit rows 0 2 10))) = true)
    (h1788 : (!((firstRowBit b1 6 && firstRowBit b1 11 && rowBit rows 0 2 6 && rowBit rows 0 2 11))) = true)
    (h1789 : (!((firstRowBit b1 6 && firstRowBit b1 12 && rowBit rows 0 2 6 && rowBit rows 0 2 12))) = true)
    (h1790 : (!((firstRowBit b1 7 && firstRowBit b1 10 && rowBit rows 0 2 7 && rowBit rows 0 2 10))) = true)
    (h1791 : (!((firstRowBit b1 7 && firstRowBit b1 11 && rowBit rows 0 2 7 && rowBit rows 0 2 11))) = true) :
    ∀ item ∈ sourceChunk027Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk027Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1728
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1729
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1730
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1731
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1732
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1733
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1734
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1735
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1736
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1737
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1738
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1739
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1740
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1741
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1742
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1743
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1744
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1745
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1746
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1747
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1748
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1749
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1750
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1751
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1752
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1753
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1754
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1755
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1756
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1757
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1758
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1759
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1760
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1761
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1762
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1763
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1764
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1765
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1766
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1767
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1768
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1769
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1770
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1771
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1772
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1773
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1774
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1775
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1776
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1777
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1778
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1779
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1780
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1781
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1782
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1783
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1784
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1785
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1786
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1787
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1788
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1789
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1790
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1791

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
