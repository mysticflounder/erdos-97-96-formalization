/-
Generated packed-source bridge for verified middle chunk 072.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk072_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h4608 : ((!((rankAtom ranks 18 == rankAtom ranks 13)) || ((rankAtom ranks 68).ult (rankAtom ranks 38)))) = true)
    (h4609 : ((!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 13).ult (rankAtom ranks 38)))) = true)
    (h4610 : ((!((rankAtom ranks 38 == rankAtom ranks 68)) || ((rankAtom ranks 13).ult (rankAtom ranks 18)))) = true)
    (h4611 : ((!((rankAtom ranks 18 == rankAtom ranks 19)) || ((rankAtom ranks 37).ult (rankAtom ranks 38)))) = true)
    (h4612 : ((!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 19).ult (rankAtom ranks 38)))) = true)
    (h4613 : ((!((rankAtom ranks 38 == rankAtom ranks 19)) || ((rankAtom ranks 37).ult (rankAtom ranks 18)))) = true)
    (h4614 : ((!((rankAtom ranks 38 == rankAtom ranks 37)) || ((rankAtom ranks 19).ult (rankAtom ranks 18)))) = true)
    (h4615 : ((!((rankAtom ranks 18 == rankAtom ranks 13)) || ((rankAtom ranks 69).ult (rankAtom ranks 39)))) = true)
    (h4616 : ((!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 13).ult (rankAtom ranks 39)))) = true)
    (h4617 : ((!((rankAtom ranks 39 == rankAtom ranks 13)) || ((rankAtom ranks 69).ult (rankAtom ranks 18)))) = true)
    (h4618 : ((!((rankAtom ranks 39 == rankAtom ranks 69)) || ((rankAtom ranks 13).ult (rankAtom ranks 18)))) = true)
    (h4619 : ((!((rankAtom ranks 18 == rankAtom ranks 20)) || ((rankAtom ranks 37).ult (rankAtom ranks 39)))) = true)
    (h4620 : ((!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 20).ult (rankAtom ranks 39)))) = true)
    (h4621 : ((!((rankAtom ranks 39 == rankAtom ranks 20)) || ((rankAtom ranks 37).ult (rankAtom ranks 18)))) = true)
    (h4622 : ((!((rankAtom ranks 18 == rankAtom ranks 13)) || ((rankAtom ranks 70).ult (rankAtom ranks 40)))) = true)
    (h4623 : ((!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 13).ult (rankAtom ranks 40)))) = true)
    (h4624 : ((!((rankAtom ranks 40 == rankAtom ranks 13)) || ((rankAtom ranks 70).ult (rankAtom ranks 18)))) = true)
    (h4625 : ((!((rankAtom ranks 40 == rankAtom ranks 70)) || ((rankAtom ranks 13).ult (rankAtom ranks 18)))) = true)
    (h4626 : ((!((rankAtom ranks 18 == rankAtom ranks 21)) || ((rankAtom ranks 37).ult (rankAtom ranks 40)))) = true)
    (h4627 : ((!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 21).ult (rankAtom ranks 40)))) = true)
    (h4628 : ((!((rankAtom ranks 40 == rankAtom ranks 21)) || ((rankAtom ranks 37).ult (rankAtom ranks 18)))) = true)
    (h4629 : ((!((rankAtom ranks 18 == rankAtom ranks 13)) || ((rankAtom ranks 71).ult (rankAtom ranks 41)))) = true)
    (h4630 : ((!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 13).ult (rankAtom ranks 41)))) = true)
    (h4631 : ((!((rankAtom ranks 41 == rankAtom ranks 13)) || ((rankAtom ranks 71).ult (rankAtom ranks 18)))) = true)
    (h4632 : ((!((rankAtom ranks 18 == rankAtom ranks 22)) || ((rankAtom ranks 37).ult (rankAtom ranks 41)))) = true)
    (h4633 : ((!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 22).ult (rankAtom ranks 41)))) = true)
    (h4634 : ((!((rankAtom ranks 41 == rankAtom ranks 22)) || ((rankAtom ranks 37).ult (rankAtom ranks 18)))) = true)
    (h4635 : ((!((rankAtom ranks 19 == rankAtom ranks 13)) || ((rankAtom ranks 72).ult (rankAtom ranks 39)))) = true)
    (h4636 : ((!((rankAtom ranks 19 == rankAtom ranks 72)) || ((rankAtom ranks 13).ult (rankAtom ranks 39)))) = true)
    (h4637 : ((!((rankAtom ranks 39 == rankAtom ranks 13)) || ((rankAtom ranks 72).ult (rankAtom ranks 19)))) = true)
    (h4638 : ((!((rankAtom ranks 39 == rankAtom ranks 72)) || ((rankAtom ranks 13).ult (rankAtom ranks 19)))) = true)
    (h4639 : ((!((rankAtom ranks 19 == rankAtom ranks 20)) || ((rankAtom ranks 38).ult (rankAtom ranks 39)))) = true)
    (h4640 : ((!((rankAtom ranks 39 == rankAtom ranks 38)) || ((rankAtom ranks 20).ult (rankAtom ranks 19)))) = true)
    (h4641 : ((!((rankAtom ranks 19 == rankAtom ranks 13)) || ((rankAtom ranks 73).ult (rankAtom ranks 40)))) = true)
    (h4642 : ((!((rankAtom ranks 19 == rankAtom ranks 73)) || ((rankAtom ranks 13).ult (rankAtom ranks 40)))) = true)
    (h4643 : ((!((rankAtom ranks 40 == rankAtom ranks 73)) || ((rankAtom ranks 13).ult (rankAtom ranks 19)))) = true)
    (h4644 : ((!((rankAtom ranks 19 == rankAtom ranks 21)) || ((rankAtom ranks 38).ult (rankAtom ranks 40)))) = true)
    (h4645 : ((!((rankAtom ranks 40 == rankAtom ranks 38)) || ((rankAtom ranks 21).ult (rankAtom ranks 19)))) = true)
    (h4646 : ((!((rankAtom ranks 19 == rankAtom ranks 13)) || ((rankAtom ranks 74).ult (rankAtom ranks 41)))) = true)
    (h4647 : ((!((rankAtom ranks 19 == rankAtom ranks 74)) || ((rankAtom ranks 13).ult (rankAtom ranks 41)))) = true)
    (h4648 : ((!((rankAtom ranks 41 == rankAtom ranks 13)) || ((rankAtom ranks 74).ult (rankAtom ranks 19)))) = true)
    (h4649 : ((!((rankAtom ranks 19 == rankAtom ranks 22)) || ((rankAtom ranks 38).ult (rankAtom ranks 41)))) = true)
    (h4650 : ((!((rankAtom ranks 20 == rankAtom ranks 13)) || ((rankAtom ranks 75).ult (rankAtom ranks 40)))) = true)
    (h4651 : ((!((rankAtom ranks 20 == rankAtom ranks 75)) || ((rankAtom ranks 13).ult (rankAtom ranks 40)))) = true)
    (h4652 : ((!((rankAtom ranks 40 == rankAtom ranks 75)) || ((rankAtom ranks 13).ult (rankAtom ranks 20)))) = true)
    (h4653 : ((!((rankAtom ranks 20 == rankAtom ranks 21)) || ((rankAtom ranks 39).ult (rankAtom ranks 40)))) = true)
    (h4654 : ((!((rankAtom ranks 40 == rankAtom ranks 39)) || ((rankAtom ranks 21).ult (rankAtom ranks 20)))) = true)
    (h4655 : ((!((rankAtom ranks 20 == rankAtom ranks 13)) || ((rankAtom ranks 76).ult (rankAtom ranks 41)))) = true)
    (h4656 : ((!((rankAtom ranks 20 == rankAtom ranks 76)) || ((rankAtom ranks 13).ult (rankAtom ranks 41)))) = true)
    (h4657 : ((!((rankAtom ranks 41 == rankAtom ranks 13)) || ((rankAtom ranks 76).ult (rankAtom ranks 20)))) = true)
    (h4658 : ((!((rankAtom ranks 20 == rankAtom ranks 22)) || ((rankAtom ranks 39).ult (rankAtom ranks 41)))) = true)
    (h4659 : ((!((rankAtom ranks 41 == rankAtom ranks 39)) || ((rankAtom ranks 22).ult (rankAtom ranks 20)))) = true)
    (h4660 : ((!((rankAtom ranks 21 == rankAtom ranks 13)) || ((rankAtom ranks 77).ult (rankAtom ranks 41)))) = true)
    (h4661 : ((!((rankAtom ranks 21 == rankAtom ranks 77)) || ((rankAtom ranks 13).ult (rankAtom ranks 41)))) = true)
    (h4662 : ((!((rankAtom ranks 41 == rankAtom ranks 13)) || ((rankAtom ranks 77).ult (rankAtom ranks 21)))) = true)
    (h4663 : ((!((rankAtom ranks 21 == rankAtom ranks 22)) || ((rankAtom ranks 40).ult (rankAtom ranks 41)))) = true)
    (h4664 : ((!((rankAtom ranks 41 == rankAtom ranks 40)) || ((rankAtom ranks 22).ult (rankAtom ranks 21)))) = true)
    (h4665 : ((!((rankAtom ranks 15 == rankAtom ranks 14)) || ((rankAtom ranks 50).ult (rankAtom ranks 43)))) = true)
    (h4666 : ((!((rankAtom ranks 15 == rankAtom ranks 50)) || ((rankAtom ranks 14).ult (rankAtom ranks 43)))) = true)
    (h4667 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h4668 : ((!((rankAtom ranks 15 == rankAtom ranks 16)) || ((rankAtom ranks 42).ult (rankAtom ranks 43)))) = true)
    (h4669 : ((!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 16).ult (rankAtom ranks 43)))) = true)
    (h4670 : ((!((rankAtom ranks 43 == rankAtom ranks 16)) || ((rankAtom ranks 42).ult (rankAtom ranks 15)))) = true)
    (h4671 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 16).ult (rankAtom ranks 15)))) = true) :
    ∀ item ∈ sourceChunk072Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk072Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4608
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4609
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4610
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4611
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4612
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4613
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4614
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4615
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4616
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4617
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4618
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4619
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4620
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4621
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4622
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4623
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4624
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4625
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4626
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4627
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4628
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4629
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4630
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4631
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4632
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4633
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4634
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4635
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4636
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4637
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4638
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4639
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4640
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4641
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4642
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4643
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4644
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4645
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4646
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4647
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4648
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4649
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4650
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4651
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4652
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4653
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4654
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4655
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4656
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4657
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4658
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4659
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4660
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4661
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4662
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4663
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4664
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4665
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4666
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4667
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4668
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4669
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4670
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4671

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
