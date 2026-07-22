/-
Generated packed-source bridge for verified middle chunk 010.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk010_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0640 : (!((rowBit rows 0 4 1 && rowBit rows 0 4 8 && rowBit rows 0 5 1 && rowBit rows 0 5 8))) = true)
    (h0641 : (!((rowBit rows 0 4 1 && rowBit rows 0 4 9 && rowBit rows 0 5 1 && rowBit rows 0 5 9))) = true)
    (h0642 : (!((rowBit rows 0 4 1 && rowBit rows 0 4 10 && rowBit rows 0 5 1 && rowBit rows 0 5 10))) = true)
    (h0643 : (!((rowBit rows 0 4 2 && rowBit rows 0 4 6 && rowBit rows 0 5 2 && rowBit rows 0 5 6))) = true)
    (h0644 : (!((rowBit rows 0 4 2 && rowBit rows 0 4 7 && rowBit rows 0 5 2 && rowBit rows 0 5 7))) = true)
    (h0645 : (!((rowBit rows 0 4 2 && rowBit rows 0 4 8 && rowBit rows 0 5 2 && rowBit rows 0 5 8))) = true)
    (h0646 : (!((rowBit rows 0 4 3 && rowBit rows 0 4 6 && rowBit rows 0 5 3 && rowBit rows 0 5 6))) = true)
    (h0647 : (!((rowBit rows 0 4 3 && rowBit rows 0 4 7 && rowBit rows 0 5 3 && rowBit rows 0 5 7))) = true)
    (h0648 : (!((rowBit rows 0 4 3 && rowBit rows 0 4 8 && rowBit rows 0 5 3 && rowBit rows 0 5 8))) = true)
    (h0649 : (!((rowBit rows 0 4 6 && rowBit rows 0 4 9 && rowBit rows 0 5 6 && rowBit rows 0 5 9))) = true)
    (h0650 : (!((rowBit rows 0 4 6 && rowBit rows 0 4 10 && rowBit rows 0 5 6 && rowBit rows 0 5 10))) = true)
    (h0651 : (!((rowBit rows 0 4 6 && rowBit rows 0 4 11 && rowBit rows 0 5 6 && rowBit rows 0 5 11))) = true)
    (h0652 : (!((rowBit rows 0 4 6 && rowBit rows 0 4 12 && rowBit rows 0 5 6 && rowBit rows 0 5 12))) = true)
    (h0653 : (!((rowBit rows 0 4 7 && rowBit rows 0 4 9 && rowBit rows 0 5 7 && rowBit rows 0 5 9))) = true)
    (h0654 : (!((rowBit rows 0 4 7 && rowBit rows 0 4 10 && rowBit rows 0 5 7 && rowBit rows 0 5 10))) = true)
    (h0655 : (!((rowBit rows 0 4 7 && rowBit rows 0 4 11 && rowBit rows 0 5 7 && rowBit rows 0 5 11))) = true)
    (h0656 : (!((rowBit rows 0 4 7 && rowBit rows 0 4 12 && rowBit rows 0 5 7 && rowBit rows 0 5 12))) = true)
    (h0657 : (!((rowBit rows 0 4 8 && rowBit rows 0 4 9 && rowBit rows 0 5 8 && rowBit rows 0 5 9))) = true)
    (h0658 : (!((rowBit rows 0 4 8 && rowBit rows 0 4 10 && rowBit rows 0 5 8 && rowBit rows 0 5 10))) = true)
    (h0659 : (!((rowBit rows 0 4 8 && rowBit rows 0 4 11 && rowBit rows 0 5 8 && rowBit rows 0 5 11))) = true)
    (h0660 : (!((rowBit rows 0 4 8 && rowBit rows 0 4 12 && rowBit rows 0 5 8 && rowBit rows 0 5 12))) = true)
    (h0661 : (!((rowBit rows 0 4 9 && rowBit rows 0 4 11 && rowBit rows 0 5 9 && rowBit rows 0 5 11))) = true)
    (h0662 : (!((rowBit rows 0 4 10 && rowBit rows 0 4 12 && rowBit rows 0 5 10 && rowBit rows 0 5 12))) = true)
    (h0663 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 7 && rowBit rows 0 6 0 && rowBit rows 0 6 7))) = true)
    (h0664 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 8 && rowBit rows 0 6 0 && rowBit rows 0 6 8))) = true)
    (h0665 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 9 && rowBit rows 0 6 0 && rowBit rows 0 6 9))) = true)
    (h0666 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 11 && rowBit rows 0 6 0 && rowBit rows 0 6 11))) = true)
    (h0667 : (!((rowBit rows 0 4 1 && rowBit rows 0 4 7 && rowBit rows 0 6 1 && rowBit rows 0 6 7))) = true)
    (h0668 : (!((rowBit rows 0 4 1 && rowBit rows 0 4 8 && rowBit rows 0 6 1 && rowBit rows 0 6 8))) = true)
    (h0669 : (!((rowBit rows 0 4 2 && rowBit rows 0 4 7 && rowBit rows 0 6 2 && rowBit rows 0 6 7))) = true)
    (h0670 : (!((rowBit rows 0 4 2 && rowBit rows 0 4 8 && rowBit rows 0 6 2 && rowBit rows 0 6 8))) = true)
    (h0671 : (!((rowBit rows 0 4 2 && rowBit rows 0 4 10 && rowBit rows 0 6 2 && rowBit rows 0 6 10))) = true)
    (h0672 : (!((rowBit rows 0 4 2 && rowBit rows 0 4 11 && rowBit rows 0 6 2 && rowBit rows 0 6 11))) = true)
    (h0673 : (!((rowBit rows 0 4 3 && rowBit rows 0 4 7 && rowBit rows 0 6 3 && rowBit rows 0 6 7))) = true)
    (h0674 : (!((rowBit rows 0 4 3 && rowBit rows 0 4 8 && rowBit rows 0 6 3 && rowBit rows 0 6 8))) = true)
    (h0675 : (!((rowBit rows 0 4 7 && rowBit rows 0 4 9 && rowBit rows 0 6 7 && rowBit rows 0 6 9))) = true)
    (h0676 : (!((rowBit rows 0 4 7 && rowBit rows 0 4 10 && rowBit rows 0 6 7 && rowBit rows 0 6 10))) = true)
    (h0677 : (!((rowBit rows 0 4 7 && rowBit rows 0 4 11 && rowBit rows 0 6 7 && rowBit rows 0 6 11))) = true)
    (h0678 : (!((rowBit rows 0 4 7 && rowBit rows 0 4 12 && rowBit rows 0 6 7 && rowBit rows 0 6 12))) = true)
    (h0679 : (!((rowBit rows 0 4 8 && rowBit rows 0 4 9 && rowBit rows 0 6 8 && rowBit rows 0 6 9))) = true)
    (h0680 : (!((rowBit rows 0 4 8 && rowBit rows 0 4 10 && rowBit rows 0 6 8 && rowBit rows 0 6 10))) = true)
    (h0681 : (!((rowBit rows 0 4 8 && rowBit rows 0 4 11 && rowBit rows 0 6 8 && rowBit rows 0 6 11))) = true)
    (h0682 : (!((rowBit rows 0 4 8 && rowBit rows 0 4 12 && rowBit rows 0 6 8 && rowBit rows 0 6 12))) = true)
    (h0683 : (!((rowBit rows 0 4 9 && rowBit rows 0 4 11 && rowBit rows 0 6 9 && rowBit rows 0 6 11))) = true)
    (h0684 : (!((rowBit rows 0 4 9 && rowBit rows 0 4 12 && rowBit rows 0 6 9 && rowBit rows 0 6 12))) = true)
    (h0685 : (!((rowBit rows 0 4 10 && rowBit rows 0 4 11 && rowBit rows 0 6 10 && rowBit rows 0 6 11))) = true)
    (h0686 : (!((rowBit rows 0 4 10 && rowBit rows 0 4 12 && rowBit rows 0 6 10 && rowBit rows 0 6 12))) = true)
    (h0687 : (!((rowBit rows 0 4 11 && rowBit rows 0 4 12 && rowBit rows 0 6 11 && rowBit rows 0 6 12))) = true)
    (h0688 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 8 && rowBit rows 0 7 0 && rowBit rows 0 7 8))) = true)
    (h0689 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 10 && rowBit rows 0 7 0 && rowBit rows 0 7 10))) = true)
    (h0690 : (!((rowBit rows 0 4 8 && rowBit rows 0 4 10 && rowBit rows 0 7 8 && rowBit rows 0 7 10))) = true)
    (h0691 : (!((rowBit rows 0 4 8 && rowBit rows 0 4 12 && rowBit rows 0 7 8 && rowBit rows 0 7 12))) = true)
    (h0692 : (!((rowBit rows 0 4 9 && rowBit rows 0 4 12 && rowBit rows 0 7 9 && rowBit rows 0 7 12))) = true)
    (h0693 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 11 && rowBit rows 0 10 0 && rowBit rows 0 10 11))) = true)
    (h0694 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 12 && rowBit rows 0 10 0 && rowBit rows 0 10 12))) = true)
    (h0695 : (!((rowBit rows 0 4 2 && rowBit rows 0 4 11 && rowBit rows 0 10 2 && rowBit rows 0 10 11))) = true)
    (h0696 : (!((rowBit rows 0 4 5 && rowBit rows 0 4 9 && rowBit rows 0 10 5 && rowBit rows 0 10 9))) = true)
    (h0697 : (!((rowBit rows 0 4 6 && rowBit rows 0 4 9 && rowBit rows 0 10 6 && rowBit rows 0 10 9))) = true)
    (h0698 : (!((rowBit rows 0 4 8 && rowBit rows 0 4 9 && rowBit rows 0 10 8 && rowBit rows 0 10 9))) = true)
    (h0699 : (!((rowBit rows 0 4 11 && rowBit rows 0 4 12 && rowBit rows 0 10 11 && rowBit rows 0 10 12))) = true)
    (h0700 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 12 && rowBit rows 0 11 0 && rowBit rows 0 11 12))) = true)
    (h0701 : (!((rowBit rows 0 4 2 && rowBit rows 0 4 12 && rowBit rows 0 11 2 && rowBit rows 0 11 12))) = true)
    (h0702 : (!((rowBit rows 0 4 5 && rowBit rows 0 4 9 && rowBit rows 0 11 5 && rowBit rows 0 11 9))) = true)
    (h0703 : (!((rowBit rows 0 4 5 && rowBit rows 0 4 10 && rowBit rows 0 11 5 && rowBit rows 0 11 10))) = true) :
    ∀ item ∈ sourceChunk010Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk010Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0640
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0641
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0642
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0643
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0644
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0645
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0646
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0647
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0648
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0649
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0650
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0651
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0652
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0653
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0654
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0655
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0656
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0657
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0658
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0659
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0660
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0661
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0662
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0663
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0664
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0665
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0666
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0667
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0668
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0669
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0670
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0671
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0672
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0673
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0674
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0675
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0676
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0677
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0678
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0679
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0680
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0681
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0682
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0683
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0684
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0685
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0686
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0687
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0688
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0689
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0690
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0691
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0692
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0693
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0694
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0695
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0696
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0697
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0698
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0699
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0700
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0701
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0702
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0703

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
