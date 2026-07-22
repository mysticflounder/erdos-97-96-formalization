/-
Generated packed-source bridge for verified right chunk 105.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk105_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h6720 : ((!((rankAtom ranks 62 == rankAtom ranks 60)) || ((rankAtom ranks 49).ult (rankAtom ranks 47)))) = true)
    (h6721 : ((!((rankAtom ranks 48 == rankAtom ranks 43)) || ((rankAtom ranks 77).ult (rankAtom ranks 62)))) = true)
    (h6722 : ((!((rankAtom ranks 48 == rankAtom ranks 77)) || ((rankAtom ranks 43).ult (rankAtom ranks 62)))) = true)
    (h6723 : ((!((rankAtom ranks 62 == rankAtom ranks 43)) || ((rankAtom ranks 77).ult (rankAtom ranks 48)))) = true)
    (h6724 : ((!((rankAtom ranks 62 == rankAtom ranks 77)) || ((rankAtom ranks 43).ult (rankAtom ranks 48)))) = true)
    (h6725 : ((!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 61).ult (rankAtom ranks 62)))) = true)
    (h6726 : ((!((rankAtom ranks 48 == rankAtom ranks 61)) || ((rankAtom ranks 49).ult (rankAtom ranks 62)))) = true)
    (h6727 : ((!((rankAtom ranks 62 == rankAtom ranks 49)) || ((rankAtom ranks 61).ult (rankAtom ranks 48)))) = true)
    (h6728 : ((!((rankAtom ranks 62 == rankAtom ranks 61)) || ((rankAtom ranks 49).ult (rankAtom ranks 48)))) = true)
    (h6729 : ((!((rankAtom ranks 45 == rankAtom ranks 44)) || ((rankAtom ranks 68).ult (rankAtom ranks 64)))) = true)
    (h6730 : ((!((rankAtom ranks 45 == rankAtom ranks 68)) || ((rankAtom ranks 44).ult (rankAtom ranks 64)))) = true)
    (h6731 : ((!((rankAtom ranks 64 == rankAtom ranks 44)) || ((rankAtom ranks 68).ult (rankAtom ranks 45)))) = true)
    (h6732 : ((!((rankAtom ranks 64 == rankAtom ranks 68)) || ((rankAtom ranks 44).ult (rankAtom ranks 45)))) = true)
    (h6733 : ((!((rankAtom ranks 45 == rankAtom ranks 46)) || ((rankAtom ranks 63).ult (rankAtom ranks 64)))) = true)
    (h6734 : ((!((rankAtom ranks 64 == rankAtom ranks 46)) || ((rankAtom ranks 63).ult (rankAtom ranks 45)))) = true)
    (h6735 : ((!((rankAtom ranks 45 == rankAtom ranks 44)) || ((rankAtom ranks 69).ult (rankAtom ranks 65)))) = true)
    (h6736 : ((!((rankAtom ranks 45 == rankAtom ranks 69)) || ((rankAtom ranks 44).ult (rankAtom ranks 65)))) = true)
    (h6737 : ((!((rankAtom ranks 65 == rankAtom ranks 69)) || ((rankAtom ranks 44).ult (rankAtom ranks 45)))) = true)
    (h6738 : ((!((rankAtom ranks 45 == rankAtom ranks 47)) || ((rankAtom ranks 63).ult (rankAtom ranks 65)))) = true)
    (h6739 : ((!((rankAtom ranks 65 == rankAtom ranks 47)) || ((rankAtom ranks 63).ult (rankAtom ranks 45)))) = true)
    (h6740 : ((!((rankAtom ranks 45 == rankAtom ranks 44)) || ((rankAtom ranks 70).ult (rankAtom ranks 66)))) = true)
    (h6741 : ((!((rankAtom ranks 45 == rankAtom ranks 70)) || ((rankAtom ranks 44).ult (rankAtom ranks 66)))) = true)
    (h6742 : ((!((rankAtom ranks 66 == rankAtom ranks 70)) || ((rankAtom ranks 44).ult (rankAtom ranks 45)))) = true)
    (h6743 : ((!((rankAtom ranks 45 == rankAtom ranks 48)) || ((rankAtom ranks 63).ult (rankAtom ranks 66)))) = true)
    (h6744 : ((!((rankAtom ranks 66 == rankAtom ranks 48)) || ((rankAtom ranks 63).ult (rankAtom ranks 45)))) = true)
    (h6745 : ((!((rankAtom ranks 45 == rankAtom ranks 44)) || ((rankAtom ranks 71).ult (rankAtom ranks 67)))) = true)
    (h6746 : ((!((rankAtom ranks 45 == rankAtom ranks 71)) || ((rankAtom ranks 44).ult (rankAtom ranks 67)))) = true)
    (h6747 : ((!((rankAtom ranks 45 == rankAtom ranks 49)) || ((rankAtom ranks 63).ult (rankAtom ranks 67)))) = true)
    (h6748 : ((!((rankAtom ranks 46 == rankAtom ranks 44)) || ((rankAtom ranks 72).ult (rankAtom ranks 65)))) = true)
    (h6749 : ((!((rankAtom ranks 46 == rankAtom ranks 72)) || ((rankAtom ranks 44).ult (rankAtom ranks 65)))) = true)
    (h6750 : ((!((rankAtom ranks 65 == rankAtom ranks 72)) || ((rankAtom ranks 44).ult (rankAtom ranks 46)))) = true)
    (h6751 : ((!((rankAtom ranks 46 == rankAtom ranks 47)) || ((rankAtom ranks 64).ult (rankAtom ranks 65)))) = true)
    (h6752 : ((!((rankAtom ranks 46 == rankAtom ranks 64)) || ((rankAtom ranks 47).ult (rankAtom ranks 65)))) = true)
    (h6753 : ((!((rankAtom ranks 65 == rankAtom ranks 47)) || ((rankAtom ranks 64).ult (rankAtom ranks 46)))) = true)
    (h6754 : ((!((rankAtom ranks 65 == rankAtom ranks 64)) || ((rankAtom ranks 47).ult (rankAtom ranks 46)))) = true)
    (h6755 : ((!((rankAtom ranks 46 == rankAtom ranks 44)) || ((rankAtom ranks 73).ult (rankAtom ranks 66)))) = true)
    (h6756 : ((!((rankAtom ranks 46 == rankAtom ranks 73)) || ((rankAtom ranks 44).ult (rankAtom ranks 66)))) = true)
    (h6757 : ((!((rankAtom ranks 66 == rankAtom ranks 73)) || ((rankAtom ranks 44).ult (rankAtom ranks 46)))) = true)
    (h6758 : ((!((rankAtom ranks 46 == rankAtom ranks 48)) || ((rankAtom ranks 64).ult (rankAtom ranks 66)))) = true)
    (h6759 : ((!((rankAtom ranks 46 == rankAtom ranks 64)) || ((rankAtom ranks 48).ult (rankAtom ranks 66)))) = true)
    (h6760 : ((!((rankAtom ranks 66 == rankAtom ranks 48)) || ((rankAtom ranks 64).ult (rankAtom ranks 46)))) = true)
    (h6761 : ((!((rankAtom ranks 66 == rankAtom ranks 64)) || ((rankAtom ranks 48).ult (rankAtom ranks 46)))) = true)
    (h6762 : ((!((rankAtom ranks 46 == rankAtom ranks 44)) || ((rankAtom ranks 74).ult (rankAtom ranks 67)))) = true)
    (h6763 : ((!((rankAtom ranks 46 == rankAtom ranks 74)) || ((rankAtom ranks 44).ult (rankAtom ranks 67)))) = true)
    (h6764 : ((!((rankAtom ranks 46 == rankAtom ranks 49)) || ((rankAtom ranks 64).ult (rankAtom ranks 67)))) = true)
    (h6765 : ((!((rankAtom ranks 46 == rankAtom ranks 64)) || ((rankAtom ranks 49).ult (rankAtom ranks 67)))) = true)
    (h6766 : ((!((rankAtom ranks 47 == rankAtom ranks 44)) || ((rankAtom ranks 75).ult (rankAtom ranks 66)))) = true)
    (h6767 : ((!((rankAtom ranks 47 == rankAtom ranks 75)) || ((rankAtom ranks 44).ult (rankAtom ranks 66)))) = true)
    (h6768 : ((!((rankAtom ranks 66 == rankAtom ranks 75)) || ((rankAtom ranks 44).ult (rankAtom ranks 47)))) = true)
    (h6769 : ((!((rankAtom ranks 47 == rankAtom ranks 48)) || ((rankAtom ranks 65).ult (rankAtom ranks 66)))) = true)
    (h6770 : ((!((rankAtom ranks 47 == rankAtom ranks 65)) || ((rankAtom ranks 48).ult (rankAtom ranks 66)))) = true)
    (h6771 : ((!((rankAtom ranks 66 == rankAtom ranks 48)) || ((rankAtom ranks 65).ult (rankAtom ranks 47)))) = true)
    (h6772 : ((!((rankAtom ranks 47 == rankAtom ranks 44)) || ((rankAtom ranks 76).ult (rankAtom ranks 67)))) = true)
    (h6773 : ((!((rankAtom ranks 47 == rankAtom ranks 76)) || ((rankAtom ranks 44).ult (rankAtom ranks 67)))) = true)
    (h6774 : ((!((rankAtom ranks 67 == rankAtom ranks 44)) || ((rankAtom ranks 76).ult (rankAtom ranks 47)))) = true)
    (h6775 : ((!((rankAtom ranks 67 == rankAtom ranks 76)) || ((rankAtom ranks 44).ult (rankAtom ranks 47)))) = true)
    (h6776 : ((!((rankAtom ranks 47 == rankAtom ranks 49)) || ((rankAtom ranks 65).ult (rankAtom ranks 67)))) = true)
    (h6777 : ((!((rankAtom ranks 47 == rankAtom ranks 65)) || ((rankAtom ranks 49).ult (rankAtom ranks 67)))) = true)
    (h6778 : ((!((rankAtom ranks 67 == rankAtom ranks 65)) || ((rankAtom ranks 49).ult (rankAtom ranks 47)))) = true)
    (h6779 : ((!((rankAtom ranks 48 == rankAtom ranks 44)) || ((rankAtom ranks 77).ult (rankAtom ranks 67)))) = true)
    (h6780 : ((!((rankAtom ranks 48 == rankAtom ranks 77)) || ((rankAtom ranks 44).ult (rankAtom ranks 67)))) = true)
    (h6781 : ((!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 66).ult (rankAtom ranks 67)))) = true)
    (h6782 : ((!((rankAtom ranks 48 == rankAtom ranks 66)) || ((rankAtom ranks 49).ult (rankAtom ranks 67)))) = true)
    (h6783 : ((!((rankAtom ranks 67 == rankAtom ranks 66)) || ((rankAtom ranks 49).ult (rankAtom ranks 48)))) = true) :
    ∀ item ∈ sourceChunk105Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk105Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6720
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6721
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6722
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6723
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6724
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6725
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6726
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6727
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6728
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6729
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6730
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6731
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6732
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6733
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6734
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6735
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6736
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6737
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6738
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6739
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6740
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6741
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6742
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6743
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6744
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6745
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6746
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6747
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6748
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6749
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6750
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6751
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6752
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6753
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6754
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6755
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6756
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6757
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6758
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6759
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6760
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6761
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6762
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6763
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6764
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6765
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6766
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6767
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6768
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6769
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6770
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6771
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6772
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6773
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6774
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6775
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6776
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6777
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6778
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6779
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6780
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6781
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6782
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6783

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
