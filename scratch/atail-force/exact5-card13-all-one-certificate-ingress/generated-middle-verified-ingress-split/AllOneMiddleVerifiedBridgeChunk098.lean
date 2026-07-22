/-
Generated packed-source bridge for verified middle chunk 098.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk098_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h6272 : ((!((rankAtom ranks 59 == rankAtom ranks 38)) || ((rankAtom ranks 57).ult (rankAtom ranks 36)))) = true)
    (h6273 : ((!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 38).ult (rankAtom ranks 36)))) = true)
    (h6274 : ((!((rankAtom ranks 36 == rankAtom ranks 35)) || ((rankAtom ranks 65).ult (rankAtom ranks 60)))) = true)
    (h6275 : ((!((rankAtom ranks 60 == rankAtom ranks 35)) || ((rankAtom ranks 65).ult (rankAtom ranks 36)))) = true)
    (h6276 : ((!((rankAtom ranks 60 == rankAtom ranks 65)) || ((rankAtom ranks 35).ult (rankAtom ranks 36)))) = true)
    (h6277 : ((!((rankAtom ranks 60 == rankAtom ranks 39)) || ((rankAtom ranks 57).ult (rankAtom ranks 36)))) = true)
    (h6278 : ((!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 39).ult (rankAtom ranks 36)))) = true)
    (h6279 : ((!((rankAtom ranks 36 == rankAtom ranks 35)) || ((rankAtom ranks 66).ult (rankAtom ranks 61)))) = true)
    (h6280 : ((!((rankAtom ranks 61 == rankAtom ranks 35)) || ((rankAtom ranks 66).ult (rankAtom ranks 36)))) = true)
    (h6281 : ((!((rankAtom ranks 61 == rankAtom ranks 66)) || ((rankAtom ranks 35).ult (rankAtom ranks 36)))) = true)
    (h6282 : ((!((rankAtom ranks 36 == rankAtom ranks 40)) || ((rankAtom ranks 57).ult (rankAtom ranks 61)))) = true)
    (h6283 : ((!((rankAtom ranks 61 == rankAtom ranks 40)) || ((rankAtom ranks 57).ult (rankAtom ranks 36)))) = true)
    (h6284 : ((!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 40).ult (rankAtom ranks 36)))) = true)
    (h6285 : ((!((rankAtom ranks 36 == rankAtom ranks 35)) || ((rankAtom ranks 67).ult (rankAtom ranks 62)))) = true)
    (h6286 : ((!((rankAtom ranks 62 == rankAtom ranks 35)) || ((rankAtom ranks 67).ult (rankAtom ranks 36)))) = true)
    (h6287 : ((!((rankAtom ranks 62 == rankAtom ranks 57)) || ((rankAtom ranks 41).ult (rankAtom ranks 36)))) = true)
    (h6288 : ((!((rankAtom ranks 37 == rankAtom ranks 35)) || ((rankAtom ranks 68).ult (rankAtom ranks 59)))) = true)
    (h6289 : ((!((rankAtom ranks 37 == rankAtom ranks 68)) || ((rankAtom ranks 35).ult (rankAtom ranks 59)))) = true)
    (h6290 : ((!((rankAtom ranks 59 == rankAtom ranks 35)) || ((rankAtom ranks 68).ult (rankAtom ranks 37)))) = true)
    (h6291 : ((!((rankAtom ranks 59 == rankAtom ranks 68)) || ((rankAtom ranks 35).ult (rankAtom ranks 37)))) = true)
    (h6292 : ((!((rankAtom ranks 37 == rankAtom ranks 38)) || ((rankAtom ranks 58).ult (rankAtom ranks 59)))) = true)
    (h6293 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 38).ult (rankAtom ranks 59)))) = true)
    (h6294 : ((!((rankAtom ranks 59 == rankAtom ranks 38)) || ((rankAtom ranks 58).ult (rankAtom ranks 37)))) = true)
    (h6295 : ((!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 38).ult (rankAtom ranks 37)))) = true)
    (h6296 : ((!((rankAtom ranks 37 == rankAtom ranks 35)) || ((rankAtom ranks 69).ult (rankAtom ranks 60)))) = true)
    (h6297 : ((!((rankAtom ranks 37 == rankAtom ranks 69)) || ((rankAtom ranks 35).ult (rankAtom ranks 60)))) = true)
    (h6298 : ((!((rankAtom ranks 60 == rankAtom ranks 35)) || ((rankAtom ranks 69).ult (rankAtom ranks 37)))) = true)
    (h6299 : ((!((rankAtom ranks 60 == rankAtom ranks 69)) || ((rankAtom ranks 35).ult (rankAtom ranks 37)))) = true)
    (h6300 : ((!((rankAtom ranks 37 == rankAtom ranks 39)) || ((rankAtom ranks 58).ult (rankAtom ranks 60)))) = true)
    (h6301 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 39).ult (rankAtom ranks 60)))) = true)
    (h6302 : ((!((rankAtom ranks 60 == rankAtom ranks 39)) || ((rankAtom ranks 58).ult (rankAtom ranks 37)))) = true)
    (h6303 : ((!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 39).ult (rankAtom ranks 37)))) = true)
    (h6304 : ((!((rankAtom ranks 37 == rankAtom ranks 35)) || ((rankAtom ranks 70).ult (rankAtom ranks 61)))) = true)
    (h6305 : ((!((rankAtom ranks 37 == rankAtom ranks 70)) || ((rankAtom ranks 35).ult (rankAtom ranks 61)))) = true)
    (h6306 : ((!((rankAtom ranks 61 == rankAtom ranks 35)) || ((rankAtom ranks 70).ult (rankAtom ranks 37)))) = true)
    (h6307 : ((!((rankAtom ranks 61 == rankAtom ranks 70)) || ((rankAtom ranks 35).ult (rankAtom ranks 37)))) = true)
    (h6308 : ((!((rankAtom ranks 37 == rankAtom ranks 40)) || ((rankAtom ranks 58).ult (rankAtom ranks 61)))) = true)
    (h6309 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 40).ult (rankAtom ranks 61)))) = true)
    (h6310 : ((!((rankAtom ranks 61 == rankAtom ranks 40)) || ((rankAtom ranks 58).ult (rankAtom ranks 37)))) = true)
    (h6311 : ((!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 40).ult (rankAtom ranks 37)))) = true)
    (h6312 : ((!((rankAtom ranks 37 == rankAtom ranks 35)) || ((rankAtom ranks 71).ult (rankAtom ranks 62)))) = true)
    (h6313 : ((!((rankAtom ranks 37 == rankAtom ranks 71)) || ((rankAtom ranks 35).ult (rankAtom ranks 62)))) = true)
    (h6314 : ((!((rankAtom ranks 62 == rankAtom ranks 35)) || ((rankAtom ranks 71).ult (rankAtom ranks 37)))) = true)
    (h6315 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 41).ult (rankAtom ranks 62)))) = true)
    (h6316 : ((!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 41).ult (rankAtom ranks 37)))) = true)
    (h6317 : ((!((rankAtom ranks 38 == rankAtom ranks 35)) || ((rankAtom ranks 72).ult (rankAtom ranks 60)))) = true)
    (h6318 : ((!((rankAtom ranks 38 == rankAtom ranks 72)) || ((rankAtom ranks 35).ult (rankAtom ranks 60)))) = true)
    (h6319 : ((!((rankAtom ranks 60 == rankAtom ranks 35)) || ((rankAtom ranks 72).ult (rankAtom ranks 38)))) = true)
    (h6320 : ((!((rankAtom ranks 60 == rankAtom ranks 72)) || ((rankAtom ranks 35).ult (rankAtom ranks 38)))) = true)
    (h6321 : ((!((rankAtom ranks 38 == rankAtom ranks 59)) || ((rankAtom ranks 39).ult (rankAtom ranks 60)))) = true)
    (h6322 : ((!((rankAtom ranks 60 == rankAtom ranks 39)) || ((rankAtom ranks 59).ult (rankAtom ranks 38)))) = true)
    (h6323 : ((!((rankAtom ranks 60 == rankAtom ranks 59)) || ((rankAtom ranks 39).ult (rankAtom ranks 38)))) = true)
    (h6324 : ((!((rankAtom ranks 38 == rankAtom ranks 35)) || ((rankAtom ranks 73).ult (rankAtom ranks 61)))) = true)
    (h6325 : ((!((rankAtom ranks 38 == rankAtom ranks 73)) || ((rankAtom ranks 35).ult (rankAtom ranks 61)))) = true)
    (h6326 : ((!((rankAtom ranks 61 == rankAtom ranks 35)) || ((rankAtom ranks 73).ult (rankAtom ranks 38)))) = true)
    (h6327 : ((!((rankAtom ranks 61 == rankAtom ranks 73)) || ((rankAtom ranks 35).ult (rankAtom ranks 38)))) = true)
    (h6328 : ((!((rankAtom ranks 38 == rankAtom ranks 40)) || ((rankAtom ranks 59).ult (rankAtom ranks 61)))) = true)
    (h6329 : ((!((rankAtom ranks 38 == rankAtom ranks 59)) || ((rankAtom ranks 40).ult (rankAtom ranks 61)))) = true)
    (h6330 : ((!((rankAtom ranks 61 == rankAtom ranks 40)) || ((rankAtom ranks 59).ult (rankAtom ranks 38)))) = true)
    (h6331 : ((!((rankAtom ranks 61 == rankAtom ranks 59)) || ((rankAtom ranks 40).ult (rankAtom ranks 38)))) = true)
    (h6332 : ((!((rankAtom ranks 38 == rankAtom ranks 35)) || ((rankAtom ranks 74).ult (rankAtom ranks 62)))) = true)
    (h6333 : ((!((rankAtom ranks 38 == rankAtom ranks 74)) || ((rankAtom ranks 35).ult (rankAtom ranks 62)))) = true)
    (h6334 : ((!((rankAtom ranks 62 == rankAtom ranks 35)) || ((rankAtom ranks 74).ult (rankAtom ranks 38)))) = true)
    (h6335 : ((!((rankAtom ranks 38 == rankAtom ranks 41)) || ((rankAtom ranks 59).ult (rankAtom ranks 62)))) = true) :
    ∀ item ∈ sourceChunk098Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk098Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6272
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6273
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6274
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6275
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6276
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6277
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6278
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6279
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6280
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6281
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6282
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6283
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6284
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6285
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6286
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6287
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6288
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6289
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6290
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6291
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6292
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6293
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6294
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6295
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6296
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6297
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6298
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6299
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6300
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6301
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6302
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6303
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6304
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6305
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6306
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6307
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6308
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6309
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6310
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6311
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6312
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6313
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6314
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6315
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6316
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6317
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6318
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6319
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6320
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6321
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6322
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6323
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6324
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6325
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6326
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6327
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6328
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6329
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6330
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6331
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6332
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6333
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6334
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6335

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
