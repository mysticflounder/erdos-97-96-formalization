/-
Generated packed-source bridge for verified right chunk 093.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk093_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h5952 : ((!((rankAtom ranks 31 == rankAtom ranks 75)) || ((rankAtom ranks 32).ult (rankAtom ranks 76)))) = true)
    (h5953 : ((!((rankAtom ranks 76 == rankAtom ranks 75)) || ((rankAtom ranks 32).ult (rankAtom ranks 31)))) = true)
    (h5954 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 33).ult (rankAtom ranks 34)))) = true)
    (h5955 : ((!((rankAtom ranks 34 == rankAtom ranks 35)) || ((rankAtom ranks 42).ult (rankAtom ranks 43)))) = true)
    (h5956 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 35).ult (rankAtom ranks 43)))) = true)
    (h5957 : ((!((rankAtom ranks 43 == rankAtom ranks 35)) || ((rankAtom ranks 42).ult (rankAtom ranks 34)))) = true)
    (h5958 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 35).ult (rankAtom ranks 34)))) = true)
    (h5959 : ((!((rankAtom ranks 34 == rankAtom ranks 36)) || ((rankAtom ranks 42).ult (rankAtom ranks 44)))) = true)
    (h5960 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 36).ult (rankAtom ranks 44)))) = true)
    (h5961 : ((!((rankAtom ranks 44 == rankAtom ranks 36)) || ((rankAtom ranks 42).ult (rankAtom ranks 34)))) = true)
    (h5962 : ((!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 36).ult (rankAtom ranks 34)))) = true)
    (h5963 : ((!((rankAtom ranks 34 == rankAtom ranks 33)) || ((rankAtom ranks 52).ult (rankAtom ranks 45)))) = true)
    (h5964 : ((!((rankAtom ranks 34 == rankAtom ranks 37)) || ((rankAtom ranks 42).ult (rankAtom ranks 45)))) = true)
    (h5965 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 37).ult (rankAtom ranks 45)))) = true)
    (h5966 : ((!((rankAtom ranks 45 == rankAtom ranks 37)) || ((rankAtom ranks 42).ult (rankAtom ranks 34)))) = true)
    (h5967 : ((!((rankAtom ranks 45 == rankAtom ranks 42)) || ((rankAtom ranks 37).ult (rankAtom ranks 34)))) = true)
    (h5968 : ((!((rankAtom ranks 34 == rankAtom ranks 33)) || ((rankAtom ranks 53).ult (rankAtom ranks 46)))) = true)
    (h5969 : ((!((rankAtom ranks 34 == rankAtom ranks 53)) || ((rankAtom ranks 33).ult (rankAtom ranks 46)))) = true)
    (h5970 : ((!((rankAtom ranks 46 == rankAtom ranks 33)) || ((rankAtom ranks 53).ult (rankAtom ranks 34)))) = true)
    (h5971 : ((!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 33).ult (rankAtom ranks 34)))) = true)
    (h5972 : ((!((rankAtom ranks 34 == rankAtom ranks 38)) || ((rankAtom ranks 42).ult (rankAtom ranks 46)))) = true)
    (h5973 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 38).ult (rankAtom ranks 46)))) = true)
    (h5974 : ((!((rankAtom ranks 46 == rankAtom ranks 38)) || ((rankAtom ranks 42).ult (rankAtom ranks 34)))) = true)
    (h5975 : ((!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 38).ult (rankAtom ranks 34)))) = true)
    (h5976 : ((!((rankAtom ranks 34 == rankAtom ranks 54)) || ((rankAtom ranks 33).ult (rankAtom ranks 47)))) = true)
    (h5977 : ((!((rankAtom ranks 47 == rankAtom ranks 33)) || ((rankAtom ranks 54).ult (rankAtom ranks 34)))) = true)
    (h5978 : ((!((rankAtom ranks 47 == rankAtom ranks 54)) || ((rankAtom ranks 33).ult (rankAtom ranks 34)))) = true)
    (h5979 : ((!((rankAtom ranks 34 == rankAtom ranks 39)) || ((rankAtom ranks 42).ult (rankAtom ranks 47)))) = true)
    (h5980 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 39).ult (rankAtom ranks 47)))) = true)
    (h5981 : ((!((rankAtom ranks 47 == rankAtom ranks 39)) || ((rankAtom ranks 42).ult (rankAtom ranks 34)))) = true)
    (h5982 : ((!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 39).ult (rankAtom ranks 34)))) = true)
    (h5983 : ((!((rankAtom ranks 34 == rankAtom ranks 33)) || ((rankAtom ranks 55).ult (rankAtom ranks 48)))) = true)
    (h5984 : ((!((rankAtom ranks 34 == rankAtom ranks 55)) || ((rankAtom ranks 33).ult (rankAtom ranks 48)))) = true)
    (h5985 : ((!((rankAtom ranks 48 == rankAtom ranks 33)) || ((rankAtom ranks 55).ult (rankAtom ranks 34)))) = true)
    (h5986 : ((!((rankAtom ranks 48 == rankAtom ranks 55)) || ((rankAtom ranks 33).ult (rankAtom ranks 34)))) = true)
    (h5987 : ((!((rankAtom ranks 34 == rankAtom ranks 40)) || ((rankAtom ranks 42).ult (rankAtom ranks 48)))) = true)
    (h5988 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 40).ult (rankAtom ranks 48)))) = true)
    (h5989 : ((!((rankAtom ranks 48 == rankAtom ranks 40)) || ((rankAtom ranks 42).ult (rankAtom ranks 34)))) = true)
    (h5990 : ((!((rankAtom ranks 48 == rankAtom ranks 42)) || ((rankAtom ranks 40).ult (rankAtom ranks 34)))) = true)
    (h5991 : ((!((rankAtom ranks 34 == rankAtom ranks 33)) || ((rankAtom ranks 56).ult (rankAtom ranks 49)))) = true)
    (h5992 : ((!((rankAtom ranks 34 == rankAtom ranks 56)) || ((rankAtom ranks 33).ult (rankAtom ranks 49)))) = true)
    (h5993 : ((!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 56).ult (rankAtom ranks 34)))) = true)
    (h5994 : ((!((rankAtom ranks 34 == rankAtom ranks 41)) || ((rankAtom ranks 42).ult (rankAtom ranks 49)))) = true)
    (h5995 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 41).ult (rankAtom ranks 49)))) = true)
    (h5996 : ((!((rankAtom ranks 49 == rankAtom ranks 42)) || ((rankAtom ranks 41).ult (rankAtom ranks 34)))) = true)
    (h5997 : ((!((rankAtom ranks 35 == rankAtom ranks 36)) || ((rankAtom ranks 43).ult (rankAtom ranks 44)))) = true)
    (h5998 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 36).ult (rankAtom ranks 44)))) = true)
    (h5999 : ((!((rankAtom ranks 44 == rankAtom ranks 36)) || ((rankAtom ranks 43).ult (rankAtom ranks 35)))) = true)
    (h6000 : ((!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 36).ult (rankAtom ranks 35)))) = true)
    (h6001 : ((!((rankAtom ranks 35 == rankAtom ranks 37)) || ((rankAtom ranks 43).ult (rankAtom ranks 45)))) = true)
    (h6002 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 37).ult (rankAtom ranks 45)))) = true)
    (h6003 : ((!((rankAtom ranks 45 == rankAtom ranks 37)) || ((rankAtom ranks 43).ult (rankAtom ranks 35)))) = true)
    (h6004 : ((!((rankAtom ranks 45 == rankAtom ranks 43)) || ((rankAtom ranks 37).ult (rankAtom ranks 35)))) = true)
    (h6005 : ((!((rankAtom ranks 35 == rankAtom ranks 33)) || ((rankAtom ranks 59).ult (rankAtom ranks 46)))) = true)
    (h6006 : ((!((rankAtom ranks 35 == rankAtom ranks 59)) || ((rankAtom ranks 33).ult (rankAtom ranks 46)))) = true)
    (h6007 : ((!((rankAtom ranks 46 == rankAtom ranks 33)) || ((rankAtom ranks 59).ult (rankAtom ranks 35)))) = true)
    (h6008 : ((!((rankAtom ranks 46 == rankAtom ranks 59)) || ((rankAtom ranks 33).ult (rankAtom ranks 35)))) = true)
    (h6009 : ((!((rankAtom ranks 35 == rankAtom ranks 38)) || ((rankAtom ranks 43).ult (rankAtom ranks 46)))) = true)
    (h6010 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 38).ult (rankAtom ranks 46)))) = true)
    (h6011 : ((!((rankAtom ranks 46 == rankAtom ranks 38)) || ((rankAtom ranks 43).ult (rankAtom ranks 35)))) = true)
    (h6012 : ((!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 38).ult (rankAtom ranks 35)))) = true)
    (h6013 : ((!((rankAtom ranks 35 == rankAtom ranks 33)) || ((rankAtom ranks 60).ult (rankAtom ranks 47)))) = true)
    (h6014 : ((!((rankAtom ranks 35 == rankAtom ranks 60)) || ((rankAtom ranks 33).ult (rankAtom ranks 47)))) = true)
    (h6015 : ((!((rankAtom ranks 47 == rankAtom ranks 33)) || ((rankAtom ranks 60).ult (rankAtom ranks 35)))) = true) :
    ∀ item ∈ sourceChunk093Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk093Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5952
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5953
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5954
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5955
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5956
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5957
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5958
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5959
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5960
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5961
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5962
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5963
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5964
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5965
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5966
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5967
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5968
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5969
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5970
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5971
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5972
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5973
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5974
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5975
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5976
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5977
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5978
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5979
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5980
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5981
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5982
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5983
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5984
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5985
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5986
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5987
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5988
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5989
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5990
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5991
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5992
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5993
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5994
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5995
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5996
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5997
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5998
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5999
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6000
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6001
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6002
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6003
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6004
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6005
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6006
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6007
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6008
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6009
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6010
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6011
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6012
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6013
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6014
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6015

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
