/-
Generated packed-source bridge for verified middle chunk 081.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk081_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h5184 : ((!((rankAtom ranks 19 == rankAtom ranks 18)) || ((rankAtom ranks 72).ult (rankAtom ranks 69)))) = true)
    (h5185 : ((!((rankAtom ranks 19 == rankAtom ranks 72)) || ((rankAtom ranks 18).ult (rankAtom ranks 69)))) = true)
    (h5186 : ((!((rankAtom ranks 69 == rankAtom ranks 18)) || ((rankAtom ranks 72).ult (rankAtom ranks 19)))) = true)
    (h5187 : ((!((rankAtom ranks 69 == rankAtom ranks 72)) || ((rankAtom ranks 18).ult (rankAtom ranks 19)))) = true)
    (h5188 : ((!((rankAtom ranks 19 == rankAtom ranks 20)) || ((rankAtom ranks 68).ult (rankAtom ranks 69)))) = true)
    (h5189 : ((!((rankAtom ranks 19 == rankAtom ranks 68)) || ((rankAtom ranks 20).ult (rankAtom ranks 69)))) = true)
    (h5190 : ((!((rankAtom ranks 69 == rankAtom ranks 20)) || ((rankAtom ranks 68).ult (rankAtom ranks 19)))) = true)
    (h5191 : ((!((rankAtom ranks 19 == rankAtom ranks 18)) || ((rankAtom ranks 73).ult (rankAtom ranks 70)))) = true)
    (h5192 : ((!((rankAtom ranks 19 == rankAtom ranks 73)) || ((rankAtom ranks 18).ult (rankAtom ranks 70)))) = true)
    (h5193 : ((!((rankAtom ranks 70 == rankAtom ranks 18)) || ((rankAtom ranks 73).ult (rankAtom ranks 19)))) = true)
    (h5194 : ((!((rankAtom ranks 70 == rankAtom ranks 73)) || ((rankAtom ranks 18).ult (rankAtom ranks 19)))) = true)
    (h5195 : ((!((rankAtom ranks 19 == rankAtom ranks 21)) || ((rankAtom ranks 68).ult (rankAtom ranks 70)))) = true)
    (h5196 : ((!((rankAtom ranks 19 == rankAtom ranks 68)) || ((rankAtom ranks 21).ult (rankAtom ranks 70)))) = true)
    (h5197 : ((!((rankAtom ranks 70 == rankAtom ranks 21)) || ((rankAtom ranks 68).ult (rankAtom ranks 19)))) = true)
    (h5198 : ((!((rankAtom ranks 19 == rankAtom ranks 18)) || ((rankAtom ranks 74).ult (rankAtom ranks 71)))) = true)
    (h5199 : ((!((rankAtom ranks 19 == rankAtom ranks 74)) || ((rankAtom ranks 18).ult (rankAtom ranks 71)))) = true)
    (h5200 : ((!((rankAtom ranks 71 == rankAtom ranks 18)) || ((rankAtom ranks 74).ult (rankAtom ranks 19)))) = true)
    (h5201 : ((!((rankAtom ranks 19 == rankAtom ranks 22)) || ((rankAtom ranks 68).ult (rankAtom ranks 71)))) = true)
    (h5202 : ((!((rankAtom ranks 19 == rankAtom ranks 68)) || ((rankAtom ranks 22).ult (rankAtom ranks 71)))) = true)
    (h5203 : ((!((rankAtom ranks 20 == rankAtom ranks 18)) || ((rankAtom ranks 75).ult (rankAtom ranks 70)))) = true)
    (h5204 : ((!((rankAtom ranks 20 == rankAtom ranks 75)) || ((rankAtom ranks 18).ult (rankAtom ranks 70)))) = true)
    (h5205 : ((!((rankAtom ranks 70 == rankAtom ranks 18)) || ((rankAtom ranks 75).ult (rankAtom ranks 20)))) = true)
    (h5206 : ((!((rankAtom ranks 70 == rankAtom ranks 75)) || ((rankAtom ranks 18).ult (rankAtom ranks 20)))) = true)
    (h5207 : ((!((rankAtom ranks 20 == rankAtom ranks 21)) || ((rankAtom ranks 69).ult (rankAtom ranks 70)))) = true)
    (h5208 : ((!((rankAtom ranks 20 == rankAtom ranks 69)) || ((rankAtom ranks 21).ult (rankAtom ranks 70)))) = true)
    (h5209 : ((!((rankAtom ranks 70 == rankAtom ranks 21)) || ((rankAtom ranks 69).ult (rankAtom ranks 20)))) = true)
    (h5210 : ((!((rankAtom ranks 20 == rankAtom ranks 18)) || ((rankAtom ranks 76).ult (rankAtom ranks 71)))) = true)
    (h5211 : ((!((rankAtom ranks 20 == rankAtom ranks 76)) || ((rankAtom ranks 18).ult (rankAtom ranks 71)))) = true)
    (h5212 : ((!((rankAtom ranks 71 == rankAtom ranks 18)) || ((rankAtom ranks 76).ult (rankAtom ranks 20)))) = true)
    (h5213 : ((!((rankAtom ranks 20 == rankAtom ranks 22)) || ((rankAtom ranks 69).ult (rankAtom ranks 71)))) = true)
    (h5214 : ((!((rankAtom ranks 20 == rankAtom ranks 69)) || ((rankAtom ranks 22).ult (rankAtom ranks 71)))) = true)
    (h5215 : ((!((rankAtom ranks 21 == rankAtom ranks 18)) || ((rankAtom ranks 77).ult (rankAtom ranks 71)))) = true)
    (h5216 : ((!((rankAtom ranks 21 == rankAtom ranks 77)) || ((rankAtom ranks 18).ult (rankAtom ranks 71)))) = true)
    (h5217 : ((!((rankAtom ranks 71 == rankAtom ranks 18)) || ((rankAtom ranks 77).ult (rankAtom ranks 21)))) = true)
    (h5218 : ((!((rankAtom ranks 21 == rankAtom ranks 22)) || ((rankAtom ranks 70).ult (rankAtom ranks 71)))) = true)
    (h5219 : ((!((rankAtom ranks 21 == rankAtom ranks 70)) || ((rankAtom ranks 22).ult (rankAtom ranks 71)))) = true)
    (h5220 : ((!((rankAtom ranks 20 == rankAtom ranks 19)) || ((rankAtom ranks 75).ult (rankAtom ranks 73)))) = true)
    (h5221 : ((!((rankAtom ranks 20 == rankAtom ranks 75)) || ((rankAtom ranks 19).ult (rankAtom ranks 73)))) = true)
    (h5222 : ((!((rankAtom ranks 73 == rankAtom ranks 19)) || ((rankAtom ranks 75).ult (rankAtom ranks 20)))) = true)
    (h5223 : ((!((rankAtom ranks 73 == rankAtom ranks 75)) || ((rankAtom ranks 19).ult (rankAtom ranks 20)))) = true)
    (h5224 : ((!((rankAtom ranks 20 == rankAtom ranks 21)) || ((rankAtom ranks 72).ult (rankAtom ranks 73)))) = true)
    (h5225 : ((!((rankAtom ranks 20 == rankAtom ranks 72)) || ((rankAtom ranks 21).ult (rankAtom ranks 73)))) = true)
    (h5226 : ((!((rankAtom ranks 73 == rankAtom ranks 21)) || ((rankAtom ranks 72).ult (rankAtom ranks 20)))) = true)
    (h5227 : ((!((rankAtom ranks 73 == rankAtom ranks 72)) || ((rankAtom ranks 21).ult (rankAtom ranks 20)))) = true)
    (h5228 : ((!((rankAtom ranks 20 == rankAtom ranks 19)) || ((rankAtom ranks 76).ult (rankAtom ranks 74)))) = true)
    (h5229 : ((!((rankAtom ranks 20 == rankAtom ranks 76)) || ((rankAtom ranks 19).ult (rankAtom ranks 74)))) = true)
    (h5230 : ((!((rankAtom ranks 74 == rankAtom ranks 19)) || ((rankAtom ranks 76).ult (rankAtom ranks 20)))) = true)
    (h5231 : ((!((rankAtom ranks 20 == rankAtom ranks 22)) || ((rankAtom ranks 72).ult (rankAtom ranks 74)))) = true)
    (h5232 : ((!((rankAtom ranks 20 == rankAtom ranks 72)) || ((rankAtom ranks 22).ult (rankAtom ranks 74)))) = true)
    (h5233 : ((!((rankAtom ranks 74 == rankAtom ranks 72)) || ((rankAtom ranks 22).ult (rankAtom ranks 20)))) = true)
    (h5234 : ((!((rankAtom ranks 21 == rankAtom ranks 19)) || ((rankAtom ranks 77).ult (rankAtom ranks 74)))) = true)
    (h5235 : ((!((rankAtom ranks 21 == rankAtom ranks 77)) || ((rankAtom ranks 19).ult (rankAtom ranks 74)))) = true)
    (h5236 : ((!((rankAtom ranks 74 == rankAtom ranks 19)) || ((rankAtom ranks 77).ult (rankAtom ranks 21)))) = true)
    (h5237 : ((!((rankAtom ranks 21 == rankAtom ranks 22)) || ((rankAtom ranks 73).ult (rankAtom ranks 74)))) = true)
    (h5238 : ((!((rankAtom ranks 21 == rankAtom ranks 73)) || ((rankAtom ranks 22).ult (rankAtom ranks 74)))) = true)
    (h5239 : ((!((rankAtom ranks 74 == rankAtom ranks 73)) || ((rankAtom ranks 22).ult (rankAtom ranks 21)))) = true)
    (h5240 : ((!((rankAtom ranks 21 == rankAtom ranks 20)) || ((rankAtom ranks 77).ult (rankAtom ranks 76)))) = true)
    (h5241 : ((!((rankAtom ranks 21 == rankAtom ranks 77)) || ((rankAtom ranks 20).ult (rankAtom ranks 76)))) = true)
    (h5242 : ((!((rankAtom ranks 76 == rankAtom ranks 20)) || ((rankAtom ranks 77).ult (rankAtom ranks 21)))) = true)
    (h5243 : ((!((rankAtom ranks 21 == rankAtom ranks 22)) || ((rankAtom ranks 75).ult (rankAtom ranks 76)))) = true)
    (h5244 : ((!((rankAtom ranks 21 == rankAtom ranks 75)) || ((rankAtom ranks 22).ult (rankAtom ranks 76)))) = true)
    (h5245 : ((!((rankAtom ranks 76 == rankAtom ranks 75)) || ((rankAtom ranks 22).ult (rankAtom ranks 21)))) = true)
    (h5246 : ((!((rankAtom ranks 24 == rankAtom ranks 23)) || ((rankAtom ranks 42).ult (rankAtom ranks 34)))) = true)
    (h5247 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 23).ult (rankAtom ranks 24)))) = true) :
    ∀ item ∈ sourceChunk081Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk081Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5184
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5185
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5186
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5187
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5188
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5189
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5190
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5191
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5192
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5193
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5194
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5195
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5196
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5197
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5198
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5199
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5200
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5201
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5202
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5203
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5204
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5205
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5206
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5207
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5208
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5209
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5210
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5211
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5212
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5213
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5214
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5215
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5216
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5217
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5218
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5219
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5220
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5221
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5222
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5223
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5224
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5225
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5226
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5227
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5228
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5229
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5230
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5231
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5232
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5233
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5234
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5235
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5236
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5237
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5238
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5239
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5240
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5241
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5242
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5243
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5244
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5245
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5246
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5247

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
