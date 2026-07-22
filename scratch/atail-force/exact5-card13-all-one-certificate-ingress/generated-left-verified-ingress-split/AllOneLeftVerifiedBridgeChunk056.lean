/-
Generated packed-source bridge for verified left chunk 056.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk056_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h3584 : ((!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 35).ult (rankAtom ranks 38)))) = true)
    (h3585 : ((!((rankAtom ranks 5 == rankAtom ranks 35)) || ((rankAtom ranks 8).ult (rankAtom ranks 38)))) = true)
    (h3586 : ((!((rankAtom ranks 38 == rankAtom ranks 8)) || ((rankAtom ranks 35).ult (rankAtom ranks 5)))) = true)
    (h3587 : ((!((rankAtom ranks 38 == rankAtom ranks 35)) || ((rankAtom ranks 8).ult (rankAtom ranks 5)))) = true)
    (h3588 : ((!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 60).ult (rankAtom ranks 39)))) = true)
    (h3589 : ((!((rankAtom ranks 5 == rankAtom ranks 60)) || ((rankAtom ranks 2).ult (rankAtom ranks 39)))) = true)
    (h3590 : ((!((rankAtom ranks 39 == rankAtom ranks 2)) || ((rankAtom ranks 60).ult (rankAtom ranks 5)))) = true)
    (h3591 : ((!((rankAtom ranks 39 == rankAtom ranks 60)) || ((rankAtom ranks 2).ult (rankAtom ranks 5)))) = true)
    (h3592 : ((!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 35).ult (rankAtom ranks 39)))) = true)
    (h3593 : ((!((rankAtom ranks 5 == rankAtom ranks 35)) || ((rankAtom ranks 9).ult (rankAtom ranks 39)))) = true)
    (h3594 : ((!((rankAtom ranks 39 == rankAtom ranks 9)) || ((rankAtom ranks 35).ult (rankAtom ranks 5)))) = true)
    (h3595 : ((!((rankAtom ranks 39 == rankAtom ranks 35)) || ((rankAtom ranks 9).ult (rankAtom ranks 5)))) = true)
    (h3596 : ((!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 61).ult (rankAtom ranks 40)))) = true)
    (h3597 : ((!((rankAtom ranks 5 == rankAtom ranks 61)) || ((rankAtom ranks 2).ult (rankAtom ranks 40)))) = true)
    (h3598 : ((!((rankAtom ranks 40 == rankAtom ranks 2)) || ((rankAtom ranks 61).ult (rankAtom ranks 5)))) = true)
    (h3599 : ((!((rankAtom ranks 40 == rankAtom ranks 61)) || ((rankAtom ranks 2).ult (rankAtom ranks 5)))) = true)
    (h3600 : ((!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 35).ult (rankAtom ranks 40)))) = true)
    (h3601 : ((!((rankAtom ranks 5 == rankAtom ranks 35)) || ((rankAtom ranks 10).ult (rankAtom ranks 40)))) = true)
    (h3602 : ((!((rankAtom ranks 40 == rankAtom ranks 10)) || ((rankAtom ranks 35).ult (rankAtom ranks 5)))) = true)
    (h3603 : ((!((rankAtom ranks 40 == rankAtom ranks 35)) || ((rankAtom ranks 10).ult (rankAtom ranks 5)))) = true)
    (h3604 : ((!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 62).ult (rankAtom ranks 41)))) = true)
    (h3605 : ((!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 2).ult (rankAtom ranks 41)))) = true)
    (h3606 : ((!((rankAtom ranks 41 == rankAtom ranks 2)) || ((rankAtom ranks 62).ult (rankAtom ranks 5)))) = true)
    (h3607 : ((!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 35).ult (rankAtom ranks 41)))) = true)
    (h3608 : ((!((rankAtom ranks 5 == rankAtom ranks 35)) || ((rankAtom ranks 11).ult (rankAtom ranks 41)))) = true)
    (h3609 : ((!((rankAtom ranks 6 == rankAtom ranks 2)) || ((rankAtom ranks 63).ult (rankAtom ranks 37)))) = true)
    (h3610 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 2).ult (rankAtom ranks 6)))) = true)
    (h3611 : ((!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 36).ult (rankAtom ranks 37)))) = true)
    (h3612 : ((!((rankAtom ranks 6 == rankAtom ranks 36)) || ((rankAtom ranks 7).ult (rankAtom ranks 37)))) = true)
    (h3613 : ((!((rankAtom ranks 37 == rankAtom ranks 7)) || ((rankAtom ranks 36).ult (rankAtom ranks 6)))) = true)
    (h3614 : ((!((rankAtom ranks 37 == rankAtom ranks 36)) || ((rankAtom ranks 7).ult (rankAtom ranks 6)))) = true)
    (h3615 : ((!((rankAtom ranks 6 == rankAtom ranks 2)) || ((rankAtom ranks 64).ult (rankAtom ranks 38)))) = true)
    (h3616 : ((!((rankAtom ranks 38 == rankAtom ranks 64)) || ((rankAtom ranks 2).ult (rankAtom ranks 6)))) = true)
    (h3617 : ((!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 36).ult (rankAtom ranks 38)))) = true)
    (h3618 : ((!((rankAtom ranks 38 == rankAtom ranks 8)) || ((rankAtom ranks 36).ult (rankAtom ranks 6)))) = true)
    (h3619 : ((!((rankAtom ranks 38 == rankAtom ranks 36)) || ((rankAtom ranks 8).ult (rankAtom ranks 6)))) = true)
    (h3620 : ((!((rankAtom ranks 6 == rankAtom ranks 2)) || ((rankAtom ranks 65).ult (rankAtom ranks 39)))) = true)
    (h3621 : ((!((rankAtom ranks 6 == rankAtom ranks 65)) || ((rankAtom ranks 2).ult (rankAtom ranks 39)))) = true)
    (h3622 : ((!((rankAtom ranks 39 == rankAtom ranks 2)) || ((rankAtom ranks 65).ult (rankAtom ranks 6)))) = true)
    (h3623 : ((!((rankAtom ranks 39 == rankAtom ranks 65)) || ((rankAtom ranks 2).ult (rankAtom ranks 6)))) = true)
    (h3624 : ((!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 36).ult (rankAtom ranks 39)))) = true)
    (h3625 : ((!((rankAtom ranks 39 == rankAtom ranks 9)) || ((rankAtom ranks 36).ult (rankAtom ranks 6)))) = true)
    (h3626 : ((!((rankAtom ranks 39 == rankAtom ranks 36)) || ((rankAtom ranks 9).ult (rankAtom ranks 6)))) = true)
    (h3627 : ((!((rankAtom ranks 6 == rankAtom ranks 2)) || ((rankAtom ranks 66).ult (rankAtom ranks 40)))) = true)
    (h3628 : ((!((rankAtom ranks 6 == rankAtom ranks 66)) || ((rankAtom ranks 2).ult (rankAtom ranks 40)))) = true)
    (h3629 : ((!((rankAtom ranks 40 == rankAtom ranks 66)) || ((rankAtom ranks 2).ult (rankAtom ranks 6)))) = true)
    (h3630 : ((!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 36).ult (rankAtom ranks 40)))) = true)
    (h3631 : ((!((rankAtom ranks 40 == rankAtom ranks 10)) || ((rankAtom ranks 36).ult (rankAtom ranks 6)))) = true)
    (h3632 : ((!((rankAtom ranks 40 == rankAtom ranks 36)) || ((rankAtom ranks 10).ult (rankAtom ranks 6)))) = true)
    (h3633 : ((!((rankAtom ranks 6 == rankAtom ranks 2)) || ((rankAtom ranks 67).ult (rankAtom ranks 41)))) = true)
    (h3634 : ((!((rankAtom ranks 41 == rankAtom ranks 2)) || ((rankAtom ranks 67).ult (rankAtom ranks 6)))) = true)
    (h3635 : ((!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 36).ult (rankAtom ranks 41)))) = true)
    (h3636 : ((!((rankAtom ranks 7 == rankAtom ranks 2)) || ((rankAtom ranks 68).ult (rankAtom ranks 38)))) = true)
    (h3637 : ((!((rankAtom ranks 38 == rankAtom ranks 2)) || ((rankAtom ranks 68).ult (rankAtom ranks 7)))) = true)
    (h3638 : ((!((rankAtom ranks 38 == rankAtom ranks 68)) || ((rankAtom ranks 2).ult (rankAtom ranks 7)))) = true)
    (h3639 : ((!((rankAtom ranks 7 == rankAtom ranks 37)) || ((rankAtom ranks 8).ult (rankAtom ranks 38)))) = true)
    (h3640 : ((!((rankAtom ranks 38 == rankAtom ranks 8)) || ((rankAtom ranks 37).ult (rankAtom ranks 7)))) = true)
    (h3641 : ((!((rankAtom ranks 38 == rankAtom ranks 37)) || ((rankAtom ranks 8).ult (rankAtom ranks 7)))) = true)
    (h3642 : ((!((rankAtom ranks 7 == rankAtom ranks 2)) || ((rankAtom ranks 69).ult (rankAtom ranks 39)))) = true)
    (h3643 : ((!((rankAtom ranks 39 == rankAtom ranks 2)) || ((rankAtom ranks 69).ult (rankAtom ranks 7)))) = true)
    (h3644 : ((!((rankAtom ranks 39 == rankAtom ranks 69)) || ((rankAtom ranks 2).ult (rankAtom ranks 7)))) = true)
    (h3645 : ((!((rankAtom ranks 7 == rankAtom ranks 37)) || ((rankAtom ranks 9).ult (rankAtom ranks 39)))) = true)
    (h3646 : ((!((rankAtom ranks 39 == rankAtom ranks 9)) || ((rankAtom ranks 37).ult (rankAtom ranks 7)))) = true)
    (h3647 : ((!((rankAtom ranks 39 == rankAtom ranks 37)) || ((rankAtom ranks 9).ult (rankAtom ranks 7)))) = true) :
    ∀ item ∈ sourceChunk056Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk056Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3584
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3585
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3586
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3587
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3588
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3589
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3590
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3591
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3592
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3593
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3594
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3595
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3596
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3597
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3598
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3599
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3600
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3601
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3602
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3603
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3604
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3605
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3606
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3607
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3608
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3609
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3610
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3611
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3612
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3613
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3614
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3615
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3616
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3617
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3618
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3619
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3620
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3621
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3622
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3623
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3624
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3625
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3626
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3627
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3628
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3629
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3630
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3631
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3632
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3633
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3634
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3635
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3636
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3637
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3638
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3639
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3640
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3641
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3642
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3643
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3644
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3645
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3646
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3647

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
