/-
Generated packed-source bridge for verified left chunk 003.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk003_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0192 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 4 && rowBit rows 0 2 0 && rowBit rows 0 2 4))) = true)
    (h0193 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 5 && rowBit rows 0 2 0 && rowBit rows 0 2 5))) = true)
    (h0194 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 6 && rowBit rows 0 2 0 && rowBit rows 0 2 6))) = true)
    (h0195 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 7 && rowBit rows 0 2 0 && rowBit rows 0 2 7))) = true)
    (h0196 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 8 && rowBit rows 0 2 0 && rowBit rows 0 2 8))) = true)
    (h0197 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 9 && rowBit rows 0 2 0 && rowBit rows 0 2 9))) = true)
    (h0198 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 10 && rowBit rows 0 2 0 && rowBit rows 0 2 10))) = true)
    (h0199 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 11 && rowBit rows 0 2 0 && rowBit rows 0 2 11))) = true)
    (h0200 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 12 && rowBit rows 0 2 0 && rowBit rows 0 2 12))) = true)
    (h0201 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 4 && rowBit rows 0 2 3 && rowBit rows 0 2 4))) = true)
    (h0202 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 5 && rowBit rows 0 2 3 && rowBit rows 0 2 5))) = true)
    (h0203 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 6 && rowBit rows 0 2 3 && rowBit rows 0 2 6))) = true)
    (h0204 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 7 && rowBit rows 0 2 3 && rowBit rows 0 2 7))) = true)
    (h0205 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 8 && rowBit rows 0 2 3 && rowBit rows 0 2 8))) = true)
    (h0206 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 9 && rowBit rows 0 2 3 && rowBit rows 0 2 9))) = true)
    (h0207 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 10 && rowBit rows 0 2 3 && rowBit rows 0 2 10))) = true)
    (h0208 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 11 && rowBit rows 0 2 3 && rowBit rows 0 2 11))) = true)
    (h0209 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 12 && rowBit rows 0 2 3 && rowBit rows 0 2 12))) = true)
    (h0210 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 5 && rowBit rows 0 2 4 && rowBit rows 0 2 5))) = true)
    (h0211 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 6 && rowBit rows 0 2 4 && rowBit rows 0 2 6))) = true)
    (h0212 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 7 && rowBit rows 0 2 4 && rowBit rows 0 2 7))) = true)
    (h0213 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 8 && rowBit rows 0 2 4 && rowBit rows 0 2 8))) = true)
    (h0214 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 9 && rowBit rows 0 2 4 && rowBit rows 0 2 9))) = true)
    (h0215 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 10 && rowBit rows 0 2 4 && rowBit rows 0 2 10))) = true)
    (h0216 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 11 && rowBit rows 0 2 4 && rowBit rows 0 2 11))) = true)
    (h0217 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 12 && rowBit rows 0 2 4 && rowBit rows 0 2 12))) = true)
    (h0218 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 8 && rowBit rows 0 2 5 && rowBit rows 0 2 8))) = true)
    (h0219 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 10 && rowBit rows 0 2 6 && rowBit rows 0 2 10))) = true)
    (h0220 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 8 && rowBit rows 0 2 7 && rowBit rows 0 2 8))) = true)
    (h0221 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 10 && rowBit rows 0 2 7 && rowBit rows 0 2 10))) = true)
    (h0222 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 9 && rowBit rows 0 2 8 && rowBit rows 0 2 9))) = true)
    (h0223 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 10 && rowBit rows 0 2 8 && rowBit rows 0 2 10))) = true)
    (h0224 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 11 && rowBit rows 0 2 8 && rowBit rows 0 2 11))) = true)
    (h0225 : (!((rowBit rows 0 1 10 && rowBit rows 0 1 12 && rowBit rows 0 2 10 && rowBit rows 0 2 12))) = true)
    (h0226 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 5 && rowBit rows 0 3 0 && rowBit rows 0 3 5))) = true)
    (h0227 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 6 && rowBit rows 0 3 0 && rowBit rows 0 3 6))) = true)
    (h0228 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 7 && rowBit rows 0 3 0 && rowBit rows 0 3 7))) = true)
    (h0229 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 8 && rowBit rows 0 3 0 && rowBit rows 0 3 8))) = true)
    (h0230 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 10 && rowBit rows 0 3 0 && rowBit rows 0 3 10))) = true)
    (h0231 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 11 && rowBit rows 0 3 0 && rowBit rows 0 3 11))) = true)
    (h0232 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 12 && rowBit rows 0 3 0 && rowBit rows 0 3 12))) = true)
    (h0233 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 5 && rowBit rows 0 3 4 && rowBit rows 0 3 5))) = true)
    (h0234 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 6 && rowBit rows 0 3 4 && rowBit rows 0 3 6))) = true)
    (h0235 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 8 && rowBit rows 0 3 4 && rowBit rows 0 3 8))) = true)
    (h0236 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 10 && rowBit rows 0 3 4 && rowBit rows 0 3 10))) = true)
    (h0237 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 11 && rowBit rows 0 3 4 && rowBit rows 0 3 11))) = true)
    (h0238 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 12 && rowBit rows 0 3 4 && rowBit rows 0 3 12))) = true)
    (h0239 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 8 && rowBit rows 0 3 5 && rowBit rows 0 3 8))) = true)
    (h0240 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 12 && rowBit rows 0 3 5 && rowBit rows 0 3 12))) = true)
    (h0241 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 8 && rowBit rows 0 3 6 && rowBit rows 0 3 8))) = true)
    (h0242 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 9 && rowBit rows 0 3 6 && rowBit rows 0 3 9))) = true)
    (h0243 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 11 && rowBit rows 0 3 6 && rowBit rows 0 3 11))) = true)
    (h0244 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 12 && rowBit rows 0 3 6 && rowBit rows 0 3 12))) = true)
    (h0245 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 9 && rowBit rows 0 3 8 && rowBit rows 0 3 9))) = true)
    (h0246 : (!((rowBit rows 0 1 9 && rowBit rows 0 1 12 && rowBit rows 0 3 9 && rowBit rows 0 3 12))) = true)
    (h0247 : (!((rowBit rows 0 1 10 && rowBit rows 0 1 12 && rowBit rows 0 3 10 && rowBit rows 0 3 12))) = true)
    (h0248 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 5 && rowBit rows 0 4 0 && rowBit rows 0 4 5))) = true)
    (h0249 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 6 && rowBit rows 0 4 0 && rowBit rows 0 4 6))) = true)
    (h0250 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 7 && rowBit rows 0 4 0 && rowBit rows 0 4 7))) = true)
    (h0251 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 8 && rowBit rows 0 4 0 && rowBit rows 0 4 8))) = true)
    (h0252 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 9 && rowBit rows 0 4 0 && rowBit rows 0 4 9))) = true)
    (h0253 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 10 && rowBit rows 0 4 0 && rowBit rows 0 4 10))) = true)
    (h0254 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 11 && rowBit rows 0 4 0 && rowBit rows 0 4 11))) = true)
    (h0255 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 12 && rowBit rows 0 4 0 && rowBit rows 0 4 12))) = true) :
    ∀ item ∈ sourceChunk003Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk003Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0192
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0193
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0194
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0195
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0196
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0197
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0198
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0199
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0200
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0201
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0202
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0203
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0204
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0205
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0206
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0207
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0208
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0209
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0210
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0211
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0212
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0213
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0214
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0215
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0216
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0217
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0218
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0219
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0220
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0221
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0222
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0223
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0224
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0225
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0226
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0227
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0228
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0229
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0230
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0231
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0232
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0233
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0234
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0235
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0236
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0237
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0238
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0239
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0240
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0241
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0242
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0243
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0244
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0245
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0246
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0247
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0248
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0249
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0250
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0251
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0252
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0253
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0254
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0255

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
