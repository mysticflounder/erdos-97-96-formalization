/-
Generated packed-source bridge for verified right chunk 059.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk059_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h3776 : ((!((rankAtom ranks 47 == rankAtom ranks 60)) || ((rankAtom ranks 3).ult (rankAtom ranks 5)))) = true)
    (h3777 : ((!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 43).ult (rankAtom ranks 47)))) = true)
    (h3778 : ((!((rankAtom ranks 5 == rankAtom ranks 43)) || ((rankAtom ranks 9).ult (rankAtom ranks 47)))) = true)
    (h3779 : ((!((rankAtom ranks 47 == rankAtom ranks 9)) || ((rankAtom ranks 43).ult (rankAtom ranks 5)))) = true)
    (h3780 : ((!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 9).ult (rankAtom ranks 5)))) = true)
    (h3781 : ((!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 61).ult (rankAtom ranks 48)))) = true)
    (h3782 : ((!((rankAtom ranks 5 == rankAtom ranks 61)) || ((rankAtom ranks 3).ult (rankAtom ranks 48)))) = true)
    (h3783 : ((!((rankAtom ranks 48 == rankAtom ranks 3)) || ((rankAtom ranks 61).ult (rankAtom ranks 5)))) = true)
    (h3784 : ((!((rankAtom ranks 48 == rankAtom ranks 61)) || ((rankAtom ranks 3).ult (rankAtom ranks 5)))) = true)
    (h3785 : ((!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 43).ult (rankAtom ranks 48)))) = true)
    (h3786 : ((!((rankAtom ranks 5 == rankAtom ranks 43)) || ((rankAtom ranks 10).ult (rankAtom ranks 48)))) = true)
    (h3787 : ((!((rankAtom ranks 48 == rankAtom ranks 10)) || ((rankAtom ranks 43).ult (rankAtom ranks 5)))) = true)
    (h3788 : ((!((rankAtom ranks 48 == rankAtom ranks 43)) || ((rankAtom ranks 10).ult (rankAtom ranks 5)))) = true)
    (h3789 : ((!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 62).ult (rankAtom ranks 49)))) = true)
    (h3790 : ((!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 3).ult (rankAtom ranks 49)))) = true)
    (h3791 : ((!((rankAtom ranks 49 == rankAtom ranks 3)) || ((rankAtom ranks 62).ult (rankAtom ranks 5)))) = true)
    (h3792 : ((!((rankAtom ranks 49 == rankAtom ranks 62)) || ((rankAtom ranks 3).ult (rankAtom ranks 5)))) = true)
    (h3793 : ((!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 43).ult (rankAtom ranks 49)))) = true)
    (h3794 : ((!((rankAtom ranks 5 == rankAtom ranks 43)) || ((rankAtom ranks 11).ult (rankAtom ranks 49)))) = true)
    (h3795 : ((!((rankAtom ranks 49 == rankAtom ranks 11)) || ((rankAtom ranks 43).ult (rankAtom ranks 5)))) = true)
    (h3796 : ((!((rankAtom ranks 49 == rankAtom ranks 43)) || ((rankAtom ranks 11).ult (rankAtom ranks 5)))) = true)
    (h3797 : ((!((rankAtom ranks 6 == rankAtom ranks 3)) || ((rankAtom ranks 63).ult (rankAtom ranks 45)))) = true)
    (h3798 : ((!((rankAtom ranks 45 == rankAtom ranks 3)) || ((rankAtom ranks 63).ult (rankAtom ranks 6)))) = true)
    (h3799 : ((!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 44).ult (rankAtom ranks 45)))) = true)
    (h3800 : ((!((rankAtom ranks 6 == rankAtom ranks 44)) || ((rankAtom ranks 7).ult (rankAtom ranks 45)))) = true)
    (h3801 : ((!((rankAtom ranks 45 == rankAtom ranks 7)) || ((rankAtom ranks 44).ult (rankAtom ranks 6)))) = true)
    (h3802 : ((!((rankAtom ranks 45 == rankAtom ranks 44)) || ((rankAtom ranks 7).ult (rankAtom ranks 6)))) = true)
    (h3803 : ((!((rankAtom ranks 6 == rankAtom ranks 3)) || ((rankAtom ranks 64).ult (rankAtom ranks 46)))) = true)
    (h3804 : ((!((rankAtom ranks 46 == rankAtom ranks 3)) || ((rankAtom ranks 64).ult (rankAtom ranks 6)))) = true)
    (h3805 : ((!((rankAtom ranks 46 == rankAtom ranks 64)) || ((rankAtom ranks 3).ult (rankAtom ranks 6)))) = true)
    (h3806 : ((!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 44).ult (rankAtom ranks 46)))) = true)
    (h3807 : ((!((rankAtom ranks 6 == rankAtom ranks 44)) || ((rankAtom ranks 8).ult (rankAtom ranks 46)))) = true)
    (h3808 : ((!((rankAtom ranks 46 == rankAtom ranks 8)) || ((rankAtom ranks 44).ult (rankAtom ranks 6)))) = true)
    (h3809 : ((!((rankAtom ranks 46 == rankAtom ranks 44)) || ((rankAtom ranks 8).ult (rankAtom ranks 6)))) = true)
    (h3810 : ((!((rankAtom ranks 6 == rankAtom ranks 3)) || ((rankAtom ranks 65).ult (rankAtom ranks 47)))) = true)
    (h3811 : ((!((rankAtom ranks 6 == rankAtom ranks 65)) || ((rankAtom ranks 3).ult (rankAtom ranks 47)))) = true)
    (h3812 : ((!((rankAtom ranks 47 == rankAtom ranks 3)) || ((rankAtom ranks 65).ult (rankAtom ranks 6)))) = true)
    (h3813 : ((!((rankAtom ranks 47 == rankAtom ranks 65)) || ((rankAtom ranks 3).ult (rankAtom ranks 6)))) = true)
    (h3814 : ((!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 44).ult (rankAtom ranks 47)))) = true)
    (h3815 : ((!((rankAtom ranks 6 == rankAtom ranks 44)) || ((rankAtom ranks 9).ult (rankAtom ranks 47)))) = true)
    (h3816 : ((!((rankAtom ranks 47 == rankAtom ranks 9)) || ((rankAtom ranks 44).ult (rankAtom ranks 6)))) = true)
    (h3817 : ((!((rankAtom ranks 47 == rankAtom ranks 44)) || ((rankAtom ranks 9).ult (rankAtom ranks 6)))) = true)
    (h3818 : ((!((rankAtom ranks 6 == rankAtom ranks 3)) || ((rankAtom ranks 66).ult (rankAtom ranks 48)))) = true)
    (h3819 : ((!((rankAtom ranks 6 == rankAtom ranks 66)) || ((rankAtom ranks 3).ult (rankAtom ranks 48)))) = true)
    (h3820 : ((!((rankAtom ranks 48 == rankAtom ranks 3)) || ((rankAtom ranks 66).ult (rankAtom ranks 6)))) = true)
    (h3821 : ((!((rankAtom ranks 48 == rankAtom ranks 66)) || ((rankAtom ranks 3).ult (rankAtom ranks 6)))) = true)
    (h3822 : ((!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 44).ult (rankAtom ranks 48)))) = true)
    (h3823 : ((!((rankAtom ranks 6 == rankAtom ranks 44)) || ((rankAtom ranks 10).ult (rankAtom ranks 48)))) = true)
    (h3824 : ((!((rankAtom ranks 48 == rankAtom ranks 10)) || ((rankAtom ranks 44).ult (rankAtom ranks 6)))) = true)
    (h3825 : ((!((rankAtom ranks 48 == rankAtom ranks 44)) || ((rankAtom ranks 10).ult (rankAtom ranks 6)))) = true)
    (h3826 : ((!((rankAtom ranks 6 == rankAtom ranks 3)) || ((rankAtom ranks 67).ult (rankAtom ranks 49)))) = true)
    (h3827 : ((!((rankAtom ranks 6 == rankAtom ranks 67)) || ((rankAtom ranks 3).ult (rankAtom ranks 49)))) = true)
    (h3828 : ((!((rankAtom ranks 49 == rankAtom ranks 3)) || ((rankAtom ranks 67).ult (rankAtom ranks 6)))) = true)
    (h3829 : ((!((rankAtom ranks 49 == rankAtom ranks 67)) || ((rankAtom ranks 3).ult (rankAtom ranks 6)))) = true)
    (h3830 : ((!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 44).ult (rankAtom ranks 49)))) = true)
    (h3831 : ((!((rankAtom ranks 6 == rankAtom ranks 44)) || ((rankAtom ranks 11).ult (rankAtom ranks 49)))) = true)
    (h3832 : ((!((rankAtom ranks 49 == rankAtom ranks 11)) || ((rankAtom ranks 44).ult (rankAtom ranks 6)))) = true)
    (h3833 : ((!((rankAtom ranks 49 == rankAtom ranks 44)) || ((rankAtom ranks 11).ult (rankAtom ranks 6)))) = true)
    (h3834 : ((!((rankAtom ranks 7 == rankAtom ranks 3)) || ((rankAtom ranks 68).ult (rankAtom ranks 46)))) = true)
    (h3835 : ((!((rankAtom ranks 7 == rankAtom ranks 68)) || ((rankAtom ranks 3).ult (rankAtom ranks 46)))) = true)
    (h3836 : ((!((rankAtom ranks 46 == rankAtom ranks 3)) || ((rankAtom ranks 68).ult (rankAtom ranks 7)))) = true)
    (h3837 : ((!((rankAtom ranks 46 == rankAtom ranks 68)) || ((rankAtom ranks 3).ult (rankAtom ranks 7)))) = true)
    (h3838 : ((!((rankAtom ranks 7 == rankAtom ranks 8)) || ((rankAtom ranks 45).ult (rankAtom ranks 46)))) = true)
    (h3839 : ((!((rankAtom ranks 7 == rankAtom ranks 45)) || ((rankAtom ranks 8).ult (rankAtom ranks 46)))) = true) :
    ∀ item ∈ sourceChunk059Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk059Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3776
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3777
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3778
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3779
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3780
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3781
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3782
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3783
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3784
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3785
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3786
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3787
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3788
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3789
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3790
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3791
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3792
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3793
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3794
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3795
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3796
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3797
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3798
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3799
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3800
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3801
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3802
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3803
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3804
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3805
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3806
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3807
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3808
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3809
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3810
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3811
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3812
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3813
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3814
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3815
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3816
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3817
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3818
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3819
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3820
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3821
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3822
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3823
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3824
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3825
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3826
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3827
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3828
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3829
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3830
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3831
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3832
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3833
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3834
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3835
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3836
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3837
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3838
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3839

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
