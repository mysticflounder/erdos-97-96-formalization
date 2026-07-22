/-
Generated packed-source bridge for verified right chunk 077.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk077_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h4928 : ((!((rankAtom ranks 17 == rankAtom ranks 15)) || ((rankAtom ranks 65).ult (rankAtom ranks 54)))) = true)
    (h4929 : ((!((rankAtom ranks 54 == rankAtom ranks 15)) || ((rankAtom ranks 65).ult (rankAtom ranks 17)))) = true)
    (h4930 : ((!((rankAtom ranks 54 == rankAtom ranks 65)) || ((rankAtom ranks 15).ult (rankAtom ranks 17)))) = true)
    (h4931 : ((!((rankAtom ranks 17 == rankAtom ranks 20)) || ((rankAtom ranks 51).ult (rankAtom ranks 54)))) = true)
    (h4932 : ((!((rankAtom ranks 54 == rankAtom ranks 20)) || ((rankAtom ranks 51).ult (rankAtom ranks 17)))) = true)
    (h4933 : ((!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 20).ult (rankAtom ranks 17)))) = true)
    (h4934 : ((!((rankAtom ranks 17 == rankAtom ranks 15)) || ((rankAtom ranks 66).ult (rankAtom ranks 55)))) = true)
    (h4935 : ((!((rankAtom ranks 55 == rankAtom ranks 15)) || ((rankAtom ranks 66).ult (rankAtom ranks 17)))) = true)
    (h4936 : ((!((rankAtom ranks 55 == rankAtom ranks 66)) || ((rankAtom ranks 15).ult (rankAtom ranks 17)))) = true)
    (h4937 : ((!((rankAtom ranks 17 == rankAtom ranks 21)) || ((rankAtom ranks 51).ult (rankAtom ranks 55)))) = true)
    (h4938 : ((!((rankAtom ranks 55 == rankAtom ranks 21)) || ((rankAtom ranks 51).ult (rankAtom ranks 17)))) = true)
    (h4939 : ((!((rankAtom ranks 55 == rankAtom ranks 51)) || ((rankAtom ranks 21).ult (rankAtom ranks 17)))) = true)
    (h4940 : ((!((rankAtom ranks 17 == rankAtom ranks 15)) || ((rankAtom ranks 67).ult (rankAtom ranks 56)))) = true)
    (h4941 : ((!((rankAtom ranks 56 == rankAtom ranks 15)) || ((rankAtom ranks 67).ult (rankAtom ranks 17)))) = true)
    (h4942 : ((!((rankAtom ranks 17 == rankAtom ranks 22)) || ((rankAtom ranks 51).ult (rankAtom ranks 56)))) = true)
    (h4943 : ((!((rankAtom ranks 56 == rankAtom ranks 51)) || ((rankAtom ranks 22).ult (rankAtom ranks 17)))) = true)
    (h4944 : ((!((rankAtom ranks 18 == rankAtom ranks 15)) || ((rankAtom ranks 68).ult (rankAtom ranks 53)))) = true)
    (h4945 : ((!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 15).ult (rankAtom ranks 53)))) = true)
    (h4946 : ((!((rankAtom ranks 53 == rankAtom ranks 15)) || ((rankAtom ranks 68).ult (rankAtom ranks 18)))) = true)
    (h4947 : ((!((rankAtom ranks 53 == rankAtom ranks 68)) || ((rankAtom ranks 15).ult (rankAtom ranks 18)))) = true)
    (h4948 : ((!((rankAtom ranks 18 == rankAtom ranks 19)) || ((rankAtom ranks 52).ult (rankAtom ranks 53)))) = true)
    (h4949 : ((!((rankAtom ranks 18 == rankAtom ranks 52)) || ((rankAtom ranks 19).ult (rankAtom ranks 53)))) = true)
    (h4950 : ((!((rankAtom ranks 53 == rankAtom ranks 19)) || ((rankAtom ranks 52).ult (rankAtom ranks 18)))) = true)
    (h4951 : ((!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 19).ult (rankAtom ranks 18)))) = true)
    (h4952 : ((!((rankAtom ranks 18 == rankAtom ranks 15)) || ((rankAtom ranks 69).ult (rankAtom ranks 54)))) = true)
    (h4953 : ((!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 15).ult (rankAtom ranks 54)))) = true)
    (h4954 : ((!((rankAtom ranks 54 == rankAtom ranks 15)) || ((rankAtom ranks 69).ult (rankAtom ranks 18)))) = true)
    (h4955 : ((!((rankAtom ranks 54 == rankAtom ranks 69)) || ((rankAtom ranks 15).ult (rankAtom ranks 18)))) = true)
    (h4956 : ((!((rankAtom ranks 18 == rankAtom ranks 20)) || ((rankAtom ranks 52).ult (rankAtom ranks 54)))) = true)
    (h4957 : ((!((rankAtom ranks 18 == rankAtom ranks 52)) || ((rankAtom ranks 20).ult (rankAtom ranks 54)))) = true)
    (h4958 : ((!((rankAtom ranks 54 == rankAtom ranks 20)) || ((rankAtom ranks 52).ult (rankAtom ranks 18)))) = true)
    (h4959 : ((!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 20).ult (rankAtom ranks 18)))) = true)
    (h4960 : ((!((rankAtom ranks 18 == rankAtom ranks 15)) || ((rankAtom ranks 70).ult (rankAtom ranks 55)))) = true)
    (h4961 : ((!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 15).ult (rankAtom ranks 55)))) = true)
    (h4962 : ((!((rankAtom ranks 55 == rankAtom ranks 15)) || ((rankAtom ranks 70).ult (rankAtom ranks 18)))) = true)
    (h4963 : ((!((rankAtom ranks 55 == rankAtom ranks 70)) || ((rankAtom ranks 15).ult (rankAtom ranks 18)))) = true)
    (h4964 : ((!((rankAtom ranks 18 == rankAtom ranks 21)) || ((rankAtom ranks 52).ult (rankAtom ranks 55)))) = true)
    (h4965 : ((!((rankAtom ranks 18 == rankAtom ranks 52)) || ((rankAtom ranks 21).ult (rankAtom ranks 55)))) = true)
    (h4966 : ((!((rankAtom ranks 55 == rankAtom ranks 21)) || ((rankAtom ranks 52).ult (rankAtom ranks 18)))) = true)
    (h4967 : ((!((rankAtom ranks 55 == rankAtom ranks 52)) || ((rankAtom ranks 21).ult (rankAtom ranks 18)))) = true)
    (h4968 : ((!((rankAtom ranks 18 == rankAtom ranks 15)) || ((rankAtom ranks 71).ult (rankAtom ranks 56)))) = true)
    (h4969 : ((!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 15).ult (rankAtom ranks 56)))) = true)
    (h4970 : ((!((rankAtom ranks 56 == rankAtom ranks 15)) || ((rankAtom ranks 71).ult (rankAtom ranks 18)))) = true)
    (h4971 : ((!((rankAtom ranks 56 == rankAtom ranks 71)) || ((rankAtom ranks 15).ult (rankAtom ranks 18)))) = true)
    (h4972 : ((!((rankAtom ranks 18 == rankAtom ranks 22)) || ((rankAtom ranks 52).ult (rankAtom ranks 56)))) = true)
    (h4973 : ((!((rankAtom ranks 18 == rankAtom ranks 52)) || ((rankAtom ranks 22).ult (rankAtom ranks 56)))) = true)
    (h4974 : ((!((rankAtom ranks 56 == rankAtom ranks 52)) || ((rankAtom ranks 22).ult (rankAtom ranks 18)))) = true)
    (h4975 : ((!((rankAtom ranks 19 == rankAtom ranks 15)) || ((rankAtom ranks 72).ult (rankAtom ranks 54)))) = true)
    (h4976 : ((!((rankAtom ranks 19 == rankAtom ranks 72)) || ((rankAtom ranks 15).ult (rankAtom ranks 54)))) = true)
    (h4977 : ((!((rankAtom ranks 54 == rankAtom ranks 15)) || ((rankAtom ranks 72).ult (rankAtom ranks 19)))) = true)
    (h4978 : ((!((rankAtom ranks 54 == rankAtom ranks 72)) || ((rankAtom ranks 15).ult (rankAtom ranks 19)))) = true)
    (h4979 : ((!((rankAtom ranks 19 == rankAtom ranks 20)) || ((rankAtom ranks 53).ult (rankAtom ranks 54)))) = true)
    (h4980 : ((!((rankAtom ranks 19 == rankAtom ranks 53)) || ((rankAtom ranks 20).ult (rankAtom ranks 54)))) = true)
    (h4981 : ((!((rankAtom ranks 54 == rankAtom ranks 20)) || ((rankAtom ranks 53).ult (rankAtom ranks 19)))) = true)
    (h4982 : ((!((rankAtom ranks 54 == rankAtom ranks 53)) || ((rankAtom ranks 20).ult (rankAtom ranks 19)))) = true)
    (h4983 : ((!((rankAtom ranks 19 == rankAtom ranks 15)) || ((rankAtom ranks 73).ult (rankAtom ranks 55)))) = true)
    (h4984 : ((!((rankAtom ranks 19 == rankAtom ranks 73)) || ((rankAtom ranks 15).ult (rankAtom ranks 55)))) = true)
    (h4985 : ((!((rankAtom ranks 55 == rankAtom ranks 15)) || ((rankAtom ranks 73).ult (rankAtom ranks 19)))) = true)
    (h4986 : ((!((rankAtom ranks 55 == rankAtom ranks 73)) || ((rankAtom ranks 15).ult (rankAtom ranks 19)))) = true)
    (h4987 : ((!((rankAtom ranks 19 == rankAtom ranks 21)) || ((rankAtom ranks 53).ult (rankAtom ranks 55)))) = true)
    (h4988 : ((!((rankAtom ranks 19 == rankAtom ranks 53)) || ((rankAtom ranks 21).ult (rankAtom ranks 55)))) = true)
    (h4989 : ((!((rankAtom ranks 55 == rankAtom ranks 21)) || ((rankAtom ranks 53).ult (rankAtom ranks 19)))) = true)
    (h4990 : ((!((rankAtom ranks 55 == rankAtom ranks 53)) || ((rankAtom ranks 21).ult (rankAtom ranks 19)))) = true)
    (h4991 : ((!((rankAtom ranks 19 == rankAtom ranks 15)) || ((rankAtom ranks 74).ult (rankAtom ranks 56)))) = true) :
    ∀ item ∈ sourceChunk077Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk077Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4928
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4929
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4930
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4931
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4932
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4933
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4934
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4935
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4936
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4937
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4938
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4939
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4940
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4941
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4942
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4943
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4944
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4945
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4946
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4947
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4948
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4949
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4950
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4951
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4952
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4953
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4954
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4955
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4956
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4957
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4958
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4959
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4960
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4961
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4962
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4963
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4964
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4965
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4966
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4967
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4968
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4969
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4970
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4971
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4972
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4973
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4974
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4975
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4976
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4977
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4978
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4979
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4980
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4981
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4982
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4983
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4984
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4985
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4986
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4987
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4988
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4989
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4990
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4991

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
