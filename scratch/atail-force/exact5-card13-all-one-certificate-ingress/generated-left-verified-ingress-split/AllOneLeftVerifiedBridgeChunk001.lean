/-
Generated packed-source bridge for verified left chunk 001.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk001_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0064 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 6 && rowBit rows 0 1 3 && rowBit rows 0 1 6))) = true)
    (h0065 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 7 && rowBit rows 0 1 3 && rowBit rows 0 1 7))) = true)
    (h0066 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 8 && rowBit rows 0 1 3 && rowBit rows 0 1 8))) = true)
    (h0067 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 9 && rowBit rows 0 1 3 && rowBit rows 0 1 9))) = true)
    (h0068 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 10 && rowBit rows 0 1 3 && rowBit rows 0 1 10))) = true)
    (h0069 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 11 && rowBit rows 0 1 3 && rowBit rows 0 1 11))) = true)
    (h0070 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 12 && rowBit rows 0 1 3 && rowBit rows 0 1 12))) = true)
    (h0071 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 5 && rowBit rows 0 1 4 && rowBit rows 0 1 5))) = true)
    (h0072 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 6 && rowBit rows 0 1 4 && rowBit rows 0 1 6))) = true)
    (h0073 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 7 && rowBit rows 0 1 4 && rowBit rows 0 1 7))) = true)
    (h0074 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 8 && rowBit rows 0 1 4 && rowBit rows 0 1 8))) = true)
    (h0075 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 9 && rowBit rows 0 1 4 && rowBit rows 0 1 9))) = true)
    (h0076 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 10 && rowBit rows 0 1 4 && rowBit rows 0 1 10))) = true)
    (h0077 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 11 && rowBit rows 0 1 4 && rowBit rows 0 1 11))) = true)
    (h0078 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 12 && rowBit rows 0 1 4 && rowBit rows 0 1 12))) = true)
    (h0079 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 6 && rowBit rows 0 1 5 && rowBit rows 0 1 6))) = true)
    (h0080 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 7 && rowBit rows 0 1 5 && rowBit rows 0 1 7))) = true)
    (h0081 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 11 && rowBit rows 0 1 6 && rowBit rows 0 1 11))) = true)
    (h0082 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 12 && rowBit rows 0 1 6 && rowBit rows 0 1 12))) = true)
    (h0083 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 0 1 7 && rowBit rows 0 1 9))) = true)
    (h0084 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 0 1 7 && rowBit rows 0 1 10))) = true)
    (h0085 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 5 && rowBit rows 0 2 3 && rowBit rows 0 2 5))) = true)
    (h0086 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 6 && rowBit rows 0 2 3 && rowBit rows 0 2 6))) = true)
    (h0087 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 7 && rowBit rows 0 2 3 && rowBit rows 0 2 7))) = true)
    (h0088 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 8 && rowBit rows 0 2 3 && rowBit rows 0 2 8))) = true)
    (h0089 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 9 && rowBit rows 0 2 3 && rowBit rows 0 2 9))) = true)
    (h0090 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 10 && rowBit rows 0 2 3 && rowBit rows 0 2 10))) = true)
    (h0091 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 11 && rowBit rows 0 2 3 && rowBit rows 0 2 11))) = true)
    (h0092 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 12 && rowBit rows 0 2 3 && rowBit rows 0 2 12))) = true)
    (h0093 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 5 && rowBit rows 0 2 4 && rowBit rows 0 2 5))) = true)
    (h0094 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 6 && rowBit rows 0 2 4 && rowBit rows 0 2 6))) = true)
    (h0095 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 7 && rowBit rows 0 2 4 && rowBit rows 0 2 7))) = true)
    (h0096 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 8 && rowBit rows 0 2 4 && rowBit rows 0 2 8))) = true)
    (h0097 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 9 && rowBit rows 0 2 4 && rowBit rows 0 2 9))) = true)
    (h0098 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 10 && rowBit rows 0 2 4 && rowBit rows 0 2 10))) = true)
    (h0099 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 11 && rowBit rows 0 2 4 && rowBit rows 0 2 11))) = true)
    (h0100 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 12 && rowBit rows 0 2 4 && rowBit rows 0 2 12))) = true)
    (h0101 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 6 && rowBit rows 0 2 5 && rowBit rows 0 2 6))) = true)
    (h0102 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 8 && rowBit rows 0 2 5 && rowBit rows 0 2 8))) = true)
    (h0103 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 9 && rowBit rows 0 2 5 && rowBit rows 0 2 9))) = true)
    (h0104 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 12 && rowBit rows 0 2 5 && rowBit rows 0 2 12))) = true)
    (h0105 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 8 && rowBit rows 0 2 6 && rowBit rows 0 2 8))) = true)
    (h0106 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 9 && rowBit rows 0 2 6 && rowBit rows 0 2 9))) = true)
    (h0107 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 5 && rowBit rows 0 3 4 && rowBit rows 0 3 5))) = true)
    (h0108 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 6 && rowBit rows 0 3 4 && rowBit rows 0 3 6))) = true)
    (h0109 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 7 && rowBit rows 0 3 4 && rowBit rows 0 3 7))) = true)
    (h0110 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 8 && rowBit rows 0 3 4 && rowBit rows 0 3 8))) = true)
    (h0111 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 10 && rowBit rows 0 3 4 && rowBit rows 0 3 10))) = true)
    (h0112 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 6 && rowBit rows 0 3 5 && rowBit rows 0 3 6))) = true)
    (h0113 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 7 && rowBit rows 0 3 6 && rowBit rows 0 3 7))) = true)
    (h0114 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 9 && rowBit rows 0 3 6 && rowBit rows 0 3 9))) = true)
    (h0115 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 10 && rowBit rows 0 3 6 && rowBit rows 0 3 10))) = true)
    (h0116 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 11 && rowBit rows 0 3 6 && rowBit rows 0 3 11))) = true)
    (h0117 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 11 && rowBit rows 0 3 7 && rowBit rows 0 3 11))) = true)
    (h0118 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 10 && rowBit rows 0 4 5 && rowBit rows 0 4 10))) = true)
    (h0119 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 11 && rowBit rows 0 4 6 && rowBit rows 0 4 11))) = true)
    (h0120 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 12 && rowBit rows 0 4 6 && rowBit rows 0 4 12))) = true)
    (h0121 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 11 && rowBit rows 0 4 7 && rowBit rows 0 4 11))) = true)
    (h0122 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 7 && rowBit rows 0 5 6 && rowBit rows 0 5 7))) = true)
    (h0123 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 8 && rowBit rows 0 5 6 && rowBit rows 0 5 8))) = true)
    (h0124 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 9 && rowBit rows 0 5 6 && rowBit rows 0 5 9))) = true)
    (h0125 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 10 && rowBit rows 0 5 6 && rowBit rows 0 5 10))) = true)
    (h0126 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 11 && rowBit rows 0 5 6 && rowBit rows 0 5 11))) = true)
    (h0127 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 12 && rowBit rows 0 5 6 && rowBit rows 0 5 12))) = true) :
    ∀ item ∈ sourceChunk001Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk001Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0064
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0065
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0066
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0067
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0068
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0069
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0070
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0071
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0072
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0073
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0074
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0075
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0076
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0077
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0078
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0079
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0080
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0081
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0082
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0083
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0084
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0085
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0086
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0087
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0088
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0089
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0090
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0091
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0092
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0093
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0094
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0095
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0096
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0097
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0098
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0099
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0100
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0101
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0102
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0103
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0104
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0105
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0106
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0107
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0108
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0109
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0110
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0111
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0112
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0113
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0114
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0115
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0116
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0117
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0118
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0119
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0120
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0121
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0122
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0123
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0124
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0125
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0126
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0127

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
