/-
Generated packed-source bridge for verified left chunk 083.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk083_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h5312 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 58).ult (rankAtom ranks 37)))) = true)
    (h5313 : ((!((rankAtom ranks 26 == rankAtom ranks 58)) || ((rankAtom ranks 23).ult (rankAtom ranks 37)))) = true)
    (h5314 : ((!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 58).ult (rankAtom ranks 26)))) = true)
    (h5315 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 23).ult (rankAtom ranks 26)))) = true)
    (h5316 : ((!((rankAtom ranks 26 == rankAtom ranks 28)) || ((rankAtom ranks 35).ult (rankAtom ranks 37)))) = true)
    (h5317 : ((!((rankAtom ranks 26 == rankAtom ranks 35)) || ((rankAtom ranks 28).ult (rankAtom ranks 37)))) = true)
    (h5318 : ((!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 35).ult (rankAtom ranks 26)))) = true)
    (h5319 : ((!((rankAtom ranks 37 == rankAtom ranks 35)) || ((rankAtom ranks 28).ult (rankAtom ranks 26)))) = true)
    (h5320 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 59).ult (rankAtom ranks 38)))) = true)
    (h5321 : ((!((rankAtom ranks 26 == rankAtom ranks 59)) || ((rankAtom ranks 23).ult (rankAtom ranks 38)))) = true)
    (h5322 : ((!((rankAtom ranks 26 == rankAtom ranks 29)) || ((rankAtom ranks 35).ult (rankAtom ranks 38)))) = true)
    (h5323 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 60).ult (rankAtom ranks 39)))) = true)
    (h5324 : ((!((rankAtom ranks 26 == rankAtom ranks 60)) || ((rankAtom ranks 23).ult (rankAtom ranks 39)))) = true)
    (h5325 : ((!((rankAtom ranks 26 == rankAtom ranks 30)) || ((rankAtom ranks 35).ult (rankAtom ranks 39)))) = true)
    (h5326 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 61).ult (rankAtom ranks 40)))) = true)
    (h5327 : ((!((rankAtom ranks 26 == rankAtom ranks 61)) || ((rankAtom ranks 23).ult (rankAtom ranks 40)))) = true)
    (h5328 : ((!((rankAtom ranks 40 == rankAtom ranks 61)) || ((rankAtom ranks 23).ult (rankAtom ranks 26)))) = true)
    (h5329 : ((!((rankAtom ranks 26 == rankAtom ranks 31)) || ((rankAtom ranks 35).ult (rankAtom ranks 40)))) = true)
    (h5330 : ((!((rankAtom ranks 40 == rankAtom ranks 35)) || ((rankAtom ranks 31).ult (rankAtom ranks 26)))) = true)
    (h5331 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 62).ult (rankAtom ranks 41)))) = true)
    (h5332 : ((!((rankAtom ranks 26 == rankAtom ranks 62)) || ((rankAtom ranks 23).ult (rankAtom ranks 41)))) = true)
    (h5333 : ((!((rankAtom ranks 26 == rankAtom ranks 32)) || ((rankAtom ranks 35).ult (rankAtom ranks 41)))) = true)
    (h5334 : ((!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 63).ult (rankAtom ranks 27)))) = true)
    (h5335 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 23).ult (rankAtom ranks 27)))) = true)
    (h5336 : ((!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 36).ult (rankAtom ranks 37)))) = true)
    (h5337 : ((!((rankAtom ranks 27 == rankAtom ranks 36)) || ((rankAtom ranks 28).ult (rankAtom ranks 37)))) = true)
    (h5338 : ((!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 36).ult (rankAtom ranks 27)))) = true)
    (h5339 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 64).ult (rankAtom ranks 38)))) = true)
    (h5340 : ((!((rankAtom ranks 27 == rankAtom ranks 29)) || ((rankAtom ranks 36).ult (rankAtom ranks 38)))) = true)
    (h5341 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 65).ult (rankAtom ranks 39)))) = true)
    (h5342 : ((!((rankAtom ranks 39 == rankAtom ranks 65)) || ((rankAtom ranks 23).ult (rankAtom ranks 27)))) = true)
    (h5343 : ((!((rankAtom ranks 27 == rankAtom ranks 30)) || ((rankAtom ranks 36).ult (rankAtom ranks 39)))) = true)
    (h5344 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 66).ult (rankAtom ranks 40)))) = true)
    (h5345 : ((!((rankAtom ranks 40 == rankAtom ranks 66)) || ((rankAtom ranks 23).ult (rankAtom ranks 27)))) = true)
    (h5346 : ((!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 36).ult (rankAtom ranks 40)))) = true)
    (h5347 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 67).ult (rankAtom ranks 41)))) = true)
    (h5348 : ((!((rankAtom ranks 27 == rankAtom ranks 32)) || ((rankAtom ranks 36).ult (rankAtom ranks 41)))) = true)
    (h5349 : ((!((rankAtom ranks 41 == rankAtom ranks 36)) || ((rankAtom ranks 32).ult (rankAtom ranks 27)))) = true)
    (h5350 : ((!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 68).ult (rankAtom ranks 38)))) = true)
    (h5351 : ((!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 23).ult (rankAtom ranks 38)))) = true)
    (h5352 : ((!((rankAtom ranks 38 == rankAtom ranks 23)) || ((rankAtom ranks 68).ult (rankAtom ranks 28)))) = true)
    (h5353 : ((!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 37).ult (rankAtom ranks 38)))) = true)
    (h5354 : ((!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 29).ult (rankAtom ranks 38)))) = true)
    (h5355 : ((!((rankAtom ranks 38 == rankAtom ranks 29)) || ((rankAtom ranks 37).ult (rankAtom ranks 28)))) = true)
    (h5356 : ((!((rankAtom ranks 38 == rankAtom ranks 37)) || ((rankAtom ranks 29).ult (rankAtom ranks 28)))) = true)
    (h5357 : ((!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 69).ult (rankAtom ranks 39)))) = true)
    (h5358 : ((!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 23).ult (rankAtom ranks 39)))) = true)
    (h5359 : ((!((rankAtom ranks 39 == rankAtom ranks 23)) || ((rankAtom ranks 69).ult (rankAtom ranks 28)))) = true)
    (h5360 : ((!((rankAtom ranks 39 == rankAtom ranks 69)) || ((rankAtom ranks 23).ult (rankAtom ranks 28)))) = true)
    (h5361 : ((!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 37).ult (rankAtom ranks 39)))) = true)
    (h5362 : ((!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 30).ult (rankAtom ranks 39)))) = true)
    (h5363 : ((!((rankAtom ranks 39 == rankAtom ranks 30)) || ((rankAtom ranks 37).ult (rankAtom ranks 28)))) = true)
    (h5364 : ((!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 70).ult (rankAtom ranks 40)))) = true)
    (h5365 : ((!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 23).ult (rankAtom ranks 40)))) = true)
    (h5366 : ((!((rankAtom ranks 40 == rankAtom ranks 23)) || ((rankAtom ranks 70).ult (rankAtom ranks 28)))) = true)
    (h5367 : ((!((rankAtom ranks 28 == rankAtom ranks 31)) || ((rankAtom ranks 37).ult (rankAtom ranks 40)))) = true)
    (h5368 : ((!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 31).ult (rankAtom ranks 40)))) = true)
    (h5369 : ((!((rankAtom ranks 40 == rankAtom ranks 31)) || ((rankAtom ranks 37).ult (rankAtom ranks 28)))) = true)
    (h5370 : ((!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 71).ult (rankAtom ranks 41)))) = true)
    (h5371 : ((!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 23).ult (rankAtom ranks 41)))) = true)
    (h5372 : ((!((rankAtom ranks 41 == rankAtom ranks 23)) || ((rankAtom ranks 71).ult (rankAtom ranks 28)))) = true)
    (h5373 : ((!((rankAtom ranks 28 == rankAtom ranks 32)) || ((rankAtom ranks 37).ult (rankAtom ranks 41)))) = true)
    (h5374 : ((!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 32).ult (rankAtom ranks 41)))) = true)
    (h5375 : ((!((rankAtom ranks 41 == rankAtom ranks 32)) || ((rankAtom ranks 37).ult (rankAtom ranks 28)))) = true) :
    ∀ item ∈ sourceChunk083Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk083Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5312
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5313
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5314
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5315
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5316
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5317
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5318
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5319
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5320
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5321
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5322
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5323
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5324
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5325
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5326
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5327
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5328
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5329
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5330
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5331
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5332
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5333
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5334
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5335
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5336
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5337
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5338
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5339
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5340
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5341
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5342
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5343
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5344
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5345
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5346
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5347
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5348
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5349
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5350
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5351
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5352
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5353
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5354
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5355
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5356
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5357
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5358
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5359
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5360
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5361
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5362
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5363
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5364
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5365
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5366
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5367
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5368
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5369
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5370
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5371
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5372
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5373
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5374
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5375

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
