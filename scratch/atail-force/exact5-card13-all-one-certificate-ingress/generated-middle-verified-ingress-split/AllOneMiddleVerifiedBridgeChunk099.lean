/-
Generated packed-source bridge for verified middle chunk 099.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk099_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h6336 : ((!((rankAtom ranks 38 == rankAtom ranks 59)) || ((rankAtom ranks 41).ult (rankAtom ranks 62)))) = true)
    (h6337 : ((!((rankAtom ranks 62 == rankAtom ranks 59)) || ((rankAtom ranks 41).ult (rankAtom ranks 38)))) = true)
    (h6338 : ((!((rankAtom ranks 39 == rankAtom ranks 75)) || ((rankAtom ranks 35).ult (rankAtom ranks 61)))) = true)
    (h6339 : ((!((rankAtom ranks 61 == rankAtom ranks 35)) || ((rankAtom ranks 75).ult (rankAtom ranks 39)))) = true)
    (h6340 : ((!((rankAtom ranks 61 == rankAtom ranks 75)) || ((rankAtom ranks 35).ult (rankAtom ranks 39)))) = true)
    (h6341 : ((!((rankAtom ranks 39 == rankAtom ranks 40)) || ((rankAtom ranks 60).ult (rankAtom ranks 61)))) = true)
    (h6342 : ((!((rankAtom ranks 39 == rankAtom ranks 60)) || ((rankAtom ranks 40).ult (rankAtom ranks 61)))) = true)
    (h6343 : ((!((rankAtom ranks 61 == rankAtom ranks 40)) || ((rankAtom ranks 60).ult (rankAtom ranks 39)))) = true)
    (h6344 : ((!((rankAtom ranks 61 == rankAtom ranks 60)) || ((rankAtom ranks 40).ult (rankAtom ranks 39)))) = true)
    (h6345 : ((!((rankAtom ranks 39 == rankAtom ranks 76)) || ((rankAtom ranks 35).ult (rankAtom ranks 62)))) = true)
    (h6346 : ((!((rankAtom ranks 62 == rankAtom ranks 35)) || ((rankAtom ranks 76).ult (rankAtom ranks 39)))) = true)
    (h6347 : ((!((rankAtom ranks 39 == rankAtom ranks 41)) || ((rankAtom ranks 60).ult (rankAtom ranks 62)))) = true)
    (h6348 : ((!((rankAtom ranks 39 == rankAtom ranks 60)) || ((rankAtom ranks 41).ult (rankAtom ranks 62)))) = true)
    (h6349 : ((!((rankAtom ranks 62 == rankAtom ranks 60)) || ((rankAtom ranks 41).ult (rankAtom ranks 39)))) = true)
    (h6350 : ((!((rankAtom ranks 40 == rankAtom ranks 77)) || ((rankAtom ranks 35).ult (rankAtom ranks 62)))) = true)
    (h6351 : ((!((rankAtom ranks 40 == rankAtom ranks 41)) || ((rankAtom ranks 61).ult (rankAtom ranks 62)))) = true)
    (h6352 : ((!((rankAtom ranks 40 == rankAtom ranks 61)) || ((rankAtom ranks 41).ult (rankAtom ranks 62)))) = true)
    (h6353 : ((!((rankAtom ranks 62 == rankAtom ranks 61)) || ((rankAtom ranks 41).ult (rankAtom ranks 40)))) = true)
    (h6354 : ((!((rankAtom ranks 37 == rankAtom ranks 36)) || ((rankAtom ranks 68).ult (rankAtom ranks 64)))) = true)
    (h6355 : ((!((rankAtom ranks 37 == rankAtom ranks 68)) || ((rankAtom ranks 36).ult (rankAtom ranks 64)))) = true)
    (h6356 : ((!((rankAtom ranks 64 == rankAtom ranks 36)) || ((rankAtom ranks 68).ult (rankAtom ranks 37)))) = true)
    (h6357 : ((!((rankAtom ranks 64 == rankAtom ranks 68)) || ((rankAtom ranks 36).ult (rankAtom ranks 37)))) = true)
    (h6358 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 38).ult (rankAtom ranks 64)))) = true)
    (h6359 : ((!((rankAtom ranks 64 == rankAtom ranks 38)) || ((rankAtom ranks 63).ult (rankAtom ranks 37)))) = true)
    (h6360 : ((!((rankAtom ranks 37 == rankAtom ranks 36)) || ((rankAtom ranks 69).ult (rankAtom ranks 65)))) = true)
    (h6361 : ((!((rankAtom ranks 37 == rankAtom ranks 69)) || ((rankAtom ranks 36).ult (rankAtom ranks 65)))) = true)
    (h6362 : ((!((rankAtom ranks 65 == rankAtom ranks 69)) || ((rankAtom ranks 36).ult (rankAtom ranks 37)))) = true)
    (h6363 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 39).ult (rankAtom ranks 65)))) = true)
    (h6364 : ((!((rankAtom ranks 37 == rankAtom ranks 36)) || ((rankAtom ranks 70).ult (rankAtom ranks 66)))) = true)
    (h6365 : ((!((rankAtom ranks 37 == rankAtom ranks 70)) || ((rankAtom ranks 36).ult (rankAtom ranks 66)))) = true)
    (h6366 : ((!((rankAtom ranks 66 == rankAtom ranks 36)) || ((rankAtom ranks 70).ult (rankAtom ranks 37)))) = true)
    (h6367 : ((!((rankAtom ranks 66 == rankAtom ranks 70)) || ((rankAtom ranks 36).ult (rankAtom ranks 37)))) = true)
    (h6368 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 40).ult (rankAtom ranks 66)))) = true)
    (h6369 : ((!((rankAtom ranks 37 == rankAtom ranks 36)) || ((rankAtom ranks 71).ult (rankAtom ranks 67)))) = true)
    (h6370 : ((!((rankAtom ranks 37 == rankAtom ranks 71)) || ((rankAtom ranks 36).ult (rankAtom ranks 67)))) = true)
    (h6371 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 41).ult (rankAtom ranks 67)))) = true)
    (h6372 : ((!((rankAtom ranks 38 == rankAtom ranks 36)) || ((rankAtom ranks 72).ult (rankAtom ranks 65)))) = true)
    (h6373 : ((!((rankAtom ranks 38 == rankAtom ranks 72)) || ((rankAtom ranks 36).ult (rankAtom ranks 65)))) = true)
    (h6374 : ((!((rankAtom ranks 65 == rankAtom ranks 72)) || ((rankAtom ranks 36).ult (rankAtom ranks 38)))) = true)
    (h6375 : ((!((rankAtom ranks 38 == rankAtom ranks 64)) || ((rankAtom ranks 39).ult (rankAtom ranks 65)))) = true)
    (h6376 : ((!((rankAtom ranks 65 == rankAtom ranks 39)) || ((rankAtom ranks 64).ult (rankAtom ranks 38)))) = true)
    (h6377 : ((!((rankAtom ranks 65 == rankAtom ranks 64)) || ((rankAtom ranks 39).ult (rankAtom ranks 38)))) = true)
    (h6378 : ((!((rankAtom ranks 38 == rankAtom ranks 73)) || ((rankAtom ranks 36).ult (rankAtom ranks 66)))) = true)
    (h6379 : ((!((rankAtom ranks 66 == rankAtom ranks 73)) || ((rankAtom ranks 36).ult (rankAtom ranks 38)))) = true)
    (h6380 : ((!((rankAtom ranks 38 == rankAtom ranks 40)) || ((rankAtom ranks 64).ult (rankAtom ranks 66)))) = true)
    (h6381 : ((!((rankAtom ranks 38 == rankAtom ranks 64)) || ((rankAtom ranks 40).ult (rankAtom ranks 66)))) = true)
    (h6382 : ((!((rankAtom ranks 66 == rankAtom ranks 40)) || ((rankAtom ranks 64).ult (rankAtom ranks 38)))) = true)
    (h6383 : ((!((rankAtom ranks 38 == rankAtom ranks 74)) || ((rankAtom ranks 36).ult (rankAtom ranks 67)))) = true)
    (h6384 : ((!((rankAtom ranks 38 == rankAtom ranks 41)) || ((rankAtom ranks 64).ult (rankAtom ranks 67)))) = true)
    (h6385 : ((!((rankAtom ranks 38 == rankAtom ranks 64)) || ((rankAtom ranks 41).ult (rankAtom ranks 67)))) = true)
    (h6386 : ((!((rankAtom ranks 39 == rankAtom ranks 36)) || ((rankAtom ranks 75).ult (rankAtom ranks 66)))) = true)
    (h6387 : ((!((rankAtom ranks 39 == rankAtom ranks 75)) || ((rankAtom ranks 36).ult (rankAtom ranks 66)))) = true)
    (h6388 : ((!((rankAtom ranks 66 == rankAtom ranks 75)) || ((rankAtom ranks 36).ult (rankAtom ranks 39)))) = true)
    (h6389 : ((!((rankAtom ranks 39 == rankAtom ranks 40)) || ((rankAtom ranks 65).ult (rankAtom ranks 66)))) = true)
    (h6390 : ((!((rankAtom ranks 39 == rankAtom ranks 65)) || ((rankAtom ranks 40).ult (rankAtom ranks 66)))) = true)
    (h6391 : ((!((rankAtom ranks 66 == rankAtom ranks 40)) || ((rankAtom ranks 65).ult (rankAtom ranks 39)))) = true)
    (h6392 : ((!((rankAtom ranks 66 == rankAtom ranks 65)) || ((rankAtom ranks 40).ult (rankAtom ranks 39)))) = true)
    (h6393 : ((!((rankAtom ranks 39 == rankAtom ranks 76)) || ((rankAtom ranks 36).ult (rankAtom ranks 67)))) = true)
    (h6394 : ((!((rankAtom ranks 39 == rankAtom ranks 65)) || ((rankAtom ranks 41).ult (rankAtom ranks 67)))) = true)
    (h6395 : ((!((rankAtom ranks 67 == rankAtom ranks 65)) || ((rankAtom ranks 41).ult (rankAtom ranks 39)))) = true)
    (h6396 : ((!((rankAtom ranks 40 == rankAtom ranks 77)) || ((rankAtom ranks 36).ult (rankAtom ranks 67)))) = true)
    (h6397 : ((!((rankAtom ranks 40 == rankAtom ranks 41)) || ((rankAtom ranks 66).ult (rankAtom ranks 67)))) = true)
    (h6398 : ((!((rankAtom ranks 40 == rankAtom ranks 66)) || ((rankAtom ranks 41).ult (rankAtom ranks 67)))) = true)
    (h6399 : ((!((rankAtom ranks 67 == rankAtom ranks 41)) || ((rankAtom ranks 66).ult (rankAtom ranks 40)))) = true) :
    ∀ item ∈ sourceChunk099Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk099Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6336
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6337
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6338
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6339
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6340
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6341
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6342
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6343
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6344
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6345
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6346
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6347
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6348
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6349
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6350
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6351
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6352
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6353
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6354
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6355
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6356
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6357
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6358
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6359
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6360
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6361
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6362
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6363
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6364
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6365
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6366
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6367
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6368
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6369
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6370
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6371
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6372
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6373
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6374
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6375
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6376
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6377
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6378
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6379
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6380
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6381
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6382
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6383
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6384
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6385
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6386
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6387
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6388
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6389
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6390
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6391
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6392
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6393
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6394
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6395
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6396
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6397
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6398
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6399

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
