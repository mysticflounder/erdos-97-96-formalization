/-
Generated packed-source bridge for verified middle chunk 092.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk092_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h5888 : ((!((rankAtom ranks 31 == rankAtom ranks 77)) || ((rankAtom ranks 27).ult (rankAtom ranks 67)))) = true)
    (h5889 : ((!((rankAtom ranks 31 == rankAtom ranks 32)) || ((rankAtom ranks 66).ult (rankAtom ranks 67)))) = true)
    (h5890 : ((!((rankAtom ranks 31 == rankAtom ranks 66)) || ((rankAtom ranks 32).ult (rankAtom ranks 67)))) = true)
    (h5891 : ((!((rankAtom ranks 67 == rankAtom ranks 66)) || ((rankAtom ranks 32).ult (rankAtom ranks 31)))) = true)
    (h5892 : ((!((rankAtom ranks 29 == rankAtom ranks 28)) || ((rankAtom ranks 72).ult (rankAtom ranks 69)))) = true)
    (h5893 : ((!((rankAtom ranks 29 == rankAtom ranks 72)) || ((rankAtom ranks 28).ult (rankAtom ranks 69)))) = true)
    (h5894 : ((!((rankAtom ranks 69 == rankAtom ranks 28)) || ((rankAtom ranks 72).ult (rankAtom ranks 29)))) = true)
    (h5895 : ((!((rankAtom ranks 69 == rankAtom ranks 72)) || ((rankAtom ranks 28).ult (rankAtom ranks 29)))) = true)
    (h5896 : ((!((rankAtom ranks 29 == rankAtom ranks 30)) || ((rankAtom ranks 68).ult (rankAtom ranks 69)))) = true)
    (h5897 : ((!((rankAtom ranks 29 == rankAtom ranks 68)) || ((rankAtom ranks 30).ult (rankAtom ranks 69)))) = true)
    (h5898 : ((!((rankAtom ranks 69 == rankAtom ranks 30)) || ((rankAtom ranks 68).ult (rankAtom ranks 29)))) = true)
    (h5899 : ((!((rankAtom ranks 29 == rankAtom ranks 28)) || ((rankAtom ranks 73).ult (rankAtom ranks 70)))) = true)
    (h5900 : ((!((rankAtom ranks 29 == rankAtom ranks 73)) || ((rankAtom ranks 28).ult (rankAtom ranks 70)))) = true)
    (h5901 : ((!((rankAtom ranks 70 == rankAtom ranks 28)) || ((rankAtom ranks 73).ult (rankAtom ranks 29)))) = true)
    (h5902 : ((!((rankAtom ranks 70 == rankAtom ranks 73)) || ((rankAtom ranks 28).ult (rankAtom ranks 29)))) = true)
    (h5903 : ((!((rankAtom ranks 29 == rankAtom ranks 31)) || ((rankAtom ranks 68).ult (rankAtom ranks 70)))) = true)
    (h5904 : ((!((rankAtom ranks 29 == rankAtom ranks 68)) || ((rankAtom ranks 31).ult (rankAtom ranks 70)))) = true)
    (h5905 : ((!((rankAtom ranks 70 == rankAtom ranks 31)) || ((rankAtom ranks 68).ult (rankAtom ranks 29)))) = true)
    (h5906 : ((!((rankAtom ranks 29 == rankAtom ranks 28)) || ((rankAtom ranks 74).ult (rankAtom ranks 71)))) = true)
    (h5907 : ((!((rankAtom ranks 29 == rankAtom ranks 74)) || ((rankAtom ranks 28).ult (rankAtom ranks 71)))) = true)
    (h5908 : ((!((rankAtom ranks 71 == rankAtom ranks 28)) || ((rankAtom ranks 74).ult (rankAtom ranks 29)))) = true)
    (h5909 : ((!((rankAtom ranks 29 == rankAtom ranks 32)) || ((rankAtom ranks 68).ult (rankAtom ranks 71)))) = true)
    (h5910 : ((!((rankAtom ranks 29 == rankAtom ranks 68)) || ((rankAtom ranks 32).ult (rankAtom ranks 71)))) = true)
    (h5911 : ((!((rankAtom ranks 30 == rankAtom ranks 28)) || ((rankAtom ranks 75).ult (rankAtom ranks 70)))) = true)
    (h5912 : ((!((rankAtom ranks 30 == rankAtom ranks 75)) || ((rankAtom ranks 28).ult (rankAtom ranks 70)))) = true)
    (h5913 : ((!((rankAtom ranks 70 == rankAtom ranks 28)) || ((rankAtom ranks 75).ult (rankAtom ranks 30)))) = true)
    (h5914 : ((!((rankAtom ranks 70 == rankAtom ranks 75)) || ((rankAtom ranks 28).ult (rankAtom ranks 30)))) = true)
    (h5915 : ((!((rankAtom ranks 30 == rankAtom ranks 31)) || ((rankAtom ranks 69).ult (rankAtom ranks 70)))) = true)
    (h5916 : ((!((rankAtom ranks 30 == rankAtom ranks 69)) || ((rankAtom ranks 31).ult (rankAtom ranks 70)))) = true)
    (h5917 : ((!((rankAtom ranks 70 == rankAtom ranks 31)) || ((rankAtom ranks 69).ult (rankAtom ranks 30)))) = true)
    (h5918 : ((!((rankAtom ranks 30 == rankAtom ranks 28)) || ((rankAtom ranks 76).ult (rankAtom ranks 71)))) = true)
    (h5919 : ((!((rankAtom ranks 30 == rankAtom ranks 76)) || ((rankAtom ranks 28).ult (rankAtom ranks 71)))) = true)
    (h5920 : ((!((rankAtom ranks 71 == rankAtom ranks 28)) || ((rankAtom ranks 76).ult (rankAtom ranks 30)))) = true)
    (h5921 : ((!((rankAtom ranks 30 == rankAtom ranks 32)) || ((rankAtom ranks 69).ult (rankAtom ranks 71)))) = true)
    (h5922 : ((!((rankAtom ranks 30 == rankAtom ranks 69)) || ((rankAtom ranks 32).ult (rankAtom ranks 71)))) = true)
    (h5923 : ((!((rankAtom ranks 31 == rankAtom ranks 28)) || ((rankAtom ranks 77).ult (rankAtom ranks 71)))) = true)
    (h5924 : ((!((rankAtom ranks 31 == rankAtom ranks 77)) || ((rankAtom ranks 28).ult (rankAtom ranks 71)))) = true)
    (h5925 : ((!((rankAtom ranks 71 == rankAtom ranks 28)) || ((rankAtom ranks 77).ult (rankAtom ranks 31)))) = true)
    (h5926 : ((!((rankAtom ranks 31 == rankAtom ranks 32)) || ((rankAtom ranks 70).ult (rankAtom ranks 71)))) = true)
    (h5927 : ((!((rankAtom ranks 31 == rankAtom ranks 70)) || ((rankAtom ranks 32).ult (rankAtom ranks 71)))) = true)
    (h5928 : ((!((rankAtom ranks 30 == rankAtom ranks 29)) || ((rankAtom ranks 75).ult (rankAtom ranks 73)))) = true)
    (h5929 : ((!((rankAtom ranks 30 == rankAtom ranks 75)) || ((rankAtom ranks 29).ult (rankAtom ranks 73)))) = true)
    (h5930 : ((!((rankAtom ranks 73 == rankAtom ranks 29)) || ((rankAtom ranks 75).ult (rankAtom ranks 30)))) = true)
    (h5931 : ((!((rankAtom ranks 73 == rankAtom ranks 75)) || ((rankAtom ranks 29).ult (rankAtom ranks 30)))) = true)
    (h5932 : ((!((rankAtom ranks 30 == rankAtom ranks 31)) || ((rankAtom ranks 72).ult (rankAtom ranks 73)))) = true)
    (h5933 : ((!((rankAtom ranks 30 == rankAtom ranks 72)) || ((rankAtom ranks 31).ult (rankAtom ranks 73)))) = true)
    (h5934 : ((!((rankAtom ranks 73 == rankAtom ranks 31)) || ((rankAtom ranks 72).ult (rankAtom ranks 30)))) = true)
    (h5935 : ((!((rankAtom ranks 73 == rankAtom ranks 72)) || ((rankAtom ranks 31).ult (rankAtom ranks 30)))) = true)
    (h5936 : ((!((rankAtom ranks 30 == rankAtom ranks 29)) || ((rankAtom ranks 76).ult (rankAtom ranks 74)))) = true)
    (h5937 : ((!((rankAtom ranks 30 == rankAtom ranks 76)) || ((rankAtom ranks 29).ult (rankAtom ranks 74)))) = true)
    (h5938 : ((!((rankAtom ranks 74 == rankAtom ranks 29)) || ((rankAtom ranks 76).ult (rankAtom ranks 30)))) = true)
    (h5939 : ((!((rankAtom ranks 30 == rankAtom ranks 32)) || ((rankAtom ranks 72).ult (rankAtom ranks 74)))) = true)
    (h5940 : ((!((rankAtom ranks 30 == rankAtom ranks 72)) || ((rankAtom ranks 32).ult (rankAtom ranks 74)))) = true)
    (h5941 : ((!((rankAtom ranks 74 == rankAtom ranks 72)) || ((rankAtom ranks 32).ult (rankAtom ranks 30)))) = true)
    (h5942 : ((!((rankAtom ranks 31 == rankAtom ranks 29)) || ((rankAtom ranks 77).ult (rankAtom ranks 74)))) = true)
    (h5943 : ((!((rankAtom ranks 31 == rankAtom ranks 77)) || ((rankAtom ranks 29).ult (rankAtom ranks 74)))) = true)
    (h5944 : ((!((rankAtom ranks 74 == rankAtom ranks 29)) || ((rankAtom ranks 77).ult (rankAtom ranks 31)))) = true)
    (h5945 : ((!((rankAtom ranks 31 == rankAtom ranks 32)) || ((rankAtom ranks 73).ult (rankAtom ranks 74)))) = true)
    (h5946 : ((!((rankAtom ranks 31 == rankAtom ranks 73)) || ((rankAtom ranks 32).ult (rankAtom ranks 74)))) = true)
    (h5947 : ((!((rankAtom ranks 74 == rankAtom ranks 73)) || ((rankAtom ranks 32).ult (rankAtom ranks 31)))) = true)
    (h5948 : ((!((rankAtom ranks 31 == rankAtom ranks 30)) || ((rankAtom ranks 77).ult (rankAtom ranks 76)))) = true)
    (h5949 : ((!((rankAtom ranks 31 == rankAtom ranks 77)) || ((rankAtom ranks 30).ult (rankAtom ranks 76)))) = true)
    (h5950 : ((!((rankAtom ranks 76 == rankAtom ranks 30)) || ((rankAtom ranks 77).ult (rankAtom ranks 31)))) = true)
    (h5951 : ((!((rankAtom ranks 31 == rankAtom ranks 32)) || ((rankAtom ranks 75).ult (rankAtom ranks 76)))) = true) :
    ∀ item ∈ sourceChunk092Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk092Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5888
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5889
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5890
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5891
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5892
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5893
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5894
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5895
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5896
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5897
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5898
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5899
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5900
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5901
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5902
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5903
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5904
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5905
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5906
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5907
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5908
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5909
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5910
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5911
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5912
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5913
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5914
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5915
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5916
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5917
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5918
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5919
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5920
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5921
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5922
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5923
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5924
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5925
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5926
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5927
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5928
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5929
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5930
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5931
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5932
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5933
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5934
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5935
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5936
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5937
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5938
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5939
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5940
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5941
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5942
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5943
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5944
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5945
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5946
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5947
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5948
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5949
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5950
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5951

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
