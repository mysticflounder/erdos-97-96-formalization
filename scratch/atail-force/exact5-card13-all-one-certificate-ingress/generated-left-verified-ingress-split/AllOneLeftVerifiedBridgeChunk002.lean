/-
Generated packed-source bridge for verified left chunk 002.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk002_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0128 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 0 5 7 && rowBit rows 0 5 8))) = true)
    (h0129 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 0 5 7 && rowBit rows 0 5 9))) = true)
    (h0130 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 0 5 7 && rowBit rows 0 5 10))) = true)
    (h0131 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 11 && rowBit rows 0 5 7 && rowBit rows 0 5 11))) = true)
    (h0132 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 12 && rowBit rows 0 5 7 && rowBit rows 0 5 12))) = true)
    (h0133 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 5 && rowBit rows 0 6 4 && rowBit rows 0 6 5))) = true)
    (h0134 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 0 6 7 && rowBit rows 0 6 8))) = true)
    (h0135 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 0 6 7 && rowBit rows 0 6 9))) = true)
    (h0136 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 0 6 7 && rowBit rows 0 6 10))) = true)
    (h0137 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 11 && rowBit rows 0 6 7 && rowBit rows 0 6 11))) = true)
    (h0138 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 12 && rowBit rows 0 6 7 && rowBit rows 0 6 12))) = true)
    (h0139 : (!((rowBit rows 0 0 2 && rowBit rows 0 0 6 && rowBit rows 0 7 2 && rowBit rows 0 7 6))) = true)
    (h0140 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 6 && rowBit rows 0 7 3 && rowBit rows 0 7 6))) = true)
    (h0141 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 5 && rowBit rows 0 7 4 && rowBit rows 0 7 5))) = true)
    (h0142 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 6 && rowBit rows 0 7 5 && rowBit rows 0 7 6))) = true)
    (h0143 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 6 && rowBit rows 0 10 1 && rowBit rows 0 10 6))) = true)
    (h0144 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 8 && rowBit rows 0 10 1 && rowBit rows 0 10 8))) = true)
    (h0145 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 9 && rowBit rows 0 10 1 && rowBit rows 0 10 9))) = true)
    (h0146 : (!((rowBit rows 0 0 2 && rowBit rows 0 0 6 && rowBit rows 0 10 2 && rowBit rows 0 10 6))) = true)
    (h0147 : (!((rowBit rows 0 0 2 && rowBit rows 0 0 8 && rowBit rows 0 10 2 && rowBit rows 0 10 8))) = true)
    (h0148 : (!((rowBit rows 0 0 2 && rowBit rows 0 0 9 && rowBit rows 0 10 2 && rowBit rows 0 10 9))) = true)
    (h0149 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 8 && rowBit rows 0 10 3 && rowBit rows 0 10 8))) = true)
    (h0150 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 9 && rowBit rows 0 10 3 && rowBit rows 0 10 9))) = true)
    (h0151 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 8 && rowBit rows 0 10 4 && rowBit rows 0 10 8))) = true)
    (h0152 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 9 && rowBit rows 0 10 4 && rowBit rows 0 10 9))) = true)
    (h0153 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 8 && rowBit rows 0 10 5 && rowBit rows 0 10 8))) = true)
    (h0154 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 9 && rowBit rows 0 10 5 && rowBit rows 0 10 9))) = true)
    (h0155 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 7 && rowBit rows 0 10 6 && rowBit rows 0 10 7))) = true)
    (h0156 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 8 && rowBit rows 0 10 6 && rowBit rows 0 10 8))) = true)
    (h0157 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 9 && rowBit rows 0 10 6 && rowBit rows 0 10 9))) = true)
    (h0158 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 0 10 7 && rowBit rows 0 10 8))) = true)
    (h0159 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 0 10 7 && rowBit rows 0 10 9))) = true)
    (h0160 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 6 && rowBit rows 0 11 1 && rowBit rows 0 11 6))) = true)
    (h0161 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 8 && rowBit rows 0 11 1 && rowBit rows 0 11 8))) = true)
    (h0162 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 9 && rowBit rows 0 11 1 && rowBit rows 0 11 9))) = true)
    (h0163 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 10 && rowBit rows 0 11 1 && rowBit rows 0 11 10))) = true)
    (h0164 : (!((rowBit rows 0 0 2 && rowBit rows 0 0 8 && rowBit rows 0 11 2 && rowBit rows 0 11 8))) = true)
    (h0165 : (!((rowBit rows 0 0 2 && rowBit rows 0 0 9 && rowBit rows 0 11 2 && rowBit rows 0 11 9))) = true)
    (h0166 : (!((rowBit rows 0 0 2 && rowBit rows 0 0 10 && rowBit rows 0 11 2 && rowBit rows 0 11 10))) = true)
    (h0167 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 7 && rowBit rows 0 11 3 && rowBit rows 0 11 7))) = true)
    (h0168 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 8 && rowBit rows 0 11 3 && rowBit rows 0 11 8))) = true)
    (h0169 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 9 && rowBit rows 0 11 3 && rowBit rows 0 11 9))) = true)
    (h0170 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 10 && rowBit rows 0 11 3 && rowBit rows 0 11 10))) = true)
    (h0171 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 8 && rowBit rows 0 11 4 && rowBit rows 0 11 8))) = true)
    (h0172 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 9 && rowBit rows 0 11 4 && rowBit rows 0 11 9))) = true)
    (h0173 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 10 && rowBit rows 0 11 4 && rowBit rows 0 11 10))) = true)
    (h0174 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 7 && rowBit rows 0 11 5 && rowBit rows 0 11 7))) = true)
    (h0175 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 8 && rowBit rows 0 11 5 && rowBit rows 0 11 8))) = true)
    (h0176 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 9 && rowBit rows 0 11 5 && rowBit rows 0 11 9))) = true)
    (h0177 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 10 && rowBit rows 0 11 5 && rowBit rows 0 11 10))) = true)
    (h0178 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 7 && rowBit rows 0 11 6 && rowBit rows 0 11 7))) = true)
    (h0179 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 8 && rowBit rows 0 11 6 && rowBit rows 0 11 8))) = true)
    (h0180 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 9 && rowBit rows 0 11 6 && rowBit rows 0 11 9))) = true)
    (h0181 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 10 && rowBit rows 0 11 6 && rowBit rows 0 11 10))) = true)
    (h0182 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 0 11 7 && rowBit rows 0 11 8))) = true)
    (h0183 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 0 11 7 && rowBit rows 0 11 9))) = true)
    (h0184 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 0 11 7 && rowBit rows 0 11 10))) = true)
    (h0185 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 10 && rowBit rows 0 12 3 && rowBit rows 0 12 10))) = true)
    (h0186 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 7 && rowBit rows 0 12 6 && rowBit rows 0 12 7))) = true)
    (h0187 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 10 && rowBit rows 0 12 6 && rowBit rows 0 12 10))) = true)
    (h0188 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 11 && rowBit rows 0 12 6 && rowBit rows 0 12 11))) = true)
    (h0189 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 0 12 7 && rowBit rows 0 12 10))) = true)
    (h0190 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 11 && rowBit rows 0 12 7 && rowBit rows 0 12 11))) = true)
    (h0191 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 3 && rowBit rows 0 2 0 && rowBit rows 0 2 3))) = true) :
    ∀ item ∈ sourceChunk002Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk002Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0128
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0129
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0130
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0131
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0132
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0133
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0134
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0135
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0136
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0137
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0138
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0139
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0140
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0141
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0142
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0143
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0144
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0145
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0146
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0147
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0148
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0149
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0150
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0151
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0152
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0153
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0154
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0155
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0156
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0157
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0158
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0159
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0160
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0161
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0162
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0163
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0164
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0165
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0166
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0167
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0168
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0169
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0170
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0171
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0172
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0173
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0174
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0175
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0176
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0177
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0178
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0179
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0180
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0181
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0182
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0183
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0184
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0185
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0186
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0187
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0188
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0189
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0190
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0191

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
