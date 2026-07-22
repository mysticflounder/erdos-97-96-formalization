/-
Generated packed-source bridge for verified left chunk 051.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk051_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h3264 : ((!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 1).ult (rankAtom ranks 3)))) = true)
    (h3265 : ((!((rankAtom ranks 3 == rankAtom ranks 7)) || ((rankAtom ranks 24).ult (rankAtom ranks 28)))) = true)
    (h3266 : ((!((rankAtom ranks 3 == rankAtom ranks 24)) || ((rankAtom ranks 7).ult (rankAtom ranks 28)))) = true)
    (h3267 : ((!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 24).ult (rankAtom ranks 3)))) = true)
    (h3268 : ((!((rankAtom ranks 28 == rankAtom ranks 24)) || ((rankAtom ranks 7).ult (rankAtom ranks 3)))) = true)
    (h3269 : ((!((rankAtom ranks 3 == rankAtom ranks 46)) || ((rankAtom ranks 1).ult (rankAtom ranks 29)))) = true)
    (h3270 : ((!((rankAtom ranks 29 == rankAtom ranks 1)) || ((rankAtom ranks 46).ult (rankAtom ranks 3)))) = true)
    (h3271 : ((!((rankAtom ranks 29 == rankAtom ranks 46)) || ((rankAtom ranks 1).ult (rankAtom ranks 3)))) = true)
    (h3272 : ((!((rankAtom ranks 3 == rankAtom ranks 8)) || ((rankAtom ranks 24).ult (rankAtom ranks 29)))) = true)
    (h3273 : ((!((rankAtom ranks 3 == rankAtom ranks 24)) || ((rankAtom ranks 8).ult (rankAtom ranks 29)))) = true)
    (h3274 : ((!((rankAtom ranks 29 == rankAtom ranks 8)) || ((rankAtom ranks 24).ult (rankAtom ranks 3)))) = true)
    (h3275 : ((!((rankAtom ranks 29 == rankAtom ranks 24)) || ((rankAtom ranks 8).ult (rankAtom ranks 3)))) = true)
    (h3276 : ((!((rankAtom ranks 3 == rankAtom ranks 47)) || ((rankAtom ranks 1).ult (rankAtom ranks 30)))) = true)
    (h3277 : ((!((rankAtom ranks 30 == rankAtom ranks 1)) || ((rankAtom ranks 47).ult (rankAtom ranks 3)))) = true)
    (h3278 : ((!((rankAtom ranks 30 == rankAtom ranks 47)) || ((rankAtom ranks 1).ult (rankAtom ranks 3)))) = true)
    (h3279 : ((!((rankAtom ranks 3 == rankAtom ranks 9)) || ((rankAtom ranks 24).ult (rankAtom ranks 30)))) = true)
    (h3280 : ((!((rankAtom ranks 3 == rankAtom ranks 24)) || ((rankAtom ranks 9).ult (rankAtom ranks 30)))) = true)
    (h3281 : ((!((rankAtom ranks 30 == rankAtom ranks 9)) || ((rankAtom ranks 24).ult (rankAtom ranks 3)))) = true)
    (h3282 : ((!((rankAtom ranks 30 == rankAtom ranks 24)) || ((rankAtom ranks 9).ult (rankAtom ranks 3)))) = true)
    (h3283 : ((!((rankAtom ranks 3 == rankAtom ranks 48)) || ((rankAtom ranks 1).ult (rankAtom ranks 31)))) = true)
    (h3284 : ((!((rankAtom ranks 31 == rankAtom ranks 1)) || ((rankAtom ranks 48).ult (rankAtom ranks 3)))) = true)
    (h3285 : ((!((rankAtom ranks 31 == rankAtom ranks 48)) || ((rankAtom ranks 1).ult (rankAtom ranks 3)))) = true)
    (h3286 : ((!((rankAtom ranks 3 == rankAtom ranks 10)) || ((rankAtom ranks 24).ult (rankAtom ranks 31)))) = true)
    (h3287 : ((!((rankAtom ranks 3 == rankAtom ranks 24)) || ((rankAtom ranks 10).ult (rankAtom ranks 31)))) = true)
    (h3288 : ((!((rankAtom ranks 31 == rankAtom ranks 10)) || ((rankAtom ranks 24).ult (rankAtom ranks 3)))) = true)
    (h3289 : ((!((rankAtom ranks 31 == rankAtom ranks 24)) || ((rankAtom ranks 10).ult (rankAtom ranks 3)))) = true)
    (h3290 : ((!((rankAtom ranks 3 == rankAtom ranks 49)) || ((rankAtom ranks 1).ult (rankAtom ranks 32)))) = true)
    (h3291 : ((!((rankAtom ranks 32 == rankAtom ranks 1)) || ((rankAtom ranks 49).ult (rankAtom ranks 3)))) = true)
    (h3292 : ((!((rankAtom ranks 32 == rankAtom ranks 24)) || ((rankAtom ranks 11).ult (rankAtom ranks 3)))) = true)
    (h3293 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 50).ult (rankAtom ranks 26)))) = true)
    (h3294 : ((!((rankAtom ranks 4 == rankAtom ranks 50)) || ((rankAtom ranks 1).ult (rankAtom ranks 26)))) = true)
    (h3295 : ((!((rankAtom ranks 26 == rankAtom ranks 1)) || ((rankAtom ranks 50).ult (rankAtom ranks 4)))) = true)
    (h3296 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 1).ult (rankAtom ranks 4)))) = true)
    (h3297 : ((!((rankAtom ranks 4 == rankAtom ranks 5)) || ((rankAtom ranks 25).ult (rankAtom ranks 26)))) = true)
    (h3298 : ((!((rankAtom ranks 4 == rankAtom ranks 25)) || ((rankAtom ranks 5).ult (rankAtom ranks 26)))) = true)
    (h3299 : ((!((rankAtom ranks 26 == rankAtom ranks 5)) || ((rankAtom ranks 25).ult (rankAtom ranks 4)))) = true)
    (h3300 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 5).ult (rankAtom ranks 4)))) = true)
    (h3301 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 51).ult (rankAtom ranks 27)))) = true)
    (h3302 : ((!((rankAtom ranks 4 == rankAtom ranks 51)) || ((rankAtom ranks 1).ult (rankAtom ranks 27)))) = true)
    (h3303 : ((!((rankAtom ranks 27 == rankAtom ranks 1)) || ((rankAtom ranks 51).ult (rankAtom ranks 4)))) = true)
    (h3304 : ((!((rankAtom ranks 4 == rankAtom ranks 6)) || ((rankAtom ranks 25).ult (rankAtom ranks 27)))) = true)
    (h3305 : ((!((rankAtom ranks 4 == rankAtom ranks 25)) || ((rankAtom ranks 6).ult (rankAtom ranks 27)))) = true)
    (h3306 : ((!((rankAtom ranks 27 == rankAtom ranks 6)) || ((rankAtom ranks 25).ult (rankAtom ranks 4)))) = true)
    (h3307 : ((!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 6).ult (rankAtom ranks 4)))) = true)
    (h3308 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 52).ult (rankAtom ranks 28)))) = true)
    (h3309 : ((!((rankAtom ranks 4 == rankAtom ranks 52)) || ((rankAtom ranks 1).ult (rankAtom ranks 28)))) = true)
    (h3310 : ((!((rankAtom ranks 28 == rankAtom ranks 1)) || ((rankAtom ranks 52).ult (rankAtom ranks 4)))) = true)
    (h3311 : ((!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 1).ult (rankAtom ranks 4)))) = true)
    (h3312 : ((!((rankAtom ranks 4 == rankAtom ranks 7)) || ((rankAtom ranks 25).ult (rankAtom ranks 28)))) = true)
    (h3313 : ((!((rankAtom ranks 4 == rankAtom ranks 25)) || ((rankAtom ranks 7).ult (rankAtom ranks 28)))) = true)
    (h3314 : ((!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 25).ult (rankAtom ranks 4)))) = true)
    (h3315 : ((!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 7).ult (rankAtom ranks 4)))) = true)
    (h3316 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 53).ult (rankAtom ranks 29)))) = true)
    (h3317 : ((!((rankAtom ranks 4 == rankAtom ranks 53)) || ((rankAtom ranks 1).ult (rankAtom ranks 29)))) = true)
    (h3318 : ((!((rankAtom ranks 29 == rankAtom ranks 1)) || ((rankAtom ranks 53).ult (rankAtom ranks 4)))) = true)
    (h3319 : ((!((rankAtom ranks 29 == rankAtom ranks 53)) || ((rankAtom ranks 1).ult (rankAtom ranks 4)))) = true)
    (h3320 : ((!((rankAtom ranks 4 == rankAtom ranks 8)) || ((rankAtom ranks 25).ult (rankAtom ranks 29)))) = true)
    (h3321 : ((!((rankAtom ranks 4 == rankAtom ranks 25)) || ((rankAtom ranks 8).ult (rankAtom ranks 29)))) = true)
    (h3322 : ((!((rankAtom ranks 29 == rankAtom ranks 8)) || ((rankAtom ranks 25).ult (rankAtom ranks 4)))) = true)
    (h3323 : ((!((rankAtom ranks 29 == rankAtom ranks 25)) || ((rankAtom ranks 8).ult (rankAtom ranks 4)))) = true)
    (h3324 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 54).ult (rankAtom ranks 30)))) = true)
    (h3325 : ((!((rankAtom ranks 4 == rankAtom ranks 54)) || ((rankAtom ranks 1).ult (rankAtom ranks 30)))) = true)
    (h3326 : ((!((rankAtom ranks 30 == rankAtom ranks 1)) || ((rankAtom ranks 54).ult (rankAtom ranks 4)))) = true)
    (h3327 : ((!((rankAtom ranks 30 == rankAtom ranks 54)) || ((rankAtom ranks 1).ult (rankAtom ranks 4)))) = true) :
    ∀ item ∈ sourceChunk051Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk051Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3264
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3265
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3266
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3267
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3268
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3269
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3270
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3271
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3272
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3273
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3274
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3275
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3276
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3277
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3278
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3279
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3280
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3281
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3282
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3283
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3284
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3285
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3286
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3287
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3288
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3289
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3290
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3291
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3292
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3293
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3294
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3295
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3296
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3297
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3298
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3299
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3300
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3301
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3302
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3303
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3304
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3305
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3306
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3307
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3308
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3309
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3310
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3311
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3312
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3313
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3314
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3315
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3316
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3317
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3318
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3319
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3320
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3321
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3322
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3323
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3324
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3325
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3326
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3327

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
