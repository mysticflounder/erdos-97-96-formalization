/-
Generated packed-source bridge for verified left chunk 060.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk060_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h3840 : ((!((rankAtom ranks 46 == rankAtom ranks 8)) || ((rankAtom ranks 45).ult (rankAtom ranks 7)))) = true)
    (h3841 : ((!((rankAtom ranks 46 == rankAtom ranks 45)) || ((rankAtom ranks 8).ult (rankAtom ranks 7)))) = true)
    (h3842 : ((!((rankAtom ranks 7 == rankAtom ranks 3)) || ((rankAtom ranks 69).ult (rankAtom ranks 47)))) = true)
    (h3843 : ((!((rankAtom ranks 7 == rankAtom ranks 69)) || ((rankAtom ranks 3).ult (rankAtom ranks 47)))) = true)
    (h3844 : ((!((rankAtom ranks 47 == rankAtom ranks 3)) || ((rankAtom ranks 69).ult (rankAtom ranks 7)))) = true)
    (h3845 : ((!((rankAtom ranks 47 == rankAtom ranks 69)) || ((rankAtom ranks 3).ult (rankAtom ranks 7)))) = true)
    (h3846 : ((!((rankAtom ranks 7 == rankAtom ranks 9)) || ((rankAtom ranks 45).ult (rankAtom ranks 47)))) = true)
    (h3847 : ((!((rankAtom ranks 7 == rankAtom ranks 45)) || ((rankAtom ranks 9).ult (rankAtom ranks 47)))) = true)
    (h3848 : ((!((rankAtom ranks 47 == rankAtom ranks 9)) || ((rankAtom ranks 45).ult (rankAtom ranks 7)))) = true)
    (h3849 : ((!((rankAtom ranks 47 == rankAtom ranks 45)) || ((rankAtom ranks 9).ult (rankAtom ranks 7)))) = true)
    (h3850 : ((!((rankAtom ranks 7 == rankAtom ranks 3)) || ((rankAtom ranks 70).ult (rankAtom ranks 48)))) = true)
    (h3851 : ((!((rankAtom ranks 48 == rankAtom ranks 3)) || ((rankAtom ranks 70).ult (rankAtom ranks 7)))) = true)
    (h3852 : ((!((rankAtom ranks 48 == rankAtom ranks 70)) || ((rankAtom ranks 3).ult (rankAtom ranks 7)))) = true)
    (h3853 : ((!((rankAtom ranks 7 == rankAtom ranks 45)) || ((rankAtom ranks 10).ult (rankAtom ranks 48)))) = true)
    (h3854 : ((!((rankAtom ranks 48 == rankAtom ranks 10)) || ((rankAtom ranks 45).ult (rankAtom ranks 7)))) = true)
    (h3855 : ((!((rankAtom ranks 48 == rankAtom ranks 45)) || ((rankAtom ranks 10).ult (rankAtom ranks 7)))) = true)
    (h3856 : ((!((rankAtom ranks 7 == rankAtom ranks 3)) || ((rankAtom ranks 71).ult (rankAtom ranks 49)))) = true)
    (h3857 : ((!((rankAtom ranks 7 == rankAtom ranks 71)) || ((rankAtom ranks 3).ult (rankAtom ranks 49)))) = true)
    (h3858 : ((!((rankAtom ranks 49 == rankAtom ranks 3)) || ((rankAtom ranks 71).ult (rankAtom ranks 7)))) = true)
    (h3859 : ((!((rankAtom ranks 49 == rankAtom ranks 71)) || ((rankAtom ranks 3).ult (rankAtom ranks 7)))) = true)
    (h3860 : ((!((rankAtom ranks 7 == rankAtom ranks 11)) || ((rankAtom ranks 45).ult (rankAtom ranks 49)))) = true)
    (h3861 : ((!((rankAtom ranks 7 == rankAtom ranks 45)) || ((rankAtom ranks 11).ult (rankAtom ranks 49)))) = true)
    (h3862 : ((!((rankAtom ranks 49 == rankAtom ranks 11)) || ((rankAtom ranks 45).ult (rankAtom ranks 7)))) = true)
    (h3863 : ((!((rankAtom ranks 49 == rankAtom ranks 45)) || ((rankAtom ranks 11).ult (rankAtom ranks 7)))) = true)
    (h3864 : ((!((rankAtom ranks 8 == rankAtom ranks 3)) || ((rankAtom ranks 72).ult (rankAtom ranks 47)))) = true)
    (h3865 : ((!((rankAtom ranks 8 == rankAtom ranks 72)) || ((rankAtom ranks 3).ult (rankAtom ranks 47)))) = true)
    (h3866 : ((!((rankAtom ranks 47 == rankAtom ranks 3)) || ((rankAtom ranks 72).ult (rankAtom ranks 8)))) = true)
    (h3867 : ((!((rankAtom ranks 47 == rankAtom ranks 72)) || ((rankAtom ranks 3).ult (rankAtom ranks 8)))) = true)
    (h3868 : ((!((rankAtom ranks 8 == rankAtom ranks 46)) || ((rankAtom ranks 9).ult (rankAtom ranks 47)))) = true)
    (h3869 : ((!((rankAtom ranks 47 == rankAtom ranks 9)) || ((rankAtom ranks 46).ult (rankAtom ranks 8)))) = true)
    (h3870 : ((!((rankAtom ranks 47 == rankAtom ranks 46)) || ((rankAtom ranks 9).ult (rankAtom ranks 8)))) = true)
    (h3871 : ((!((rankAtom ranks 8 == rankAtom ranks 3)) || ((rankAtom ranks 73).ult (rankAtom ranks 48)))) = true)
    (h3872 : ((!((rankAtom ranks 8 == rankAtom ranks 73)) || ((rankAtom ranks 3).ult (rankAtom ranks 48)))) = true)
    (h3873 : ((!((rankAtom ranks 48 == rankAtom ranks 3)) || ((rankAtom ranks 73).ult (rankAtom ranks 8)))) = true)
    (h3874 : ((!((rankAtom ranks 48 == rankAtom ranks 73)) || ((rankAtom ranks 3).ult (rankAtom ranks 8)))) = true)
    (h3875 : ((!((rankAtom ranks 8 == rankAtom ranks 46)) || ((rankAtom ranks 10).ult (rankAtom ranks 48)))) = true)
    (h3876 : ((!((rankAtom ranks 48 == rankAtom ranks 10)) || ((rankAtom ranks 46).ult (rankAtom ranks 8)))) = true)
    (h3877 : ((!((rankAtom ranks 48 == rankAtom ranks 46)) || ((rankAtom ranks 10).ult (rankAtom ranks 8)))) = true)
    (h3878 : ((!((rankAtom ranks 8 == rankAtom ranks 3)) || ((rankAtom ranks 74).ult (rankAtom ranks 49)))) = true)
    (h3879 : ((!((rankAtom ranks 8 == rankAtom ranks 74)) || ((rankAtom ranks 3).ult (rankAtom ranks 49)))) = true)
    (h3880 : ((!((rankAtom ranks 49 == rankAtom ranks 3)) || ((rankAtom ranks 74).ult (rankAtom ranks 8)))) = true)
    (h3881 : ((!((rankAtom ranks 49 == rankAtom ranks 74)) || ((rankAtom ranks 3).ult (rankAtom ranks 8)))) = true)
    (h3882 : ((!((rankAtom ranks 8 == rankAtom ranks 11)) || ((rankAtom ranks 46).ult (rankAtom ranks 49)))) = true)
    (h3883 : ((!((rankAtom ranks 8 == rankAtom ranks 46)) || ((rankAtom ranks 11).ult (rankAtom ranks 49)))) = true)
    (h3884 : ((!((rankAtom ranks 49 == rankAtom ranks 11)) || ((rankAtom ranks 46).ult (rankAtom ranks 8)))) = true)
    (h3885 : ((!((rankAtom ranks 49 == rankAtom ranks 46)) || ((rankAtom ranks 11).ult (rankAtom ranks 8)))) = true)
    (h3886 : ((!((rankAtom ranks 9 == rankAtom ranks 3)) || ((rankAtom ranks 75).ult (rankAtom ranks 48)))) = true)
    (h3887 : ((!((rankAtom ranks 9 == rankAtom ranks 75)) || ((rankAtom ranks 3).ult (rankAtom ranks 48)))) = true)
    (h3888 : ((!((rankAtom ranks 48 == rankAtom ranks 3)) || ((rankAtom ranks 75).ult (rankAtom ranks 9)))) = true)
    (h3889 : ((!((rankAtom ranks 48 == rankAtom ranks 75)) || ((rankAtom ranks 3).ult (rankAtom ranks 9)))) = true)
    (h3890 : ((!((rankAtom ranks 9 == rankAtom ranks 10)) || ((rankAtom ranks 47).ult (rankAtom ranks 48)))) = true)
    (h3891 : ((!((rankAtom ranks 9 == rankAtom ranks 47)) || ((rankAtom ranks 10).ult (rankAtom ranks 48)))) = true)
    (h3892 : ((!((rankAtom ranks 48 == rankAtom ranks 10)) || ((rankAtom ranks 47).ult (rankAtom ranks 9)))) = true)
    (h3893 : ((!((rankAtom ranks 48 == rankAtom ranks 47)) || ((rankAtom ranks 10).ult (rankAtom ranks 9)))) = true)
    (h3894 : ((!((rankAtom ranks 9 == rankAtom ranks 3)) || ((rankAtom ranks 76).ult (rankAtom ranks 49)))) = true)
    (h3895 : ((!((rankAtom ranks 9 == rankAtom ranks 76)) || ((rankAtom ranks 3).ult (rankAtom ranks 49)))) = true)
    (h3896 : ((!((rankAtom ranks 49 == rankAtom ranks 3)) || ((rankAtom ranks 76).ult (rankAtom ranks 9)))) = true)
    (h3897 : ((!((rankAtom ranks 49 == rankAtom ranks 76)) || ((rankAtom ranks 3).ult (rankAtom ranks 9)))) = true)
    (h3898 : ((!((rankAtom ranks 9 == rankAtom ranks 11)) || ((rankAtom ranks 47).ult (rankAtom ranks 49)))) = true)
    (h3899 : ((!((rankAtom ranks 9 == rankAtom ranks 47)) || ((rankAtom ranks 11).ult (rankAtom ranks 49)))) = true)
    (h3900 : ((!((rankAtom ranks 49 == rankAtom ranks 11)) || ((rankAtom ranks 47).ult (rankAtom ranks 9)))) = true)
    (h3901 : ((!((rankAtom ranks 49 == rankAtom ranks 47)) || ((rankAtom ranks 11).ult (rankAtom ranks 9)))) = true)
    (h3902 : ((!((rankAtom ranks 10 == rankAtom ranks 3)) || ((rankAtom ranks 77).ult (rankAtom ranks 49)))) = true)
    (h3903 : ((!((rankAtom ranks 10 == rankAtom ranks 77)) || ((rankAtom ranks 3).ult (rankAtom ranks 49)))) = true) :
    ∀ item ∈ sourceChunk060Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk060Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3840
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3841
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3842
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3843
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3844
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3845
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3846
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3847
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3848
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3849
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3850
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3851
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3852
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3853
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3854
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3855
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3856
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3857
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3858
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3859
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3860
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3861
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3862
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3863
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3864
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3865
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3866
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3867
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3868
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3869
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3870
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3871
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3872
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3873
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3874
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3875
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3876
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3877
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3878
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3879
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3880
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3881
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3882
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3883
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3884
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3885
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3886
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3887
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3888
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3889
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3890
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3891
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3892
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3893
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3894
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3895
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3896
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3897
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3898
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3899
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3900
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3901
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3902
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3903

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
