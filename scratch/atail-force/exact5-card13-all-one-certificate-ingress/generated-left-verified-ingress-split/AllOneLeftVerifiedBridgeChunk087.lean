/-
Generated packed-source bridge for verified left chunk 087.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk087_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h5568 : ((!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 74).ult (rankAtom ranks 29)))) = true)
    (h5569 : ((!((rankAtom ranks 49 == rankAtom ranks 74)) || ((rankAtom ranks 24).ult (rankAtom ranks 29)))) = true)
    (h5570 : ((!((rankAtom ranks 29 == rankAtom ranks 32)) || ((rankAtom ranks 46).ult (rankAtom ranks 49)))) = true)
    (h5571 : ((!((rankAtom ranks 29 == rankAtom ranks 46)) || ((rankAtom ranks 32).ult (rankAtom ranks 49)))) = true)
    (h5572 : ((!((rankAtom ranks 49 == rankAtom ranks 46)) || ((rankAtom ranks 32).ult (rankAtom ranks 29)))) = true)
    (h5573 : ((!((rankAtom ranks 30 == rankAtom ranks 24)) || ((rankAtom ranks 75).ult (rankAtom ranks 48)))) = true)
    (h5574 : ((!((rankAtom ranks 30 == rankAtom ranks 75)) || ((rankAtom ranks 24).ult (rankAtom ranks 48)))) = true)
    (h5575 : ((!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 75).ult (rankAtom ranks 30)))) = true)
    (h5576 : ((!((rankAtom ranks 48 == rankAtom ranks 75)) || ((rankAtom ranks 24).ult (rankAtom ranks 30)))) = true)
    (h5577 : ((!((rankAtom ranks 30 == rankAtom ranks 31)) || ((rankAtom ranks 47).ult (rankAtom ranks 48)))) = true)
    (h5578 : ((!((rankAtom ranks 30 == rankAtom ranks 47)) || ((rankAtom ranks 31).ult (rankAtom ranks 48)))) = true)
    (h5579 : ((!((rankAtom ranks 48 == rankAtom ranks 31)) || ((rankAtom ranks 47).ult (rankAtom ranks 30)))) = true)
    (h5580 : ((!((rankAtom ranks 48 == rankAtom ranks 47)) || ((rankAtom ranks 31).ult (rankAtom ranks 30)))) = true)
    (h5581 : ((!((rankAtom ranks 30 == rankAtom ranks 24)) || ((rankAtom ranks 76).ult (rankAtom ranks 49)))) = true)
    (h5582 : ((!((rankAtom ranks 30 == rankAtom ranks 76)) || ((rankAtom ranks 24).ult (rankAtom ranks 49)))) = true)
    (h5583 : ((!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 76).ult (rankAtom ranks 30)))) = true)
    (h5584 : ((!((rankAtom ranks 30 == rankAtom ranks 32)) || ((rankAtom ranks 47).ult (rankAtom ranks 49)))) = true)
    (h5585 : ((!((rankAtom ranks 30 == rankAtom ranks 47)) || ((rankAtom ranks 32).ult (rankAtom ranks 49)))) = true)
    (h5586 : ((!((rankAtom ranks 49 == rankAtom ranks 47)) || ((rankAtom ranks 32).ult (rankAtom ranks 30)))) = true)
    (h5587 : ((!((rankAtom ranks 31 == rankAtom ranks 24)) || ((rankAtom ranks 77).ult (rankAtom ranks 49)))) = true)
    (h5588 : ((!((rankAtom ranks 31 == rankAtom ranks 77)) || ((rankAtom ranks 24).ult (rankAtom ranks 49)))) = true)
    (h5589 : ((!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 77).ult (rankAtom ranks 31)))) = true)
    (h5590 : ((!((rankAtom ranks 31 == rankAtom ranks 32)) || ((rankAtom ranks 48).ult (rankAtom ranks 49)))) = true)
    (h5591 : ((!((rankAtom ranks 31 == rankAtom ranks 48)) || ((rankAtom ranks 32).ult (rankAtom ranks 49)))) = true)
    (h5592 : ((!((rankAtom ranks 49 == rankAtom ranks 48)) || ((rankAtom ranks 32).ult (rankAtom ranks 31)))) = true)
    (h5593 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 57).ult (rankAtom ranks 51)))) = true)
    (h5594 : ((!((rankAtom ranks 26 == rankAtom ranks 57)) || ((rankAtom ranks 25).ult (rankAtom ranks 51)))) = true)
    (h5595 : ((!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 25).ult (rankAtom ranks 26)))) = true)
    (h5596 : ((!((rankAtom ranks 26 == rankAtom ranks 27)) || ((rankAtom ranks 50).ult (rankAtom ranks 51)))) = true)
    (h5597 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 27).ult (rankAtom ranks 51)))) = true)
    (h5598 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 27).ult (rankAtom ranks 26)))) = true)
    (h5599 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 58).ult (rankAtom ranks 52)))) = true)
    (h5600 : ((!((rankAtom ranks 26 == rankAtom ranks 58)) || ((rankAtom ranks 25).ult (rankAtom ranks 52)))) = true)
    (h5601 : ((!((rankAtom ranks 52 == rankAtom ranks 25)) || ((rankAtom ranks 58).ult (rankAtom ranks 26)))) = true)
    (h5602 : ((!((rankAtom ranks 26 == rankAtom ranks 28)) || ((rankAtom ranks 50).ult (rankAtom ranks 52)))) = true)
    (h5603 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 28).ult (rankAtom ranks 52)))) = true)
    (h5604 : ((!((rankAtom ranks 52 == rankAtom ranks 28)) || ((rankAtom ranks 50).ult (rankAtom ranks 26)))) = true)
    (h5605 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 28).ult (rankAtom ranks 26)))) = true)
    (h5606 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 59).ult (rankAtom ranks 53)))) = true)
    (h5607 : ((!((rankAtom ranks 26 == rankAtom ranks 59)) || ((rankAtom ranks 25).ult (rankAtom ranks 53)))) = true)
    (h5608 : ((!((rankAtom ranks 53 == rankAtom ranks 25)) || ((rankAtom ranks 59).ult (rankAtom ranks 26)))) = true)
    (h5609 : ((!((rankAtom ranks 53 == rankAtom ranks 59)) || ((rankAtom ranks 25).ult (rankAtom ranks 26)))) = true)
    (h5610 : ((!((rankAtom ranks 26 == rankAtom ranks 29)) || ((rankAtom ranks 50).ult (rankAtom ranks 53)))) = true)
    (h5611 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 29).ult (rankAtom ranks 53)))) = true)
    (h5612 : ((!((rankAtom ranks 53 == rankAtom ranks 29)) || ((rankAtom ranks 50).ult (rankAtom ranks 26)))) = true)
    (h5613 : ((!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 29).ult (rankAtom ranks 26)))) = true)
    (h5614 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 60).ult (rankAtom ranks 54)))) = true)
    (h5615 : ((!((rankAtom ranks 26 == rankAtom ranks 60)) || ((rankAtom ranks 25).ult (rankAtom ranks 54)))) = true)
    (h5616 : ((!((rankAtom ranks 54 == rankAtom ranks 25)) || ((rankAtom ranks 60).ult (rankAtom ranks 26)))) = true)
    (h5617 : ((!((rankAtom ranks 54 == rankAtom ranks 60)) || ((rankAtom ranks 25).ult (rankAtom ranks 26)))) = true)
    (h5618 : ((!((rankAtom ranks 26 == rankAtom ranks 30)) || ((rankAtom ranks 50).ult (rankAtom ranks 54)))) = true)
    (h5619 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 30).ult (rankAtom ranks 54)))) = true)
    (h5620 : ((!((rankAtom ranks 54 == rankAtom ranks 30)) || ((rankAtom ranks 50).ult (rankAtom ranks 26)))) = true)
    (h5621 : ((!((rankAtom ranks 54 == rankAtom ranks 50)) || ((rankAtom ranks 30).ult (rankAtom ranks 26)))) = true)
    (h5622 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 61).ult (rankAtom ranks 55)))) = true)
    (h5623 : ((!((rankAtom ranks 26 == rankAtom ranks 61)) || ((rankAtom ranks 25).ult (rankAtom ranks 55)))) = true)
    (h5624 : ((!((rankAtom ranks 55 == rankAtom ranks 25)) || ((rankAtom ranks 61).ult (rankAtom ranks 26)))) = true)
    (h5625 : ((!((rankAtom ranks 55 == rankAtom ranks 61)) || ((rankAtom ranks 25).ult (rankAtom ranks 26)))) = true)
    (h5626 : ((!((rankAtom ranks 26 == rankAtom ranks 31)) || ((rankAtom ranks 50).ult (rankAtom ranks 55)))) = true)
    (h5627 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 31).ult (rankAtom ranks 55)))) = true)
    (h5628 : ((!((rankAtom ranks 55 == rankAtom ranks 31)) || ((rankAtom ranks 50).ult (rankAtom ranks 26)))) = true)
    (h5629 : ((!((rankAtom ranks 55 == rankAtom ranks 50)) || ((rankAtom ranks 31).ult (rankAtom ranks 26)))) = true)
    (h5630 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 62).ult (rankAtom ranks 56)))) = true)
    (h5631 : ((!((rankAtom ranks 26 == rankAtom ranks 62)) || ((rankAtom ranks 25).ult (rankAtom ranks 56)))) = true) :
    ∀ item ∈ sourceChunk087Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk087Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5568
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5569
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5570
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5571
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5572
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5573
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5574
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5575
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5576
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5577
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5578
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5579
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5580
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5581
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5582
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5583
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5584
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5585
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5586
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5587
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5588
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5589
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5590
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5591
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5592
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5593
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5594
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5595
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5596
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5597
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5598
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5599
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5600
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5601
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5602
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5603
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5604
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5605
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5606
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5607
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5608
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5609
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5610
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5611
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5612
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5613
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5614
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5615
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5616
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5617
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5618
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5619
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5620
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5621
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5622
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5623
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5624
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5625
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5626
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5627
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5628
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5629
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5630
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5631

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
