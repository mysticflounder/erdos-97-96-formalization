/-
Generated packed-source bridge for verified middle chunk 076.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk076_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h4864 : ((!((rankAtom ranks 21 == rankAtom ranks 14)) || ((rankAtom ranks 77).ult (rankAtom ranks 49)))) = true)
    (h4865 : ((!((rankAtom ranks 21 == rankAtom ranks 77)) || ((rankAtom ranks 14).ult (rankAtom ranks 49)))) = true)
    (h4866 : ((!((rankAtom ranks 49 == rankAtom ranks 14)) || ((rankAtom ranks 77).ult (rankAtom ranks 21)))) = true)
    (h4867 : ((!((rankAtom ranks 49 == rankAtom ranks 77)) || ((rankAtom ranks 14).ult (rankAtom ranks 21)))) = true)
    (h4868 : ((!((rankAtom ranks 21 == rankAtom ranks 22)) || ((rankAtom ranks 48).ult (rankAtom ranks 49)))) = true)
    (h4869 : ((!((rankAtom ranks 21 == rankAtom ranks 48)) || ((rankAtom ranks 22).ult (rankAtom ranks 49)))) = true)
    (h4870 : ((!((rankAtom ranks 49 == rankAtom ranks 48)) || ((rankAtom ranks 22).ult (rankAtom ranks 21)))) = true)
    (h4871 : ((!((rankAtom ranks 16 == rankAtom ranks 15)) || ((rankAtom ranks 57).ult (rankAtom ranks 51)))) = true)
    (h4872 : ((!((rankAtom ranks 16 == rankAtom ranks 57)) || ((rankAtom ranks 15).ult (rankAtom ranks 51)))) = true)
    (h4873 : ((!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 15).ult (rankAtom ranks 16)))) = true)
    (h4874 : ((!((rankAtom ranks 16 == rankAtom ranks 17)) || ((rankAtom ranks 50).ult (rankAtom ranks 51)))) = true)
    (h4875 : ((!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 17).ult (rankAtom ranks 51)))) = true)
    (h4876 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 17).ult (rankAtom ranks 16)))) = true)
    (h4877 : ((!((rankAtom ranks 16 == rankAtom ranks 15)) || ((rankAtom ranks 58).ult (rankAtom ranks 52)))) = true)
    (h4878 : ((!((rankAtom ranks 16 == rankAtom ranks 58)) || ((rankAtom ranks 15).ult (rankAtom ranks 52)))) = true)
    (h4879 : ((!((rankAtom ranks 52 == rankAtom ranks 15)) || ((rankAtom ranks 58).ult (rankAtom ranks 16)))) = true)
    (h4880 : ((!((rankAtom ranks 16 == rankAtom ranks 18)) || ((rankAtom ranks 50).ult (rankAtom ranks 52)))) = true)
    (h4881 : ((!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 18).ult (rankAtom ranks 52)))) = true)
    (h4882 : ((!((rankAtom ranks 52 == rankAtom ranks 18)) || ((rankAtom ranks 50).ult (rankAtom ranks 16)))) = true)
    (h4883 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 18).ult (rankAtom ranks 16)))) = true)
    (h4884 : ((!((rankAtom ranks 16 == rankAtom ranks 15)) || ((rankAtom ranks 59).ult (rankAtom ranks 53)))) = true)
    (h4885 : ((!((rankAtom ranks 16 == rankAtom ranks 59)) || ((rankAtom ranks 15).ult (rankAtom ranks 53)))) = true)
    (h4886 : ((!((rankAtom ranks 53 == rankAtom ranks 15)) || ((rankAtom ranks 59).ult (rankAtom ranks 16)))) = true)
    (h4887 : ((!((rankAtom ranks 53 == rankAtom ranks 59)) || ((rankAtom ranks 15).ult (rankAtom ranks 16)))) = true)
    (h4888 : ((!((rankAtom ranks 16 == rankAtom ranks 19)) || ((rankAtom ranks 50).ult (rankAtom ranks 53)))) = true)
    (h4889 : ((!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 19).ult (rankAtom ranks 53)))) = true)
    (h4890 : ((!((rankAtom ranks 53 == rankAtom ranks 19)) || ((rankAtom ranks 50).ult (rankAtom ranks 16)))) = true)
    (h4891 : ((!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 19).ult (rankAtom ranks 16)))) = true)
    (h4892 : ((!((rankAtom ranks 16 == rankAtom ranks 15)) || ((rankAtom ranks 60).ult (rankAtom ranks 54)))) = true)
    (h4893 : ((!((rankAtom ranks 16 == rankAtom ranks 60)) || ((rankAtom ranks 15).ult (rankAtom ranks 54)))) = true)
    (h4894 : ((!((rankAtom ranks 54 == rankAtom ranks 15)) || ((rankAtom ranks 60).ult (rankAtom ranks 16)))) = true)
    (h4895 : ((!((rankAtom ranks 54 == rankAtom ranks 60)) || ((rankAtom ranks 15).ult (rankAtom ranks 16)))) = true)
    (h4896 : ((!((rankAtom ranks 16 == rankAtom ranks 20)) || ((rankAtom ranks 50).ult (rankAtom ranks 54)))) = true)
    (h4897 : ((!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 20).ult (rankAtom ranks 54)))) = true)
    (h4898 : ((!((rankAtom ranks 54 == rankAtom ranks 20)) || ((rankAtom ranks 50).ult (rankAtom ranks 16)))) = true)
    (h4899 : ((!((rankAtom ranks 54 == rankAtom ranks 50)) || ((rankAtom ranks 20).ult (rankAtom ranks 16)))) = true)
    (h4900 : ((!((rankAtom ranks 16 == rankAtom ranks 15)) || ((rankAtom ranks 61).ult (rankAtom ranks 55)))) = true)
    (h4901 : ((!((rankAtom ranks 16 == rankAtom ranks 61)) || ((rankAtom ranks 15).ult (rankAtom ranks 55)))) = true)
    (h4902 : ((!((rankAtom ranks 55 == rankAtom ranks 15)) || ((rankAtom ranks 61).ult (rankAtom ranks 16)))) = true)
    (h4903 : ((!((rankAtom ranks 55 == rankAtom ranks 61)) || ((rankAtom ranks 15).ult (rankAtom ranks 16)))) = true)
    (h4904 : ((!((rankAtom ranks 16 == rankAtom ranks 21)) || ((rankAtom ranks 50).ult (rankAtom ranks 55)))) = true)
    (h4905 : ((!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 21).ult (rankAtom ranks 55)))) = true)
    (h4906 : ((!((rankAtom ranks 55 == rankAtom ranks 21)) || ((rankAtom ranks 50).ult (rankAtom ranks 16)))) = true)
    (h4907 : ((!((rankAtom ranks 55 == rankAtom ranks 50)) || ((rankAtom ranks 21).ult (rankAtom ranks 16)))) = true)
    (h4908 : ((!((rankAtom ranks 16 == rankAtom ranks 15)) || ((rankAtom ranks 62).ult (rankAtom ranks 56)))) = true)
    (h4909 : ((!((rankAtom ranks 16 == rankAtom ranks 62)) || ((rankAtom ranks 15).ult (rankAtom ranks 56)))) = true)
    (h4910 : ((!((rankAtom ranks 56 == rankAtom ranks 15)) || ((rankAtom ranks 62).ult (rankAtom ranks 16)))) = true)
    (h4911 : ((!((rankAtom ranks 56 == rankAtom ranks 62)) || ((rankAtom ranks 15).ult (rankAtom ranks 16)))) = true)
    (h4912 : ((!((rankAtom ranks 16 == rankAtom ranks 22)) || ((rankAtom ranks 50).ult (rankAtom ranks 56)))) = true)
    (h4913 : ((!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 22).ult (rankAtom ranks 56)))) = true)
    (h4914 : ((!((rankAtom ranks 56 == rankAtom ranks 50)) || ((rankAtom ranks 22).ult (rankAtom ranks 16)))) = true)
    (h4915 : ((!((rankAtom ranks 17 == rankAtom ranks 15)) || ((rankAtom ranks 63).ult (rankAtom ranks 52)))) = true)
    (h4916 : ((!((rankAtom ranks 17 == rankAtom ranks 63)) || ((rankAtom ranks 15).ult (rankAtom ranks 52)))) = true)
    (h4917 : ((!((rankAtom ranks 52 == rankAtom ranks 15)) || ((rankAtom ranks 63).ult (rankAtom ranks 17)))) = true)
    (h4918 : ((!((rankAtom ranks 17 == rankAtom ranks 18)) || ((rankAtom ranks 51).ult (rankAtom ranks 52)))) = true)
    (h4919 : ((!((rankAtom ranks 52 == rankAtom ranks 18)) || ((rankAtom ranks 51).ult (rankAtom ranks 17)))) = true)
    (h4920 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 18).ult (rankAtom ranks 17)))) = true)
    (h4921 : ((!((rankAtom ranks 17 == rankAtom ranks 15)) || ((rankAtom ranks 64).ult (rankAtom ranks 53)))) = true)
    (h4922 : ((!((rankAtom ranks 17 == rankAtom ranks 64)) || ((rankAtom ranks 15).ult (rankAtom ranks 53)))) = true)
    (h4923 : ((!((rankAtom ranks 53 == rankAtom ranks 15)) || ((rankAtom ranks 64).ult (rankAtom ranks 17)))) = true)
    (h4924 : ((!((rankAtom ranks 53 == rankAtom ranks 64)) || ((rankAtom ranks 15).ult (rankAtom ranks 17)))) = true)
    (h4925 : ((!((rankAtom ranks 17 == rankAtom ranks 19)) || ((rankAtom ranks 51).ult (rankAtom ranks 53)))) = true)
    (h4926 : ((!((rankAtom ranks 53 == rankAtom ranks 19)) || ((rankAtom ranks 51).ult (rankAtom ranks 17)))) = true)
    (h4927 : ((!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 19).ult (rankAtom ranks 17)))) = true) :
    ∀ item ∈ sourceChunk076Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk076Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4864
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4865
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4866
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4867
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4868
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4869
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4870
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4871
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4872
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4873
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4874
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4875
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4876
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4877
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4878
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4879
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4880
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4881
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4882
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4883
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4884
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4885
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4886
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4887
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4888
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4889
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4890
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4891
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4892
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4893
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4894
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4895
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4896
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4897
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4898
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4899
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4900
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4901
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4902
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4903
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4904
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4905
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4906
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4907
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4908
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4909
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4910
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4911
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4912
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4913
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4914
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4915
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4916
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4917
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4918
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4919
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4920
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4921
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4922
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4923
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4924
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4925
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4926
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4927

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
