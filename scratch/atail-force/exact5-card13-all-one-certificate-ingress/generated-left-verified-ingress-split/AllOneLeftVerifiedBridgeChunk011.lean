/-
Generated packed-source bridge for verified left chunk 011.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk011_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0704 : (!((rowBit rows 0 4 6 && rowBit rows 0 4 9 && rowBit rows 0 11 6 && rowBit rows 0 11 9))) = true)
    (h0705 : (!((rowBit rows 0 4 6 && rowBit rows 0 4 10 && rowBit rows 0 11 6 && rowBit rows 0 11 10))) = true)
    (h0706 : (!((rowBit rows 0 4 8 && rowBit rows 0 4 10 && rowBit rows 0 11 8 && rowBit rows 0 11 10))) = true)
    (h0707 : (!((rowBit rows 0 4 9 && rowBit rows 0 4 10 && rowBit rows 0 11 9 && rowBit rows 0 11 10))) = true)
    (h0708 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 4 && rowBit rows 0 6 0 && rowBit rows 0 6 4))) = true)
    (h0709 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 7 && rowBit rows 0 6 0 && rowBit rows 0 6 7))) = true)
    (h0710 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 8 && rowBit rows 0 6 0 && rowBit rows 0 6 8))) = true)
    (h0711 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 9 && rowBit rows 0 6 0 && rowBit rows 0 6 9))) = true)
    (h0712 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 11 && rowBit rows 0 6 0 && rowBit rows 0 6 11))) = true)
    (h0713 : (!((rowBit rows 0 5 1 && rowBit rows 0 5 4 && rowBit rows 0 6 1 && rowBit rows 0 6 4))) = true)
    (h0714 : (!((rowBit rows 0 5 1 && rowBit rows 0 5 7 && rowBit rows 0 6 1 && rowBit rows 0 6 7))) = true)
    (h0715 : (!((rowBit rows 0 5 1 && rowBit rows 0 5 8 && rowBit rows 0 6 1 && rowBit rows 0 6 8))) = true)
    (h0716 : (!((rowBit rows 0 5 2 && rowBit rows 0 5 4 && rowBit rows 0 6 2 && rowBit rows 0 6 4))) = true)
    (h0717 : (!((rowBit rows 0 5 2 && rowBit rows 0 5 7 && rowBit rows 0 6 2 && rowBit rows 0 6 7))) = true)
    (h0718 : (!((rowBit rows 0 5 2 && rowBit rows 0 5 8 && rowBit rows 0 6 2 && rowBit rows 0 6 8))) = true)
    (h0719 : (!((rowBit rows 0 5 3 && rowBit rows 0 5 4 && rowBit rows 0 6 3 && rowBit rows 0 6 4))) = true)
    (h0720 : (!((rowBit rows 0 5 3 && rowBit rows 0 5 7 && rowBit rows 0 6 3 && rowBit rows 0 6 7))) = true)
    (h0721 : (!((rowBit rows 0 5 3 && rowBit rows 0 5 8 && rowBit rows 0 6 3 && rowBit rows 0 6 8))) = true)
    (h0722 : (!((rowBit rows 0 5 3 && rowBit rows 0 5 10 && rowBit rows 0 6 3 && rowBit rows 0 6 10))) = true)
    (h0723 : (!((rowBit rows 0 5 4 && rowBit rows 0 5 7 && rowBit rows 0 6 4 && rowBit rows 0 6 7))) = true)
    (h0724 : (!((rowBit rows 0 5 4 && rowBit rows 0 5 8 && rowBit rows 0 6 4 && rowBit rows 0 6 8))) = true)
    (h0725 : (!((rowBit rows 0 5 4 && rowBit rows 0 5 9 && rowBit rows 0 6 4 && rowBit rows 0 6 9))) = true)
    (h0726 : (!((rowBit rows 0 5 4 && rowBit rows 0 5 10 && rowBit rows 0 6 4 && rowBit rows 0 6 10))) = true)
    (h0727 : (!((rowBit rows 0 5 4 && rowBit rows 0 5 11 && rowBit rows 0 6 4 && rowBit rows 0 6 11))) = true)
    (h0728 : (!((rowBit rows 0 5 4 && rowBit rows 0 5 12 && rowBit rows 0 6 4 && rowBit rows 0 6 12))) = true)
    (h0729 : (!((rowBit rows 0 5 7 && rowBit rows 0 5 8 && rowBit rows 0 6 7 && rowBit rows 0 6 8))) = true)
    (h0730 : (!((rowBit rows 0 5 7 && rowBit rows 0 5 9 && rowBit rows 0 6 7 && rowBit rows 0 6 9))) = true)
    (h0731 : (!((rowBit rows 0 5 7 && rowBit rows 0 5 10 && rowBit rows 0 6 7 && rowBit rows 0 6 10))) = true)
    (h0732 : (!((rowBit rows 0 5 7 && rowBit rows 0 5 11 && rowBit rows 0 6 7 && rowBit rows 0 6 11))) = true)
    (h0733 : (!((rowBit rows 0 5 7 && rowBit rows 0 5 12 && rowBit rows 0 6 7 && rowBit rows 0 6 12))) = true)
    (h0734 : (!((rowBit rows 0 5 8 && rowBit rows 0 5 9 && rowBit rows 0 6 8 && rowBit rows 0 6 9))) = true)
    (h0735 : (!((rowBit rows 0 5 8 && rowBit rows 0 5 10 && rowBit rows 0 6 8 && rowBit rows 0 6 10))) = true)
    (h0736 : (!((rowBit rows 0 5 8 && rowBit rows 0 5 11 && rowBit rows 0 6 8 && rowBit rows 0 6 11))) = true)
    (h0737 : (!((rowBit rows 0 5 8 && rowBit rows 0 5 12 && rowBit rows 0 6 8 && rowBit rows 0 6 12))) = true)
    (h0738 : (!((rowBit rows 0 5 9 && rowBit rows 0 5 10 && rowBit rows 0 6 9 && rowBit rows 0 6 10))) = true)
    (h0739 : (!((rowBit rows 0 5 11 && rowBit rows 0 5 12 && rowBit rows 0 6 11 && rowBit rows 0 6 12))) = true)
    (h0740 : (!((rowBit rows 0 5 4 && rowBit rows 0 5 9 && rowBit rows 0 7 4 && rowBit rows 0 7 9))) = true)
    (h0741 : (!((rowBit rows 0 5 4 && rowBit rows 0 5 10 && rowBit rows 0 7 4 && rowBit rows 0 7 10))) = true)
    (h0742 : (!((rowBit rows 0 5 4 && rowBit rows 0 5 11 && rowBit rows 0 7 4 && rowBit rows 0 7 11))) = true)
    (h0743 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 3 && rowBit rows 0 10 0 && rowBit rows 0 10 3))) = true)
    (h0744 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 4 && rowBit rows 0 10 0 && rowBit rows 0 10 4))) = true)
    (h0745 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 11 && rowBit rows 0 10 0 && rowBit rows 0 10 11))) = true)
    (h0746 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 12 && rowBit rows 0 10 0 && rowBit rows 0 10 12))) = true)
    (h0747 : (!((rowBit rows 0 5 1 && rowBit rows 0 5 11 && rowBit rows 0 10 1 && rowBit rows 0 10 11))) = true)
    (h0748 : (!((rowBit rows 0 5 3 && rowBit rows 0 5 11 && rowBit rows 0 10 3 && rowBit rows 0 10 11))) = true)
    (h0749 : (!((rowBit rows 0 5 3 && rowBit rows 0 5 12 && rowBit rows 0 10 3 && rowBit rows 0 10 12))) = true)
    (h0750 : (!((rowBit rows 0 5 4 && rowBit rows 0 5 11 && rowBit rows 0 10 4 && rowBit rows 0 10 11))) = true)
    (h0751 : (!((rowBit rows 0 5 4 && rowBit rows 0 5 12 && rowBit rows 0 10 4 && rowBit rows 0 10 12))) = true)
    (h0752 : (!((rowBit rows 0 5 6 && rowBit rows 0 5 7 && rowBit rows 0 10 6 && rowBit rows 0 10 7))) = true)
    (h0753 : (!((rowBit rows 0 5 6 && rowBit rows 0 5 8 && rowBit rows 0 10 6 && rowBit rows 0 10 8))) = true)
    (h0754 : (!((rowBit rows 0 5 6 && rowBit rows 0 5 9 && rowBit rows 0 10 6 && rowBit rows 0 10 9))) = true)
    (h0755 : (!((rowBit rows 0 5 7 && rowBit rows 0 5 8 && rowBit rows 0 10 7 && rowBit rows 0 10 8))) = true)
    (h0756 : (!((rowBit rows 0 5 7 && rowBit rows 0 5 9 && rowBit rows 0 10 7 && rowBit rows 0 10 9))) = true)
    (h0757 : (!((rowBit rows 0 5 8 && rowBit rows 0 5 9 && rowBit rows 0 10 8 && rowBit rows 0 10 9))) = true)
    (h0758 : (!((rowBit rows 0 5 11 && rowBit rows 0 5 12 && rowBit rows 0 10 11 && rowBit rows 0 10 12))) = true)
    (h0759 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 4 && rowBit rows 0 11 0 && rowBit rows 0 11 4))) = true)
    (h0760 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 12 && rowBit rows 0 11 0 && rowBit rows 0 11 12))) = true)
    (h0761 : (!((rowBit rows 0 5 1 && rowBit rows 0 5 4 && rowBit rows 0 11 1 && rowBit rows 0 11 4))) = true)
    (h0762 : (!((rowBit rows 0 5 2 && rowBit rows 0 5 12 && rowBit rows 0 11 2 && rowBit rows 0 11 12))) = true)
    (h0763 : (!((rowBit rows 0 5 4 && rowBit rows 0 5 12 && rowBit rows 0 11 4 && rowBit rows 0 11 12))) = true)
    (h0764 : (!((rowBit rows 0 5 6 && rowBit rows 0 5 7 && rowBit rows 0 11 6 && rowBit rows 0 11 7))) = true)
    (h0765 : (!((rowBit rows 0 5 6 && rowBit rows 0 5 8 && rowBit rows 0 11 6 && rowBit rows 0 11 8))) = true)
    (h0766 : (!((rowBit rows 0 5 6 && rowBit rows 0 5 9 && rowBit rows 0 11 6 && rowBit rows 0 11 9))) = true)
    (h0767 : (!((rowBit rows 0 5 6 && rowBit rows 0 5 10 && rowBit rows 0 11 6 && rowBit rows 0 11 10))) = true) :
    ∀ item ∈ sourceChunk011Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk011Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0704
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0705
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0706
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0707
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0708
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0709
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0710
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0711
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0712
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0713
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0714
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0715
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0716
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0717
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0718
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0719
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0720
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0721
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0722
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0723
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0724
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0725
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0726
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0727
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0728
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0729
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0730
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0731
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0732
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0733
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0734
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0735
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0736
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0737
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0738
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0739
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0740
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0741
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0742
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0743
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0744
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0745
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0746
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0747
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0748
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0749
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0750
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0751
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0752
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0753
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0754
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0755
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0756
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0757
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0758
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0759
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0760
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0761
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0762
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0763
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0764
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0765
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0766
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0767

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
