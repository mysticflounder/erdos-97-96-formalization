/-
Generated packed-source bridge for verified left chunk 082.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk082_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h5248 : ((!((rankAtom ranks 24 == rankAtom ranks 25)) || ((rankAtom ranks 33).ult (rankAtom ranks 34)))) = true)
    (h5249 : ((!((rankAtom ranks 34 == rankAtom ranks 33)) || ((rankAtom ranks 25).ult (rankAtom ranks 24)))) = true)
    (h5250 : ((!((rankAtom ranks 24 == rankAtom ranks 23)) || ((rankAtom ranks 43).ult (rankAtom ranks 35)))) = true)
    (h5251 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 23).ult (rankAtom ranks 24)))) = true)
    (h5252 : ((!((rankAtom ranks 24 == rankAtom ranks 26)) || ((rankAtom ranks 33).ult (rankAtom ranks 35)))) = true)
    (h5253 : ((!((rankAtom ranks 24 == rankAtom ranks 23)) || ((rankAtom ranks 44).ult (rankAtom ranks 36)))) = true)
    (h5254 : ((!((rankAtom ranks 36 == rankAtom ranks 44)) || ((rankAtom ranks 23).ult (rankAtom ranks 24)))) = true)
    (h5255 : ((!((rankAtom ranks 24 == rankAtom ranks 27)) || ((rankAtom ranks 33).ult (rankAtom ranks 36)))) = true)
    (h5256 : ((!((rankAtom ranks 36 == rankAtom ranks 33)) || ((rankAtom ranks 27).ult (rankAtom ranks 24)))) = true)
    (h5257 : ((!((rankAtom ranks 24 == rankAtom ranks 23)) || ((rankAtom ranks 45).ult (rankAtom ranks 37)))) = true)
    (h5258 : ((!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 45).ult (rankAtom ranks 24)))) = true)
    (h5259 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 23).ult (rankAtom ranks 24)))) = true)
    (h5260 : ((!((rankAtom ranks 24 == rankAtom ranks 33)) || ((rankAtom ranks 28).ult (rankAtom ranks 37)))) = true)
    (h5261 : ((!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 33).ult (rankAtom ranks 24)))) = true)
    (h5262 : ((!((rankAtom ranks 24 == rankAtom ranks 23)) || ((rankAtom ranks 46).ult (rankAtom ranks 38)))) = true)
    (h5263 : ((!((rankAtom ranks 24 == rankAtom ranks 46)) || ((rankAtom ranks 23).ult (rankAtom ranks 38)))) = true)
    (h5264 : ((!((rankAtom ranks 38 == rankAtom ranks 23)) || ((rankAtom ranks 46).ult (rankAtom ranks 24)))) = true)
    (h5265 : ((!((rankAtom ranks 38 == rankAtom ranks 46)) || ((rankAtom ranks 23).ult (rankAtom ranks 24)))) = true)
    (h5266 : ((!((rankAtom ranks 24 == rankAtom ranks 29)) || ((rankAtom ranks 33).ult (rankAtom ranks 38)))) = true)
    (h5267 : ((!((rankAtom ranks 38 == rankAtom ranks 33)) || ((rankAtom ranks 29).ult (rankAtom ranks 24)))) = true)
    (h5268 : ((!((rankAtom ranks 24 == rankAtom ranks 23)) || ((rankAtom ranks 47).ult (rankAtom ranks 39)))) = true)
    (h5269 : ((!((rankAtom ranks 24 == rankAtom ranks 47)) || ((rankAtom ranks 23).ult (rankAtom ranks 39)))) = true)
    (h5270 : ((!((rankAtom ranks 39 == rankAtom ranks 23)) || ((rankAtom ranks 47).ult (rankAtom ranks 24)))) = true)
    (h5271 : ((!((rankAtom ranks 39 == rankAtom ranks 47)) || ((rankAtom ranks 23).ult (rankAtom ranks 24)))) = true)
    (h5272 : ((!((rankAtom ranks 24 == rankAtom ranks 30)) || ((rankAtom ranks 33).ult (rankAtom ranks 39)))) = true)
    (h5273 : ((!((rankAtom ranks 24 == rankAtom ranks 23)) || ((rankAtom ranks 48).ult (rankAtom ranks 40)))) = true)
    (h5274 : ((!((rankAtom ranks 24 == rankAtom ranks 48)) || ((rankAtom ranks 23).ult (rankAtom ranks 40)))) = true)
    (h5275 : ((!((rankAtom ranks 40 == rankAtom ranks 23)) || ((rankAtom ranks 48).ult (rankAtom ranks 24)))) = true)
    (h5276 : ((!((rankAtom ranks 40 == rankAtom ranks 48)) || ((rankAtom ranks 23).ult (rankAtom ranks 24)))) = true)
    (h5277 : ((!((rankAtom ranks 24 == rankAtom ranks 31)) || ((rankAtom ranks 33).ult (rankAtom ranks 40)))) = true)
    (h5278 : ((!((rankAtom ranks 24 == rankAtom ranks 23)) || ((rankAtom ranks 49).ult (rankAtom ranks 41)))) = true)
    (h5279 : ((!((rankAtom ranks 24 == rankAtom ranks 49)) || ((rankAtom ranks 23).ult (rankAtom ranks 41)))) = true)
    (h5280 : ((!((rankAtom ranks 24 == rankAtom ranks 32)) || ((rankAtom ranks 33).ult (rankAtom ranks 41)))) = true)
    (h5281 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 50).ult (rankAtom ranks 35)))) = true)
    (h5282 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 23).ult (rankAtom ranks 25)))) = true)
    (h5283 : ((!((rankAtom ranks 25 == rankAtom ranks 26)) || ((rankAtom ranks 34).ult (rankAtom ranks 35)))) = true)
    (h5284 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 51).ult (rankAtom ranks 36)))) = true)
    (h5285 : ((!((rankAtom ranks 25 == rankAtom ranks 51)) || ((rankAtom ranks 23).ult (rankAtom ranks 36)))) = true)
    (h5286 : ((!((rankAtom ranks 25 == rankAtom ranks 27)) || ((rankAtom ranks 34).ult (rankAtom ranks 36)))) = true)
    (h5287 : ((!((rankAtom ranks 36 == rankAtom ranks 34)) || ((rankAtom ranks 27).ult (rankAtom ranks 25)))) = true)
    (h5288 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 52).ult (rankAtom ranks 37)))) = true)
    (h5289 : ((!((rankAtom ranks 25 == rankAtom ranks 52)) || ((rankAtom ranks 23).ult (rankAtom ranks 37)))) = true)
    (h5290 : ((!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 52).ult (rankAtom ranks 25)))) = true)
    (h5291 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 23).ult (rankAtom ranks 25)))) = true)
    (h5292 : ((!((rankAtom ranks 25 == rankAtom ranks 28)) || ((rankAtom ranks 34).ult (rankAtom ranks 37)))) = true)
    (h5293 : ((!((rankAtom ranks 25 == rankAtom ranks 34)) || ((rankAtom ranks 28).ult (rankAtom ranks 37)))) = true)
    (h5294 : ((!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 34).ult (rankAtom ranks 25)))) = true)
    (h5295 : ((!((rankAtom ranks 37 == rankAtom ranks 34)) || ((rankAtom ranks 28).ult (rankAtom ranks 25)))) = true)
    (h5296 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 53).ult (rankAtom ranks 38)))) = true)
    (h5297 : ((!((rankAtom ranks 25 == rankAtom ranks 53)) || ((rankAtom ranks 23).ult (rankAtom ranks 38)))) = true)
    (h5298 : ((!((rankAtom ranks 25 == rankAtom ranks 29)) || ((rankAtom ranks 34).ult (rankAtom ranks 38)))) = true)
    (h5299 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 54).ult (rankAtom ranks 39)))) = true)
    (h5300 : ((!((rankAtom ranks 25 == rankAtom ranks 54)) || ((rankAtom ranks 23).ult (rankAtom ranks 39)))) = true)
    (h5301 : ((!((rankAtom ranks 25 == rankAtom ranks 30)) || ((rankAtom ranks 34).ult (rankAtom ranks 39)))) = true)
    (h5302 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 55).ult (rankAtom ranks 40)))) = true)
    (h5303 : ((!((rankAtom ranks 25 == rankAtom ranks 55)) || ((rankAtom ranks 23).ult (rankAtom ranks 40)))) = true)
    (h5304 : ((!((rankAtom ranks 40 == rankAtom ranks 55)) || ((rankAtom ranks 23).ult (rankAtom ranks 25)))) = true)
    (h5305 : ((!((rankAtom ranks 25 == rankAtom ranks 31)) || ((rankAtom ranks 34).ult (rankAtom ranks 40)))) = true)
    (h5306 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 56).ult (rankAtom ranks 41)))) = true)
    (h5307 : ((!((rankAtom ranks 25 == rankAtom ranks 56)) || ((rankAtom ranks 23).ult (rankAtom ranks 41)))) = true)
    (h5308 : ((!((rankAtom ranks 25 == rankAtom ranks 32)) || ((rankAtom ranks 34).ult (rankAtom ranks 41)))) = true)
    (h5309 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 57).ult (rankAtom ranks 36)))) = true)
    (h5310 : ((!((rankAtom ranks 26 == rankAtom ranks 57)) || ((rankAtom ranks 23).ult (rankAtom ranks 36)))) = true)
    (h5311 : ((!((rankAtom ranks 26 == rankAtom ranks 27)) || ((rankAtom ranks 35).ult (rankAtom ranks 36)))) = true) :
    ∀ item ∈ sourceChunk082Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk082Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5248
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5249
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5250
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5251
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5252
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5253
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5254
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5255
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5256
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5257
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5258
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5259
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5260
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5261
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5262
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5263
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5264
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5265
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5266
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5267
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5268
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5269
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5270
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5271
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5272
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5273
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5274
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5275
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5276
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5277
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5278
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5279
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5280
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5281
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5282
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5283
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5284
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5285
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5286
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5287
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5288
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5289
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5290
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5291
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5292
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5293
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5294
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5295
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5296
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5297
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5298
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5299
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5300
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5301
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5302
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5303
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5304
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5305
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5306
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5307
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5308
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5309
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5310
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5311

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
