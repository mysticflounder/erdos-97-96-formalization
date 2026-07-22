/-
Generated packed-source bridge for verified middle chunk 050.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk050_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h3200 : ((!((rankAtom ranks 10 == rankAtom ranks 77)) || ((rankAtom ranks 0).ult (rankAtom ranks 22)))) = true)
    (h3201 : ((!((rankAtom ranks 22 == rankAtom ranks 0)) || ((rankAtom ranks 77).ult (rankAtom ranks 10)))) = true)
    (h3202 : ((!((rankAtom ranks 10 == rankAtom ranks 21)) || ((rankAtom ranks 11).ult (rankAtom ranks 22)))) = true)
    (h3203 : ((!((rankAtom ranks 22 == rankAtom ranks 21)) || ((rankAtom ranks 11).ult (rankAtom ranks 10)))) = true)
    (h3204 : ((!((rankAtom ranks 24 == rankAtom ranks 3)) || ((rankAtom ranks 23).ult (rankAtom ranks 2)))) = true)
    (h3205 : ((!((rankAtom ranks 24 == rankAtom ranks 23)) || ((rankAtom ranks 3).ult (rankAtom ranks 2)))) = true)
    (h3206 : ((!((rankAtom ranks 25 == rankAtom ranks 1)) || ((rankAtom ranks 34).ult (rankAtom ranks 2)))) = true)
    (h3207 : ((!((rankAtom ranks 2 == rankAtom ranks 4)) || ((rankAtom ranks 23).ult (rankAtom ranks 25)))) = true)
    (h3208 : ((!((rankAtom ranks 25 == rankAtom ranks 4)) || ((rankAtom ranks 23).ult (rankAtom ranks 2)))) = true)
    (h3209 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 4).ult (rankAtom ranks 2)))) = true)
    (h3210 : ((!((rankAtom ranks 26 == rankAtom ranks 1)) || ((rankAtom ranks 35).ult (rankAtom ranks 2)))) = true)
    (h3211 : ((!((rankAtom ranks 2 == rankAtom ranks 5)) || ((rankAtom ranks 23).ult (rankAtom ranks 26)))) = true)
    (h3212 : ((!((rankAtom ranks 26 == rankAtom ranks 5)) || ((rankAtom ranks 23).ult (rankAtom ranks 2)))) = true)
    (h3213 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 5).ult (rankAtom ranks 2)))) = true)
    (h3214 : ((!((rankAtom ranks 27 == rankAtom ranks 1)) || ((rankAtom ranks 36).ult (rankAtom ranks 2)))) = true)
    (h3215 : ((!((rankAtom ranks 2 == rankAtom ranks 6)) || ((rankAtom ranks 23).ult (rankAtom ranks 27)))) = true)
    (h3216 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 6).ult (rankAtom ranks 2)))) = true)
    (h3217 : ((!((rankAtom ranks 2 == rankAtom ranks 37)) || ((rankAtom ranks 1).ult (rankAtom ranks 28)))) = true)
    (h3218 : ((!((rankAtom ranks 28 == rankAtom ranks 1)) || ((rankAtom ranks 37).ult (rankAtom ranks 2)))) = true)
    (h3219 : ((!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 1).ult (rankAtom ranks 2)))) = true)
    (h3220 : ((!((rankAtom ranks 2 == rankAtom ranks 23)) || ((rankAtom ranks 7).ult (rankAtom ranks 28)))) = true)
    (h3221 : ((!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 23).ult (rankAtom ranks 2)))) = true)
    (h3222 : ((!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 7).ult (rankAtom ranks 2)))) = true)
    (h3223 : ((!((rankAtom ranks 2 == rankAtom ranks 38)) || ((rankAtom ranks 1).ult (rankAtom ranks 29)))) = true)
    (h3224 : ((!((rankAtom ranks 29 == rankAtom ranks 1)) || ((rankAtom ranks 38).ult (rankAtom ranks 2)))) = true)
    (h3225 : ((!((rankAtom ranks 29 == rankAtom ranks 8)) || ((rankAtom ranks 23).ult (rankAtom ranks 2)))) = true)
    (h3226 : ((!((rankAtom ranks 29 == rankAtom ranks 23)) || ((rankAtom ranks 8).ult (rankAtom ranks 2)))) = true)
    (h3227 : ((!((rankAtom ranks 30 == rankAtom ranks 1)) || ((rankAtom ranks 39).ult (rankAtom ranks 2)))) = true)
    (h3228 : ((!((rankAtom ranks 2 == rankAtom ranks 9)) || ((rankAtom ranks 23).ult (rankAtom ranks 30)))) = true)
    (h3229 : ((!((rankAtom ranks 30 == rankAtom ranks 9)) || ((rankAtom ranks 23).ult (rankAtom ranks 2)))) = true)
    (h3230 : ((!((rankAtom ranks 30 == rankAtom ranks 23)) || ((rankAtom ranks 9).ult (rankAtom ranks 2)))) = true)
    (h3231 : ((!((rankAtom ranks 2 == rankAtom ranks 40)) || ((rankAtom ranks 1).ult (rankAtom ranks 31)))) = true)
    (h3232 : ((!((rankAtom ranks 31 == rankAtom ranks 1)) || ((rankAtom ranks 40).ult (rankAtom ranks 2)))) = true)
    (h3233 : ((!((rankAtom ranks 31 == rankAtom ranks 10)) || ((rankAtom ranks 23).ult (rankAtom ranks 2)))) = true)
    (h3234 : ((!((rankAtom ranks 31 == rankAtom ranks 23)) || ((rankAtom ranks 10).ult (rankAtom ranks 2)))) = true)
    (h3235 : ((!((rankAtom ranks 2 == rankAtom ranks 41)) || ((rankAtom ranks 1).ult (rankAtom ranks 32)))) = true)
    (h3236 : ((!((rankAtom ranks 32 == rankAtom ranks 1)) || ((rankAtom ranks 41).ult (rankAtom ranks 2)))) = true)
    (h3237 : ((!((rankAtom ranks 2 == rankAtom ranks 11)) || ((rankAtom ranks 23).ult (rankAtom ranks 32)))) = true)
    (h3238 : ((!((rankAtom ranks 32 == rankAtom ranks 23)) || ((rankAtom ranks 11).ult (rankAtom ranks 2)))) = true)
    (h3239 : ((!((rankAtom ranks 3 == rankAtom ranks 1)) || ((rankAtom ranks 42).ult (rankAtom ranks 25)))) = true)
    (h3240 : ((!((rankAtom ranks 3 == rankAtom ranks 42)) || ((rankAtom ranks 1).ult (rankAtom ranks 25)))) = true)
    (h3241 : ((!((rankAtom ranks 25 == rankAtom ranks 1)) || ((rankAtom ranks 42).ult (rankAtom ranks 3)))) = true)
    (h3242 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 1).ult (rankAtom ranks 3)))) = true)
    (h3243 : ((!((rankAtom ranks 3 == rankAtom ranks 4)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h3244 : ((!((rankAtom ranks 3 == rankAtom ranks 24)) || ((rankAtom ranks 4).ult (rankAtom ranks 25)))) = true)
    (h3245 : ((!((rankAtom ranks 25 == rankAtom ranks 4)) || ((rankAtom ranks 24).ult (rankAtom ranks 3)))) = true)
    (h3246 : ((!((rankAtom ranks 25 == rankAtom ranks 24)) || ((rankAtom ranks 4).ult (rankAtom ranks 3)))) = true)
    (h3247 : ((!((rankAtom ranks 3 == rankAtom ranks 1)) || ((rankAtom ranks 43).ult (rankAtom ranks 26)))) = true)
    (h3248 : ((!((rankAtom ranks 3 == rankAtom ranks 43)) || ((rankAtom ranks 1).ult (rankAtom ranks 26)))) = true)
    (h3249 : ((!((rankAtom ranks 26 == rankAtom ranks 1)) || ((rankAtom ranks 43).ult (rankAtom ranks 3)))) = true)
    (h3250 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 1).ult (rankAtom ranks 3)))) = true)
    (h3251 : ((!((rankAtom ranks 3 == rankAtom ranks 5)) || ((rankAtom ranks 24).ult (rankAtom ranks 26)))) = true)
    (h3252 : ((!((rankAtom ranks 3 == rankAtom ranks 24)) || ((rankAtom ranks 5).ult (rankAtom ranks 26)))) = true)
    (h3253 : ((!((rankAtom ranks 26 == rankAtom ranks 5)) || ((rankAtom ranks 24).ult (rankAtom ranks 3)))) = true)
    (h3254 : ((!((rankAtom ranks 26 == rankAtom ranks 24)) || ((rankAtom ranks 5).ult (rankAtom ranks 3)))) = true)
    (h3255 : ((!((rankAtom ranks 3 == rankAtom ranks 1)) || ((rankAtom ranks 44).ult (rankAtom ranks 27)))) = true)
    (h3256 : ((!((rankAtom ranks 3 == rankAtom ranks 44)) || ((rankAtom ranks 1).ult (rankAtom ranks 27)))) = true)
    (h3257 : ((!((rankAtom ranks 27 == rankAtom ranks 1)) || ((rankAtom ranks 44).ult (rankAtom ranks 3)))) = true)
    (h3258 : ((!((rankAtom ranks 3 == rankAtom ranks 6)) || ((rankAtom ranks 24).ult (rankAtom ranks 27)))) = true)
    (h3259 : ((!((rankAtom ranks 3 == rankAtom ranks 24)) || ((rankAtom ranks 6).ult (rankAtom ranks 27)))) = true)
    (h3260 : ((!((rankAtom ranks 27 == rankAtom ranks 24)) || ((rankAtom ranks 6).ult (rankAtom ranks 3)))) = true)
    (h3261 : ((!((rankAtom ranks 3 == rankAtom ranks 1)) || ((rankAtom ranks 45).ult (rankAtom ranks 28)))) = true)
    (h3262 : ((!((rankAtom ranks 3 == rankAtom ranks 45)) || ((rankAtom ranks 1).ult (rankAtom ranks 28)))) = true)
    (h3263 : ((!((rankAtom ranks 28 == rankAtom ranks 1)) || ((rankAtom ranks 45).ult (rankAtom ranks 3)))) = true) :
    ∀ item ∈ sourceChunk050Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk050Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3200
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3201
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3202
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3203
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3204
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3205
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3206
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3207
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3208
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3209
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3210
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3211
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3212
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3213
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3214
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3215
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3216
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3217
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3218
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3219
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3220
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3221
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3222
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3223
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3224
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3225
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3226
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3227
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3228
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3229
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3230
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3231
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3232
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3233
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3234
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3235
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3236
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3237
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3238
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3239
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3240
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3241
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3242
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3243
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3244
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3245
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3246
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3247
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3248
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3249
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3250
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3251
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3252
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3253
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3254
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3255
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3256
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3257
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3258
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3259
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3260
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3261
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3262
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3263

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
