/-
Generated packed-source bridge for verified middle chunk 015.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk015_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0960 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 6 && rowBit rows 0 11 3 && rowBit rows 0 11 6))) = true)
    (h0961 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 5 && rowBit rows 0 11 4 && rowBit rows 0 11 5))) = true)
    (h0962 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 6 && rowBit rows 0 11 4 && rowBit rows 0 11 6))) = true)
    (h0963 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 7 && rowBit rows 0 11 4 && rowBit rows 0 11 7))) = true)
    (h0964 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 6 && rowBit rows 0 11 5 && rowBit rows 0 11 6))) = true)
    (h0965 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 6 && rowBit rows 0 12 3 && rowBit rows 0 12 6))) = true)
    (h0966 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 7 && rowBit rows 0 12 3 && rowBit rows 0 12 7))) = true)
    (h0967 : (!((rowBit rows 0 10 1 && rowBit rows 0 10 4 && rowBit rows 0 11 1 && rowBit rows 0 11 4))) = true)
    (h0968 : (!((rowBit rows 0 10 1 && rowBit rows 0 10 5 && rowBit rows 0 11 1 && rowBit rows 0 11 5))) = true)
    (h0969 : (!((rowBit rows 0 10 1 && rowBit rows 0 10 7 && rowBit rows 0 11 1 && rowBit rows 0 11 7))) = true)
    (h0970 : (!((rowBit rows 0 10 2 && rowBit rows 0 10 5 && rowBit rows 0 11 2 && rowBit rows 0 11 5))) = true)
    (h0971 : (!((rowBit rows 0 10 2 && rowBit rows 0 10 7 && rowBit rows 0 11 2 && rowBit rows 0 11 7))) = true)
    (h0972 : (!((rowBit rows 0 10 3 && rowBit rows 0 10 5 && rowBit rows 0 11 3 && rowBit rows 0 11 5))) = true)
    (h0973 : (!((rowBit rows 0 10 4 && rowBit rows 0 10 5 && rowBit rows 0 11 4 && rowBit rows 0 11 5))) = true)
    (h0974 : (!((rowBit rows 0 10 4 && rowBit rows 0 10 6 && rowBit rows 0 11 4 && rowBit rows 0 11 6))) = true)
    (h0975 : (!((rowBit rows 0 10 5 && rowBit rows 0 10 6 && rowBit rows 0 11 5 && rowBit rows 0 11 6))) = true)
    (h0976 : (!((rowBit rows 0 10 6 && rowBit rows 0 10 7 && rowBit rows 0 11 6 && rowBit rows 0 11 7))) = true)
    (h0977 : (!((rowBit rows 0 10 4 && rowBit rows 0 10 7 && rowBit rows 0 12 4 && rowBit rows 0 12 7))) = true)
    (h0978 : (!((rowBit rows 0 11 2 && rowBit rows 0 11 6 && rowBit rows 0 12 2 && rowBit rows 0 12 6))) = true)
    (h0979 : ((((bif rowBit rows 0 1 0 then 1#4 else 0#4) + (bif rowBit rows 0 1 1 then 1#4 else 0#4) + (bif rowBit rows 0 1 2 then 1#4 else 0#4) + (bif rowBit rows 0 1 3 then 1#4 else 0#4) + (bif rowBit rows 0 1 4 then 1#4 else 0#4))).ule 2#4) = true)
    (h0980 : ((((bif rowBit rows 0 2 0 then 1#4 else 0#4) + (bif rowBit rows 0 2 1 then 1#4 else 0#4) + (bif rowBit rows 0 2 2 then 1#4 else 0#4) + (bif rowBit rows 0 2 3 then 1#4 else 0#4) + (bif rowBit rows 0 2 4 then 1#4 else 0#4))).ule 2#4) = true)
    (h0981 : ((((bif rowBit rows 0 3 0 then 1#4 else 0#4) + (bif rowBit rows 0 3 1 then 1#4 else 0#4) + (bif rowBit rows 0 3 2 then 1#4 else 0#4) + (bif rowBit rows 0 3 3 then 1#4 else 0#4) + (bif rowBit rows 0 3 4 then 1#4 else 0#4))).ule 2#4) = true)
    (h0982 : ((((bif rowBit rows 0 0 0 then 1#4 else 0#4) + (bif rowBit rows 0 0 1 then 1#4 else 0#4) + (bif rowBit rows 0 0 2 then 1#4 else 0#4) + (bif rowBit rows 0 0 3 then 1#4 else 0#4) + (bif rowBit rows 0 0 4 then 1#4 else 0#4))).ule 1#4) = true)
    (h0983 : ((((bif rowBit rows 0 4 0 then 1#4 else 0#4) + (bif rowBit rows 0 4 1 then 1#4 else 0#4) + (bif rowBit rows 0 4 2 then 1#4 else 0#4) + (bif rowBit rows 0 4 3 then 1#4 else 0#4) + (bif rowBit rows 0 4 4 then 1#4 else 0#4))).ule 1#4) = true)
    (h0984 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 8 && rowBit rows 0 1 5 && rowBit rows 0 1 8))) = true)
    (h0985 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 9 && rowBit rows 0 1 5 && rowBit rows 0 1 9))) = true)
    (h0986 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 10 && rowBit rows 0 1 5 && rowBit rows 0 1 10))) = true)
    (h0987 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 11 && rowBit rows 0 1 5 && rowBit rows 0 1 11))) = true)
    (h0988 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 12 && rowBit rows 0 1 5 && rowBit rows 0 1 12))) = true)
    (h0989 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 7 && rowBit rows 0 1 6 && rowBit rows 0 1 7))) = true)
    (h0990 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 8 && rowBit rows 0 1 6 && rowBit rows 0 1 8))) = true)
    (h0991 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 9 && rowBit rows 0 1 6 && rowBit rows 0 1 9))) = true)
    (h0992 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 10 && rowBit rows 0 1 6 && rowBit rows 0 1 10))) = true)
    (h0993 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 0 1 7 && rowBit rows 0 1 8))) = true)
    (h0994 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 11 && rowBit rows 0 1 7 && rowBit rows 0 1 11))) = true)
    (h0995 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 12 && rowBit rows 0 1 7 && rowBit rows 0 1 12))) = true)
    (h0996 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 7 && rowBit rows 0 2 5 && rowBit rows 0 2 7))) = true)
    (h0997 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 10 && rowBit rows 0 2 5 && rowBit rows 0 2 10))) = true)
    (h0998 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 11 && rowBit rows 0 2 5 && rowBit rows 0 2 11))) = true)
    (h0999 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 7 && rowBit rows 0 2 6 && rowBit rows 0 2 7))) = true)
    (h1000 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 10 && rowBit rows 0 2 6 && rowBit rows 0 2 10))) = true)
    (h1001 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 11 && rowBit rows 0 2 6 && rowBit rows 0 2 11))) = true)
    (h1002 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 12 && rowBit rows 0 2 6 && rowBit rows 0 2 12))) = true)
    (h1003 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 0 2 7 && rowBit rows 0 2 8))) = true)
    (h1004 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 0 2 7 && rowBit rows 0 2 9))) = true)
    (h1005 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 0 2 7 && rowBit rows 0 2 10))) = true)
    (h1006 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 11 && rowBit rows 0 2 7 && rowBit rows 0 2 11))) = true)
    (h1007 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 12 && rowBit rows 0 2 7 && rowBit rows 0 2 12))) = true)
    (h1008 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 7 && rowBit rows 0 3 5 && rowBit rows 0 3 7))) = true)
    (h1009 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 10 && rowBit rows 0 3 5 && rowBit rows 0 3 10))) = true)
    (h1010 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 8 && rowBit rows 0 3 6 && rowBit rows 0 3 8))) = true)
    (h1011 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 12 && rowBit rows 0 3 6 && rowBit rows 0 3 12))) = true)
    (h1012 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 0 3 7 && rowBit rows 0 3 8))) = true)
    (h1013 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 0 3 7 && rowBit rows 0 3 9))) = true)
    (h1014 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 0 3 7 && rowBit rows 0 3 10))) = true)
    (h1015 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 12 && rowBit rows 0 3 7 && rowBit rows 0 3 12))) = true)
    (h1016 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 9 && rowBit rows 0 4 5 && rowBit rows 0 4 9))) = true)
    (h1017 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 11 && rowBit rows 0 4 5 && rowBit rows 0 4 11))) = true)
    (h1018 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 12 && rowBit rows 0 4 5 && rowBit rows 0 4 12))) = true)
    (h1019 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 9 && rowBit rows 0 4 6 && rowBit rows 0 4 9))) = true)
    (h1020 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 10 && rowBit rows 0 4 6 && rowBit rows 0 4 10))) = true)
    (h1021 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 0 4 7 && rowBit rows 0 4 9))) = true)
    (h1022 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 0 4 7 && rowBit rows 0 4 10))) = true)
    (h1023 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 12 && rowBit rows 0 4 7 && rowBit rows 0 4 12))) = true) :
    ∀ item ∈ sourceChunk015Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk015Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0960
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0961
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0962
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0963
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0964
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0965
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0966
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0967
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0968
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0969
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0970
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0971
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0972
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0973
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0974
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0975
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0976
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0977
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0978
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h0979 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h0980 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h0981 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h0982 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h0983 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0984
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0985
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0986
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0987
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0988
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0989
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0990
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0991
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0992
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0993
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0994
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0995
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0996
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0997
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0998
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0999
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1000
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1001
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1002
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1003
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1004
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1005
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1006
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1007
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1008
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1009
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1010
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1011
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1012
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1013
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1014
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1015
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1016
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1017
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1018
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1019
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1020
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1021
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1022
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1023

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
