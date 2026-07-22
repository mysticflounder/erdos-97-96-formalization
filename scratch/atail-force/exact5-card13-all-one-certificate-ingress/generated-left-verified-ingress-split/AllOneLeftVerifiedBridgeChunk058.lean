/-
Generated packed-source bridge for verified left chunk 058.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk058_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h3712 : ((!((rankAtom ranks 45 == rankAtom ranks 3)) || ((rankAtom ranks 52).ult (rankAtom ranks 4)))) = true)
    (h3713 : ((!((rankAtom ranks 45 == rankAtom ranks 52)) || ((rankAtom ranks 3).ult (rankAtom ranks 4)))) = true)
    (h3714 : ((!((rankAtom ranks 4 == rankAtom ranks 7)) || ((rankAtom ranks 42).ult (rankAtom ranks 45)))) = true)
    (h3715 : ((!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 7).ult (rankAtom ranks 45)))) = true)
    (h3716 : ((!((rankAtom ranks 45 == rankAtom ranks 7)) || ((rankAtom ranks 42).ult (rankAtom ranks 4)))) = true)
    (h3717 : ((!((rankAtom ranks 45 == rankAtom ranks 42)) || ((rankAtom ranks 7).ult (rankAtom ranks 4)))) = true)
    (h3718 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 53).ult (rankAtom ranks 46)))) = true)
    (h3719 : ((!((rankAtom ranks 4 == rankAtom ranks 53)) || ((rankAtom ranks 3).ult (rankAtom ranks 46)))) = true)
    (h3720 : ((!((rankAtom ranks 46 == rankAtom ranks 3)) || ((rankAtom ranks 53).ult (rankAtom ranks 4)))) = true)
    (h3721 : ((!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 3).ult (rankAtom ranks 4)))) = true)
    (h3722 : ((!((rankAtom ranks 4 == rankAtom ranks 8)) || ((rankAtom ranks 42).ult (rankAtom ranks 46)))) = true)
    (h3723 : ((!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 8).ult (rankAtom ranks 46)))) = true)
    (h3724 : ((!((rankAtom ranks 46 == rankAtom ranks 8)) || ((rankAtom ranks 42).ult (rankAtom ranks 4)))) = true)
    (h3725 : ((!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 8).ult (rankAtom ranks 4)))) = true)
    (h3726 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 54).ult (rankAtom ranks 47)))) = true)
    (h3727 : ((!((rankAtom ranks 4 == rankAtom ranks 54)) || ((rankAtom ranks 3).ult (rankAtom ranks 47)))) = true)
    (h3728 : ((!((rankAtom ranks 47 == rankAtom ranks 3)) || ((rankAtom ranks 54).ult (rankAtom ranks 4)))) = true)
    (h3729 : ((!((rankAtom ranks 47 == rankAtom ranks 54)) || ((rankAtom ranks 3).ult (rankAtom ranks 4)))) = true)
    (h3730 : ((!((rankAtom ranks 4 == rankAtom ranks 9)) || ((rankAtom ranks 42).ult (rankAtom ranks 47)))) = true)
    (h3731 : ((!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 9).ult (rankAtom ranks 47)))) = true)
    (h3732 : ((!((rankAtom ranks 47 == rankAtom ranks 9)) || ((rankAtom ranks 42).ult (rankAtom ranks 4)))) = true)
    (h3733 : ((!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 9).ult (rankAtom ranks 4)))) = true)
    (h3734 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 55).ult (rankAtom ranks 48)))) = true)
    (h3735 : ((!((rankAtom ranks 4 == rankAtom ranks 55)) || ((rankAtom ranks 3).ult (rankAtom ranks 48)))) = true)
    (h3736 : ((!((rankAtom ranks 48 == rankAtom ranks 3)) || ((rankAtom ranks 55).ult (rankAtom ranks 4)))) = true)
    (h3737 : ((!((rankAtom ranks 48 == rankAtom ranks 55)) || ((rankAtom ranks 3).ult (rankAtom ranks 4)))) = true)
    (h3738 : ((!((rankAtom ranks 4 == rankAtom ranks 10)) || ((rankAtom ranks 42).ult (rankAtom ranks 48)))) = true)
    (h3739 : ((!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 10).ult (rankAtom ranks 48)))) = true)
    (h3740 : ((!((rankAtom ranks 48 == rankAtom ranks 10)) || ((rankAtom ranks 42).ult (rankAtom ranks 4)))) = true)
    (h3741 : ((!((rankAtom ranks 48 == rankAtom ranks 42)) || ((rankAtom ranks 10).ult (rankAtom ranks 4)))) = true)
    (h3742 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 56).ult (rankAtom ranks 49)))) = true)
    (h3743 : ((!((rankAtom ranks 4 == rankAtom ranks 56)) || ((rankAtom ranks 3).ult (rankAtom ranks 49)))) = true)
    (h3744 : ((!((rankAtom ranks 49 == rankAtom ranks 3)) || ((rankAtom ranks 56).ult (rankAtom ranks 4)))) = true)
    (h3745 : ((!((rankAtom ranks 49 == rankAtom ranks 56)) || ((rankAtom ranks 3).ult (rankAtom ranks 4)))) = true)
    (h3746 : ((!((rankAtom ranks 4 == rankAtom ranks 11)) || ((rankAtom ranks 42).ult (rankAtom ranks 49)))) = true)
    (h3747 : ((!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 11).ult (rankAtom ranks 49)))) = true)
    (h3748 : ((!((rankAtom ranks 49 == rankAtom ranks 11)) || ((rankAtom ranks 42).ult (rankAtom ranks 4)))) = true)
    (h3749 : ((!((rankAtom ranks 49 == rankAtom ranks 42)) || ((rankAtom ranks 11).ult (rankAtom ranks 4)))) = true)
    (h3750 : ((!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 57).ult (rankAtom ranks 44)))) = true)
    (h3751 : ((!((rankAtom ranks 5 == rankAtom ranks 57)) || ((rankAtom ranks 3).ult (rankAtom ranks 44)))) = true)
    (h3752 : ((!((rankAtom ranks 44 == rankAtom ranks 3)) || ((rankAtom ranks 57).ult (rankAtom ranks 5)))) = true)
    (h3753 : ((!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 43).ult (rankAtom ranks 44)))) = true)
    (h3754 : ((!((rankAtom ranks 5 == rankAtom ranks 43)) || ((rankAtom ranks 6).ult (rankAtom ranks 44)))) = true)
    (h3755 : ((!((rankAtom ranks 44 == rankAtom ranks 6)) || ((rankAtom ranks 43).ult (rankAtom ranks 5)))) = true)
    (h3756 : ((!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 6).ult (rankAtom ranks 5)))) = true)
    (h3757 : ((!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 58).ult (rankAtom ranks 45)))) = true)
    (h3758 : ((!((rankAtom ranks 5 == rankAtom ranks 58)) || ((rankAtom ranks 3).ult (rankAtom ranks 45)))) = true)
    (h3759 : ((!((rankAtom ranks 45 == rankAtom ranks 3)) || ((rankAtom ranks 58).ult (rankAtom ranks 5)))) = true)
    (h3760 : ((!((rankAtom ranks 45 == rankAtom ranks 58)) || ((rankAtom ranks 3).ult (rankAtom ranks 5)))) = true)
    (h3761 : ((!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 43).ult (rankAtom ranks 45)))) = true)
    (h3762 : ((!((rankAtom ranks 5 == rankAtom ranks 43)) || ((rankAtom ranks 7).ult (rankAtom ranks 45)))) = true)
    (h3763 : ((!((rankAtom ranks 45 == rankAtom ranks 7)) || ((rankAtom ranks 43).ult (rankAtom ranks 5)))) = true)
    (h3764 : ((!((rankAtom ranks 45 == rankAtom ranks 43)) || ((rankAtom ranks 7).ult (rankAtom ranks 5)))) = true)
    (h3765 : ((!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 59).ult (rankAtom ranks 46)))) = true)
    (h3766 : ((!((rankAtom ranks 5 == rankAtom ranks 59)) || ((rankAtom ranks 3).ult (rankAtom ranks 46)))) = true)
    (h3767 : ((!((rankAtom ranks 46 == rankAtom ranks 3)) || ((rankAtom ranks 59).ult (rankAtom ranks 5)))) = true)
    (h3768 : ((!((rankAtom ranks 46 == rankAtom ranks 59)) || ((rankAtom ranks 3).ult (rankAtom ranks 5)))) = true)
    (h3769 : ((!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 43).ult (rankAtom ranks 46)))) = true)
    (h3770 : ((!((rankAtom ranks 5 == rankAtom ranks 43)) || ((rankAtom ranks 8).ult (rankAtom ranks 46)))) = true)
    (h3771 : ((!((rankAtom ranks 46 == rankAtom ranks 8)) || ((rankAtom ranks 43).ult (rankAtom ranks 5)))) = true)
    (h3772 : ((!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 8).ult (rankAtom ranks 5)))) = true)
    (h3773 : ((!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 60).ult (rankAtom ranks 47)))) = true)
    (h3774 : ((!((rankAtom ranks 5 == rankAtom ranks 60)) || ((rankAtom ranks 3).ult (rankAtom ranks 47)))) = true)
    (h3775 : ((!((rankAtom ranks 47 == rankAtom ranks 3)) || ((rankAtom ranks 60).ult (rankAtom ranks 5)))) = true) :
    ∀ item ∈ sourceChunk058Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk058Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3712
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3713
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3714
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3715
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3716
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3717
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3718
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3719
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3720
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3721
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3722
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3723
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3724
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3725
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3726
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3727
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3728
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3729
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3730
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3731
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3732
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3733
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3734
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3735
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3736
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3737
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3738
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3739
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3740
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3741
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3742
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3743
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3744
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3745
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3746
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3747
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3748
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3749
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3750
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3751
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3752
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3753
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3754
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3755
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3756
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3757
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3758
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3759
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3760
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3761
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3762
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3763
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3764
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3765
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3766
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3767
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3768
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3769
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3770
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3771
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3772
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3773
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3774
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3775

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
