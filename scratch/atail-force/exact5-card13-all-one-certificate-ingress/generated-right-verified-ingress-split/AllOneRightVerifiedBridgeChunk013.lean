/-
Generated packed-source bridge for verified right chunk 013.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk013_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0832 : (!((rowBit rows 0 7 2 && rowBit rows 0 7 6 && rowBit rows 0 11 2 && rowBit rows 0 11 6))) = true)
    (h0833 : (!((rowBit rows 0 7 6 && rowBit rows 0 7 12 && rowBit rows 0 11 6 && rowBit rows 0 11 12))) = true)
    (h0834 : (!((rowBit rows 0 8 2 && rowBit rows 0 8 11 && rowBit rows 0 10 2 && rowBit rows 0 10 11))) = true)
    (h0835 : (!((rowBit rows 0 9 0 && rowBit rows 0 9 8 && rowBit rows 0 11 0 && rowBit rows 0 11 8))) = true)
    (h0836 : (!((rowBit rows 0 10 0 && rowBit rows 0 10 1 && rowBit rows 0 11 0 && rowBit rows 0 11 1))) = true)
    (h0837 : (!((rowBit rows 0 10 0 && rowBit rows 0 10 2 && rowBit rows 0 11 0 && rowBit rows 0 11 2))) = true)
    (h0838 : (!((rowBit rows 0 10 0 && rowBit rows 0 10 3 && rowBit rows 0 11 0 && rowBit rows 0 11 3))) = true)
    (h0839 : (!((rowBit rows 0 10 0 && rowBit rows 0 10 4 && rowBit rows 0 11 0 && rowBit rows 0 11 4))) = true)
    (h0840 : (!((rowBit rows 0 10 0 && rowBit rows 0 10 5 && rowBit rows 0 11 0 && rowBit rows 0 11 5))) = true)
    (h0841 : (!((rowBit rows 0 10 0 && rowBit rows 0 10 6 && rowBit rows 0 11 0 && rowBit rows 0 11 6))) = true)
    (h0842 : (!((rowBit rows 0 10 0 && rowBit rows 0 10 7 && rowBit rows 0 11 0 && rowBit rows 0 11 7))) = true)
    (h0843 : (!((rowBit rows 0 10 0 && rowBit rows 0 10 8 && rowBit rows 0 11 0 && rowBit rows 0 11 8))) = true)
    (h0844 : (!((rowBit rows 0 10 0 && rowBit rows 0 10 9 && rowBit rows 0 11 0 && rowBit rows 0 11 9))) = true)
    (h0845 : (!((rowBit rows 0 10 0 && rowBit rows 0 10 12 && rowBit rows 0 11 0 && rowBit rows 0 11 12))) = true)
    (h0846 : (!((rowBit rows 0 10 1 && rowBit rows 0 10 6 && rowBit rows 0 11 1 && rowBit rows 0 11 6))) = true)
    (h0847 : (!((rowBit rows 0 10 1 && rowBit rows 0 10 8 && rowBit rows 0 11 1 && rowBit rows 0 11 8))) = true)
    (h0848 : (!((rowBit rows 0 10 1 && rowBit rows 0 10 9 && rowBit rows 0 11 1 && rowBit rows 0 11 9))) = true)
    (h0849 : (!((rowBit rows 0 10 1 && rowBit rows 0 10 12 && rowBit rows 0 11 1 && rowBit rows 0 11 12))) = true)
    (h0850 : (!((rowBit rows 0 10 2 && rowBit rows 0 10 4 && rowBit rows 0 11 2 && rowBit rows 0 11 4))) = true)
    (h0851 : (!((rowBit rows 0 10 2 && rowBit rows 0 10 6 && rowBit rows 0 11 2 && rowBit rows 0 11 6))) = true)
    (h0852 : (!((rowBit rows 0 10 2 && rowBit rows 0 10 8 && rowBit rows 0 11 2 && rowBit rows 0 11 8))) = true)
    (h0853 : (!((rowBit rows 0 10 2 && rowBit rows 0 10 9 && rowBit rows 0 11 2 && rowBit rows 0 11 9))) = true)
    (h0854 : (!((rowBit rows 0 10 2 && rowBit rows 0 10 12 && rowBit rows 0 11 2 && rowBit rows 0 11 12))) = true)
    (h0855 : (!((rowBit rows 0 10 3 && rowBit rows 0 10 6 && rowBit rows 0 11 3 && rowBit rows 0 11 6))) = true)
    (h0856 : (!((rowBit rows 0 10 3 && rowBit rows 0 10 7 && rowBit rows 0 11 3 && rowBit rows 0 11 7))) = true)
    (h0857 : (!((rowBit rows 0 10 3 && rowBit rows 0 10 8 && rowBit rows 0 11 3 && rowBit rows 0 11 8))) = true)
    (h0858 : (!((rowBit rows 0 10 3 && rowBit rows 0 10 9 && rowBit rows 0 11 3 && rowBit rows 0 11 9))) = true)
    (h0859 : (!((rowBit rows 0 10 3 && rowBit rows 0 10 12 && rowBit rows 0 11 3 && rowBit rows 0 11 12))) = true)
    (h0860 : (!((rowBit rows 0 10 4 && rowBit rows 0 10 7 && rowBit rows 0 11 4 && rowBit rows 0 11 7))) = true)
    (h0861 : (!((rowBit rows 0 10 4 && rowBit rows 0 10 8 && rowBit rows 0 11 4 && rowBit rows 0 11 8))) = true)
    (h0862 : (!((rowBit rows 0 10 4 && rowBit rows 0 10 9 && rowBit rows 0 11 4 && rowBit rows 0 11 9))) = true)
    (h0863 : (!((rowBit rows 0 10 4 && rowBit rows 0 10 12 && rowBit rows 0 11 4 && rowBit rows 0 11 12))) = true)
    (h0864 : (!((rowBit rows 0 10 5 && rowBit rows 0 10 7 && rowBit rows 0 11 5 && rowBit rows 0 11 7))) = true)
    (h0865 : (!((rowBit rows 0 10 5 && rowBit rows 0 10 8 && rowBit rows 0 11 5 && rowBit rows 0 11 8))) = true)
    (h0866 : (!((rowBit rows 0 10 5 && rowBit rows 0 10 9 && rowBit rows 0 11 5 && rowBit rows 0 11 9))) = true)
    (h0867 : (!((rowBit rows 0 10 5 && rowBit rows 0 10 12 && rowBit rows 0 11 5 && rowBit rows 0 11 12))) = true)
    (h0868 : (!((rowBit rows 0 10 6 && rowBit rows 0 10 8 && rowBit rows 0 11 6 && rowBit rows 0 11 8))) = true)
    (h0869 : (!((rowBit rows 0 10 6 && rowBit rows 0 10 9 && rowBit rows 0 11 6 && rowBit rows 0 11 9))) = true)
    (h0870 : (!((rowBit rows 0 10 6 && rowBit rows 0 10 12 && rowBit rows 0 11 6 && rowBit rows 0 11 12))) = true)
    (h0871 : (!((rowBit rows 0 10 7 && rowBit rows 0 10 8 && rowBit rows 0 11 7 && rowBit rows 0 11 8))) = true)
    (h0872 : (!((rowBit rows 0 10 7 && rowBit rows 0 10 9 && rowBit rows 0 11 7 && rowBit rows 0 11 9))) = true)
    (h0873 : (!((rowBit rows 0 10 7 && rowBit rows 0 10 12 && rowBit rows 0 11 7 && rowBit rows 0 11 12))) = true)
    (h0874 : (!((rowBit rows 0 10 8 && rowBit rows 0 10 9 && rowBit rows 0 11 8 && rowBit rows 0 11 9))) = true)
    (h0875 : (!((rowBit rows 0 10 8 && rowBit rows 0 10 12 && rowBit rows 0 11 8 && rowBit rows 0 11 12))) = true)
    (h0876 : (!((rowBit rows 0 10 9 && rowBit rows 0 10 12 && rowBit rows 0 11 9 && rowBit rows 0 11 12))) = true)
    (h0877 : (!((rowBit rows 0 10 1 && rowBit rows 0 10 4 && rowBit rows 0 12 1 && rowBit rows 0 12 4))) = true)
    (h0878 : (!((rowBit rows 0 10 2 && rowBit rows 0 10 9 && rowBit rows 0 12 2 && rowBit rows 0 12 9))) = true)
    (h0879 : (!((rowBit rows 0 10 6 && rowBit rows 0 10 8 && rowBit rows 0 12 6 && rowBit rows 0 12 8))) = true)
    (h0880 : (!((rowBit rows 0 11 1 && rowBit rows 0 11 4 && rowBit rows 0 12 1 && rowBit rows 0 12 4))) = true)
    (h0881 : (!((rowBit rows 0 11 1 && rowBit rows 0 11 10 && rowBit rows 0 12 1 && rowBit rows 0 12 10))) = true)
    (h0882 : (!((rowBit rows 0 11 2 && rowBit rows 0 11 8 && rowBit rows 0 12 2 && rowBit rows 0 12 8))) = true)
    (h0883 : (!((rowBit rows 0 11 2 && rowBit rows 0 11 9 && rowBit rows 0 12 2 && rowBit rows 0 12 9))) = true)
    (h0884 : (!((rowBit rows 0 11 4 && rowBit rows 0 11 10 && rowBit rows 0 12 4 && rowBit rows 0 12 10))) = true)
    (h0885 : (!((rowBit rows 0 11 6 && rowBit rows 0 11 8 && rowBit rows 0 12 6 && rowBit rows 0 12 8))) = true)
    (h0886 : ((((bif rowBit rows 0 5 4 then 1#4 else 0#4) + (bif rowBit rows 0 5 5 then 1#4 else 0#4) + (bif rowBit rows 0 5 6 then 1#4 else 0#4) + (bif rowBit rows 0 5 7 then 1#4 else 0#4) + (bif rowBit rows 0 5 8 then 1#4 else 0#4))).ule 2#4) = true)
    (h0887 : ((((bif rowBit rows 0 6 4 then 1#4 else 0#4) + (bif rowBit rows 0 6 5 then 1#4 else 0#4) + (bif rowBit rows 0 6 6 then 1#4 else 0#4) + (bif rowBit rows 0 6 7 then 1#4 else 0#4) + (bif rowBit rows 0 6 8 then 1#4 else 0#4))).ule 2#4) = true)
    (h0888 : ((((bif rowBit rows 0 7 4 then 1#4 else 0#4) + (bif rowBit rows 0 7 5 then 1#4 else 0#4) + (bif rowBit rows 0 7 6 then 1#4 else 0#4) + (bif rowBit rows 0 7 7 then 1#4 else 0#4) + (bif rowBit rows 0 7 8 then 1#4 else 0#4))).ule 2#4) = true)
    (h0889 : ((((bif rowBit rows 0 4 4 then 1#4 else 0#4) + (bif rowBit rows 0 4 5 then 1#4 else 0#4) + (bif rowBit rows 0 4 6 then 1#4 else 0#4) + (bif rowBit rows 0 4 7 then 1#4 else 0#4) + (bif rowBit rows 0 4 8 then 1#4 else 0#4))).ule 1#4) = true)
    (h0890 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 10 && rowBit rows 0 5 0 && rowBit rows 0 5 10))) = true)
    (h0891 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 12 && rowBit rows 0 5 0 && rowBit rows 0 5 12))) = true)
    (h0892 : (!((rowBit rows 0 4 1 && rowBit rows 0 4 11 && rowBit rows 0 5 1 && rowBit rows 0 5 11))) = true)
    (h0893 : (!((rowBit rows 0 4 2 && rowBit rows 0 4 9 && rowBit rows 0 5 2 && rowBit rows 0 5 9))) = true)
    (h0894 : (!((rowBit rows 0 4 2 && rowBit rows 0 4 12 && rowBit rows 0 5 2 && rowBit rows 0 5 12))) = true)
    (h0895 : (!((rowBit rows 0 4 3 && rowBit rows 0 4 9 && rowBit rows 0 5 3 && rowBit rows 0 5 9))) = true) :
    ∀ item ∈ sourceChunk013Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk013Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0832
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0833
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0834
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0835
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0836
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0837
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0838
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0839
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0840
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0841
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0842
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0843
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0844
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0845
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0846
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0847
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0848
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0849
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0850
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0851
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0852
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0853
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0854
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0855
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0856
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0857
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0858
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0859
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0860
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0861
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0862
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0863
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0864
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0865
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0866
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0867
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0868
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0869
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0870
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0871
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0872
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0873
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0874
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0875
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0876
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0877
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0878
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0879
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0880
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0881
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0882
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0883
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0884
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0885
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h0886 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h0887 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h0888 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h0889 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0890
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0891
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0892
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0893
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0894
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0895

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
