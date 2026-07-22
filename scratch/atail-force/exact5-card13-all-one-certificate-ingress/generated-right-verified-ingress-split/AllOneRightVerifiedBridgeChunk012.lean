/-
Generated packed-source bridge for verified right chunk 012.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk012_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0768 : (!((rowBit rows 0 5 7 && rowBit rows 0 5 8 && rowBit rows 0 11 7 && rowBit rows 0 11 8))) = true)
    (h0769 : (!((rowBit rows 0 5 7 && rowBit rows 0 5 9 && rowBit rows 0 11 7 && rowBit rows 0 11 9))) = true)
    (h0770 : (!((rowBit rows 0 5 7 && rowBit rows 0 5 10 && rowBit rows 0 11 7 && rowBit rows 0 11 10))) = true)
    (h0771 : (!((rowBit rows 0 5 8 && rowBit rows 0 5 9 && rowBit rows 0 11 8 && rowBit rows 0 11 9))) = true)
    (h0772 : (!((rowBit rows 0 5 8 && rowBit rows 0 5 10 && rowBit rows 0 11 8 && rowBit rows 0 11 10))) = true)
    (h0773 : (!((rowBit rows 0 5 9 && rowBit rows 0 5 10 && rowBit rows 0 11 9 && rowBit rows 0 11 10))) = true)
    (h0774 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 3 && rowBit rows 0 12 0 && rowBit rows 0 12 3))) = true)
    (h0775 : (!((rowBit rows 0 5 7 && rowBit rows 0 5 9 && rowBit rows 0 12 7 && rowBit rows 0 12 9))) = true)
    (h0776 : (!((rowBit rows 0 6 3 && rowBit rows 0 6 4 && rowBit rows 0 7 3 && rowBit rows 0 7 4))) = true)
    (h0777 : (!((rowBit rows 0 6 4 && rowBit rows 0 6 5 && rowBit rows 0 7 4 && rowBit rows 0 7 5))) = true)
    (h0778 : (!((rowBit rows 0 6 4 && rowBit rows 0 6 8 && rowBit rows 0 7 4 && rowBit rows 0 7 8))) = true)
    (h0779 : (!((rowBit rows 0 6 4 && rowBit rows 0 6 10 && rowBit rows 0 7 4 && rowBit rows 0 7 10))) = true)
    (h0780 : (!((rowBit rows 0 6 5 && rowBit rows 0 6 8 && rowBit rows 0 7 5 && rowBit rows 0 7 8))) = true)
    (h0781 : (!((rowBit rows 0 6 5 && rowBit rows 0 6 9 && rowBit rows 0 7 5 && rowBit rows 0 7 9))) = true)
    (h0782 : (!((rowBit rows 0 6 5 && rowBit rows 0 6 11 && rowBit rows 0 7 5 && rowBit rows 0 7 11))) = true)
    (h0783 : (!((rowBit rows 0 6 8 && rowBit rows 0 6 9 && rowBit rows 0 7 8 && rowBit rows 0 7 9))) = true)
    (h0784 : (!((rowBit rows 0 6 8 && rowBit rows 0 6 10 && rowBit rows 0 7 8 && rowBit rows 0 7 10))) = true)
    (h0785 : (!((rowBit rows 0 6 8 && rowBit rows 0 6 11 && rowBit rows 0 7 8 && rowBit rows 0 7 11))) = true)
    (h0786 : (!((rowBit rows 0 6 8 && rowBit rows 0 6 12 && rowBit rows 0 7 8 && rowBit rows 0 7 12))) = true)
    (h0787 : (!((rowBit rows 0 6 9 && rowBit rows 0 6 11 && rowBit rows 0 7 9 && rowBit rows 0 7 11))) = true)
    (h0788 : (!((rowBit rows 0 6 11 && rowBit rows 0 6 12 && rowBit rows 0 7 11 && rowBit rows 0 7 12))) = true)
    (h0789 : (!((rowBit rows 0 6 0 && rowBit rows 0 6 1 && rowBit rows 0 10 0 && rowBit rows 0 10 1))) = true)
    (h0790 : (!((rowBit rows 0 6 0 && rowBit rows 0 6 4 && rowBit rows 0 10 0 && rowBit rows 0 10 4))) = true)
    (h0791 : (!((rowBit rows 0 6 0 && rowBit rows 0 6 5 && rowBit rows 0 10 0 && rowBit rows 0 10 5))) = true)
    (h0792 : (!((rowBit rows 0 6 0 && rowBit rows 0 6 11 && rowBit rows 0 10 0 && rowBit rows 0 10 11))) = true)
    (h0793 : (!((rowBit rows 0 6 0 && rowBit rows 0 6 12 && rowBit rows 0 10 0 && rowBit rows 0 10 12))) = true)
    (h0794 : (!((rowBit rows 0 6 1 && rowBit rows 0 6 4 && rowBit rows 0 10 1 && rowBit rows 0 10 4))) = true)
    (h0795 : (!((rowBit rows 0 6 1 && rowBit rows 0 6 11 && rowBit rows 0 10 1 && rowBit rows 0 10 11))) = true)
    (h0796 : (!((rowBit rows 0 6 1 && rowBit rows 0 6 12 && rowBit rows 0 10 1 && rowBit rows 0 10 12))) = true)
    (h0797 : (!((rowBit rows 0 6 2 && rowBit rows 0 6 4 && rowBit rows 0 10 2 && rowBit rows 0 10 4))) = true)
    (h0798 : (!((rowBit rows 0 6 2 && rowBit rows 0 6 5 && rowBit rows 0 10 2 && rowBit rows 0 10 5))) = true)
    (h0799 : (!((rowBit rows 0 6 2 && rowBit rows 0 6 11 && rowBit rows 0 10 2 && rowBit rows 0 10 11))) = true)
    (h0800 : (!((rowBit rows 0 6 2 && rowBit rows 0 6 12 && rowBit rows 0 10 2 && rowBit rows 0 10 12))) = true)
    (h0801 : (!((rowBit rows 0 6 3 && rowBit rows 0 6 4 && rowBit rows 0 10 3 && rowBit rows 0 10 4))) = true)
    (h0802 : (!((rowBit rows 0 6 4 && rowBit rows 0 6 5 && rowBit rows 0 10 4 && rowBit rows 0 10 5))) = true)
    (h0803 : (!((rowBit rows 0 6 4 && rowBit rows 0 6 11 && rowBit rows 0 10 4 && rowBit rows 0 10 11))) = true)
    (h0804 : (!((rowBit rows 0 6 4 && rowBit rows 0 6 12 && rowBit rows 0 10 4 && rowBit rows 0 10 12))) = true)
    (h0805 : (!((rowBit rows 0 6 5 && rowBit rows 0 6 11 && rowBit rows 0 10 5 && rowBit rows 0 10 11))) = true)
    (h0806 : (!((rowBit rows 0 6 5 && rowBit rows 0 6 12 && rowBit rows 0 10 5 && rowBit rows 0 10 12))) = true)
    (h0807 : (!((rowBit rows 0 6 7 && rowBit rows 0 6 8 && rowBit rows 0 10 7 && rowBit rows 0 10 8))) = true)
    (h0808 : (!((rowBit rows 0 6 7 && rowBit rows 0 6 9 && rowBit rows 0 10 7 && rowBit rows 0 10 9))) = true)
    (h0809 : (!((rowBit rows 0 6 8 && rowBit rows 0 6 9 && rowBit rows 0 10 8 && rowBit rows 0 10 9))) = true)
    (h0810 : (!((rowBit rows 0 6 11 && rowBit rows 0 6 12 && rowBit rows 0 10 11 && rowBit rows 0 10 12))) = true)
    (h0811 : (!((rowBit rows 0 6 0 && rowBit rows 0 6 4 && rowBit rows 0 11 0 && rowBit rows 0 11 4))) = true)
    (h0812 : (!((rowBit rows 0 6 0 && rowBit rows 0 6 5 && rowBit rows 0 11 0 && rowBit rows 0 11 5))) = true)
    (h0813 : (!((rowBit rows 0 6 0 && rowBit rows 0 6 12 && rowBit rows 0 11 0 && rowBit rows 0 11 12))) = true)
    (h0814 : (!((rowBit rows 0 6 1 && rowBit rows 0 6 4 && rowBit rows 0 11 1 && rowBit rows 0 11 4))) = true)
    (h0815 : (!((rowBit rows 0 6 2 && rowBit rows 0 6 4 && rowBit rows 0 11 2 && rowBit rows 0 11 4))) = true)
    (h0816 : (!((rowBit rows 0 6 4 && rowBit rows 0 6 5 && rowBit rows 0 11 4 && rowBit rows 0 11 5))) = true)
    (h0817 : (!((rowBit rows 0 6 4 && rowBit rows 0 6 12 && rowBit rows 0 11 4 && rowBit rows 0 11 12))) = true)
    (h0818 : (!((rowBit rows 0 6 5 && rowBit rows 0 6 12 && rowBit rows 0 11 5 && rowBit rows 0 11 12))) = true)
    (h0819 : (!((rowBit rows 0 6 7 && rowBit rows 0 6 8 && rowBit rows 0 11 7 && rowBit rows 0 11 8))) = true)
    (h0820 : (!((rowBit rows 0 6 7 && rowBit rows 0 6 9 && rowBit rows 0 11 7 && rowBit rows 0 11 9))) = true)
    (h0821 : (!((rowBit rows 0 6 7 && rowBit rows 0 6 10 && rowBit rows 0 11 7 && rowBit rows 0 11 10))) = true)
    (h0822 : (!((rowBit rows 0 6 8 && rowBit rows 0 6 9 && rowBit rows 0 11 8 && rowBit rows 0 11 9))) = true)
    (h0823 : (!((rowBit rows 0 6 8 && rowBit rows 0 6 10 && rowBit rows 0 11 8 && rowBit rows 0 11 10))) = true)
    (h0824 : (!((rowBit rows 0 7 0 && rowBit rows 0 7 2 && rowBit rows 0 10 0 && rowBit rows 0 10 2))) = true)
    (h0825 : (!((rowBit rows 0 7 0 && rowBit rows 0 7 5 && rowBit rows 0 10 0 && rowBit rows 0 10 5))) = true)
    (h0826 : (!((rowBit rows 0 7 1 && rowBit rows 0 7 6 && rowBit rows 0 10 1 && rowBit rows 0 10 6))) = true)
    (h0827 : (!((rowBit rows 0 7 4 && rowBit rows 0 7 5 && rowBit rows 0 10 4 && rowBit rows 0 10 5))) = true)
    (h0828 : (!((rowBit rows 0 7 6 && rowBit rows 0 7 12 && rowBit rows 0 10 6 && rowBit rows 0 10 12))) = true)
    (h0829 : (!((rowBit rows 0 7 0 && rowBit rows 0 7 4 && rowBit rows 0 11 0 && rowBit rows 0 11 4))) = true)
    (h0830 : (!((rowBit rows 0 7 0 && rowBit rows 0 7 5 && rowBit rows 0 11 0 && rowBit rows 0 11 5))) = true)
    (h0831 : (!((rowBit rows 0 7 0 && rowBit rows 0 7 6 && rowBit rows 0 11 0 && rowBit rows 0 11 6))) = true) :
    ∀ item ∈ sourceChunk012Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk012Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0768
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0769
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0770
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0771
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0772
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0773
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0774
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0775
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0776
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0777
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0778
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0779
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0780
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0781
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0782
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0783
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0784
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0785
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0786
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0787
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0788
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0789
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0790
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0791
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0792
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0793
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0794
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0795
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0796
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0797
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0798
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0799
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0800
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0801
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0802
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0803
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0804
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0805
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0806
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0807
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0808
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0809
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0810
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0811
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0812
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0813
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0814
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0815
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0816
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0817
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0818
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0819
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0820
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0821
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0822
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0823
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0824
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0825
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0826
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0827
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0828
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0829
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0830
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0831

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
