/-
Generated packed-source bridge for verified right chunk 055.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk055_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h3520 : ((!((rankAtom ranks 3 == rankAtom ranks 33)) || ((rankAtom ranks 10).ult (rankAtom ranks 40)))) = true)
    (h3521 : ((!((rankAtom ranks 40 == rankAtom ranks 10)) || ((rankAtom ranks 33).ult (rankAtom ranks 3)))) = true)
    (h3522 : ((!((rankAtom ranks 3 == rankAtom ranks 49)) || ((rankAtom ranks 2).ult (rankAtom ranks 41)))) = true)
    (h3523 : ((!((rankAtom ranks 41 == rankAtom ranks 49)) || ((rankAtom ranks 2).ult (rankAtom ranks 3)))) = true)
    (h3524 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 50).ult (rankAtom ranks 35)))) = true)
    (h3525 : ((!((rankAtom ranks 4 == rankAtom ranks 50)) || ((rankAtom ranks 2).ult (rankAtom ranks 35)))) = true)
    (h3526 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 2).ult (rankAtom ranks 4)))) = true)
    (h3527 : ((!((rankAtom ranks 4 == rankAtom ranks 5)) || ((rankAtom ranks 34).ult (rankAtom ranks 35)))) = true)
    (h3528 : ((!((rankAtom ranks 4 == rankAtom ranks 34)) || ((rankAtom ranks 5).ult (rankAtom ranks 35)))) = true)
    (h3529 : ((!((rankAtom ranks 35 == rankAtom ranks 5)) || ((rankAtom ranks 34).ult (rankAtom ranks 4)))) = true)
    (h3530 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 51).ult (rankAtom ranks 36)))) = true)
    (h3531 : ((!((rankAtom ranks 4 == rankAtom ranks 51)) || ((rankAtom ranks 2).ult (rankAtom ranks 36)))) = true)
    (h3532 : ((!((rankAtom ranks 36 == rankAtom ranks 51)) || ((rankAtom ranks 2).ult (rankAtom ranks 4)))) = true)
    (h3533 : ((!((rankAtom ranks 4 == rankAtom ranks 6)) || ((rankAtom ranks 34).ult (rankAtom ranks 36)))) = true)
    (h3534 : ((!((rankAtom ranks 4 == rankAtom ranks 34)) || ((rankAtom ranks 6).ult (rankAtom ranks 36)))) = true)
    (h3535 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 52).ult (rankAtom ranks 37)))) = true)
    (h3536 : ((!((rankAtom ranks 4 == rankAtom ranks 52)) || ((rankAtom ranks 2).ult (rankAtom ranks 37)))) = true)
    (h3537 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 2).ult (rankAtom ranks 4)))) = true)
    (h3538 : ((!((rankAtom ranks 4 == rankAtom ranks 7)) || ((rankAtom ranks 34).ult (rankAtom ranks 37)))) = true)
    (h3539 : ((!((rankAtom ranks 4 == rankAtom ranks 34)) || ((rankAtom ranks 7).ult (rankAtom ranks 37)))) = true)
    (h3540 : ((!((rankAtom ranks 37 == rankAtom ranks 7)) || ((rankAtom ranks 34).ult (rankAtom ranks 4)))) = true)
    (h3541 : ((!((rankAtom ranks 37 == rankAtom ranks 34)) || ((rankAtom ranks 7).ult (rankAtom ranks 4)))) = true)
    (h3542 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 53).ult (rankAtom ranks 38)))) = true)
    (h3543 : ((!((rankAtom ranks 4 == rankAtom ranks 53)) || ((rankAtom ranks 2).ult (rankAtom ranks 38)))) = true)
    (h3544 : ((!((rankAtom ranks 38 == rankAtom ranks 53)) || ((rankAtom ranks 2).ult (rankAtom ranks 4)))) = true)
    (h3545 : ((!((rankAtom ranks 4 == rankAtom ranks 8)) || ((rankAtom ranks 34).ult (rankAtom ranks 38)))) = true)
    (h3546 : ((!((rankAtom ranks 4 == rankAtom ranks 34)) || ((rankAtom ranks 8).ult (rankAtom ranks 38)))) = true)
    (h3547 : ((!((rankAtom ranks 38 == rankAtom ranks 8)) || ((rankAtom ranks 34).ult (rankAtom ranks 4)))) = true)
    (h3548 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 54).ult (rankAtom ranks 39)))) = true)
    (h3549 : ((!((rankAtom ranks 4 == rankAtom ranks 54)) || ((rankAtom ranks 2).ult (rankAtom ranks 39)))) = true)
    (h3550 : ((!((rankAtom ranks 39 == rankAtom ranks 54)) || ((rankAtom ranks 2).ult (rankAtom ranks 4)))) = true)
    (h3551 : ((!((rankAtom ranks 4 == rankAtom ranks 9)) || ((rankAtom ranks 34).ult (rankAtom ranks 39)))) = true)
    (h3552 : ((!((rankAtom ranks 4 == rankAtom ranks 34)) || ((rankAtom ranks 9).ult (rankAtom ranks 39)))) = true)
    (h3553 : ((!((rankAtom ranks 39 == rankAtom ranks 9)) || ((rankAtom ranks 34).ult (rankAtom ranks 4)))) = true)
    (h3554 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 55).ult (rankAtom ranks 40)))) = true)
    (h3555 : ((!((rankAtom ranks 4 == rankAtom ranks 55)) || ((rankAtom ranks 2).ult (rankAtom ranks 40)))) = true)
    (h3556 : ((!((rankAtom ranks 40 == rankAtom ranks 2)) || ((rankAtom ranks 55).ult (rankAtom ranks 4)))) = true)
    (h3557 : ((!((rankAtom ranks 40 == rankAtom ranks 55)) || ((rankAtom ranks 2).ult (rankAtom ranks 4)))) = true)
    (h3558 : ((!((rankAtom ranks 4 == rankAtom ranks 10)) || ((rankAtom ranks 34).ult (rankAtom ranks 40)))) = true)
    (h3559 : ((!((rankAtom ranks 4 == rankAtom ranks 34)) || ((rankAtom ranks 10).ult (rankAtom ranks 40)))) = true)
    (h3560 : ((!((rankAtom ranks 40 == rankAtom ranks 10)) || ((rankAtom ranks 34).ult (rankAtom ranks 4)))) = true)
    (h3561 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 56).ult (rankAtom ranks 41)))) = true)
    (h3562 : ((!((rankAtom ranks 4 == rankAtom ranks 56)) || ((rankAtom ranks 2).ult (rankAtom ranks 41)))) = true)
    (h3563 : ((!((rankAtom ranks 41 == rankAtom ranks 56)) || ((rankAtom ranks 2).ult (rankAtom ranks 4)))) = true)
    (h3564 : ((!((rankAtom ranks 4 == rankAtom ranks 11)) || ((rankAtom ranks 34).ult (rankAtom ranks 41)))) = true)
    (h3565 : ((!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 57).ult (rankAtom ranks 36)))) = true)
    (h3566 : ((!((rankAtom ranks 5 == rankAtom ranks 57)) || ((rankAtom ranks 2).ult (rankAtom ranks 36)))) = true)
    (h3567 : ((!((rankAtom ranks 36 == rankAtom ranks 2)) || ((rankAtom ranks 57).ult (rankAtom ranks 5)))) = true)
    (h3568 : ((!((rankAtom ranks 36 == rankAtom ranks 57)) || ((rankAtom ranks 2).ult (rankAtom ranks 5)))) = true)
    (h3569 : ((!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 35).ult (rankAtom ranks 36)))) = true)
    (h3570 : ((!((rankAtom ranks 5 == rankAtom ranks 35)) || ((rankAtom ranks 6).ult (rankAtom ranks 36)))) = true)
    (h3571 : ((!((rankAtom ranks 36 == rankAtom ranks 6)) || ((rankAtom ranks 35).ult (rankAtom ranks 5)))) = true)
    (h3572 : ((!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 58).ult (rankAtom ranks 37)))) = true)
    (h3573 : ((!((rankAtom ranks 5 == rankAtom ranks 58)) || ((rankAtom ranks 2).ult (rankAtom ranks 37)))) = true)
    (h3574 : ((!((rankAtom ranks 37 == rankAtom ranks 2)) || ((rankAtom ranks 58).ult (rankAtom ranks 5)))) = true)
    (h3575 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 2).ult (rankAtom ranks 5)))) = true)
    (h3576 : ((!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 35).ult (rankAtom ranks 37)))) = true)
    (h3577 : ((!((rankAtom ranks 5 == rankAtom ranks 35)) || ((rankAtom ranks 7).ult (rankAtom ranks 37)))) = true)
    (h3578 : ((!((rankAtom ranks 37 == rankAtom ranks 7)) || ((rankAtom ranks 35).ult (rankAtom ranks 5)))) = true)
    (h3579 : ((!((rankAtom ranks 37 == rankAtom ranks 35)) || ((rankAtom ranks 7).ult (rankAtom ranks 5)))) = true)
    (h3580 : ((!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 59).ult (rankAtom ranks 38)))) = true)
    (h3581 : ((!((rankAtom ranks 5 == rankAtom ranks 59)) || ((rankAtom ranks 2).ult (rankAtom ranks 38)))) = true)
    (h3582 : ((!((rankAtom ranks 38 == rankAtom ranks 2)) || ((rankAtom ranks 59).ult (rankAtom ranks 5)))) = true)
    (h3583 : ((!((rankAtom ranks 38 == rankAtom ranks 59)) || ((rankAtom ranks 2).ult (rankAtom ranks 5)))) = true) :
    ∀ item ∈ sourceChunk055Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk055Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3520
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3521
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3522
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3523
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3524
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3525
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3526
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3527
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3528
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3529
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3530
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3531
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3532
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3533
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3534
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3535
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3536
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3537
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3538
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3539
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3540
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3541
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3542
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3543
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3544
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3545
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3546
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3547
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3548
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3549
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3550
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3551
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3552
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3553
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3554
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3555
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3556
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3557
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3558
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3559
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3560
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3561
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3562
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3563
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3564
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3565
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3566
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3567
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3568
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3569
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3570
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3571
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3572
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3573
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3574
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3575
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3576
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3577
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3578
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3579
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3580
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3581
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3582
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3583

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
