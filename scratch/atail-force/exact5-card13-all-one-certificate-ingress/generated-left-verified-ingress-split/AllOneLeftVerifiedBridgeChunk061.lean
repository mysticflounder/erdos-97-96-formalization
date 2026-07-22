/-
Generated packed-source bridge for verified left chunk 061.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk061_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h3904 : ((!((rankAtom ranks 49 == rankAtom ranks 3)) || ((rankAtom ranks 77).ult (rankAtom ranks 10)))) = true)
    (h3905 : ((!((rankAtom ranks 10 == rankAtom ranks 11)) || ((rankAtom ranks 48).ult (rankAtom ranks 49)))) = true)
    (h3906 : ((!((rankAtom ranks 10 == rankAtom ranks 48)) || ((rankAtom ranks 11).ult (rankAtom ranks 49)))) = true)
    (h3907 : ((!((rankAtom ranks 49 == rankAtom ranks 11)) || ((rankAtom ranks 48).ult (rankAtom ranks 10)))) = true)
    (h3908 : ((!((rankAtom ranks 49 == rankAtom ranks 48)) || ((rankAtom ranks 11).ult (rankAtom ranks 10)))) = true)
    (h3909 : ((!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 57).ult (rankAtom ranks 51)))) = true)
    (h3910 : ((!((rankAtom ranks 5 == rankAtom ranks 57)) || ((rankAtom ranks 4).ult (rankAtom ranks 51)))) = true)
    (h3911 : ((!((rankAtom ranks 51 == rankAtom ranks 4)) || ((rankAtom ranks 57).ult (rankAtom ranks 5)))) = true)
    (h3912 : ((!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 4).ult (rankAtom ranks 5)))) = true)
    (h3913 : ((!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 50).ult (rankAtom ranks 51)))) = true)
    (h3914 : ((!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 6).ult (rankAtom ranks 51)))) = true)
    (h3915 : ((!((rankAtom ranks 51 == rankAtom ranks 6)) || ((rankAtom ranks 50).ult (rankAtom ranks 5)))) = true)
    (h3916 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 6).ult (rankAtom ranks 5)))) = true)
    (h3917 : ((!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 58).ult (rankAtom ranks 52)))) = true)
    (h3918 : ((!((rankAtom ranks 5 == rankAtom ranks 58)) || ((rankAtom ranks 4).ult (rankAtom ranks 52)))) = true)
    (h3919 : ((!((rankAtom ranks 52 == rankAtom ranks 4)) || ((rankAtom ranks 58).ult (rankAtom ranks 5)))) = true)
    (h3920 : ((!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 50).ult (rankAtom ranks 52)))) = true)
    (h3921 : ((!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 7).ult (rankAtom ranks 52)))) = true)
    (h3922 : ((!((rankAtom ranks 52 == rankAtom ranks 7)) || ((rankAtom ranks 50).ult (rankAtom ranks 5)))) = true)
    (h3923 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 7).ult (rankAtom ranks 5)))) = true)
    (h3924 : ((!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 59).ult (rankAtom ranks 53)))) = true)
    (h3925 : ((!((rankAtom ranks 5 == rankAtom ranks 59)) || ((rankAtom ranks 4).ult (rankAtom ranks 53)))) = true)
    (h3926 : ((!((rankAtom ranks 53 == rankAtom ranks 4)) || ((rankAtom ranks 59).ult (rankAtom ranks 5)))) = true)
    (h3927 : ((!((rankAtom ranks 53 == rankAtom ranks 59)) || ((rankAtom ranks 4).ult (rankAtom ranks 5)))) = true)
    (h3928 : ((!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 50).ult (rankAtom ranks 53)))) = true)
    (h3929 : ((!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 8).ult (rankAtom ranks 53)))) = true)
    (h3930 : ((!((rankAtom ranks 53 == rankAtom ranks 8)) || ((rankAtom ranks 50).ult (rankAtom ranks 5)))) = true)
    (h3931 : ((!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 8).ult (rankAtom ranks 5)))) = true)
    (h3932 : ((!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 60).ult (rankAtom ranks 54)))) = true)
    (h3933 : ((!((rankAtom ranks 5 == rankAtom ranks 60)) || ((rankAtom ranks 4).ult (rankAtom ranks 54)))) = true)
    (h3934 : ((!((rankAtom ranks 54 == rankAtom ranks 4)) || ((rankAtom ranks 60).ult (rankAtom ranks 5)))) = true)
    (h3935 : ((!((rankAtom ranks 54 == rankAtom ranks 60)) || ((rankAtom ranks 4).ult (rankAtom ranks 5)))) = true)
    (h3936 : ((!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 50).ult (rankAtom ranks 54)))) = true)
    (h3937 : ((!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 9).ult (rankAtom ranks 54)))) = true)
    (h3938 : ((!((rankAtom ranks 54 == rankAtom ranks 9)) || ((rankAtom ranks 50).ult (rankAtom ranks 5)))) = true)
    (h3939 : ((!((rankAtom ranks 54 == rankAtom ranks 50)) || ((rankAtom ranks 9).ult (rankAtom ranks 5)))) = true)
    (h3940 : ((!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 61).ult (rankAtom ranks 55)))) = true)
    (h3941 : ((!((rankAtom ranks 5 == rankAtom ranks 61)) || ((rankAtom ranks 4).ult (rankAtom ranks 55)))) = true)
    (h3942 : ((!((rankAtom ranks 55 == rankAtom ranks 4)) || ((rankAtom ranks 61).ult (rankAtom ranks 5)))) = true)
    (h3943 : ((!((rankAtom ranks 55 == rankAtom ranks 61)) || ((rankAtom ranks 4).ult (rankAtom ranks 5)))) = true)
    (h3944 : ((!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 50).ult (rankAtom ranks 55)))) = true)
    (h3945 : ((!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 10).ult (rankAtom ranks 55)))) = true)
    (h3946 : ((!((rankAtom ranks 55 == rankAtom ranks 10)) || ((rankAtom ranks 50).ult (rankAtom ranks 5)))) = true)
    (h3947 : ((!((rankAtom ranks 55 == rankAtom ranks 50)) || ((rankAtom ranks 10).ult (rankAtom ranks 5)))) = true)
    (h3948 : ((!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 62).ult (rankAtom ranks 56)))) = true)
    (h3949 : ((!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 4).ult (rankAtom ranks 56)))) = true)
    (h3950 : ((!((rankAtom ranks 56 == rankAtom ranks 4)) || ((rankAtom ranks 62).ult (rankAtom ranks 5)))) = true)
    (h3951 : ((!((rankAtom ranks 56 == rankAtom ranks 62)) || ((rankAtom ranks 4).ult (rankAtom ranks 5)))) = true)
    (h3952 : ((!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 50).ult (rankAtom ranks 56)))) = true)
    (h3953 : ((!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 11).ult (rankAtom ranks 56)))) = true)
    (h3954 : ((!((rankAtom ranks 56 == rankAtom ranks 11)) || ((rankAtom ranks 50).ult (rankAtom ranks 5)))) = true)
    (h3955 : ((!((rankAtom ranks 56 == rankAtom ranks 50)) || ((rankAtom ranks 11).ult (rankAtom ranks 5)))) = true)
    (h3956 : ((!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 63).ult (rankAtom ranks 52)))) = true)
    (h3957 : ((!((rankAtom ranks 52 == rankAtom ranks 4)) || ((rankAtom ranks 63).ult (rankAtom ranks 6)))) = true)
    (h3958 : ((!((rankAtom ranks 52 == rankAtom ranks 63)) || ((rankAtom ranks 4).ult (rankAtom ranks 6)))) = true)
    (h3959 : ((!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 51).ult (rankAtom ranks 52)))) = true)
    (h3960 : ((!((rankAtom ranks 6 == rankAtom ranks 51)) || ((rankAtom ranks 7).ult (rankAtom ranks 52)))) = true)
    (h3961 : ((!((rankAtom ranks 52 == rankAtom ranks 7)) || ((rankAtom ranks 51).ult (rankAtom ranks 6)))) = true)
    (h3962 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 7).ult (rankAtom ranks 6)))) = true)
    (h3963 : ((!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 64).ult (rankAtom ranks 53)))) = true)
    (h3964 : ((!((rankAtom ranks 53 == rankAtom ranks 4)) || ((rankAtom ranks 64).ult (rankAtom ranks 6)))) = true)
    (h3965 : ((!((rankAtom ranks 53 == rankAtom ranks 64)) || ((rankAtom ranks 4).ult (rankAtom ranks 6)))) = true)
    (h3966 : ((!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 51).ult (rankAtom ranks 53)))) = true)
    (h3967 : ((!((rankAtom ranks 6 == rankAtom ranks 51)) || ((rankAtom ranks 8).ult (rankAtom ranks 53)))) = true) :
    ∀ item ∈ sourceChunk061Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk061Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3904
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3905
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3906
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3907
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3908
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3909
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3910
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3911
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3912
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3913
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3914
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3915
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3916
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3917
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3918
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3919
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3920
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3921
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3922
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3923
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3924
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3925
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3926
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3927
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3928
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3929
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3930
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3931
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3932
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3933
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3934
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3935
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3936
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3937
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3938
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3939
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3940
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3941
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3942
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3943
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3944
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3945
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3946
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3947
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3948
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3949
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3950
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3951
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3952
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3953
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3954
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3955
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3956
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3957
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3958
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3959
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3960
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3961
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3962
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3963
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3964
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3965
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3966
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3967

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
