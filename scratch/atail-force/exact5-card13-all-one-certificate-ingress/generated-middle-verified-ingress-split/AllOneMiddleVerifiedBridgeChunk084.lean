/-
Generated packed-source bridge for verified middle chunk 084.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk084_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h5376 : ((!((rankAtom ranks 29 == rankAtom ranks 23)) || ((rankAtom ranks 72).ult (rankAtom ranks 39)))) = true)
    (h5377 : ((!((rankAtom ranks 39 == rankAtom ranks 23)) || ((rankAtom ranks 72).ult (rankAtom ranks 29)))) = true)
    (h5378 : ((!((rankAtom ranks 39 == rankAtom ranks 72)) || ((rankAtom ranks 23).ult (rankAtom ranks 29)))) = true)
    (h5379 : ((!((rankAtom ranks 29 == rankAtom ranks 30)) || ((rankAtom ranks 38).ult (rankAtom ranks 39)))) = true)
    (h5380 : ((!((rankAtom ranks 29 == rankAtom ranks 23)) || ((rankAtom ranks 73).ult (rankAtom ranks 40)))) = true)
    (h5381 : ((!((rankAtom ranks 29 == rankAtom ranks 73)) || ((rankAtom ranks 23).ult (rankAtom ranks 40)))) = true)
    (h5382 : ((!((rankAtom ranks 40 == rankAtom ranks 73)) || ((rankAtom ranks 23).ult (rankAtom ranks 29)))) = true)
    (h5383 : ((!((rankAtom ranks 29 == rankAtom ranks 31)) || ((rankAtom ranks 38).ult (rankAtom ranks 40)))) = true)
    (h5384 : ((!((rankAtom ranks 40 == rankAtom ranks 38)) || ((rankAtom ranks 31).ult (rankAtom ranks 29)))) = true)
    (h5385 : ((!((rankAtom ranks 29 == rankAtom ranks 23)) || ((rankAtom ranks 74).ult (rankAtom ranks 41)))) = true)
    (h5386 : ((!((rankAtom ranks 29 == rankAtom ranks 74)) || ((rankAtom ranks 23).ult (rankAtom ranks 41)))) = true)
    (h5387 : ((!((rankAtom ranks 41 == rankAtom ranks 23)) || ((rankAtom ranks 74).ult (rankAtom ranks 29)))) = true)
    (h5388 : ((!((rankAtom ranks 29 == rankAtom ranks 32)) || ((rankAtom ranks 38).ult (rankAtom ranks 41)))) = true)
    (h5389 : ((!((rankAtom ranks 41 == rankAtom ranks 38)) || ((rankAtom ranks 32).ult (rankAtom ranks 29)))) = true)
    (h5390 : ((!((rankAtom ranks 30 == rankAtom ranks 23)) || ((rankAtom ranks 75).ult (rankAtom ranks 40)))) = true)
    (h5391 : ((!((rankAtom ranks 30 == rankAtom ranks 75)) || ((rankAtom ranks 23).ult (rankAtom ranks 40)))) = true)
    (h5392 : ((!((rankAtom ranks 40 == rankAtom ranks 75)) || ((rankAtom ranks 23).ult (rankAtom ranks 30)))) = true)
    (h5393 : ((!((rankAtom ranks 30 == rankAtom ranks 31)) || ((rankAtom ranks 39).ult (rankAtom ranks 40)))) = true)
    (h5394 : ((!((rankAtom ranks 30 == rankAtom ranks 23)) || ((rankAtom ranks 76).ult (rankAtom ranks 41)))) = true)
    (h5395 : ((!((rankAtom ranks 30 == rankAtom ranks 76)) || ((rankAtom ranks 23).ult (rankAtom ranks 41)))) = true)
    (h5396 : ((!((rankAtom ranks 30 == rankAtom ranks 32)) || ((rankAtom ranks 39).ult (rankAtom ranks 41)))) = true)
    (h5397 : ((!((rankAtom ranks 31 == rankAtom ranks 23)) || ((rankAtom ranks 77).ult (rankAtom ranks 41)))) = true)
    (h5398 : ((!((rankAtom ranks 31 == rankAtom ranks 77)) || ((rankAtom ranks 23).ult (rankAtom ranks 41)))) = true)
    (h5399 : ((!((rankAtom ranks 31 == rankAtom ranks 32)) || ((rankAtom ranks 40).ult (rankAtom ranks 41)))) = true)
    (h5400 : ((!((rankAtom ranks 41 == rankAtom ranks 40)) || ((rankAtom ranks 32).ult (rankAtom ranks 31)))) = true)
    (h5401 : ((!((rankAtom ranks 25 == rankAtom ranks 24)) || ((rankAtom ranks 50).ult (rankAtom ranks 43)))) = true)
    (h5402 : ((!((rankAtom ranks 25 == rankAtom ranks 50)) || ((rankAtom ranks 24).ult (rankAtom ranks 43)))) = true)
    (h5403 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h5404 : ((!((rankAtom ranks 25 == rankAtom ranks 26)) || ((rankAtom ranks 42).ult (rankAtom ranks 43)))) = true)
    (h5405 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 26).ult (rankAtom ranks 43)))) = true)
    (h5406 : ((!((rankAtom ranks 43 == rankAtom ranks 26)) || ((rankAtom ranks 42).ult (rankAtom ranks 25)))) = true)
    (h5407 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 26).ult (rankAtom ranks 25)))) = true)
    (h5408 : ((!((rankAtom ranks 25 == rankAtom ranks 24)) || ((rankAtom ranks 51).ult (rankAtom ranks 44)))) = true)
    (h5409 : ((!((rankAtom ranks 25 == rankAtom ranks 51)) || ((rankAtom ranks 24).ult (rankAtom ranks 44)))) = true)
    (h5410 : ((!((rankAtom ranks 44 == rankAtom ranks 51)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h5411 : ((!((rankAtom ranks 25 == rankAtom ranks 27)) || ((rankAtom ranks 42).ult (rankAtom ranks 44)))) = true)
    (h5412 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 27).ult (rankAtom ranks 44)))) = true)
    (h5413 : ((!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 27).ult (rankAtom ranks 25)))) = true)
    (h5414 : ((!((rankAtom ranks 25 == rankAtom ranks 24)) || ((rankAtom ranks 52).ult (rankAtom ranks 45)))) = true)
    (h5415 : ((!((rankAtom ranks 25 == rankAtom ranks 52)) || ((rankAtom ranks 24).ult (rankAtom ranks 45)))) = true)
    (h5416 : ((!((rankAtom ranks 45 == rankAtom ranks 24)) || ((rankAtom ranks 52).ult (rankAtom ranks 25)))) = true)
    (h5417 : ((!((rankAtom ranks 25 == rankAtom ranks 28)) || ((rankAtom ranks 42).ult (rankAtom ranks 45)))) = true)
    (h5418 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 28).ult (rankAtom ranks 45)))) = true)
    (h5419 : ((!((rankAtom ranks 45 == rankAtom ranks 28)) || ((rankAtom ranks 42).ult (rankAtom ranks 25)))) = true)
    (h5420 : ((!((rankAtom ranks 45 == rankAtom ranks 42)) || ((rankAtom ranks 28).ult (rankAtom ranks 25)))) = true)
    (h5421 : ((!((rankAtom ranks 25 == rankAtom ranks 24)) || ((rankAtom ranks 53).ult (rankAtom ranks 46)))) = true)
    (h5422 : ((!((rankAtom ranks 25 == rankAtom ranks 53)) || ((rankAtom ranks 24).ult (rankAtom ranks 46)))) = true)
    (h5423 : ((!((rankAtom ranks 46 == rankAtom ranks 24)) || ((rankAtom ranks 53).ult (rankAtom ranks 25)))) = true)
    (h5424 : ((!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h5425 : ((!((rankAtom ranks 25 == rankAtom ranks 29)) || ((rankAtom ranks 42).ult (rankAtom ranks 46)))) = true)
    (h5426 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 29).ult (rankAtom ranks 46)))) = true)
    (h5427 : ((!((rankAtom ranks 46 == rankAtom ranks 29)) || ((rankAtom ranks 42).ult (rankAtom ranks 25)))) = true)
    (h5428 : ((!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 29).ult (rankAtom ranks 25)))) = true)
    (h5429 : ((!((rankAtom ranks 25 == rankAtom ranks 24)) || ((rankAtom ranks 54).ult (rankAtom ranks 47)))) = true)
    (h5430 : ((!((rankAtom ranks 25 == rankAtom ranks 54)) || ((rankAtom ranks 24).ult (rankAtom ranks 47)))) = true)
    (h5431 : ((!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 54).ult (rankAtom ranks 25)))) = true)
    (h5432 : ((!((rankAtom ranks 47 == rankAtom ranks 54)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h5433 : ((!((rankAtom ranks 25 == rankAtom ranks 30)) || ((rankAtom ranks 42).ult (rankAtom ranks 47)))) = true)
    (h5434 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 30).ult (rankAtom ranks 47)))) = true)
    (h5435 : ((!((rankAtom ranks 47 == rankAtom ranks 30)) || ((rankAtom ranks 42).ult (rankAtom ranks 25)))) = true)
    (h5436 : ((!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 30).ult (rankAtom ranks 25)))) = true)
    (h5437 : ((!((rankAtom ranks 25 == rankAtom ranks 24)) || ((rankAtom ranks 55).ult (rankAtom ranks 48)))) = true)
    (h5438 : ((!((rankAtom ranks 25 == rankAtom ranks 55)) || ((rankAtom ranks 24).ult (rankAtom ranks 48)))) = true)
    (h5439 : ((!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 55).ult (rankAtom ranks 25)))) = true) :
    ∀ item ∈ sourceChunk084Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk084Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5376
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5377
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5378
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5379
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5380
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5381
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5382
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5383
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5384
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5385
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5386
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5387
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5388
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5389
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5390
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5391
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5392
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5393
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5394
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5395
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5396
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5397
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5398
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5399
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5400
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5401
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5402
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5403
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5404
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5405
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5406
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5407
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5408
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5409
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5410
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5411
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5412
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5413
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5414
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5415
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5416
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5417
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5418
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5419
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5420
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5421
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5422
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5423
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5424
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5425
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5426
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5427
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5428
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5429
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5430
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5431
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5432
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5433
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5434
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5435
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5436
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5437
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5438
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5439

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
