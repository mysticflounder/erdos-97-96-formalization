/-
Generated packed-source bridge for verified left chunk 053.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk053_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h3392 : ((!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 27).ult (rankAtom ranks 28)))) = true)
    (h3393 : ((!((rankAtom ranks 6 == rankAtom ranks 27)) || ((rankAtom ranks 7).ult (rankAtom ranks 28)))) = true)
    (h3394 : ((!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 27).ult (rankAtom ranks 6)))) = true)
    (h3395 : ((!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 7).ult (rankAtom ranks 6)))) = true)
    (h3396 : ((!((rankAtom ranks 6 == rankAtom ranks 1)) || ((rankAtom ranks 64).ult (rankAtom ranks 29)))) = true)
    (h3397 : ((!((rankAtom ranks 29 == rankAtom ranks 1)) || ((rankAtom ranks 64).ult (rankAtom ranks 6)))) = true)
    (h3398 : ((!((rankAtom ranks 29 == rankAtom ranks 64)) || ((rankAtom ranks 1).ult (rankAtom ranks 6)))) = true)
    (h3399 : ((!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 27).ult (rankAtom ranks 29)))) = true)
    (h3400 : ((!((rankAtom ranks 29 == rankAtom ranks 8)) || ((rankAtom ranks 27).ult (rankAtom ranks 6)))) = true)
    (h3401 : ((!((rankAtom ranks 29 == rankAtom ranks 27)) || ((rankAtom ranks 8).ult (rankAtom ranks 6)))) = true)
    (h3402 : ((!((rankAtom ranks 6 == rankAtom ranks 1)) || ((rankAtom ranks 65).ult (rankAtom ranks 30)))) = true)
    (h3403 : ((!((rankAtom ranks 30 == rankAtom ranks 1)) || ((rankAtom ranks 65).ult (rankAtom ranks 6)))) = true)
    (h3404 : ((!((rankAtom ranks 30 == rankAtom ranks 65)) || ((rankAtom ranks 1).ult (rankAtom ranks 6)))) = true)
    (h3405 : ((!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 27).ult (rankAtom ranks 30)))) = true)
    (h3406 : ((!((rankAtom ranks 30 == rankAtom ranks 9)) || ((rankAtom ranks 27).ult (rankAtom ranks 6)))) = true)
    (h3407 : ((!((rankAtom ranks 30 == rankAtom ranks 27)) || ((rankAtom ranks 9).ult (rankAtom ranks 6)))) = true)
    (h3408 : ((!((rankAtom ranks 6 == rankAtom ranks 1)) || ((rankAtom ranks 66).ult (rankAtom ranks 31)))) = true)
    (h3409 : ((!((rankAtom ranks 6 == rankAtom ranks 66)) || ((rankAtom ranks 1).ult (rankAtom ranks 31)))) = true)
    (h3410 : ((!((rankAtom ranks 31 == rankAtom ranks 1)) || ((rankAtom ranks 66).ult (rankAtom ranks 6)))) = true)
    (h3411 : ((!((rankAtom ranks 31 == rankAtom ranks 66)) || ((rankAtom ranks 1).ult (rankAtom ranks 6)))) = true)
    (h3412 : ((!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 27).ult (rankAtom ranks 31)))) = true)
    (h3413 : ((!((rankAtom ranks 31 == rankAtom ranks 10)) || ((rankAtom ranks 27).ult (rankAtom ranks 6)))) = true)
    (h3414 : ((!((rankAtom ranks 31 == rankAtom ranks 27)) || ((rankAtom ranks 10).ult (rankAtom ranks 6)))) = true)
    (h3415 : ((!((rankAtom ranks 6 == rankAtom ranks 1)) || ((rankAtom ranks 67).ult (rankAtom ranks 32)))) = true)
    (h3416 : ((!((rankAtom ranks 32 == rankAtom ranks 1)) || ((rankAtom ranks 67).ult (rankAtom ranks 6)))) = true)
    (h3417 : ((!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 27).ult (rankAtom ranks 32)))) = true)
    (h3418 : ((!((rankAtom ranks 32 == rankAtom ranks 27)) || ((rankAtom ranks 11).ult (rankAtom ranks 6)))) = true)
    (h3419 : ((!((rankAtom ranks 7 == rankAtom ranks 1)) || ((rankAtom ranks 68).ult (rankAtom ranks 29)))) = true)
    (h3420 : ((!((rankAtom ranks 29 == rankAtom ranks 1)) || ((rankAtom ranks 68).ult (rankAtom ranks 7)))) = true)
    (h3421 : ((!((rankAtom ranks 29 == rankAtom ranks 68)) || ((rankAtom ranks 1).ult (rankAtom ranks 7)))) = true)
    (h3422 : ((!((rankAtom ranks 7 == rankAtom ranks 8)) || ((rankAtom ranks 28).ult (rankAtom ranks 29)))) = true)
    (h3423 : ((!((rankAtom ranks 7 == rankAtom ranks 28)) || ((rankAtom ranks 8).ult (rankAtom ranks 29)))) = true)
    (h3424 : ((!((rankAtom ranks 29 == rankAtom ranks 8)) || ((rankAtom ranks 28).ult (rankAtom ranks 7)))) = true)
    (h3425 : ((!((rankAtom ranks 29 == rankAtom ranks 28)) || ((rankAtom ranks 8).ult (rankAtom ranks 7)))) = true)
    (h3426 : ((!((rankAtom ranks 7 == rankAtom ranks 1)) || ((rankAtom ranks 69).ult (rankAtom ranks 30)))) = true)
    (h3427 : ((!((rankAtom ranks 30 == rankAtom ranks 1)) || ((rankAtom ranks 69).ult (rankAtom ranks 7)))) = true)
    (h3428 : ((!((rankAtom ranks 30 == rankAtom ranks 69)) || ((rankAtom ranks 1).ult (rankAtom ranks 7)))) = true)
    (h3429 : ((!((rankAtom ranks 7 == rankAtom ranks 9)) || ((rankAtom ranks 28).ult (rankAtom ranks 30)))) = true)
    (h3430 : ((!((rankAtom ranks 7 == rankAtom ranks 28)) || ((rankAtom ranks 9).ult (rankAtom ranks 30)))) = true)
    (h3431 : ((!((rankAtom ranks 30 == rankAtom ranks 9)) || ((rankAtom ranks 28).ult (rankAtom ranks 7)))) = true)
    (h3432 : ((!((rankAtom ranks 30 == rankAtom ranks 28)) || ((rankAtom ranks 9).ult (rankAtom ranks 7)))) = true)
    (h3433 : ((!((rankAtom ranks 7 == rankAtom ranks 1)) || ((rankAtom ranks 70).ult (rankAtom ranks 31)))) = true)
    (h3434 : ((!((rankAtom ranks 31 == rankAtom ranks 1)) || ((rankAtom ranks 70).ult (rankAtom ranks 7)))) = true)
    (h3435 : ((!((rankAtom ranks 31 == rankAtom ranks 70)) || ((rankAtom ranks 1).ult (rankAtom ranks 7)))) = true)
    (h3436 : ((!((rankAtom ranks 7 == rankAtom ranks 28)) || ((rankAtom ranks 10).ult (rankAtom ranks 31)))) = true)
    (h3437 : ((!((rankAtom ranks 31 == rankAtom ranks 10)) || ((rankAtom ranks 28).ult (rankAtom ranks 7)))) = true)
    (h3438 : ((!((rankAtom ranks 31 == rankAtom ranks 28)) || ((rankAtom ranks 10).ult (rankAtom ranks 7)))) = true)
    (h3439 : ((!((rankAtom ranks 7 == rankAtom ranks 1)) || ((rankAtom ranks 71).ult (rankAtom ranks 32)))) = true)
    (h3440 : ((!((rankAtom ranks 32 == rankAtom ranks 1)) || ((rankAtom ranks 71).ult (rankAtom ranks 7)))) = true)
    (h3441 : ((!((rankAtom ranks 7 == rankAtom ranks 28)) || ((rankAtom ranks 11).ult (rankAtom ranks 32)))) = true)
    (h3442 : ((!((rankAtom ranks 32 == rankAtom ranks 11)) || ((rankAtom ranks 28).ult (rankAtom ranks 7)))) = true)
    (h3443 : ((!((rankAtom ranks 32 == rankAtom ranks 28)) || ((rankAtom ranks 11).ult (rankAtom ranks 7)))) = true)
    (h3444 : ((!((rankAtom ranks 8 == rankAtom ranks 1)) || ((rankAtom ranks 72).ult (rankAtom ranks 30)))) = true)
    (h3445 : ((!((rankAtom ranks 8 == rankAtom ranks 72)) || ((rankAtom ranks 1).ult (rankAtom ranks 30)))) = true)
    (h3446 : ((!((rankAtom ranks 30 == rankAtom ranks 1)) || ((rankAtom ranks 72).ult (rankAtom ranks 8)))) = true)
    (h3447 : ((!((rankAtom ranks 30 == rankAtom ranks 72)) || ((rankAtom ranks 1).ult (rankAtom ranks 8)))) = true)
    (h3448 : ((!((rankAtom ranks 8 == rankAtom ranks 29)) || ((rankAtom ranks 9).ult (rankAtom ranks 30)))) = true)
    (h3449 : ((!((rankAtom ranks 30 == rankAtom ranks 9)) || ((rankAtom ranks 29).ult (rankAtom ranks 8)))) = true)
    (h3450 : ((!((rankAtom ranks 30 == rankAtom ranks 29)) || ((rankAtom ranks 9).ult (rankAtom ranks 8)))) = true)
    (h3451 : ((!((rankAtom ranks 8 == rankAtom ranks 1)) || ((rankAtom ranks 73).ult (rankAtom ranks 31)))) = true)
    (h3452 : ((!((rankAtom ranks 8 == rankAtom ranks 73)) || ((rankAtom ranks 1).ult (rankAtom ranks 31)))) = true)
    (h3453 : ((!((rankAtom ranks 31 == rankAtom ranks 1)) || ((rankAtom ranks 73).ult (rankAtom ranks 8)))) = true)
    (h3454 : ((!((rankAtom ranks 31 == rankAtom ranks 73)) || ((rankAtom ranks 1).ult (rankAtom ranks 8)))) = true)
    (h3455 : ((!((rankAtom ranks 8 == rankAtom ranks 29)) || ((rankAtom ranks 10).ult (rankAtom ranks 31)))) = true) :
    ∀ item ∈ sourceChunk053Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk053Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3392
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3393
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3394
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3395
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3396
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3397
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3398
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3399
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3400
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3401
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3402
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3403
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3404
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3405
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3406
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3407
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3408
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3409
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3410
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3411
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3412
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3413
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3414
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3415
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3416
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3417
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3418
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3419
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3420
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3421
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3422
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3423
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3424
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3425
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3426
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3427
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3428
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3429
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3430
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3431
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3432
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3433
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3434
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3435
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3436
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3437
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3438
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3439
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3440
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3441
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3442
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3443
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3444
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3445
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3446
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3447
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3448
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3449
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3450
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3451
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3452
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3453
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3454
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3455

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
