/-
Generated packed-source bridge for verified middle chunk 108.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk108_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h6912 : ((!((rankAtom ranks 53 == rankAtom ranks 54)) || ((rankAtom ranks 59).ult (rankAtom ranks 60)))) = true)
    (h6913 : ((!((rankAtom ranks 53 == rankAtom ranks 59)) || ((rankAtom ranks 54).ult (rankAtom ranks 60)))) = true)
    (h6914 : ((!((rankAtom ranks 60 == rankAtom ranks 54)) || ((rankAtom ranks 59).ult (rankAtom ranks 53)))) = true)
    (h6915 : ((!((rankAtom ranks 60 == rankAtom ranks 59)) || ((rankAtom ranks 54).ult (rankAtom ranks 53)))) = true)
    (h6916 : ((!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 73).ult (rankAtom ranks 61)))) = true)
    (h6917 : ((!((rankAtom ranks 53 == rankAtom ranks 73)) || ((rankAtom ranks 50).ult (rankAtom ranks 61)))) = true)
    (h6918 : ((!((rankAtom ranks 61 == rankAtom ranks 50)) || ((rankAtom ranks 73).ult (rankAtom ranks 53)))) = true)
    (h6919 : ((!((rankAtom ranks 61 == rankAtom ranks 73)) || ((rankAtom ranks 50).ult (rankAtom ranks 53)))) = true)
    (h6920 : ((!((rankAtom ranks 53 == rankAtom ranks 55)) || ((rankAtom ranks 59).ult (rankAtom ranks 61)))) = true)
    (h6921 : ((!((rankAtom ranks 53 == rankAtom ranks 59)) || ((rankAtom ranks 55).ult (rankAtom ranks 61)))) = true)
    (h6922 : ((!((rankAtom ranks 61 == rankAtom ranks 55)) || ((rankAtom ranks 59).ult (rankAtom ranks 53)))) = true)
    (h6923 : ((!((rankAtom ranks 61 == rankAtom ranks 59)) || ((rankAtom ranks 55).ult (rankAtom ranks 53)))) = true)
    (h6924 : ((!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 74).ult (rankAtom ranks 62)))) = true)
    (h6925 : ((!((rankAtom ranks 53 == rankAtom ranks 74)) || ((rankAtom ranks 50).ult (rankAtom ranks 62)))) = true)
    (h6926 : ((!((rankAtom ranks 62 == rankAtom ranks 50)) || ((rankAtom ranks 74).ult (rankAtom ranks 53)))) = true)
    (h6927 : ((!((rankAtom ranks 53 == rankAtom ranks 56)) || ((rankAtom ranks 59).ult (rankAtom ranks 62)))) = true)
    (h6928 : ((!((rankAtom ranks 53 == rankAtom ranks 59)) || ((rankAtom ranks 56).ult (rankAtom ranks 62)))) = true)
    (h6929 : ((!((rankAtom ranks 62 == rankAtom ranks 56)) || ((rankAtom ranks 59).ult (rankAtom ranks 53)))) = true)
    (h6930 : ((!((rankAtom ranks 62 == rankAtom ranks 59)) || ((rankAtom ranks 56).ult (rankAtom ranks 53)))) = true)
    (h6931 : ((!((rankAtom ranks 54 == rankAtom ranks 50)) || ((rankAtom ranks 75).ult (rankAtom ranks 61)))) = true)
    (h6932 : ((!((rankAtom ranks 54 == rankAtom ranks 75)) || ((rankAtom ranks 50).ult (rankAtom ranks 61)))) = true)
    (h6933 : ((!((rankAtom ranks 61 == rankAtom ranks 50)) || ((rankAtom ranks 75).ult (rankAtom ranks 54)))) = true)
    (h6934 : ((!((rankAtom ranks 61 == rankAtom ranks 75)) || ((rankAtom ranks 50).ult (rankAtom ranks 54)))) = true)
    (h6935 : ((!((rankAtom ranks 54 == rankAtom ranks 55)) || ((rankAtom ranks 60).ult (rankAtom ranks 61)))) = true)
    (h6936 : ((!((rankAtom ranks 54 == rankAtom ranks 60)) || ((rankAtom ranks 55).ult (rankAtom ranks 61)))) = true)
    (h6937 : ((!((rankAtom ranks 61 == rankAtom ranks 55)) || ((rankAtom ranks 60).ult (rankAtom ranks 54)))) = true)
    (h6938 : ((!((rankAtom ranks 61 == rankAtom ranks 60)) || ((rankAtom ranks 55).ult (rankAtom ranks 54)))) = true)
    (h6939 : ((!((rankAtom ranks 54 == rankAtom ranks 50)) || ((rankAtom ranks 76).ult (rankAtom ranks 62)))) = true)
    (h6940 : ((!((rankAtom ranks 54 == rankAtom ranks 76)) || ((rankAtom ranks 50).ult (rankAtom ranks 62)))) = true)
    (h6941 : ((!((rankAtom ranks 62 == rankAtom ranks 50)) || ((rankAtom ranks 76).ult (rankAtom ranks 54)))) = true)
    (h6942 : ((!((rankAtom ranks 54 == rankAtom ranks 56)) || ((rankAtom ranks 60).ult (rankAtom ranks 62)))) = true)
    (h6943 : ((!((rankAtom ranks 54 == rankAtom ranks 60)) || ((rankAtom ranks 56).ult (rankAtom ranks 62)))) = true)
    (h6944 : ((!((rankAtom ranks 62 == rankAtom ranks 60)) || ((rankAtom ranks 56).ult (rankAtom ranks 54)))) = true)
    (h6945 : ((!((rankAtom ranks 55 == rankAtom ranks 50)) || ((rankAtom ranks 77).ult (rankAtom ranks 62)))) = true)
    (h6946 : ((!((rankAtom ranks 55 == rankAtom ranks 77)) || ((rankAtom ranks 50).ult (rankAtom ranks 62)))) = true)
    (h6947 : ((!((rankAtom ranks 62 == rankAtom ranks 50)) || ((rankAtom ranks 77).ult (rankAtom ranks 55)))) = true)
    (h6948 : ((!((rankAtom ranks 55 == rankAtom ranks 56)) || ((rankAtom ranks 61).ult (rankAtom ranks 62)))) = true)
    (h6949 : ((!((rankAtom ranks 55 == rankAtom ranks 61)) || ((rankAtom ranks 56).ult (rankAtom ranks 62)))) = true)
    (h6950 : ((!((rankAtom ranks 62 == rankAtom ranks 56)) || ((rankAtom ranks 61).ult (rankAtom ranks 55)))) = true)
    (h6951 : ((!((rankAtom ranks 62 == rankAtom ranks 61)) || ((rankAtom ranks 56).ult (rankAtom ranks 55)))) = true)
    (h6952 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 68).ult (rankAtom ranks 64)))) = true)
    (h6953 : ((!((rankAtom ranks 52 == rankAtom ranks 68)) || ((rankAtom ranks 51).ult (rankAtom ranks 64)))) = true)
    (h6954 : ((!((rankAtom ranks 64 == rankAtom ranks 68)) || ((rankAtom ranks 51).ult (rankAtom ranks 52)))) = true)
    (h6955 : ((!((rankAtom ranks 52 == rankAtom ranks 53)) || ((rankAtom ranks 63).ult (rankAtom ranks 64)))) = true)
    (h6956 : ((!((rankAtom ranks 64 == rankAtom ranks 53)) || ((rankAtom ranks 63).ult (rankAtom ranks 52)))) = true)
    (h6957 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 69).ult (rankAtom ranks 65)))) = true)
    (h6958 : ((!((rankAtom ranks 52 == rankAtom ranks 69)) || ((rankAtom ranks 51).ult (rankAtom ranks 65)))) = true)
    (h6959 : ((!((rankAtom ranks 65 == rankAtom ranks 69)) || ((rankAtom ranks 51).ult (rankAtom ranks 52)))) = true)
    (h6960 : ((!((rankAtom ranks 52 == rankAtom ranks 54)) || ((rankAtom ranks 63).ult (rankAtom ranks 65)))) = true)
    (h6961 : ((!((rankAtom ranks 65 == rankAtom ranks 54)) || ((rankAtom ranks 63).ult (rankAtom ranks 52)))) = true)
    (h6962 : ((!((rankAtom ranks 65 == rankAtom ranks 63)) || ((rankAtom ranks 54).ult (rankAtom ranks 52)))) = true)
    (h6963 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 70).ult (rankAtom ranks 66)))) = true)
    (h6964 : ((!((rankAtom ranks 52 == rankAtom ranks 70)) || ((rankAtom ranks 51).ult (rankAtom ranks 66)))) = true)
    (h6965 : ((!((rankAtom ranks 66 == rankAtom ranks 70)) || ((rankAtom ranks 51).ult (rankAtom ranks 52)))) = true)
    (h6966 : ((!((rankAtom ranks 52 == rankAtom ranks 55)) || ((rankAtom ranks 63).ult (rankAtom ranks 66)))) = true)
    (h6967 : ((!((rankAtom ranks 66 == rankAtom ranks 55)) || ((rankAtom ranks 63).ult (rankAtom ranks 52)))) = true)
    (h6968 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 71).ult (rankAtom ranks 67)))) = true)
    (h6969 : ((!((rankAtom ranks 52 == rankAtom ranks 71)) || ((rankAtom ranks 51).ult (rankAtom ranks 67)))) = true)
    (h6970 : ((!((rankAtom ranks 52 == rankAtom ranks 56)) || ((rankAtom ranks 63).ult (rankAtom ranks 67)))) = true)
    (h6971 : ((!((rankAtom ranks 67 == rankAtom ranks 56)) || ((rankAtom ranks 63).ult (rankAtom ranks 52)))) = true)
    (h6972 : ((!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 72).ult (rankAtom ranks 65)))) = true)
    (h6973 : ((!((rankAtom ranks 53 == rankAtom ranks 72)) || ((rankAtom ranks 51).ult (rankAtom ranks 65)))) = true)
    (h6974 : ((!((rankAtom ranks 65 == rankAtom ranks 72)) || ((rankAtom ranks 51).ult (rankAtom ranks 53)))) = true)
    (h6975 : ((!((rankAtom ranks 53 == rankAtom ranks 54)) || ((rankAtom ranks 64).ult (rankAtom ranks 65)))) = true) :
    ∀ item ∈ sourceChunk108Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk108Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6912
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6913
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6914
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6915
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6916
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6917
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6918
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6919
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6920
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6921
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6922
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6923
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6924
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6925
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6926
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6927
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6928
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6929
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6930
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6931
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6932
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6933
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6934
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6935
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6936
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6937
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6938
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6939
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6940
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6941
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6942
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6943
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6944
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6945
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6946
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6947
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6948
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6949
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6950
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6951
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6952
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6953
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6954
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6955
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6956
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6957
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6958
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6959
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6960
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6961
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6962
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6963
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6964
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6965
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6966
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6967
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6968
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6969
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6970
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6971
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6972
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6973
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6974
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6975

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
