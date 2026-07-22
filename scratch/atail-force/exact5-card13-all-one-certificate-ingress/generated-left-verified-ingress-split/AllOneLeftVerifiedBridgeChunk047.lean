/-
Generated packed-source bridge for verified left chunk 047.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk047_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h3008 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 50).ult (rankAtom ranks 16)))) = true)
    (h3009 : ((!((rankAtom ranks 4 == rankAtom ranks 50)) || ((rankAtom ranks 0).ult (rankAtom ranks 16)))) = true)
    (h3010 : ((!((rankAtom ranks 16 == rankAtom ranks 0)) || ((rankAtom ranks 50).ult (rankAtom ranks 4)))) = true)
    (h3011 : ((!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 0).ult (rankAtom ranks 4)))) = true)
    (h3012 : ((!((rankAtom ranks 4 == rankAtom ranks 5)) || ((rankAtom ranks 15).ult (rankAtom ranks 16)))) = true)
    (h3013 : ((!((rankAtom ranks 4 == rankAtom ranks 15)) || ((rankAtom ranks 5).ult (rankAtom ranks 16)))) = true)
    (h3014 : ((!((rankAtom ranks 16 == rankAtom ranks 5)) || ((rankAtom ranks 15).ult (rankAtom ranks 4)))) = true)
    (h3015 : ((!((rankAtom ranks 16 == rankAtom ranks 15)) || ((rankAtom ranks 5).ult (rankAtom ranks 4)))) = true)
    (h3016 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 51).ult (rankAtom ranks 17)))) = true)
    (h3017 : ((!((rankAtom ranks 4 == rankAtom ranks 51)) || ((rankAtom ranks 0).ult (rankAtom ranks 17)))) = true)
    (h3018 : ((!((rankAtom ranks 17 == rankAtom ranks 0)) || ((rankAtom ranks 51).ult (rankAtom ranks 4)))) = true)
    (h3019 : ((!((rankAtom ranks 4 == rankAtom ranks 6)) || ((rankAtom ranks 15).ult (rankAtom ranks 17)))) = true)
    (h3020 : ((!((rankAtom ranks 4 == rankAtom ranks 15)) || ((rankAtom ranks 6).ult (rankAtom ranks 17)))) = true)
    (h3021 : ((!((rankAtom ranks 17 == rankAtom ranks 6)) || ((rankAtom ranks 15).ult (rankAtom ranks 4)))) = true)
    (h3022 : ((!((rankAtom ranks 17 == rankAtom ranks 15)) || ((rankAtom ranks 6).ult (rankAtom ranks 4)))) = true)
    (h3023 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 52).ult (rankAtom ranks 18)))) = true)
    (h3024 : ((!((rankAtom ranks 4 == rankAtom ranks 52)) || ((rankAtom ranks 0).ult (rankAtom ranks 18)))) = true)
    (h3025 : ((!((rankAtom ranks 18 == rankAtom ranks 0)) || ((rankAtom ranks 52).ult (rankAtom ranks 4)))) = true)
    (h3026 : ((!((rankAtom ranks 18 == rankAtom ranks 52)) || ((rankAtom ranks 0).ult (rankAtom ranks 4)))) = true)
    (h3027 : ((!((rankAtom ranks 4 == rankAtom ranks 7)) || ((rankAtom ranks 15).ult (rankAtom ranks 18)))) = true)
    (h3028 : ((!((rankAtom ranks 4 == rankAtom ranks 15)) || ((rankAtom ranks 7).ult (rankAtom ranks 18)))) = true)
    (h3029 : ((!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 15).ult (rankAtom ranks 4)))) = true)
    (h3030 : ((!((rankAtom ranks 18 == rankAtom ranks 15)) || ((rankAtom ranks 7).ult (rankAtom ranks 4)))) = true)
    (h3031 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 53).ult (rankAtom ranks 19)))) = true)
    (h3032 : ((!((rankAtom ranks 4 == rankAtom ranks 53)) || ((rankAtom ranks 0).ult (rankAtom ranks 19)))) = true)
    (h3033 : ((!((rankAtom ranks 19 == rankAtom ranks 0)) || ((rankAtom ranks 53).ult (rankAtom ranks 4)))) = true)
    (h3034 : ((!((rankAtom ranks 19 == rankAtom ranks 53)) || ((rankAtom ranks 0).ult (rankAtom ranks 4)))) = true)
    (h3035 : ((!((rankAtom ranks 4 == rankAtom ranks 8)) || ((rankAtom ranks 15).ult (rankAtom ranks 19)))) = true)
    (h3036 : ((!((rankAtom ranks 4 == rankAtom ranks 15)) || ((rankAtom ranks 8).ult (rankAtom ranks 19)))) = true)
    (h3037 : ((!((rankAtom ranks 19 == rankAtom ranks 8)) || ((rankAtom ranks 15).ult (rankAtom ranks 4)))) = true)
    (h3038 : ((!((rankAtom ranks 19 == rankAtom ranks 15)) || ((rankAtom ranks 8).ult (rankAtom ranks 4)))) = true)
    (h3039 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 54).ult (rankAtom ranks 20)))) = true)
    (h3040 : ((!((rankAtom ranks 4 == rankAtom ranks 54)) || ((rankAtom ranks 0).ult (rankAtom ranks 20)))) = true)
    (h3041 : ((!((rankAtom ranks 20 == rankAtom ranks 0)) || ((rankAtom ranks 54).ult (rankAtom ranks 4)))) = true)
    (h3042 : ((!((rankAtom ranks 20 == rankAtom ranks 54)) || ((rankAtom ranks 0).ult (rankAtom ranks 4)))) = true)
    (h3043 : ((!((rankAtom ranks 4 == rankAtom ranks 9)) || ((rankAtom ranks 15).ult (rankAtom ranks 20)))) = true)
    (h3044 : ((!((rankAtom ranks 4 == rankAtom ranks 15)) || ((rankAtom ranks 9).ult (rankAtom ranks 20)))) = true)
    (h3045 : ((!((rankAtom ranks 20 == rankAtom ranks 9)) || ((rankAtom ranks 15).ult (rankAtom ranks 4)))) = true)
    (h3046 : ((!((rankAtom ranks 20 == rankAtom ranks 15)) || ((rankAtom ranks 9).ult (rankAtom ranks 4)))) = true)
    (h3047 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 55).ult (rankAtom ranks 21)))) = true)
    (h3048 : ((!((rankAtom ranks 4 == rankAtom ranks 55)) || ((rankAtom ranks 0).ult (rankAtom ranks 21)))) = true)
    (h3049 : ((!((rankAtom ranks 21 == rankAtom ranks 0)) || ((rankAtom ranks 55).ult (rankAtom ranks 4)))) = true)
    (h3050 : ((!((rankAtom ranks 21 == rankAtom ranks 55)) || ((rankAtom ranks 0).ult (rankAtom ranks 4)))) = true)
    (h3051 : ((!((rankAtom ranks 4 == rankAtom ranks 10)) || ((rankAtom ranks 15).ult (rankAtom ranks 21)))) = true)
    (h3052 : ((!((rankAtom ranks 4 == rankAtom ranks 15)) || ((rankAtom ranks 10).ult (rankAtom ranks 21)))) = true)
    (h3053 : ((!((rankAtom ranks 21 == rankAtom ranks 10)) || ((rankAtom ranks 15).ult (rankAtom ranks 4)))) = true)
    (h3054 : ((!((rankAtom ranks 21 == rankAtom ranks 15)) || ((rankAtom ranks 10).ult (rankAtom ranks 4)))) = true)
    (h3055 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 56).ult (rankAtom ranks 22)))) = true)
    (h3056 : ((!((rankAtom ranks 4 == rankAtom ranks 56)) || ((rankAtom ranks 0).ult (rankAtom ranks 22)))) = true)
    (h3057 : ((!((rankAtom ranks 22 == rankAtom ranks 0)) || ((rankAtom ranks 56).ult (rankAtom ranks 4)))) = true)
    (h3058 : ((!((rankAtom ranks 22 == rankAtom ranks 56)) || ((rankAtom ranks 0).ult (rankAtom ranks 4)))) = true)
    (h3059 : ((!((rankAtom ranks 4 == rankAtom ranks 11)) || ((rankAtom ranks 15).ult (rankAtom ranks 22)))) = true)
    (h3060 : ((!((rankAtom ranks 4 == rankAtom ranks 15)) || ((rankAtom ranks 11).ult (rankAtom ranks 22)))) = true)
    (h3061 : ((!((rankAtom ranks 22 == rankAtom ranks 11)) || ((rankAtom ranks 15).ult (rankAtom ranks 4)))) = true)
    (h3062 : ((!((rankAtom ranks 22 == rankAtom ranks 15)) || ((rankAtom ranks 11).ult (rankAtom ranks 4)))) = true)
    (h3063 : ((!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 57).ult (rankAtom ranks 17)))) = true)
    (h3064 : ((!((rankAtom ranks 5 == rankAtom ranks 57)) || ((rankAtom ranks 0).ult (rankAtom ranks 17)))) = true)
    (h3065 : ((!((rankAtom ranks 17 == rankAtom ranks 0)) || ((rankAtom ranks 57).ult (rankAtom ranks 5)))) = true)
    (h3066 : ((!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 16).ult (rankAtom ranks 17)))) = true)
    (h3067 : ((!((rankAtom ranks 5 == rankAtom ranks 16)) || ((rankAtom ranks 6).ult (rankAtom ranks 17)))) = true)
    (h3068 : ((!((rankAtom ranks 17 == rankAtom ranks 6)) || ((rankAtom ranks 16).ult (rankAtom ranks 5)))) = true)
    (h3069 : ((!((rankAtom ranks 17 == rankAtom ranks 16)) || ((rankAtom ranks 6).ult (rankAtom ranks 5)))) = true)
    (h3070 : ((!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 58).ult (rankAtom ranks 18)))) = true)
    (h3071 : ((!((rankAtom ranks 5 == rankAtom ranks 58)) || ((rankAtom ranks 0).ult (rankAtom ranks 18)))) = true) :
    ∀ item ∈ sourceChunk047Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk047Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3008
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3009
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3010
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3011
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3012
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3013
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3014
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3015
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3016
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3017
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3018
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3019
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3020
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3021
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3022
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3023
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3024
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3025
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3026
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3027
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3028
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3029
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3030
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3031
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3032
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3033
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3034
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3035
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3036
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3037
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3038
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3039
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3040
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3041
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3042
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3043
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3044
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3045
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3046
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3047
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3048
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3049
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3050
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3051
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3052
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3053
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3054
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3055
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3056
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3057
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3058
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3059
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3060
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3061
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3062
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3063
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3064
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3065
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3066
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3067
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3068
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3069
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3070
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3071

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
