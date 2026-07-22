/-
Generated packed-source bridge for verified middle chunk 014.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk014_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0896 : (!((rowBit rows 0 4 3 && rowBit rows 0 4 11 && rowBit rows 0 5 3 && rowBit rows 0 5 11))) = true)
    (h0897 : (!((rowBit rows 0 4 3 && rowBit rows 0 4 12 && rowBit rows 0 5 3 && rowBit rows 0 5 12))) = true)
    (h0898 : (!((rowBit rows 0 4 9 && rowBit rows 0 4 10 && rowBit rows 0 5 9 && rowBit rows 0 5 10))) = true)
    (h0899 : (!((rowBit rows 0 4 9 && rowBit rows 0 4 12 && rowBit rows 0 5 9 && rowBit rows 0 5 12))) = true)
    (h0900 : (!((rowBit rows 0 4 10 && rowBit rows 0 4 11 && rowBit rows 0 5 10 && rowBit rows 0 5 11))) = true)
    (h0901 : (!((rowBit rows 0 4 11 && rowBit rows 0 4 12 && rowBit rows 0 5 11 && rowBit rows 0 5 12))) = true)
    (h0902 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 10 && rowBit rows 0 6 0 && rowBit rows 0 6 10))) = true)
    (h0903 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 12 && rowBit rows 0 6 0 && rowBit rows 0 6 12))) = true)
    (h0904 : (!((rowBit rows 0 4 1 && rowBit rows 0 4 9 && rowBit rows 0 6 1 && rowBit rows 0 6 9))) = true)
    (h0905 : (!((rowBit rows 0 4 1 && rowBit rows 0 4 10 && rowBit rows 0 6 1 && rowBit rows 0 6 10))) = true)
    (h0906 : (!((rowBit rows 0 4 1 && rowBit rows 0 4 11 && rowBit rows 0 6 1 && rowBit rows 0 6 11))) = true)
    (h0907 : (!((rowBit rows 0 4 2 && rowBit rows 0 4 9 && rowBit rows 0 6 2 && rowBit rows 0 6 9))) = true)
    (h0908 : (!((rowBit rows 0 4 2 && rowBit rows 0 4 12 && rowBit rows 0 6 2 && rowBit rows 0 6 12))) = true)
    (h0909 : (!((rowBit rows 0 4 3 && rowBit rows 0 4 9 && rowBit rows 0 6 3 && rowBit rows 0 6 9))) = true)
    (h0910 : (!((rowBit rows 0 4 3 && rowBit rows 0 4 10 && rowBit rows 0 6 3 && rowBit rows 0 6 10))) = true)
    (h0911 : (!((rowBit rows 0 4 3 && rowBit rows 0 4 11 && rowBit rows 0 6 3 && rowBit rows 0 6 11))) = true)
    (h0912 : (!((rowBit rows 0 4 9 && rowBit rows 0 4 10 && rowBit rows 0 6 9 && rowBit rows 0 6 10))) = true)
    (h0913 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 12 && rowBit rows 0 7 0 && rowBit rows 0 7 12))) = true)
    (h0914 : (!((rowBit rows 0 4 10 && rowBit rows 0 4 12 && rowBit rows 0 7 10 && rowBit rows 0 7 12))) = true)
    (h0915 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 1 && rowBit rows 0 6 0 && rowBit rows 0 6 1))) = true)
    (h0916 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 2 && rowBit rows 0 6 0 && rowBit rows 0 6 2))) = true)
    (h0917 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 3 && rowBit rows 0 6 0 && rowBit rows 0 6 3))) = true)
    (h0918 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 10 && rowBit rows 0 6 0 && rowBit rows 0 6 10))) = true)
    (h0919 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 12 && rowBit rows 0 6 0 && rowBit rows 0 6 12))) = true)
    (h0920 : (!((rowBit rows 0 5 1 && rowBit rows 0 5 9 && rowBit rows 0 6 1 && rowBit rows 0 6 9))) = true)
    (h0921 : (!((rowBit rows 0 5 1 && rowBit rows 0 5 10 && rowBit rows 0 6 1 && rowBit rows 0 6 10))) = true)
    (h0922 : (!((rowBit rows 0 5 1 && rowBit rows 0 5 11 && rowBit rows 0 6 1 && rowBit rows 0 6 11))) = true)
    (h0923 : (!((rowBit rows 0 5 1 && rowBit rows 0 5 12 && rowBit rows 0 6 1 && rowBit rows 0 6 12))) = true)
    (h0924 : (!((rowBit rows 0 5 2 && rowBit rows 0 5 9 && rowBit rows 0 6 2 && rowBit rows 0 6 9))) = true)
    (h0925 : (!((rowBit rows 0 5 2 && rowBit rows 0 5 10 && rowBit rows 0 6 2 && rowBit rows 0 6 10))) = true)
    (h0926 : (!((rowBit rows 0 5 2 && rowBit rows 0 5 11 && rowBit rows 0 6 2 && rowBit rows 0 6 11))) = true)
    (h0927 : (!((rowBit rows 0 5 2 && rowBit rows 0 5 12 && rowBit rows 0 6 2 && rowBit rows 0 6 12))) = true)
    (h0928 : (!((rowBit rows 0 5 3 && rowBit rows 0 5 9 && rowBit rows 0 6 3 && rowBit rows 0 6 9))) = true)
    (h0929 : (!((rowBit rows 0 5 3 && rowBit rows 0 5 11 && rowBit rows 0 6 3 && rowBit rows 0 6 11))) = true)
    (h0930 : (!((rowBit rows 0 5 3 && rowBit rows 0 5 12 && rowBit rows 0 6 3 && rowBit rows 0 6 12))) = true)
    (h0931 : (!((rowBit rows 0 5 9 && rowBit rows 0 5 11 && rowBit rows 0 6 9 && rowBit rows 0 6 11))) = true)
    (h0932 : (!((rowBit rows 0 5 9 && rowBit rows 0 5 12 && rowBit rows 0 6 9 && rowBit rows 0 6 12))) = true)
    (h0933 : (!((rowBit rows 0 5 10 && rowBit rows 0 5 11 && rowBit rows 0 6 10 && rowBit rows 0 6 11))) = true)
    (h0934 : (!((rowBit rows 0 5 10 && rowBit rows 0 5 12 && rowBit rows 0 6 10 && rowBit rows 0 6 12))) = true)
    (h0935 : (!((rowBit rows 0 5 9 && rowBit rows 0 5 10 && rowBit rows 0 7 9 && rowBit rows 0 7 10))) = true)
    (h0936 : (!((rowBit rows 0 5 10 && rowBit rows 0 5 12 && rowBit rows 0 7 10 && rowBit rows 0 7 12))) = true)
    (h0937 : (!((rowBit rows 0 6 10 && rowBit rows 0 6 12 && rowBit rows 0 7 10 && rowBit rows 0 7 12))) = true)
    (h0938 : ((((bif rowBit rows 0 10 0 then 1#4 else 0#4) + (bif rowBit rows 0 10 8 then 1#4 else 0#4) + (bif rowBit rows 0 10 9 then 1#4 else 0#4) + (bif rowBit rows 0 10 10 then 1#4 else 0#4) + (bif rowBit rows 0 10 11 then 1#4 else 0#4) + (bif rowBit rows 0 10 12 then 1#4 else 0#4))).ule 2#4) = true)
    (h0939 : ((((bif rowBit rows 0 11 0 then 1#4 else 0#4) + (bif rowBit rows 0 11 8 then 1#4 else 0#4) + (bif rowBit rows 0 11 9 then 1#4 else 0#4) + (bif rowBit rows 0 11 10 then 1#4 else 0#4) + (bif rowBit rows 0 11 11 then 1#4 else 0#4) + (bif rowBit rows 0 11 12 then 1#4 else 0#4))).ule 2#4) = true)
    (h0940 : ((((bif rowBit rows 0 12 0 then 1#4 else 0#4) + (bif rowBit rows 0 12 8 then 1#4 else 0#4) + (bif rowBit rows 0 12 9 then 1#4 else 0#4) + (bif rowBit rows 0 12 10 then 1#4 else 0#4) + (bif rowBit rows 0 12 11 then 1#4 else 0#4) + (bif rowBit rows 0 12 12 then 1#4 else 0#4))).ule 2#4) = true)
    (h0941 : ((((bif rowBit rows 0 0 0 then 1#4 else 0#4) + (bif rowBit rows 0 0 8 then 1#4 else 0#4) + (bif rowBit rows 0 0 9 then 1#4 else 0#4) + (bif rowBit rows 0 0 10 then 1#4 else 0#4) + (bif rowBit rows 0 0 11 then 1#4 else 0#4) + (bif rowBit rows 0 0 12 then 1#4 else 0#4))).ule 1#4) = true)
    (h0942 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 5 && rowBit rows 0 10 1 && rowBit rows 0 10 5))) = true)
    (h0943 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 7 && rowBit rows 0 10 1 && rowBit rows 0 10 7))) = true)
    (h0944 : (!((rowBit rows 0 0 2 && rowBit rows 0 0 5 && rowBit rows 0 10 2 && rowBit rows 0 10 5))) = true)
    (h0945 : (!((rowBit rows 0 0 2 && rowBit rows 0 0 7 && rowBit rows 0 10 2 && rowBit rows 0 10 7))) = true)
    (h0946 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 5 && rowBit rows 0 10 3 && rowBit rows 0 10 5))) = true)
    (h0947 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 6 && rowBit rows 0 10 3 && rowBit rows 0 10 6))) = true)
    (h0948 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 7 && rowBit rows 0 10 3 && rowBit rows 0 10 7))) = true)
    (h0949 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 5 && rowBit rows 0 10 4 && rowBit rows 0 10 5))) = true)
    (h0950 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 6 && rowBit rows 0 10 4 && rowBit rows 0 10 6))) = true)
    (h0951 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 7 && rowBit rows 0 10 4 && rowBit rows 0 10 7))) = true)
    (h0952 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 6 && rowBit rows 0 10 5 && rowBit rows 0 10 6))) = true)
    (h0953 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 7 && rowBit rows 0 10 5 && rowBit rows 0 10 7))) = true)
    (h0954 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 5 && rowBit rows 0 11 1 && rowBit rows 0 11 5))) = true)
    (h0955 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 7 && rowBit rows 0 11 1 && rowBit rows 0 11 7))) = true)
    (h0956 : (!((rowBit rows 0 0 2 && rowBit rows 0 0 5 && rowBit rows 0 11 2 && rowBit rows 0 11 5))) = true)
    (h0957 : (!((rowBit rows 0 0 2 && rowBit rows 0 0 6 && rowBit rows 0 11 2 && rowBit rows 0 11 6))) = true)
    (h0958 : (!((rowBit rows 0 0 2 && rowBit rows 0 0 7 && rowBit rows 0 11 2 && rowBit rows 0 11 7))) = true)
    (h0959 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 5 && rowBit rows 0 11 3 && rowBit rows 0 11 5))) = true) :
    ∀ item ∈ sourceChunk014Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk014Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0896
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0897
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0898
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0899
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0900
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0901
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0902
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0903
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0904
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0905
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0906
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0907
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0908
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0909
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0910
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0911
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0912
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0913
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0914
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0915
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0916
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0917
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0918
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0919
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0920
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0921
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0922
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0923
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0924
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0925
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0926
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0927
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0928
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0929
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0930
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0931
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0932
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0933
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0934
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0935
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0936
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0937
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h0938 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h0939 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h0940 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h0941 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0942
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0943
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0944
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0945
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0946
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0947
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0948
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0949
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0950
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0951
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0952
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0953
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0954
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0955
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0956
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0957
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0958
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0959

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
