/-
Generated packed-source bridge for verified middle chunk 009.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk009_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0576 : (!((rowBit rows 0 3 6 && rowBit rows 0 3 10 && rowBit rows 0 5 6 && rowBit rows 0 5 10))) = true)
    (h0577 : (!((rowBit rows 0 3 6 && rowBit rows 0 3 11 && rowBit rows 0 5 6 && rowBit rows 0 5 11))) = true)
    (h0578 : (!((rowBit rows 0 3 6 && rowBit rows 0 3 12 && rowBit rows 0 5 6 && rowBit rows 0 5 12))) = true)
    (h0579 : (!((rowBit rows 0 3 7 && rowBit rows 0 3 8 && rowBit rows 0 5 7 && rowBit rows 0 5 8))) = true)
    (h0580 : (!((rowBit rows 0 3 7 && rowBit rows 0 3 9 && rowBit rows 0 5 7 && rowBit rows 0 5 9))) = true)
    (h0581 : (!((rowBit rows 0 3 7 && rowBit rows 0 3 10 && rowBit rows 0 5 7 && rowBit rows 0 5 10))) = true)
    (h0582 : (!((rowBit rows 0 3 7 && rowBit rows 0 3 11 && rowBit rows 0 5 7 && rowBit rows 0 5 11))) = true)
    (h0583 : (!((rowBit rows 0 3 8 && rowBit rows 0 3 9 && rowBit rows 0 5 8 && rowBit rows 0 5 9))) = true)
    (h0584 : (!((rowBit rows 0 3 8 && rowBit rows 0 3 10 && rowBit rows 0 5 8 && rowBit rows 0 5 10))) = true)
    (h0585 : (!((rowBit rows 0 3 8 && rowBit rows 0 3 11 && rowBit rows 0 5 8 && rowBit rows 0 5 11))) = true)
    (h0586 : (!((rowBit rows 0 3 8 && rowBit rows 0 3 12 && rowBit rows 0 5 8 && rowBit rows 0 5 12))) = true)
    (h0587 : (!((rowBit rows 0 3 9 && rowBit rows 0 3 11 && rowBit rows 0 5 9 && rowBit rows 0 5 11))) = true)
    (h0588 : (!((rowBit rows 0 3 9 && rowBit rows 0 3 12 && rowBit rows 0 5 9 && rowBit rows 0 5 12))) = true)
    (h0589 : (!((rowBit rows 0 3 11 && rowBit rows 0 3 12 && rowBit rows 0 5 11 && rowBit rows 0 5 12))) = true)
    (h0590 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 7 && rowBit rows 0 6 0 && rowBit rows 0 6 7))) = true)
    (h0591 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 8 && rowBit rows 0 6 0 && rowBit rows 0 6 8))) = true)
    (h0592 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 9 && rowBit rows 0 6 0 && rowBit rows 0 6 9))) = true)
    (h0593 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 10 && rowBit rows 0 6 0 && rowBit rows 0 6 10))) = true)
    (h0594 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 11 && rowBit rows 0 6 0 && rowBit rows 0 6 11))) = true)
    (h0595 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 12 && rowBit rows 0 6 0 && rowBit rows 0 6 12))) = true)
    (h0596 : (!((rowBit rows 0 3 2 && rowBit rows 0 3 7 && rowBit rows 0 6 2 && rowBit rows 0 6 7))) = true)
    (h0597 : (!((rowBit rows 0 3 2 && rowBit rows 0 3 12 && rowBit rows 0 6 2 && rowBit rows 0 6 12))) = true)
    (h0598 : (!((rowBit rows 0 3 4 && rowBit rows 0 3 5 && rowBit rows 0 6 4 && rowBit rows 0 6 5))) = true)
    (h0599 : (!((rowBit rows 0 3 7 && rowBit rows 0 3 9 && rowBit rows 0 6 7 && rowBit rows 0 6 9))) = true)
    (h0600 : (!((rowBit rows 0 3 7 && rowBit rows 0 3 11 && rowBit rows 0 6 7 && rowBit rows 0 6 11))) = true)
    (h0601 : (!((rowBit rows 0 3 7 && rowBit rows 0 3 12 && rowBit rows 0 6 7 && rowBit rows 0 6 12))) = true)
    (h0602 : (!((rowBit rows 0 3 8 && rowBit rows 0 3 10 && rowBit rows 0 6 8 && rowBit rows 0 6 10))) = true)
    (h0603 : (!((rowBit rows 0 3 8 && rowBit rows 0 3 11 && rowBit rows 0 6 8 && rowBit rows 0 6 11))) = true)
    (h0604 : (!((rowBit rows 0 3 8 && rowBit rows 0 3 12 && rowBit rows 0 6 8 && rowBit rows 0 6 12))) = true)
    (h0605 : (!((rowBit rows 0 3 9 && rowBit rows 0 3 11 && rowBit rows 0 6 9 && rowBit rows 0 6 11))) = true)
    (h0606 : (!((rowBit rows 0 3 9 && rowBit rows 0 3 12 && rowBit rows 0 6 9 && rowBit rows 0 6 12))) = true)
    (h0607 : (!((rowBit rows 0 3 10 && rowBit rows 0 3 12 && rowBit rows 0 6 10 && rowBit rows 0 6 12))) = true)
    (h0608 : (!((rowBit rows 0 3 11 && rowBit rows 0 3 12 && rowBit rows 0 6 11 && rowBit rows 0 6 12))) = true)
    (h0609 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 2 && rowBit rows 0 10 0 && rowBit rows 0 10 2))) = true)
    (h0610 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 11 && rowBit rows 0 10 0 && rowBit rows 0 10 11))) = true)
    (h0611 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 12 && rowBit rows 0 10 0 && rowBit rows 0 10 12))) = true)
    (h0612 : (!((rowBit rows 0 3 4 && rowBit rows 0 3 6 && rowBit rows 0 10 4 && rowBit rows 0 10 6))) = true)
    (h0613 : (!((rowBit rows 0 3 4 && rowBit rows 0 3 7 && rowBit rows 0 10 4 && rowBit rows 0 10 7))) = true)
    (h0614 : (!((rowBit rows 0 3 4 && rowBit rows 0 3 8 && rowBit rows 0 10 4 && rowBit rows 0 10 8))) = true)
    (h0615 : (!((rowBit rows 0 3 4 && rowBit rows 0 3 9 && rowBit rows 0 10 4 && rowBit rows 0 10 9))) = true)
    (h0616 : (!((rowBit rows 0 3 5 && rowBit rows 0 3 7 && rowBit rows 0 10 5 && rowBit rows 0 10 7))) = true)
    (h0617 : (!((rowBit rows 0 3 6 && rowBit rows 0 3 8 && rowBit rows 0 10 6 && rowBit rows 0 10 8))) = true)
    (h0618 : (!((rowBit rows 0 3 6 && rowBit rows 0 3 9 && rowBit rows 0 10 6 && rowBit rows 0 10 9))) = true)
    (h0619 : (!((rowBit rows 0 3 7 && rowBit rows 0 3 8 && rowBit rows 0 10 7 && rowBit rows 0 10 8))) = true)
    (h0620 : (!((rowBit rows 0 3 11 && rowBit rows 0 3 12 && rowBit rows 0 10 11 && rowBit rows 0 10 12))) = true)
    (h0621 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 2 && rowBit rows 0 11 0 && rowBit rows 0 11 2))) = true)
    (h0622 : (!((rowBit rows 0 3 4 && rowBit rows 0 3 6 && rowBit rows 0 11 4 && rowBit rows 0 11 6))) = true)
    (h0623 : (!((rowBit rows 0 3 4 && rowBit rows 0 3 7 && rowBit rows 0 11 4 && rowBit rows 0 11 7))) = true)
    (h0624 : (!((rowBit rows 0 3 4 && rowBit rows 0 3 8 && rowBit rows 0 11 4 && rowBit rows 0 11 8))) = true)
    (h0625 : (!((rowBit rows 0 3 4 && rowBit rows 0 3 9 && rowBit rows 0 11 4 && rowBit rows 0 11 9))) = true)
    (h0626 : (!((rowBit rows 0 3 4 && rowBit rows 0 3 10 && rowBit rows 0 11 4 && rowBit rows 0 11 10))) = true)
    (h0627 : (!((rowBit rows 0 3 6 && rowBit rows 0 3 8 && rowBit rows 0 11 6 && rowBit rows 0 11 8))) = true)
    (h0628 : (!((rowBit rows 0 3 6 && rowBit rows 0 3 9 && rowBit rows 0 11 6 && rowBit rows 0 11 9))) = true)
    (h0629 : (!((rowBit rows 0 3 6 && rowBit rows 0 3 10 && rowBit rows 0 11 6 && rowBit rows 0 11 10))) = true)
    (h0630 : (!((rowBit rows 0 3 7 && rowBit rows 0 3 8 && rowBit rows 0 11 7 && rowBit rows 0 11 8))) = true)
    (h0631 : (!((rowBit rows 0 3 8 && rowBit rows 0 3 10 && rowBit rows 0 11 8 && rowBit rows 0 11 10))) = true)
    (h0632 : (!((rowBit rows 0 3 9 && rowBit rows 0 3 10 && rowBit rows 0 11 9 && rowBit rows 0 11 10))) = true)
    (h0633 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 6 && rowBit rows 0 5 0 && rowBit rows 0 5 6))) = true)
    (h0634 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 7 && rowBit rows 0 5 0 && rowBit rows 0 5 7))) = true)
    (h0635 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 8 && rowBit rows 0 5 0 && rowBit rows 0 5 8))) = true)
    (h0636 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 9 && rowBit rows 0 5 0 && rowBit rows 0 5 9))) = true)
    (h0637 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 11 && rowBit rows 0 5 0 && rowBit rows 0 5 11))) = true)
    (h0638 : (!((rowBit rows 0 4 1 && rowBit rows 0 4 6 && rowBit rows 0 5 1 && rowBit rows 0 5 6))) = true)
    (h0639 : (!((rowBit rows 0 4 1 && rowBit rows 0 4 7 && rowBit rows 0 5 1 && rowBit rows 0 5 7))) = true) :
    ∀ item ∈ sourceChunk009Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk009Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0576
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0577
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0578
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0579
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0580
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0581
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0582
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0583
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0584
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0585
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0586
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0587
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0588
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0589
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0590
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0591
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0592
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0593
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0594
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0595
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0596
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0597
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0598
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0599
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0600
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0601
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0602
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0603
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0604
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0605
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0606
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0607
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0608
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0609
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0610
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0611
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0612
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0613
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0614
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0615
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0616
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0617
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0618
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0619
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0620
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0621
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0622
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0623
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0624
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0625
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0626
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0627
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0628
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0629
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0630
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0631
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0632
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0633
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0634
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0635
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0636
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0637
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0638
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0639

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
