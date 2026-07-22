/-
Generated packed-source bridge for verified left chunk 054.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk054_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h3456 : ((!((rankAtom ranks 31 == rankAtom ranks 10)) || ((rankAtom ranks 29).ult (rankAtom ranks 8)))) = true)
    (h3457 : ((!((rankAtom ranks 31 == rankAtom ranks 29)) || ((rankAtom ranks 10).ult (rankAtom ranks 8)))) = true)
    (h3458 : ((!((rankAtom ranks 8 == rankAtom ranks 1)) || ((rankAtom ranks 74).ult (rankAtom ranks 32)))) = true)
    (h3459 : ((!((rankAtom ranks 8 == rankAtom ranks 74)) || ((rankAtom ranks 1).ult (rankAtom ranks 32)))) = true)
    (h3460 : ((!((rankAtom ranks 32 == rankAtom ranks 1)) || ((rankAtom ranks 74).ult (rankAtom ranks 8)))) = true)
    (h3461 : ((!((rankAtom ranks 8 == rankAtom ranks 11)) || ((rankAtom ranks 29).ult (rankAtom ranks 32)))) = true)
    (h3462 : ((!((rankAtom ranks 8 == rankAtom ranks 29)) || ((rankAtom ranks 11).ult (rankAtom ranks 32)))) = true)
    (h3463 : ((!((rankAtom ranks 32 == rankAtom ranks 29)) || ((rankAtom ranks 11).ult (rankAtom ranks 8)))) = true)
    (h3464 : ((!((rankAtom ranks 9 == rankAtom ranks 1)) || ((rankAtom ranks 75).ult (rankAtom ranks 31)))) = true)
    (h3465 : ((!((rankAtom ranks 9 == rankAtom ranks 75)) || ((rankAtom ranks 1).ult (rankAtom ranks 31)))) = true)
    (h3466 : ((!((rankAtom ranks 31 == rankAtom ranks 1)) || ((rankAtom ranks 75).ult (rankAtom ranks 9)))) = true)
    (h3467 : ((!((rankAtom ranks 31 == rankAtom ranks 75)) || ((rankAtom ranks 1).ult (rankAtom ranks 9)))) = true)
    (h3468 : ((!((rankAtom ranks 9 == rankAtom ranks 30)) || ((rankAtom ranks 10).ult (rankAtom ranks 31)))) = true)
    (h3469 : ((!((rankAtom ranks 31 == rankAtom ranks 10)) || ((rankAtom ranks 30).ult (rankAtom ranks 9)))) = true)
    (h3470 : ((!((rankAtom ranks 31 == rankAtom ranks 30)) || ((rankAtom ranks 10).ult (rankAtom ranks 9)))) = true)
    (h3471 : ((!((rankAtom ranks 9 == rankAtom ranks 1)) || ((rankAtom ranks 76).ult (rankAtom ranks 32)))) = true)
    (h3472 : ((!((rankAtom ranks 9 == rankAtom ranks 76)) || ((rankAtom ranks 1).ult (rankAtom ranks 32)))) = true)
    (h3473 : ((!((rankAtom ranks 32 == rankAtom ranks 1)) || ((rankAtom ranks 76).ult (rankAtom ranks 9)))) = true)
    (h3474 : ((!((rankAtom ranks 9 == rankAtom ranks 30)) || ((rankAtom ranks 11).ult (rankAtom ranks 32)))) = true)
    (h3475 : ((!((rankAtom ranks 32 == rankAtom ranks 30)) || ((rankAtom ranks 11).ult (rankAtom ranks 9)))) = true)
    (h3476 : ((!((rankAtom ranks 10 == rankAtom ranks 1)) || ((rankAtom ranks 77).ult (rankAtom ranks 32)))) = true)
    (h3477 : ((!((rankAtom ranks 10 == rankAtom ranks 77)) || ((rankAtom ranks 1).ult (rankAtom ranks 32)))) = true)
    (h3478 : ((!((rankAtom ranks 32 == rankAtom ranks 1)) || ((rankAtom ranks 77).ult (rankAtom ranks 10)))) = true)
    (h3479 : ((!((rankAtom ranks 10 == rankAtom ranks 31)) || ((rankAtom ranks 11).ult (rankAtom ranks 32)))) = true)
    (h3480 : ((!((rankAtom ranks 32 == rankAtom ranks 31)) || ((rankAtom ranks 11).ult (rankAtom ranks 10)))) = true)
    (h3481 : ((!((rankAtom ranks 3 == rankAtom ranks 2)) || ((rankAtom ranks 42).ult (rankAtom ranks 34)))) = true)
    (h3482 : ((!((rankAtom ranks 3 == rankAtom ranks 42)) || ((rankAtom ranks 2).ult (rankAtom ranks 34)))) = true)
    (h3483 : ((!((rankAtom ranks 34 == rankAtom ranks 2)) || ((rankAtom ranks 42).ult (rankAtom ranks 3)))) = true)
    (h3484 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 2).ult (rankAtom ranks 3)))) = true)
    (h3485 : ((!((rankAtom ranks 3 == rankAtom ranks 4)) || ((rankAtom ranks 33).ult (rankAtom ranks 34)))) = true)
    (h3486 : ((!((rankAtom ranks 3 == rankAtom ranks 33)) || ((rankAtom ranks 4).ult (rankAtom ranks 34)))) = true)
    (h3487 : ((!((rankAtom ranks 34 == rankAtom ranks 4)) || ((rankAtom ranks 33).ult (rankAtom ranks 3)))) = true)
    (h3488 : ((!((rankAtom ranks 3 == rankAtom ranks 43)) || ((rankAtom ranks 2).ult (rankAtom ranks 35)))) = true)
    (h3489 : ((!((rankAtom ranks 35 == rankAtom ranks 2)) || ((rankAtom ranks 43).ult (rankAtom ranks 3)))) = true)
    (h3490 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 2).ult (rankAtom ranks 3)))) = true)
    (h3491 : ((!((rankAtom ranks 3 == rankAtom ranks 5)) || ((rankAtom ranks 33).ult (rankAtom ranks 35)))) = true)
    (h3492 : ((!((rankAtom ranks 3 == rankAtom ranks 33)) || ((rankAtom ranks 5).ult (rankAtom ranks 35)))) = true)
    (h3493 : ((!((rankAtom ranks 35 == rankAtom ranks 5)) || ((rankAtom ranks 33).ult (rankAtom ranks 3)))) = true)
    (h3494 : ((!((rankAtom ranks 3 == rankAtom ranks 2)) || ((rankAtom ranks 44).ult (rankAtom ranks 36)))) = true)
    (h3495 : ((!((rankAtom ranks 3 == rankAtom ranks 44)) || ((rankAtom ranks 2).ult (rankAtom ranks 36)))) = true)
    (h3496 : ((!((rankAtom ranks 36 == rankAtom ranks 2)) || ((rankAtom ranks 44).ult (rankAtom ranks 3)))) = true)
    (h3497 : ((!((rankAtom ranks 36 == rankAtom ranks 44)) || ((rankAtom ranks 2).ult (rankAtom ranks 3)))) = true)
    (h3498 : ((!((rankAtom ranks 3 == rankAtom ranks 6)) || ((rankAtom ranks 33).ult (rankAtom ranks 36)))) = true)
    (h3499 : ((!((rankAtom ranks 3 == rankAtom ranks 33)) || ((rankAtom ranks 6).ult (rankAtom ranks 36)))) = true)
    (h3500 : ((!((rankAtom ranks 36 == rankAtom ranks 33)) || ((rankAtom ranks 6).ult (rankAtom ranks 3)))) = true)
    (h3501 : ((!((rankAtom ranks 3 == rankAtom ranks 2)) || ((rankAtom ranks 45).ult (rankAtom ranks 37)))) = true)
    (h3502 : ((!((rankAtom ranks 3 == rankAtom ranks 45)) || ((rankAtom ranks 2).ult (rankAtom ranks 37)))) = true)
    (h3503 : ((!((rankAtom ranks 37 == rankAtom ranks 2)) || ((rankAtom ranks 45).ult (rankAtom ranks 3)))) = true)
    (h3504 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 2).ult (rankAtom ranks 3)))) = true)
    (h3505 : ((!((rankAtom ranks 3 == rankAtom ranks 7)) || ((rankAtom ranks 33).ult (rankAtom ranks 37)))) = true)
    (h3506 : ((!((rankAtom ranks 3 == rankAtom ranks 33)) || ((rankAtom ranks 7).ult (rankAtom ranks 37)))) = true)
    (h3507 : ((!((rankAtom ranks 37 == rankAtom ranks 7)) || ((rankAtom ranks 33).ult (rankAtom ranks 3)))) = true)
    (h3508 : ((!((rankAtom ranks 37 == rankAtom ranks 33)) || ((rankAtom ranks 7).ult (rankAtom ranks 3)))) = true)
    (h3509 : ((!((rankAtom ranks 3 == rankAtom ranks 46)) || ((rankAtom ranks 2).ult (rankAtom ranks 38)))) = true)
    (h3510 : ((!((rankAtom ranks 38 == rankAtom ranks 2)) || ((rankAtom ranks 46).ult (rankAtom ranks 3)))) = true)
    (h3511 : ((!((rankAtom ranks 38 == rankAtom ranks 46)) || ((rankAtom ranks 2).ult (rankAtom ranks 3)))) = true)
    (h3512 : ((!((rankAtom ranks 3 == rankAtom ranks 33)) || ((rankAtom ranks 8).ult (rankAtom ranks 38)))) = true)
    (h3513 : ((!((rankAtom ranks 38 == rankAtom ranks 8)) || ((rankAtom ranks 33).ult (rankAtom ranks 3)))) = true)
    (h3514 : ((!((rankAtom ranks 3 == rankAtom ranks 47)) || ((rankAtom ranks 2).ult (rankAtom ranks 39)))) = true)
    (h3515 : ((!((rankAtom ranks 39 == rankAtom ranks 2)) || ((rankAtom ranks 47).ult (rankAtom ranks 3)))) = true)
    (h3516 : ((!((rankAtom ranks 39 == rankAtom ranks 47)) || ((rankAtom ranks 2).ult (rankAtom ranks 3)))) = true)
    (h3517 : ((!((rankAtom ranks 39 == rankAtom ranks 9)) || ((rankAtom ranks 33).ult (rankAtom ranks 3)))) = true)
    (h3518 : ((!((rankAtom ranks 3 == rankAtom ranks 48)) || ((rankAtom ranks 2).ult (rankAtom ranks 40)))) = true)
    (h3519 : ((!((rankAtom ranks 40 == rankAtom ranks 48)) || ((rankAtom ranks 2).ult (rankAtom ranks 3)))) = true) :
    ∀ item ∈ sourceChunk054Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk054Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3456
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3457
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3458
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3459
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3460
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3461
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3462
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3463
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3464
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3465
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3466
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3467
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3468
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3469
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3470
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3471
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3472
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3473
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3474
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3475
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3476
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3477
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3478
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3479
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3480
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3481
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3482
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3483
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3484
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3485
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3486
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3487
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3488
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3489
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3490
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3491
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3492
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3493
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3494
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3495
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3496
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3497
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3498
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3499
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3500
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3501
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3502
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3503
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3504
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3505
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3506
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3507
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3508
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3509
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3510
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3511
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3512
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3513
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3514
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3515
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3516
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3517
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3518
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3519

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
