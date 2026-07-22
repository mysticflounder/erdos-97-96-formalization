/-
Generated packed-source bridge for verified left chunk 052.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk052_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h3328 : ((!((rankAtom ranks 4 == rankAtom ranks 9)) || ((rankAtom ranks 25).ult (rankAtom ranks 30)))) = true)
    (h3329 : ((!((rankAtom ranks 4 == rankAtom ranks 25)) || ((rankAtom ranks 9).ult (rankAtom ranks 30)))) = true)
    (h3330 : ((!((rankAtom ranks 30 == rankAtom ranks 9)) || ((rankAtom ranks 25).ult (rankAtom ranks 4)))) = true)
    (h3331 : ((!((rankAtom ranks 30 == rankAtom ranks 25)) || ((rankAtom ranks 9).ult (rankAtom ranks 4)))) = true)
    (h3332 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 55).ult (rankAtom ranks 31)))) = true)
    (h3333 : ((!((rankAtom ranks 4 == rankAtom ranks 55)) || ((rankAtom ranks 1).ult (rankAtom ranks 31)))) = true)
    (h3334 : ((!((rankAtom ranks 31 == rankAtom ranks 1)) || ((rankAtom ranks 55).ult (rankAtom ranks 4)))) = true)
    (h3335 : ((!((rankAtom ranks 31 == rankAtom ranks 55)) || ((rankAtom ranks 1).ult (rankAtom ranks 4)))) = true)
    (h3336 : ((!((rankAtom ranks 4 == rankAtom ranks 10)) || ((rankAtom ranks 25).ult (rankAtom ranks 31)))) = true)
    (h3337 : ((!((rankAtom ranks 4 == rankAtom ranks 25)) || ((rankAtom ranks 10).ult (rankAtom ranks 31)))) = true)
    (h3338 : ((!((rankAtom ranks 31 == rankAtom ranks 10)) || ((rankAtom ranks 25).ult (rankAtom ranks 4)))) = true)
    (h3339 : ((!((rankAtom ranks 31 == rankAtom ranks 25)) || ((rankAtom ranks 10).ult (rankAtom ranks 4)))) = true)
    (h3340 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 56).ult (rankAtom ranks 32)))) = true)
    (h3341 : ((!((rankAtom ranks 4 == rankAtom ranks 56)) || ((rankAtom ranks 1).ult (rankAtom ranks 32)))) = true)
    (h3342 : ((!((rankAtom ranks 32 == rankAtom ranks 1)) || ((rankAtom ranks 56).ult (rankAtom ranks 4)))) = true)
    (h3343 : ((!((rankAtom ranks 4 == rankAtom ranks 11)) || ((rankAtom ranks 25).ult (rankAtom ranks 32)))) = true)
    (h3344 : ((!((rankAtom ranks 4 == rankAtom ranks 25)) || ((rankAtom ranks 11).ult (rankAtom ranks 32)))) = true)
    (h3345 : ((!((rankAtom ranks 32 == rankAtom ranks 25)) || ((rankAtom ranks 11).ult (rankAtom ranks 4)))) = true)
    (h3346 : ((!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 57).ult (rankAtom ranks 27)))) = true)
    (h3347 : ((!((rankAtom ranks 5 == rankAtom ranks 57)) || ((rankAtom ranks 1).ult (rankAtom ranks 27)))) = true)
    (h3348 : ((!((rankAtom ranks 27 == rankAtom ranks 1)) || ((rankAtom ranks 57).ult (rankAtom ranks 5)))) = true)
    (h3349 : ((!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 26).ult (rankAtom ranks 27)))) = true)
    (h3350 : ((!((rankAtom ranks 5 == rankAtom ranks 26)) || ((rankAtom ranks 6).ult (rankAtom ranks 27)))) = true)
    (h3351 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 6).ult (rankAtom ranks 5)))) = true)
    (h3352 : ((!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 58).ult (rankAtom ranks 28)))) = true)
    (h3353 : ((!((rankAtom ranks 5 == rankAtom ranks 58)) || ((rankAtom ranks 1).ult (rankAtom ranks 28)))) = true)
    (h3354 : ((!((rankAtom ranks 28 == rankAtom ranks 1)) || ((rankAtom ranks 58).ult (rankAtom ranks 5)))) = true)
    (h3355 : ((!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 1).ult (rankAtom ranks 5)))) = true)
    (h3356 : ((!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 26).ult (rankAtom ranks 28)))) = true)
    (h3357 : ((!((rankAtom ranks 5 == rankAtom ranks 26)) || ((rankAtom ranks 7).ult (rankAtom ranks 28)))) = true)
    (h3358 : ((!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 26).ult (rankAtom ranks 5)))) = true)
    (h3359 : ((!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 7).ult (rankAtom ranks 5)))) = true)
    (h3360 : ((!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 59).ult (rankAtom ranks 29)))) = true)
    (h3361 : ((!((rankAtom ranks 5 == rankAtom ranks 59)) || ((rankAtom ranks 1).ult (rankAtom ranks 29)))) = true)
    (h3362 : ((!((rankAtom ranks 29 == rankAtom ranks 1)) || ((rankAtom ranks 59).ult (rankAtom ranks 5)))) = true)
    (h3363 : ((!((rankAtom ranks 29 == rankAtom ranks 59)) || ((rankAtom ranks 1).ult (rankAtom ranks 5)))) = true)
    (h3364 : ((!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 26).ult (rankAtom ranks 29)))) = true)
    (h3365 : ((!((rankAtom ranks 5 == rankAtom ranks 26)) || ((rankAtom ranks 8).ult (rankAtom ranks 29)))) = true)
    (h3366 : ((!((rankAtom ranks 29 == rankAtom ranks 8)) || ((rankAtom ranks 26).ult (rankAtom ranks 5)))) = true)
    (h3367 : ((!((rankAtom ranks 29 == rankAtom ranks 26)) || ((rankAtom ranks 8).ult (rankAtom ranks 5)))) = true)
    (h3368 : ((!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 60).ult (rankAtom ranks 30)))) = true)
    (h3369 : ((!((rankAtom ranks 5 == rankAtom ranks 60)) || ((rankAtom ranks 1).ult (rankAtom ranks 30)))) = true)
    (h3370 : ((!((rankAtom ranks 30 == rankAtom ranks 1)) || ((rankAtom ranks 60).ult (rankAtom ranks 5)))) = true)
    (h3371 : ((!((rankAtom ranks 30 == rankAtom ranks 60)) || ((rankAtom ranks 1).ult (rankAtom ranks 5)))) = true)
    (h3372 : ((!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 26).ult (rankAtom ranks 30)))) = true)
    (h3373 : ((!((rankAtom ranks 5 == rankAtom ranks 26)) || ((rankAtom ranks 9).ult (rankAtom ranks 30)))) = true)
    (h3374 : ((!((rankAtom ranks 30 == rankAtom ranks 9)) || ((rankAtom ranks 26).ult (rankAtom ranks 5)))) = true)
    (h3375 : ((!((rankAtom ranks 30 == rankAtom ranks 26)) || ((rankAtom ranks 9).ult (rankAtom ranks 5)))) = true)
    (h3376 : ((!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 61).ult (rankAtom ranks 31)))) = true)
    (h3377 : ((!((rankAtom ranks 5 == rankAtom ranks 61)) || ((rankAtom ranks 1).ult (rankAtom ranks 31)))) = true)
    (h3378 : ((!((rankAtom ranks 31 == rankAtom ranks 1)) || ((rankAtom ranks 61).ult (rankAtom ranks 5)))) = true)
    (h3379 : ((!((rankAtom ranks 31 == rankAtom ranks 61)) || ((rankAtom ranks 1).ult (rankAtom ranks 5)))) = true)
    (h3380 : ((!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 26).ult (rankAtom ranks 31)))) = true)
    (h3381 : ((!((rankAtom ranks 5 == rankAtom ranks 26)) || ((rankAtom ranks 10).ult (rankAtom ranks 31)))) = true)
    (h3382 : ((!((rankAtom ranks 31 == rankAtom ranks 10)) || ((rankAtom ranks 26).ult (rankAtom ranks 5)))) = true)
    (h3383 : ((!((rankAtom ranks 31 == rankAtom ranks 26)) || ((rankAtom ranks 10).ult (rankAtom ranks 5)))) = true)
    (h3384 : ((!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 62).ult (rankAtom ranks 32)))) = true)
    (h3385 : ((!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 1).ult (rankAtom ranks 32)))) = true)
    (h3386 : ((!((rankAtom ranks 32 == rankAtom ranks 1)) || ((rankAtom ranks 62).ult (rankAtom ranks 5)))) = true)
    (h3387 : ((!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 26).ult (rankAtom ranks 32)))) = true)
    (h3388 : ((!((rankAtom ranks 5 == rankAtom ranks 26)) || ((rankAtom ranks 11).ult (rankAtom ranks 32)))) = true)
    (h3389 : ((!((rankAtom ranks 32 == rankAtom ranks 26)) || ((rankAtom ranks 11).ult (rankAtom ranks 5)))) = true)
    (h3390 : ((!((rankAtom ranks 6 == rankAtom ranks 1)) || ((rankAtom ranks 63).ult (rankAtom ranks 28)))) = true)
    (h3391 : ((!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 1).ult (rankAtom ranks 6)))) = true) :
    ∀ item ∈ sourceChunk052Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk052Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3328
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3329
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3330
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3331
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3332
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3333
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3334
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3335
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3336
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3337
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3338
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3339
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3340
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3341
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3342
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3343
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3344
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3345
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3346
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3347
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3348
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3349
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3350
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3351
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3352
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3353
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3354
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3355
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3356
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3357
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3358
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3359
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3360
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3361
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3362
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3363
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3364
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3365
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3366
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3367
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3368
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3369
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3370
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3371
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3372
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3373
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3374
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3375
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3376
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3377
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3378
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3379
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3380
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3381
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3382
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3383
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3384
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3385
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3386
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3387
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3388
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3389
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3390
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3391

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
