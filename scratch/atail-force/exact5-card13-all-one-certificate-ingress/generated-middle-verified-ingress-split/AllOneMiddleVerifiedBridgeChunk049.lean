/-
Generated packed-source bridge for verified middle chunk 049.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk049_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h3136 : ((!((rankAtom ranks 21 == rankAtom ranks 10)) || ((rankAtom ranks 17).ult (rankAtom ranks 6)))) = true)
    (h3137 : ((!((rankAtom ranks 21 == rankAtom ranks 17)) || ((rankAtom ranks 10).ult (rankAtom ranks 6)))) = true)
    (h3138 : ((!((rankAtom ranks 6 == rankAtom ranks 0)) || ((rankAtom ranks 67).ult (rankAtom ranks 22)))) = true)
    (h3139 : ((!((rankAtom ranks 6 == rankAtom ranks 67)) || ((rankAtom ranks 0).ult (rankAtom ranks 22)))) = true)
    (h3140 : ((!((rankAtom ranks 22 == rankAtom ranks 0)) || ((rankAtom ranks 67).ult (rankAtom ranks 6)))) = true)
    (h3141 : ((!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 17).ult (rankAtom ranks 22)))) = true)
    (h3142 : ((!((rankAtom ranks 22 == rankAtom ranks 11)) || ((rankAtom ranks 17).ult (rankAtom ranks 6)))) = true)
    (h3143 : ((!((rankAtom ranks 22 == rankAtom ranks 17)) || ((rankAtom ranks 11).ult (rankAtom ranks 6)))) = true)
    (h3144 : ((!((rankAtom ranks 7 == rankAtom ranks 0)) || ((rankAtom ranks 68).ult (rankAtom ranks 19)))) = true)
    (h3145 : ((!((rankAtom ranks 19 == rankAtom ranks 0)) || ((rankAtom ranks 68).ult (rankAtom ranks 7)))) = true)
    (h3146 : ((!((rankAtom ranks 19 == rankAtom ranks 68)) || ((rankAtom ranks 0).ult (rankAtom ranks 7)))) = true)
    (h3147 : ((!((rankAtom ranks 7 == rankAtom ranks 8)) || ((rankAtom ranks 18).ult (rankAtom ranks 19)))) = true)
    (h3148 : ((!((rankAtom ranks 7 == rankAtom ranks 18)) || ((rankAtom ranks 8).ult (rankAtom ranks 19)))) = true)
    (h3149 : ((!((rankAtom ranks 19 == rankAtom ranks 8)) || ((rankAtom ranks 18).ult (rankAtom ranks 7)))) = true)
    (h3150 : ((!((rankAtom ranks 19 == rankAtom ranks 18)) || ((rankAtom ranks 8).ult (rankAtom ranks 7)))) = true)
    (h3151 : ((!((rankAtom ranks 7 == rankAtom ranks 0)) || ((rankAtom ranks 69).ult (rankAtom ranks 20)))) = true)
    (h3152 : ((!((rankAtom ranks 20 == rankAtom ranks 0)) || ((rankAtom ranks 69).ult (rankAtom ranks 7)))) = true)
    (h3153 : ((!((rankAtom ranks 20 == rankAtom ranks 69)) || ((rankAtom ranks 0).ult (rankAtom ranks 7)))) = true)
    (h3154 : ((!((rankAtom ranks 7 == rankAtom ranks 9)) || ((rankAtom ranks 18).ult (rankAtom ranks 20)))) = true)
    (h3155 : ((!((rankAtom ranks 7 == rankAtom ranks 18)) || ((rankAtom ranks 9).ult (rankAtom ranks 20)))) = true)
    (h3156 : ((!((rankAtom ranks 20 == rankAtom ranks 9)) || ((rankAtom ranks 18).ult (rankAtom ranks 7)))) = true)
    (h3157 : ((!((rankAtom ranks 20 == rankAtom ranks 18)) || ((rankAtom ranks 9).ult (rankAtom ranks 7)))) = true)
    (h3158 : ((!((rankAtom ranks 7 == rankAtom ranks 0)) || ((rankAtom ranks 70).ult (rankAtom ranks 21)))) = true)
    (h3159 : ((!((rankAtom ranks 21 == rankAtom ranks 0)) || ((rankAtom ranks 70).ult (rankAtom ranks 7)))) = true)
    (h3160 : ((!((rankAtom ranks 21 == rankAtom ranks 70)) || ((rankAtom ranks 0).ult (rankAtom ranks 7)))) = true)
    (h3161 : ((!((rankAtom ranks 7 == rankAtom ranks 18)) || ((rankAtom ranks 10).ult (rankAtom ranks 21)))) = true)
    (h3162 : ((!((rankAtom ranks 21 == rankAtom ranks 10)) || ((rankAtom ranks 18).ult (rankAtom ranks 7)))) = true)
    (h3163 : ((!((rankAtom ranks 21 == rankAtom ranks 18)) || ((rankAtom ranks 10).ult (rankAtom ranks 7)))) = true)
    (h3164 : ((!((rankAtom ranks 7 == rankAtom ranks 0)) || ((rankAtom ranks 71).ult (rankAtom ranks 22)))) = true)
    (h3165 : ((!((rankAtom ranks 22 == rankAtom ranks 0)) || ((rankAtom ranks 71).ult (rankAtom ranks 7)))) = true)
    (h3166 : ((!((rankAtom ranks 7 == rankAtom ranks 11)) || ((rankAtom ranks 18).ult (rankAtom ranks 22)))) = true)
    (h3167 : ((!((rankAtom ranks 7 == rankAtom ranks 18)) || ((rankAtom ranks 11).ult (rankAtom ranks 22)))) = true)
    (h3168 : ((!((rankAtom ranks 22 == rankAtom ranks 18)) || ((rankAtom ranks 11).ult (rankAtom ranks 7)))) = true)
    (h3169 : ((!((rankAtom ranks 8 == rankAtom ranks 72)) || ((rankAtom ranks 0).ult (rankAtom ranks 20)))) = true)
    (h3170 : ((!((rankAtom ranks 20 == rankAtom ranks 0)) || ((rankAtom ranks 72).ult (rankAtom ranks 8)))) = true)
    (h3171 : ((!((rankAtom ranks 20 == rankAtom ranks 72)) || ((rankAtom ranks 0).ult (rankAtom ranks 8)))) = true)
    (h3172 : ((!((rankAtom ranks 8 == rankAtom ranks 19)) || ((rankAtom ranks 9).ult (rankAtom ranks 20)))) = true)
    (h3173 : ((!((rankAtom ranks 20 == rankAtom ranks 9)) || ((rankAtom ranks 19).ult (rankAtom ranks 8)))) = true)
    (h3174 : ((!((rankAtom ranks 20 == rankAtom ranks 19)) || ((rankAtom ranks 9).ult (rankAtom ranks 8)))) = true)
    (h3175 : ((!((rankAtom ranks 8 == rankAtom ranks 0)) || ((rankAtom ranks 73).ult (rankAtom ranks 21)))) = true)
    (h3176 : ((!((rankAtom ranks 8 == rankAtom ranks 73)) || ((rankAtom ranks 0).ult (rankAtom ranks 21)))) = true)
    (h3177 : ((!((rankAtom ranks 21 == rankAtom ranks 0)) || ((rankAtom ranks 73).ult (rankAtom ranks 8)))) = true)
    (h3178 : ((!((rankAtom ranks 21 == rankAtom ranks 73)) || ((rankAtom ranks 0).ult (rankAtom ranks 8)))) = true)
    (h3179 : ((!((rankAtom ranks 8 == rankAtom ranks 19)) || ((rankAtom ranks 10).ult (rankAtom ranks 21)))) = true)
    (h3180 : ((!((rankAtom ranks 21 == rankAtom ranks 10)) || ((rankAtom ranks 19).ult (rankAtom ranks 8)))) = true)
    (h3181 : ((!((rankAtom ranks 21 == rankAtom ranks 19)) || ((rankAtom ranks 10).ult (rankAtom ranks 8)))) = true)
    (h3182 : ((!((rankAtom ranks 8 == rankAtom ranks 0)) || ((rankAtom ranks 74).ult (rankAtom ranks 22)))) = true)
    (h3183 : ((!((rankAtom ranks 8 == rankAtom ranks 74)) || ((rankAtom ranks 0).ult (rankAtom ranks 22)))) = true)
    (h3184 : ((!((rankAtom ranks 22 == rankAtom ranks 0)) || ((rankAtom ranks 74).ult (rankAtom ranks 8)))) = true)
    (h3185 : ((!((rankAtom ranks 8 == rankAtom ranks 19)) || ((rankAtom ranks 11).ult (rankAtom ranks 22)))) = true)
    (h3186 : ((!((rankAtom ranks 22 == rankAtom ranks 19)) || ((rankAtom ranks 11).ult (rankAtom ranks 8)))) = true)
    (h3187 : ((!((rankAtom ranks 9 == rankAtom ranks 0)) || ((rankAtom ranks 75).ult (rankAtom ranks 21)))) = true)
    (h3188 : ((!((rankAtom ranks 9 == rankAtom ranks 75)) || ((rankAtom ranks 0).ult (rankAtom ranks 21)))) = true)
    (h3189 : ((!((rankAtom ranks 21 == rankAtom ranks 0)) || ((rankAtom ranks 75).ult (rankAtom ranks 9)))) = true)
    (h3190 : ((!((rankAtom ranks 21 == rankAtom ranks 75)) || ((rankAtom ranks 0).ult (rankAtom ranks 9)))) = true)
    (h3191 : ((!((rankAtom ranks 9 == rankAtom ranks 20)) || ((rankAtom ranks 10).ult (rankAtom ranks 21)))) = true)
    (h3192 : ((!((rankAtom ranks 21 == rankAtom ranks 10)) || ((rankAtom ranks 20).ult (rankAtom ranks 9)))) = true)
    (h3193 : ((!((rankAtom ranks 21 == rankAtom ranks 20)) || ((rankAtom ranks 10).ult (rankAtom ranks 9)))) = true)
    (h3194 : ((!((rankAtom ranks 9 == rankAtom ranks 0)) || ((rankAtom ranks 76).ult (rankAtom ranks 22)))) = true)
    (h3195 : ((!((rankAtom ranks 9 == rankAtom ranks 76)) || ((rankAtom ranks 0).ult (rankAtom ranks 22)))) = true)
    (h3196 : ((!((rankAtom ranks 22 == rankAtom ranks 0)) || ((rankAtom ranks 76).ult (rankAtom ranks 9)))) = true)
    (h3197 : ((!((rankAtom ranks 9 == rankAtom ranks 20)) || ((rankAtom ranks 11).ult (rankAtom ranks 22)))) = true)
    (h3198 : ((!((rankAtom ranks 22 == rankAtom ranks 20)) || ((rankAtom ranks 11).ult (rankAtom ranks 9)))) = true)
    (h3199 : ((!((rankAtom ranks 10 == rankAtom ranks 0)) || ((rankAtom ranks 77).ult (rankAtom ranks 22)))) = true) :
    ∀ item ∈ sourceChunk049Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk049Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3136
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3137
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3138
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3139
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3140
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3141
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3142
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3143
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3144
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3145
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3146
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3147
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3148
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3149
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3150
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3151
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3152
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3153
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3154
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3155
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3156
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3157
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3158
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3159
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3160
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3161
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3162
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3163
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3164
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3165
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3166
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3167
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3168
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3169
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3170
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3171
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3172
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3173
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3174
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3175
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3176
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3177
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3178
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3179
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3180
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3181
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3182
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3183
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3184
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3185
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3186
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3187
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3188
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3189
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3190
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3191
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3192
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3193
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3194
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3195
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3196
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3197
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3198
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3199

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
