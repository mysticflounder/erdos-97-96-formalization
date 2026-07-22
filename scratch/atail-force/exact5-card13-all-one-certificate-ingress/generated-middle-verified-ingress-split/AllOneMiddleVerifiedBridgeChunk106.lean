/-
Generated packed-source bridge for verified middle chunk 106.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk106_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h6784 : ((!((rankAtom ranks 46 == rankAtom ranks 45)) || ((rankAtom ranks 72).ult (rankAtom ranks 69)))) = true)
    (h6785 : ((!((rankAtom ranks 46 == rankAtom ranks 72)) || ((rankAtom ranks 45).ult (rankAtom ranks 69)))) = true)
    (h6786 : ((!((rankAtom ranks 69 == rankAtom ranks 45)) || ((rankAtom ranks 72).ult (rankAtom ranks 46)))) = true)
    (h6787 : ((!((rankAtom ranks 69 == rankAtom ranks 72)) || ((rankAtom ranks 45).ult (rankAtom ranks 46)))) = true)
    (h6788 : ((!((rankAtom ranks 46 == rankAtom ranks 47)) || ((rankAtom ranks 68).ult (rankAtom ranks 69)))) = true)
    (h6789 : ((!((rankAtom ranks 46 == rankAtom ranks 68)) || ((rankAtom ranks 47).ult (rankAtom ranks 69)))) = true)
    (h6790 : ((!((rankAtom ranks 69 == rankAtom ranks 47)) || ((rankAtom ranks 68).ult (rankAtom ranks 46)))) = true)
    (h6791 : ((!((rankAtom ranks 69 == rankAtom ranks 68)) || ((rankAtom ranks 47).ult (rankAtom ranks 46)))) = true)
    (h6792 : ((!((rankAtom ranks 46 == rankAtom ranks 45)) || ((rankAtom ranks 73).ult (rankAtom ranks 70)))) = true)
    (h6793 : ((!((rankAtom ranks 46 == rankAtom ranks 73)) || ((rankAtom ranks 45).ult (rankAtom ranks 70)))) = true)
    (h6794 : ((!((rankAtom ranks 70 == rankAtom ranks 45)) || ((rankAtom ranks 73).ult (rankAtom ranks 46)))) = true)
    (h6795 : ((!((rankAtom ranks 70 == rankAtom ranks 73)) || ((rankAtom ranks 45).ult (rankAtom ranks 46)))) = true)
    (h6796 : ((!((rankAtom ranks 46 == rankAtom ranks 48)) || ((rankAtom ranks 68).ult (rankAtom ranks 70)))) = true)
    (h6797 : ((!((rankAtom ranks 46 == rankAtom ranks 68)) || ((rankAtom ranks 48).ult (rankAtom ranks 70)))) = true)
    (h6798 : ((!((rankAtom ranks 70 == rankAtom ranks 48)) || ((rankAtom ranks 68).ult (rankAtom ranks 46)))) = true)
    (h6799 : ((!((rankAtom ranks 46 == rankAtom ranks 45)) || ((rankAtom ranks 74).ult (rankAtom ranks 71)))) = true)
    (h6800 : ((!((rankAtom ranks 46 == rankAtom ranks 74)) || ((rankAtom ranks 45).ult (rankAtom ranks 71)))) = true)
    (h6801 : ((!((rankAtom ranks 71 == rankAtom ranks 45)) || ((rankAtom ranks 74).ult (rankAtom ranks 46)))) = true)
    (h6802 : ((!((rankAtom ranks 46 == rankAtom ranks 49)) || ((rankAtom ranks 68).ult (rankAtom ranks 71)))) = true)
    (h6803 : ((!((rankAtom ranks 46 == rankAtom ranks 68)) || ((rankAtom ranks 49).ult (rankAtom ranks 71)))) = true)
    (h6804 : ((!((rankAtom ranks 71 == rankAtom ranks 68)) || ((rankAtom ranks 49).ult (rankAtom ranks 46)))) = true)
    (h6805 : ((!((rankAtom ranks 47 == rankAtom ranks 45)) || ((rankAtom ranks 75).ult (rankAtom ranks 70)))) = true)
    (h6806 : ((!((rankAtom ranks 47 == rankAtom ranks 75)) || ((rankAtom ranks 45).ult (rankAtom ranks 70)))) = true)
    (h6807 : ((!((rankAtom ranks 70 == rankAtom ranks 45)) || ((rankAtom ranks 75).ult (rankAtom ranks 47)))) = true)
    (h6808 : ((!((rankAtom ranks 70 == rankAtom ranks 75)) || ((rankAtom ranks 45).ult (rankAtom ranks 47)))) = true)
    (h6809 : ((!((rankAtom ranks 47 == rankAtom ranks 48)) || ((rankAtom ranks 69).ult (rankAtom ranks 70)))) = true)
    (h6810 : ((!((rankAtom ranks 47 == rankAtom ranks 69)) || ((rankAtom ranks 48).ult (rankAtom ranks 70)))) = true)
    (h6811 : ((!((rankAtom ranks 70 == rankAtom ranks 48)) || ((rankAtom ranks 69).ult (rankAtom ranks 47)))) = true)
    (h6812 : ((!((rankAtom ranks 70 == rankAtom ranks 69)) || ((rankAtom ranks 48).ult (rankAtom ranks 47)))) = true)
    (h6813 : ((!((rankAtom ranks 47 == rankAtom ranks 45)) || ((rankAtom ranks 76).ult (rankAtom ranks 71)))) = true)
    (h6814 : ((!((rankAtom ranks 47 == rankAtom ranks 76)) || ((rankAtom ranks 45).ult (rankAtom ranks 71)))) = true)
    (h6815 : ((!((rankAtom ranks 71 == rankAtom ranks 45)) || ((rankAtom ranks 76).ult (rankAtom ranks 47)))) = true)
    (h6816 : ((!((rankAtom ranks 47 == rankAtom ranks 49)) || ((rankAtom ranks 69).ult (rankAtom ranks 71)))) = true)
    (h6817 : ((!((rankAtom ranks 47 == rankAtom ranks 69)) || ((rankAtom ranks 49).ult (rankAtom ranks 71)))) = true)
    (h6818 : ((!((rankAtom ranks 48 == rankAtom ranks 45)) || ((rankAtom ranks 77).ult (rankAtom ranks 71)))) = true)
    (h6819 : ((!((rankAtom ranks 48 == rankAtom ranks 77)) || ((rankAtom ranks 45).ult (rankAtom ranks 71)))) = true)
    (h6820 : ((!((rankAtom ranks 71 == rankAtom ranks 45)) || ((rankAtom ranks 77).ult (rankAtom ranks 48)))) = true)
    (h6821 : ((!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 70).ult (rankAtom ranks 71)))) = true)
    (h6822 : ((!((rankAtom ranks 48 == rankAtom ranks 70)) || ((rankAtom ranks 49).ult (rankAtom ranks 71)))) = true)
    (h6823 : ((!((rankAtom ranks 71 == rankAtom ranks 49)) || ((rankAtom ranks 70).ult (rankAtom ranks 48)))) = true)
    (h6824 : ((!((rankAtom ranks 71 == rankAtom ranks 70)) || ((rankAtom ranks 49).ult (rankAtom ranks 48)))) = true)
    (h6825 : ((!((rankAtom ranks 47 == rankAtom ranks 46)) || ((rankAtom ranks 75).ult (rankAtom ranks 73)))) = true)
    (h6826 : ((!((rankAtom ranks 47 == rankAtom ranks 75)) || ((rankAtom ranks 46).ult (rankAtom ranks 73)))) = true)
    (h6827 : ((!((rankAtom ranks 73 == rankAtom ranks 46)) || ((rankAtom ranks 75).ult (rankAtom ranks 47)))) = true)
    (h6828 : ((!((rankAtom ranks 73 == rankAtom ranks 75)) || ((rankAtom ranks 46).ult (rankAtom ranks 47)))) = true)
    (h6829 : ((!((rankAtom ranks 47 == rankAtom ranks 48)) || ((rankAtom ranks 72).ult (rankAtom ranks 73)))) = true)
    (h6830 : ((!((rankAtom ranks 47 == rankAtom ranks 72)) || ((rankAtom ranks 48).ult (rankAtom ranks 73)))) = true)
    (h6831 : ((!((rankAtom ranks 73 == rankAtom ranks 48)) || ((rankAtom ranks 72).ult (rankAtom ranks 47)))) = true)
    (h6832 : ((!((rankAtom ranks 73 == rankAtom ranks 72)) || ((rankAtom ranks 48).ult (rankAtom ranks 47)))) = true)
    (h6833 : ((!((rankAtom ranks 47 == rankAtom ranks 46)) || ((rankAtom ranks 76).ult (rankAtom ranks 74)))) = true)
    (h6834 : ((!((rankAtom ranks 47 == rankAtom ranks 76)) || ((rankAtom ranks 46).ult (rankAtom ranks 74)))) = true)
    (h6835 : ((!((rankAtom ranks 74 == rankAtom ranks 46)) || ((rankAtom ranks 76).ult (rankAtom ranks 47)))) = true)
    (h6836 : ((!((rankAtom ranks 47 == rankAtom ranks 49)) || ((rankAtom ranks 72).ult (rankAtom ranks 74)))) = true)
    (h6837 : ((!((rankAtom ranks 47 == rankAtom ranks 72)) || ((rankAtom ranks 49).ult (rankAtom ranks 74)))) = true)
    (h6838 : ((!((rankAtom ranks 74 == rankAtom ranks 49)) || ((rankAtom ranks 72).ult (rankAtom ranks 47)))) = true)
    (h6839 : ((!((rankAtom ranks 74 == rankAtom ranks 72)) || ((rankAtom ranks 49).ult (rankAtom ranks 47)))) = true)
    (h6840 : ((!((rankAtom ranks 48 == rankAtom ranks 46)) || ((rankAtom ranks 77).ult (rankAtom ranks 74)))) = true)
    (h6841 : ((!((rankAtom ranks 48 == rankAtom ranks 77)) || ((rankAtom ranks 46).ult (rankAtom ranks 74)))) = true)
    (h6842 : ((!((rankAtom ranks 74 == rankAtom ranks 46)) || ((rankAtom ranks 77).ult (rankAtom ranks 48)))) = true)
    (h6843 : ((!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 73).ult (rankAtom ranks 74)))) = true)
    (h6844 : ((!((rankAtom ranks 48 == rankAtom ranks 73)) || ((rankAtom ranks 49).ult (rankAtom ranks 74)))) = true)
    (h6845 : ((!((rankAtom ranks 74 == rankAtom ranks 49)) || ((rankAtom ranks 73).ult (rankAtom ranks 48)))) = true)
    (h6846 : ((!((rankAtom ranks 74 == rankAtom ranks 73)) || ((rankAtom ranks 49).ult (rankAtom ranks 48)))) = true)
    (h6847 : ((!((rankAtom ranks 48 == rankAtom ranks 47)) || ((rankAtom ranks 77).ult (rankAtom ranks 76)))) = true) :
    ∀ item ∈ sourceChunk106Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk106Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6784
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6785
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6786
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6787
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6788
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6789
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6790
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6791
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6792
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6793
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6794
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6795
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6796
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6797
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6798
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6799
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6800
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6801
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6802
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6803
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6804
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6805
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6806
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6807
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6808
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6809
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6810
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6811
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6812
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6813
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6814
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6815
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6816
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6817
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6818
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6819
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6820
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6821
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6822
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6823
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6824
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6825
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6826
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6827
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6828
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6829
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6830
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6831
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6832
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6833
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6834
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6835
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6836
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6837
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6838
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6839
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6840
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6841
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6842
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6843
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6844
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6845
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6846
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6847

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
