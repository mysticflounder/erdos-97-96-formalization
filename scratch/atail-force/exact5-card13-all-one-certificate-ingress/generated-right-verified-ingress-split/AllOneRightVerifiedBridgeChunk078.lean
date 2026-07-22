/-
Generated packed-source bridge for verified right chunk 078.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk078_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h4992 : ((!((rankAtom ranks 19 == rankAtom ranks 74)) || ((rankAtom ranks 15).ult (rankAtom ranks 56)))) = true)
    (h4993 : ((!((rankAtom ranks 56 == rankAtom ranks 15)) || ((rankAtom ranks 74).ult (rankAtom ranks 19)))) = true)
    (h4994 : ((!((rankAtom ranks 56 == rankAtom ranks 74)) || ((rankAtom ranks 15).ult (rankAtom ranks 19)))) = true)
    (h4995 : ((!((rankAtom ranks 19 == rankAtom ranks 22)) || ((rankAtom ranks 53).ult (rankAtom ranks 56)))) = true)
    (h4996 : ((!((rankAtom ranks 19 == rankAtom ranks 53)) || ((rankAtom ranks 22).ult (rankAtom ranks 56)))) = true)
    (h4997 : ((!((rankAtom ranks 56 == rankAtom ranks 22)) || ((rankAtom ranks 53).ult (rankAtom ranks 19)))) = true)
    (h4998 : ((!((rankAtom ranks 56 == rankAtom ranks 53)) || ((rankAtom ranks 22).ult (rankAtom ranks 19)))) = true)
    (h4999 : ((!((rankAtom ranks 20 == rankAtom ranks 15)) || ((rankAtom ranks 75).ult (rankAtom ranks 55)))) = true)
    (h5000 : ((!((rankAtom ranks 20 == rankAtom ranks 75)) || ((rankAtom ranks 15).ult (rankAtom ranks 55)))) = true)
    (h5001 : ((!((rankAtom ranks 55 == rankAtom ranks 15)) || ((rankAtom ranks 75).ult (rankAtom ranks 20)))) = true)
    (h5002 : ((!((rankAtom ranks 55 == rankAtom ranks 75)) || ((rankAtom ranks 15).ult (rankAtom ranks 20)))) = true)
    (h5003 : ((!((rankAtom ranks 20 == rankAtom ranks 21)) || ((rankAtom ranks 54).ult (rankAtom ranks 55)))) = true)
    (h5004 : ((!((rankAtom ranks 20 == rankAtom ranks 54)) || ((rankAtom ranks 21).ult (rankAtom ranks 55)))) = true)
    (h5005 : ((!((rankAtom ranks 55 == rankAtom ranks 21)) || ((rankAtom ranks 54).ult (rankAtom ranks 20)))) = true)
    (h5006 : ((!((rankAtom ranks 55 == rankAtom ranks 54)) || ((rankAtom ranks 21).ult (rankAtom ranks 20)))) = true)
    (h5007 : ((!((rankAtom ranks 20 == rankAtom ranks 15)) || ((rankAtom ranks 76).ult (rankAtom ranks 56)))) = true)
    (h5008 : ((!((rankAtom ranks 20 == rankAtom ranks 76)) || ((rankAtom ranks 15).ult (rankAtom ranks 56)))) = true)
    (h5009 : ((!((rankAtom ranks 56 == rankAtom ranks 15)) || ((rankAtom ranks 76).ult (rankAtom ranks 20)))) = true)
    (h5010 : ((!((rankAtom ranks 20 == rankAtom ranks 22)) || ((rankAtom ranks 54).ult (rankAtom ranks 56)))) = true)
    (h5011 : ((!((rankAtom ranks 20 == rankAtom ranks 54)) || ((rankAtom ranks 22).ult (rankAtom ranks 56)))) = true)
    (h5012 : ((!((rankAtom ranks 56 == rankAtom ranks 54)) || ((rankAtom ranks 22).ult (rankAtom ranks 20)))) = true)
    (h5013 : ((!((rankAtom ranks 21 == rankAtom ranks 15)) || ((rankAtom ranks 77).ult (rankAtom ranks 56)))) = true)
    (h5014 : ((!((rankAtom ranks 21 == rankAtom ranks 77)) || ((rankAtom ranks 15).ult (rankAtom ranks 56)))) = true)
    (h5015 : ((!((rankAtom ranks 56 == rankAtom ranks 15)) || ((rankAtom ranks 77).ult (rankAtom ranks 21)))) = true)
    (h5016 : ((!((rankAtom ranks 21 == rankAtom ranks 22)) || ((rankAtom ranks 55).ult (rankAtom ranks 56)))) = true)
    (h5017 : ((!((rankAtom ranks 21 == rankAtom ranks 55)) || ((rankAtom ranks 22).ult (rankAtom ranks 56)))) = true)
    (h5018 : ((!((rankAtom ranks 56 == rankAtom ranks 22)) || ((rankAtom ranks 55).ult (rankAtom ranks 21)))) = true)
    (h5019 : ((!((rankAtom ranks 56 == rankAtom ranks 55)) || ((rankAtom ranks 22).ult (rankAtom ranks 21)))) = true)
    (h5020 : ((!((rankAtom ranks 17 == rankAtom ranks 16)) || ((rankAtom ranks 63).ult (rankAtom ranks 58)))) = true)
    (h5021 : ((!((rankAtom ranks 17 == rankAtom ranks 63)) || ((rankAtom ranks 16).ult (rankAtom ranks 58)))) = true)
    (h5022 : ((!((rankAtom ranks 58 == rankAtom ranks 16)) || ((rankAtom ranks 63).ult (rankAtom ranks 17)))) = true)
    (h5023 : ((!((rankAtom ranks 17 == rankAtom ranks 18)) || ((rankAtom ranks 57).ult (rankAtom ranks 58)))) = true)
    (h5024 : ((!((rankAtom ranks 17 == rankAtom ranks 57)) || ((rankAtom ranks 18).ult (rankAtom ranks 58)))) = true)
    (h5025 : ((!((rankAtom ranks 58 == rankAtom ranks 18)) || ((rankAtom ranks 57).ult (rankAtom ranks 17)))) = true)
    (h5026 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 18).ult (rankAtom ranks 17)))) = true)
    (h5027 : ((!((rankAtom ranks 17 == rankAtom ranks 16)) || ((rankAtom ranks 64).ult (rankAtom ranks 59)))) = true)
    (h5028 : ((!((rankAtom ranks 17 == rankAtom ranks 64)) || ((rankAtom ranks 16).ult (rankAtom ranks 59)))) = true)
    (h5029 : ((!((rankAtom ranks 59 == rankAtom ranks 16)) || ((rankAtom ranks 64).ult (rankAtom ranks 17)))) = true)
    (h5030 : ((!((rankAtom ranks 59 == rankAtom ranks 64)) || ((rankAtom ranks 16).ult (rankAtom ranks 17)))) = true)
    (h5031 : ((!((rankAtom ranks 17 == rankAtom ranks 19)) || ((rankAtom ranks 57).ult (rankAtom ranks 59)))) = true)
    (h5032 : ((!((rankAtom ranks 59 == rankAtom ranks 19)) || ((rankAtom ranks 57).ult (rankAtom ranks 17)))) = true)
    (h5033 : ((!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 19).ult (rankAtom ranks 17)))) = true)
    (h5034 : ((!((rankAtom ranks 17 == rankAtom ranks 16)) || ((rankAtom ranks 65).ult (rankAtom ranks 60)))) = true)
    (h5035 : ((!((rankAtom ranks 60 == rankAtom ranks 16)) || ((rankAtom ranks 65).ult (rankAtom ranks 17)))) = true)
    (h5036 : ((!((rankAtom ranks 60 == rankAtom ranks 65)) || ((rankAtom ranks 16).ult (rankAtom ranks 17)))) = true)
    (h5037 : ((!((rankAtom ranks 17 == rankAtom ranks 20)) || ((rankAtom ranks 57).ult (rankAtom ranks 60)))) = true)
    (h5038 : ((!((rankAtom ranks 60 == rankAtom ranks 20)) || ((rankAtom ranks 57).ult (rankAtom ranks 17)))) = true)
    (h5039 : ((!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 20).ult (rankAtom ranks 17)))) = true)
    (h5040 : ((!((rankAtom ranks 17 == rankAtom ranks 16)) || ((rankAtom ranks 66).ult (rankAtom ranks 61)))) = true)
    (h5041 : ((!((rankAtom ranks 61 == rankAtom ranks 16)) || ((rankAtom ranks 66).ult (rankAtom ranks 17)))) = true)
    (h5042 : ((!((rankAtom ranks 61 == rankAtom ranks 66)) || ((rankAtom ranks 16).ult (rankAtom ranks 17)))) = true)
    (h5043 : ((!((rankAtom ranks 17 == rankAtom ranks 21)) || ((rankAtom ranks 57).ult (rankAtom ranks 61)))) = true)
    (h5044 : ((!((rankAtom ranks 61 == rankAtom ranks 21)) || ((rankAtom ranks 57).ult (rankAtom ranks 17)))) = true)
    (h5045 : ((!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 21).ult (rankAtom ranks 17)))) = true)
    (h5046 : ((!((rankAtom ranks 17 == rankAtom ranks 16)) || ((rankAtom ranks 67).ult (rankAtom ranks 62)))) = true)
    (h5047 : ((!((rankAtom ranks 17 == rankAtom ranks 67)) || ((rankAtom ranks 16).ult (rankAtom ranks 62)))) = true)
    (h5048 : ((!((rankAtom ranks 62 == rankAtom ranks 16)) || ((rankAtom ranks 67).ult (rankAtom ranks 17)))) = true)
    (h5049 : ((!((rankAtom ranks 17 == rankAtom ranks 22)) || ((rankAtom ranks 57).ult (rankAtom ranks 62)))) = true)
    (h5050 : ((!((rankAtom ranks 62 == rankAtom ranks 57)) || ((rankAtom ranks 22).ult (rankAtom ranks 17)))) = true)
    (h5051 : ((!((rankAtom ranks 18 == rankAtom ranks 16)) || ((rankAtom ranks 68).ult (rankAtom ranks 59)))) = true)
    (h5052 : ((!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 16).ult (rankAtom ranks 59)))) = true)
    (h5053 : ((!((rankAtom ranks 59 == rankAtom ranks 16)) || ((rankAtom ranks 68).ult (rankAtom ranks 18)))) = true)
    (h5054 : ((!((rankAtom ranks 59 == rankAtom ranks 68)) || ((rankAtom ranks 16).ult (rankAtom ranks 18)))) = true)
    (h5055 : ((!((rankAtom ranks 18 == rankAtom ranks 19)) || ((rankAtom ranks 58).ult (rankAtom ranks 59)))) = true) :
    ∀ item ∈ sourceChunk078Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk078Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4992
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4993
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4994
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4995
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4996
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4997
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4998
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4999
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5000
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5001
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5002
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5003
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5004
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5005
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5006
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5007
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5008
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5009
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5010
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5011
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5012
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5013
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5014
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5015
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5016
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5017
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5018
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5019
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5020
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5021
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5022
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5023
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5024
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5025
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5026
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5027
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5028
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5029
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5030
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5031
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5032
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5033
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5034
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5035
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5036
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5037
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5038
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5039
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5040
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5041
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5042
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5043
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5044
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5045
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5046
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5047
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5048
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5049
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5050
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5051
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5052
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5053
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5054
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5055

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
