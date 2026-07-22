/-
Generated packed-source bridge for verified right chunk 048.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk048_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h3072 : ((!((rankAtom ranks 18 == rankAtom ranks 0)) || ((rankAtom ranks 58).ult (rankAtom ranks 5)))) = true)
    (h3073 : ((!((rankAtom ranks 18 == rankAtom ranks 58)) || ((rankAtom ranks 0).ult (rankAtom ranks 5)))) = true)
    (h3074 : ((!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 16).ult (rankAtom ranks 18)))) = true)
    (h3075 : ((!((rankAtom ranks 5 == rankAtom ranks 16)) || ((rankAtom ranks 7).ult (rankAtom ranks 18)))) = true)
    (h3076 : ((!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 16).ult (rankAtom ranks 5)))) = true)
    (h3077 : ((!((rankAtom ranks 18 == rankAtom ranks 16)) || ((rankAtom ranks 7).ult (rankAtom ranks 5)))) = true)
    (h3078 : ((!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 59).ult (rankAtom ranks 19)))) = true)
    (h3079 : ((!((rankAtom ranks 5 == rankAtom ranks 59)) || ((rankAtom ranks 0).ult (rankAtom ranks 19)))) = true)
    (h3080 : ((!((rankAtom ranks 19 == rankAtom ranks 0)) || ((rankAtom ranks 59).ult (rankAtom ranks 5)))) = true)
    (h3081 : ((!((rankAtom ranks 19 == rankAtom ranks 59)) || ((rankAtom ranks 0).ult (rankAtom ranks 5)))) = true)
    (h3082 : ((!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 16).ult (rankAtom ranks 19)))) = true)
    (h3083 : ((!((rankAtom ranks 5 == rankAtom ranks 16)) || ((rankAtom ranks 8).ult (rankAtom ranks 19)))) = true)
    (h3084 : ((!((rankAtom ranks 19 == rankAtom ranks 8)) || ((rankAtom ranks 16).ult (rankAtom ranks 5)))) = true)
    (h3085 : ((!((rankAtom ranks 19 == rankAtom ranks 16)) || ((rankAtom ranks 8).ult (rankAtom ranks 5)))) = true)
    (h3086 : ((!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 60).ult (rankAtom ranks 20)))) = true)
    (h3087 : ((!((rankAtom ranks 5 == rankAtom ranks 60)) || ((rankAtom ranks 0).ult (rankAtom ranks 20)))) = true)
    (h3088 : ((!((rankAtom ranks 20 == rankAtom ranks 0)) || ((rankAtom ranks 60).ult (rankAtom ranks 5)))) = true)
    (h3089 : ((!((rankAtom ranks 20 == rankAtom ranks 60)) || ((rankAtom ranks 0).ult (rankAtom ranks 5)))) = true)
    (h3090 : ((!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 16).ult (rankAtom ranks 20)))) = true)
    (h3091 : ((!((rankAtom ranks 5 == rankAtom ranks 16)) || ((rankAtom ranks 9).ult (rankAtom ranks 20)))) = true)
    (h3092 : ((!((rankAtom ranks 20 == rankAtom ranks 9)) || ((rankAtom ranks 16).ult (rankAtom ranks 5)))) = true)
    (h3093 : ((!((rankAtom ranks 20 == rankAtom ranks 16)) || ((rankAtom ranks 9).ult (rankAtom ranks 5)))) = true)
    (h3094 : ((!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 61).ult (rankAtom ranks 21)))) = true)
    (h3095 : ((!((rankAtom ranks 5 == rankAtom ranks 61)) || ((rankAtom ranks 0).ult (rankAtom ranks 21)))) = true)
    (h3096 : ((!((rankAtom ranks 21 == rankAtom ranks 0)) || ((rankAtom ranks 61).ult (rankAtom ranks 5)))) = true)
    (h3097 : ((!((rankAtom ranks 21 == rankAtom ranks 61)) || ((rankAtom ranks 0).ult (rankAtom ranks 5)))) = true)
    (h3098 : ((!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 16).ult (rankAtom ranks 21)))) = true)
    (h3099 : ((!((rankAtom ranks 5 == rankAtom ranks 16)) || ((rankAtom ranks 10).ult (rankAtom ranks 21)))) = true)
    (h3100 : ((!((rankAtom ranks 21 == rankAtom ranks 10)) || ((rankAtom ranks 16).ult (rankAtom ranks 5)))) = true)
    (h3101 : ((!((rankAtom ranks 21 == rankAtom ranks 16)) || ((rankAtom ranks 10).ult (rankAtom ranks 5)))) = true)
    (h3102 : ((!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 62).ult (rankAtom ranks 22)))) = true)
    (h3103 : ((!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 0).ult (rankAtom ranks 22)))) = true)
    (h3104 : ((!((rankAtom ranks 22 == rankAtom ranks 0)) || ((rankAtom ranks 62).ult (rankAtom ranks 5)))) = true)
    (h3105 : ((!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 16).ult (rankAtom ranks 22)))) = true)
    (h3106 : ((!((rankAtom ranks 5 == rankAtom ranks 16)) || ((rankAtom ranks 11).ult (rankAtom ranks 22)))) = true)
    (h3107 : ((!((rankAtom ranks 22 == rankAtom ranks 11)) || ((rankAtom ranks 16).ult (rankAtom ranks 5)))) = true)
    (h3108 : ((!((rankAtom ranks 22 == rankAtom ranks 16)) || ((rankAtom ranks 11).ult (rankAtom ranks 5)))) = true)
    (h3109 : ((!((rankAtom ranks 6 == rankAtom ranks 0)) || ((rankAtom ranks 63).ult (rankAtom ranks 18)))) = true)
    (h3110 : ((!((rankAtom ranks 18 == rankAtom ranks 0)) || ((rankAtom ranks 63).ult (rankAtom ranks 6)))) = true)
    (h3111 : ((!((rankAtom ranks 18 == rankAtom ranks 63)) || ((rankAtom ranks 0).ult (rankAtom ranks 6)))) = true)
    (h3112 : ((!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 17).ult (rankAtom ranks 18)))) = true)
    (h3113 : ((!((rankAtom ranks 6 == rankAtom ranks 17)) || ((rankAtom ranks 7).ult (rankAtom ranks 18)))) = true)
    (h3114 : ((!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 17).ult (rankAtom ranks 6)))) = true)
    (h3115 : ((!((rankAtom ranks 18 == rankAtom ranks 17)) || ((rankAtom ranks 7).ult (rankAtom ranks 6)))) = true)
    (h3116 : ((!((rankAtom ranks 6 == rankAtom ranks 0)) || ((rankAtom ranks 64).ult (rankAtom ranks 19)))) = true)
    (h3117 : ((!((rankAtom ranks 19 == rankAtom ranks 0)) || ((rankAtom ranks 64).ult (rankAtom ranks 6)))) = true)
    (h3118 : ((!((rankAtom ranks 19 == rankAtom ranks 64)) || ((rankAtom ranks 0).ult (rankAtom ranks 6)))) = true)
    (h3119 : ((!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 17).ult (rankAtom ranks 19)))) = true)
    (h3120 : ((!((rankAtom ranks 6 == rankAtom ranks 17)) || ((rankAtom ranks 8).ult (rankAtom ranks 19)))) = true)
    (h3121 : ((!((rankAtom ranks 19 == rankAtom ranks 8)) || ((rankAtom ranks 17).ult (rankAtom ranks 6)))) = true)
    (h3122 : ((!((rankAtom ranks 19 == rankAtom ranks 17)) || ((rankAtom ranks 8).ult (rankAtom ranks 6)))) = true)
    (h3123 : ((!((rankAtom ranks 6 == rankAtom ranks 0)) || ((rankAtom ranks 65).ult (rankAtom ranks 20)))) = true)
    (h3124 : ((!((rankAtom ranks 20 == rankAtom ranks 0)) || ((rankAtom ranks 65).ult (rankAtom ranks 6)))) = true)
    (h3125 : ((!((rankAtom ranks 20 == rankAtom ranks 65)) || ((rankAtom ranks 0).ult (rankAtom ranks 6)))) = true)
    (h3126 : ((!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 17).ult (rankAtom ranks 20)))) = true)
    (h3127 : ((!((rankAtom ranks 6 == rankAtom ranks 17)) || ((rankAtom ranks 9).ult (rankAtom ranks 20)))) = true)
    (h3128 : ((!((rankAtom ranks 20 == rankAtom ranks 9)) || ((rankAtom ranks 17).ult (rankAtom ranks 6)))) = true)
    (h3129 : ((!((rankAtom ranks 20 == rankAtom ranks 17)) || ((rankAtom ranks 9).ult (rankAtom ranks 6)))) = true)
    (h3130 : ((!((rankAtom ranks 6 == rankAtom ranks 0)) || ((rankAtom ranks 66).ult (rankAtom ranks 21)))) = true)
    (h3131 : ((!((rankAtom ranks 6 == rankAtom ranks 66)) || ((rankAtom ranks 0).ult (rankAtom ranks 21)))) = true)
    (h3132 : ((!((rankAtom ranks 21 == rankAtom ranks 0)) || ((rankAtom ranks 66).ult (rankAtom ranks 6)))) = true)
    (h3133 : ((!((rankAtom ranks 21 == rankAtom ranks 66)) || ((rankAtom ranks 0).ult (rankAtom ranks 6)))) = true)
    (h3134 : ((!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 17).ult (rankAtom ranks 21)))) = true)
    (h3135 : ((!((rankAtom ranks 6 == rankAtom ranks 17)) || ((rankAtom ranks 10).ult (rankAtom ranks 21)))) = true) :
    ∀ item ∈ sourceChunk048Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk048Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3072
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3073
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3074
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3075
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3076
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3077
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3078
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3079
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3080
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3081
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3082
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3083
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3084
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3085
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3086
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3087
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3088
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3089
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3090
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3091
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3092
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3093
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3094
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3095
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3096
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3097
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3098
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3099
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3100
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3101
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3102
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3103
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3104
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3105
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3106
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3107
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3108
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3109
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3110
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3111
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3112
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3113
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3114
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3115
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3116
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3117
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3118
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3119
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3120
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3121
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3122
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3123
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3124
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3125
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3126
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3127
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3128
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3129
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3130
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3131
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3132
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3133
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3134
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3135

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
