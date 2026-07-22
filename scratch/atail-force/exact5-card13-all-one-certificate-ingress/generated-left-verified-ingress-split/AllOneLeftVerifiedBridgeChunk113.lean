/-
Generated packed-source bridge for verified left chunk 113.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk113_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h7232 : ((!((rankAtom ranks 69 == rankAtom ranks 75)) || ((rankAtom ranks 68).ult (rankAtom ranks 73)))) = true)
    (h7233 : ((!((rankAtom ranks 73 == rankAtom ranks 68)) || ((rankAtom ranks 75).ult (rankAtom ranks 69)))) = true)
    (h7234 : ((!((rankAtom ranks 73 == rankAtom ranks 75)) || ((rankAtom ranks 68).ult (rankAtom ranks 69)))) = true)
    (h7235 : ((!((rankAtom ranks 69 == rankAtom ranks 72)) || ((rankAtom ranks 70).ult (rankAtom ranks 73)))) = true)
    (h7236 : ((!((rankAtom ranks 73 == rankAtom ranks 70)) || ((rankAtom ranks 72).ult (rankAtom ranks 69)))) = true)
    (h7237 : ((!((rankAtom ranks 73 == rankAtom ranks 72)) || ((rankAtom ranks 70).ult (rankAtom ranks 69)))) = true)
    (h7238 : ((!((rankAtom ranks 69 == rankAtom ranks 76)) || ((rankAtom ranks 68).ult (rankAtom ranks 74)))) = true)
    (h7239 : ((!((rankAtom ranks 74 == rankAtom ranks 68)) || ((rankAtom ranks 76).ult (rankAtom ranks 69)))) = true)
    (h7240 : ((!((rankAtom ranks 69 == rankAtom ranks 72)) || ((rankAtom ranks 71).ult (rankAtom ranks 74)))) = true)
    (h7241 : ((!((rankAtom ranks 74 == rankAtom ranks 72)) || ((rankAtom ranks 71).ult (rankAtom ranks 69)))) = true)
    (h7242 : ((!((rankAtom ranks 70 == rankAtom ranks 77)) || ((rankAtom ranks 68).ult (rankAtom ranks 74)))) = true)
    (h7243 : ((!((rankAtom ranks 74 == rankAtom ranks 68)) || ((rankAtom ranks 77).ult (rankAtom ranks 70)))) = true)
    (h7244 : ((!((rankAtom ranks 70 == rankAtom ranks 73)) || ((rankAtom ranks 71).ult (rankAtom ranks 74)))) = true)
    (h7245 : ((!((rankAtom ranks 74 == rankAtom ranks 73)) || ((rankAtom ranks 71).ult (rankAtom ranks 70)))) = true)
    (h7246 : ((!((rankAtom ranks 70 == rankAtom ranks 77)) || ((rankAtom ranks 69).ult (rankAtom ranks 76)))) = true)
    (h7247 : ((!((rankAtom ranks 76 == rankAtom ranks 69)) || ((rankAtom ranks 77).ult (rankAtom ranks 70)))) = true)
    (h7248 : ((!((rankAtom ranks 70 == rankAtom ranks 75)) || ((rankAtom ranks 71).ult (rankAtom ranks 76)))) = true)
    (h7249 : ((!((rankAtom ranks 76 == rankAtom ranks 75)) || ((rankAtom ranks 71).ult (rankAtom ranks 70)))) = true)
    (h7250 : ((!((rankAtom ranks 73 == rankAtom ranks 72)) || ((rankAtom ranks 77).ult (rankAtom ranks 76)))) = true)
    (h7251 : ((!((rankAtom ranks 73 == rankAtom ranks 77)) || ((rankAtom ranks 72).ult (rankAtom ranks 76)))) = true)
    (h7252 : ((!((rankAtom ranks 76 == rankAtom ranks 72)) || ((rankAtom ranks 77).ult (rankAtom ranks 73)))) = true)
    (h7253 : ((!((rankAtom ranks 73 == rankAtom ranks 74)) || ((rankAtom ranks 75).ult (rankAtom ranks 76)))) = true)
    (h7254 : ((!((rankAtom ranks 73 == rankAtom ranks 75)) || ((rankAtom ranks 74).ult (rankAtom ranks 76)))) = true)
    (h7255 : ((!((rankAtom ranks 76 == rankAtom ranks 75)) || ((rankAtom ranks 74).ult (rankAtom ranks 73)))) = true) :
    ∀ item ∈ sourceChunk113Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk113Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7232
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7233
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7234
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7235
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7236
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7237
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7238
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7239
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7240
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7241
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7242
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7243
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7244
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7245
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7246
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7247
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7248
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7249
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7250
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7251
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7252
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7253
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7254
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7255

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
