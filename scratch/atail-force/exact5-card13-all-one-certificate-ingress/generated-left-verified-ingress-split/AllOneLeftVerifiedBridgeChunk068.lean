/-
Generated packed-source bridge for verified left chunk 068.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk068_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h4352 : ((!((rankAtom ranks 29 == rankAtom ranks 53)) || ((rankAtom ranks 12).ult (rankAtom ranks 15)))) = true)
    (h4353 : ((!((rankAtom ranks 15 == rankAtom ranks 19)) || ((rankAtom ranks 25).ult (rankAtom ranks 29)))) = true)
    (h4354 : ((!((rankAtom ranks 29 == rankAtom ranks 25)) || ((rankAtom ranks 19).ult (rankAtom ranks 15)))) = true)
    (h4355 : ((!((rankAtom ranks 15 == rankAtom ranks 12)) || ((rankAtom ranks 54).ult (rankAtom ranks 30)))) = true)
    (h4356 : ((!((rankAtom ranks 15 == rankAtom ranks 54)) || ((rankAtom ranks 12).ult (rankAtom ranks 30)))) = true)
    (h4357 : ((!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 54).ult (rankAtom ranks 15)))) = true)
    (h4358 : ((!((rankAtom ranks 30 == rankAtom ranks 54)) || ((rankAtom ranks 12).ult (rankAtom ranks 15)))) = true)
    (h4359 : ((!((rankAtom ranks 15 == rankAtom ranks 20)) || ((rankAtom ranks 25).ult (rankAtom ranks 30)))) = true)
    (h4360 : ((!((rankAtom ranks 30 == rankAtom ranks 25)) || ((rankAtom ranks 20).ult (rankAtom ranks 15)))) = true)
    (h4361 : ((!((rankAtom ranks 15 == rankAtom ranks 12)) || ((rankAtom ranks 55).ult (rankAtom ranks 31)))) = true)
    (h4362 : ((!((rankAtom ranks 15 == rankAtom ranks 55)) || ((rankAtom ranks 12).ult (rankAtom ranks 31)))) = true)
    (h4363 : ((!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 55).ult (rankAtom ranks 15)))) = true)
    (h4364 : ((!((rankAtom ranks 31 == rankAtom ranks 55)) || ((rankAtom ranks 12).ult (rankAtom ranks 15)))) = true)
    (h4365 : ((!((rankAtom ranks 15 == rankAtom ranks 21)) || ((rankAtom ranks 25).ult (rankAtom ranks 31)))) = true)
    (h4366 : ((!((rankAtom ranks 31 == rankAtom ranks 25)) || ((rankAtom ranks 21).ult (rankAtom ranks 15)))) = true)
    (h4367 : ((!((rankAtom ranks 15 == rankAtom ranks 12)) || ((rankAtom ranks 56).ult (rankAtom ranks 32)))) = true)
    (h4368 : ((!((rankAtom ranks 15 == rankAtom ranks 56)) || ((rankAtom ranks 12).ult (rankAtom ranks 32)))) = true)
    (h4369 : ((!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 56).ult (rankAtom ranks 15)))) = true)
    (h4370 : ((!((rankAtom ranks 15 == rankAtom ranks 22)) || ((rankAtom ranks 25).ult (rankAtom ranks 32)))) = true)
    (h4371 : ((!((rankAtom ranks 32 == rankAtom ranks 25)) || ((rankAtom ranks 22).ult (rankAtom ranks 15)))) = true)
    (h4372 : ((!((rankAtom ranks 16 == rankAtom ranks 12)) || ((rankAtom ranks 57).ult (rankAtom ranks 27)))) = true)
    (h4373 : ((!((rankAtom ranks 27 == rankAtom ranks 12)) || ((rankAtom ranks 57).ult (rankAtom ranks 16)))) = true)
    (h4374 : ((!((rankAtom ranks 16 == rankAtom ranks 17)) || ((rankAtom ranks 26).ult (rankAtom ranks 27)))) = true)
    (h4375 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 17).ult (rankAtom ranks 16)))) = true)
    (h4376 : ((!((rankAtom ranks 16 == rankAtom ranks 12)) || ((rankAtom ranks 58).ult (rankAtom ranks 28)))) = true)
    (h4377 : ((!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 58).ult (rankAtom ranks 16)))) = true)
    (h4378 : ((!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 12).ult (rankAtom ranks 16)))) = true)
    (h4379 : ((!((rankAtom ranks 16 == rankAtom ranks 18)) || ((rankAtom ranks 26).ult (rankAtom ranks 28)))) = true)
    (h4380 : ((!((rankAtom ranks 16 == rankAtom ranks 26)) || ((rankAtom ranks 18).ult (rankAtom ranks 28)))) = true)
    (h4381 : ((!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 26).ult (rankAtom ranks 16)))) = true)
    (h4382 : ((!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 18).ult (rankAtom ranks 16)))) = true)
    (h4383 : ((!((rankAtom ranks 16 == rankAtom ranks 12)) || ((rankAtom ranks 59).ult (rankAtom ranks 29)))) = true)
    (h4384 : ((!((rankAtom ranks 16 == rankAtom ranks 59)) || ((rankAtom ranks 12).ult (rankAtom ranks 29)))) = true)
    (h4385 : ((!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 59).ult (rankAtom ranks 16)))) = true)
    (h4386 : ((!((rankAtom ranks 29 == rankAtom ranks 59)) || ((rankAtom ranks 12).ult (rankAtom ranks 16)))) = true)
    (h4387 : ((!((rankAtom ranks 16 == rankAtom ranks 19)) || ((rankAtom ranks 26).ult (rankAtom ranks 29)))) = true)
    (h4388 : ((!((rankAtom ranks 29 == rankAtom ranks 26)) || ((rankAtom ranks 19).ult (rankAtom ranks 16)))) = true)
    (h4389 : ((!((rankAtom ranks 16 == rankAtom ranks 12)) || ((rankAtom ranks 60).ult (rankAtom ranks 30)))) = true)
    (h4390 : ((!((rankAtom ranks 16 == rankAtom ranks 60)) || ((rankAtom ranks 12).ult (rankAtom ranks 30)))) = true)
    (h4391 : ((!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 60).ult (rankAtom ranks 16)))) = true)
    (h4392 : ((!((rankAtom ranks 30 == rankAtom ranks 60)) || ((rankAtom ranks 12).ult (rankAtom ranks 16)))) = true)
    (h4393 : ((!((rankAtom ranks 16 == rankAtom ranks 20)) || ((rankAtom ranks 26).ult (rankAtom ranks 30)))) = true)
    (h4394 : ((!((rankAtom ranks 30 == rankAtom ranks 26)) || ((rankAtom ranks 20).ult (rankAtom ranks 16)))) = true)
    (h4395 : ((!((rankAtom ranks 16 == rankAtom ranks 12)) || ((rankAtom ranks 61).ult (rankAtom ranks 31)))) = true)
    (h4396 : ((!((rankAtom ranks 16 == rankAtom ranks 61)) || ((rankAtom ranks 12).ult (rankAtom ranks 31)))) = true)
    (h4397 : ((!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 61).ult (rankAtom ranks 16)))) = true)
    (h4398 : ((!((rankAtom ranks 31 == rankAtom ranks 61)) || ((rankAtom ranks 12).ult (rankAtom ranks 16)))) = true)
    (h4399 : ((!((rankAtom ranks 16 == rankAtom ranks 21)) || ((rankAtom ranks 26).ult (rankAtom ranks 31)))) = true)
    (h4400 : ((!((rankAtom ranks 31 == rankAtom ranks 26)) || ((rankAtom ranks 21).ult (rankAtom ranks 16)))) = true)
    (h4401 : ((!((rankAtom ranks 16 == rankAtom ranks 12)) || ((rankAtom ranks 62).ult (rankAtom ranks 32)))) = true)
    (h4402 : ((!((rankAtom ranks 16 == rankAtom ranks 62)) || ((rankAtom ranks 12).ult (rankAtom ranks 32)))) = true)
    (h4403 : ((!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 62).ult (rankAtom ranks 16)))) = true)
    (h4404 : ((!((rankAtom ranks 32 == rankAtom ranks 62)) || ((rankAtom ranks 12).ult (rankAtom ranks 16)))) = true)
    (h4405 : ((!((rankAtom ranks 16 == rankAtom ranks 22)) || ((rankAtom ranks 26).ult (rankAtom ranks 32)))) = true)
    (h4406 : ((!((rankAtom ranks 32 == rankAtom ranks 26)) || ((rankAtom ranks 22).ult (rankAtom ranks 16)))) = true)
    (h4407 : ((!((rankAtom ranks 17 == rankAtom ranks 12)) || ((rankAtom ranks 63).ult (rankAtom ranks 28)))) = true)
    (h4408 : ((!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 63).ult (rankAtom ranks 17)))) = true)
    (h4409 : ((!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 12).ult (rankAtom ranks 17)))) = true)
    (h4410 : ((!((rankAtom ranks 17 == rankAtom ranks 18)) || ((rankAtom ranks 27).ult (rankAtom ranks 28)))) = true)
    (h4411 : ((!((rankAtom ranks 17 == rankAtom ranks 27)) || ((rankAtom ranks 18).ult (rankAtom ranks 28)))) = true)
    (h4412 : ((!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 27).ult (rankAtom ranks 17)))) = true)
    (h4413 : ((!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 18).ult (rankAtom ranks 17)))) = true)
    (h4414 : ((!((rankAtom ranks 17 == rankAtom ranks 12)) || ((rankAtom ranks 64).ult (rankAtom ranks 29)))) = true)
    (h4415 : ((!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 64).ult (rankAtom ranks 17)))) = true) :
    ∀ item ∈ sourceChunk068Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk068Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4352
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4353
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4354
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4355
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4356
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4357
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4358
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4359
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4360
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4361
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4362
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4363
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4364
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4365
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4366
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4367
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4368
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4369
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4370
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4371
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4372
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4373
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4374
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4375
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4376
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4377
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4378
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4379
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4380
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4381
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4382
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4383
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4384
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4385
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4386
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4387
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4388
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4389
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4390
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4391
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4392
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4393
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4394
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4395
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4396
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4397
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4398
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4399
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4400
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4401
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4402
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4403
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4404
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4405
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4406
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4407
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4408
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4409
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4410
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4411
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4412
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4413
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4414
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4415

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
