/-
Generated packed-source bridge for verified left chunk 100.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk100_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h6400 : ((!((rankAtom ranks 67 == rankAtom ranks 66)) || ((rankAtom ranks 41).ult (rankAtom ranks 40)))) = true)
    (h6401 : ((!((rankAtom ranks 38 == rankAtom ranks 37)) || ((rankAtom ranks 72).ult (rankAtom ranks 69)))) = true)
    (h6402 : ((!((rankAtom ranks 38 == rankAtom ranks 72)) || ((rankAtom ranks 37).ult (rankAtom ranks 69)))) = true)
    (h6403 : ((!((rankAtom ranks 69 == rankAtom ranks 37)) || ((rankAtom ranks 72).ult (rankAtom ranks 38)))) = true)
    (h6404 : ((!((rankAtom ranks 69 == rankAtom ranks 72)) || ((rankAtom ranks 37).ult (rankAtom ranks 38)))) = true)
    (h6405 : ((!((rankAtom ranks 38 == rankAtom ranks 39)) || ((rankAtom ranks 68).ult (rankAtom ranks 69)))) = true)
    (h6406 : ((!((rankAtom ranks 38 == rankAtom ranks 68)) || ((rankAtom ranks 39).ult (rankAtom ranks 69)))) = true)
    (h6407 : ((!((rankAtom ranks 69 == rankAtom ranks 39)) || ((rankAtom ranks 68).ult (rankAtom ranks 38)))) = true)
    (h6408 : ((!((rankAtom ranks 69 == rankAtom ranks 68)) || ((rankAtom ranks 39).ult (rankAtom ranks 38)))) = true)
    (h6409 : ((!((rankAtom ranks 38 == rankAtom ranks 37)) || ((rankAtom ranks 73).ult (rankAtom ranks 70)))) = true)
    (h6410 : ((!((rankAtom ranks 38 == rankAtom ranks 73)) || ((rankAtom ranks 37).ult (rankAtom ranks 70)))) = true)
    (h6411 : ((!((rankAtom ranks 70 == rankAtom ranks 37)) || ((rankAtom ranks 73).ult (rankAtom ranks 38)))) = true)
    (h6412 : ((!((rankAtom ranks 70 == rankAtom ranks 73)) || ((rankAtom ranks 37).ult (rankAtom ranks 38)))) = true)
    (h6413 : ((!((rankAtom ranks 38 == rankAtom ranks 40)) || ((rankAtom ranks 68).ult (rankAtom ranks 70)))) = true)
    (h6414 : ((!((rankAtom ranks 38 == rankAtom ranks 68)) || ((rankAtom ranks 40).ult (rankAtom ranks 70)))) = true)
    (h6415 : ((!((rankAtom ranks 70 == rankAtom ranks 40)) || ((rankAtom ranks 68).ult (rankAtom ranks 38)))) = true)
    (h6416 : ((!((rankAtom ranks 38 == rankAtom ranks 37)) || ((rankAtom ranks 74).ult (rankAtom ranks 71)))) = true)
    (h6417 : ((!((rankAtom ranks 38 == rankAtom ranks 74)) || ((rankAtom ranks 37).ult (rankAtom ranks 71)))) = true)
    (h6418 : ((!((rankAtom ranks 71 == rankAtom ranks 37)) || ((rankAtom ranks 74).ult (rankAtom ranks 38)))) = true)
    (h6419 : ((!((rankAtom ranks 38 == rankAtom ranks 41)) || ((rankAtom ranks 68).ult (rankAtom ranks 71)))) = true)
    (h6420 : ((!((rankAtom ranks 38 == rankAtom ranks 68)) || ((rankAtom ranks 41).ult (rankAtom ranks 71)))) = true)
    (h6421 : ((!((rankAtom ranks 39 == rankAtom ranks 37)) || ((rankAtom ranks 75).ult (rankAtom ranks 70)))) = true)
    (h6422 : ((!((rankAtom ranks 39 == rankAtom ranks 75)) || ((rankAtom ranks 37).ult (rankAtom ranks 70)))) = true)
    (h6423 : ((!((rankAtom ranks 70 == rankAtom ranks 37)) || ((rankAtom ranks 75).ult (rankAtom ranks 39)))) = true)
    (h6424 : ((!((rankAtom ranks 70 == rankAtom ranks 75)) || ((rankAtom ranks 37).ult (rankAtom ranks 39)))) = true)
    (h6425 : ((!((rankAtom ranks 39 == rankAtom ranks 40)) || ((rankAtom ranks 69).ult (rankAtom ranks 70)))) = true)
    (h6426 : ((!((rankAtom ranks 39 == rankAtom ranks 69)) || ((rankAtom ranks 40).ult (rankAtom ranks 70)))) = true)
    (h6427 : ((!((rankAtom ranks 70 == rankAtom ranks 40)) || ((rankAtom ranks 69).ult (rankAtom ranks 39)))) = true)
    (h6428 : ((!((rankAtom ranks 39 == rankAtom ranks 76)) || ((rankAtom ranks 37).ult (rankAtom ranks 71)))) = true)
    (h6429 : ((!((rankAtom ranks 71 == rankAtom ranks 37)) || ((rankAtom ranks 76).ult (rankAtom ranks 39)))) = true)
    (h6430 : ((!((rankAtom ranks 39 == rankAtom ranks 41)) || ((rankAtom ranks 69).ult (rankAtom ranks 71)))) = true)
    (h6431 : ((!((rankAtom ranks 39 == rankAtom ranks 69)) || ((rankAtom ranks 41).ult (rankAtom ranks 71)))) = true)
    (h6432 : ((!((rankAtom ranks 40 == rankAtom ranks 77)) || ((rankAtom ranks 37).ult (rankAtom ranks 71)))) = true)
    (h6433 : ((!((rankAtom ranks 71 == rankAtom ranks 37)) || ((rankAtom ranks 77).ult (rankAtom ranks 40)))) = true)
    (h6434 : ((!((rankAtom ranks 40 == rankAtom ranks 41)) || ((rankAtom ranks 70).ult (rankAtom ranks 71)))) = true)
    (h6435 : ((!((rankAtom ranks 40 == rankAtom ranks 70)) || ((rankAtom ranks 41).ult (rankAtom ranks 71)))) = true)
    (h6436 : ((!((rankAtom ranks 39 == rankAtom ranks 38)) || ((rankAtom ranks 75).ult (rankAtom ranks 73)))) = true)
    (h6437 : ((!((rankAtom ranks 39 == rankAtom ranks 75)) || ((rankAtom ranks 38).ult (rankAtom ranks 73)))) = true)
    (h6438 : ((!((rankAtom ranks 73 == rankAtom ranks 38)) || ((rankAtom ranks 75).ult (rankAtom ranks 39)))) = true)
    (h6439 : ((!((rankAtom ranks 73 == rankAtom ranks 75)) || ((rankAtom ranks 38).ult (rankAtom ranks 39)))) = true)
    (h6440 : ((!((rankAtom ranks 39 == rankAtom ranks 40)) || ((rankAtom ranks 72).ult (rankAtom ranks 73)))) = true)
    (h6441 : ((!((rankAtom ranks 39 == rankAtom ranks 72)) || ((rankAtom ranks 40).ult (rankAtom ranks 73)))) = true)
    (h6442 : ((!((rankAtom ranks 73 == rankAtom ranks 40)) || ((rankAtom ranks 72).ult (rankAtom ranks 39)))) = true)
    (h6443 : ((!((rankAtom ranks 73 == rankAtom ranks 72)) || ((rankAtom ranks 40).ult (rankAtom ranks 39)))) = true)
    (h6444 : ((!((rankAtom ranks 39 == rankAtom ranks 76)) || ((rankAtom ranks 38).ult (rankAtom ranks 74)))) = true)
    (h6445 : ((!((rankAtom ranks 74 == rankAtom ranks 38)) || ((rankAtom ranks 76).ult (rankAtom ranks 39)))) = true)
    (h6446 : ((!((rankAtom ranks 39 == rankAtom ranks 41)) || ((rankAtom ranks 72).ult (rankAtom ranks 74)))) = true)
    (h6447 : ((!((rankAtom ranks 39 == rankAtom ranks 72)) || ((rankAtom ranks 41).ult (rankAtom ranks 74)))) = true)
    (h6448 : ((!((rankAtom ranks 74 == rankAtom ranks 72)) || ((rankAtom ranks 41).ult (rankAtom ranks 39)))) = true)
    (h6449 : ((!((rankAtom ranks 40 == rankAtom ranks 77)) || ((rankAtom ranks 38).ult (rankAtom ranks 74)))) = true)
    (h6450 : ((!((rankAtom ranks 74 == rankAtom ranks 38)) || ((rankAtom ranks 77).ult (rankAtom ranks 40)))) = true)
    (h6451 : ((!((rankAtom ranks 40 == rankAtom ranks 41)) || ((rankAtom ranks 73).ult (rankAtom ranks 74)))) = true)
    (h6452 : ((!((rankAtom ranks 40 == rankAtom ranks 73)) || ((rankAtom ranks 41).ult (rankAtom ranks 74)))) = true)
    (h6453 : ((!((rankAtom ranks 74 == rankAtom ranks 73)) || ((rankAtom ranks 41).ult (rankAtom ranks 40)))) = true)
    (h6454 : ((!((rankAtom ranks 40 == rankAtom ranks 39)) || ((rankAtom ranks 77).ult (rankAtom ranks 76)))) = true)
    (h6455 : ((!((rankAtom ranks 40 == rankAtom ranks 77)) || ((rankAtom ranks 39).ult (rankAtom ranks 76)))) = true)
    (h6456 : ((!((rankAtom ranks 76 == rankAtom ranks 39)) || ((rankAtom ranks 77).ult (rankAtom ranks 40)))) = true)
    (h6457 : ((!((rankAtom ranks 40 == rankAtom ranks 41)) || ((rankAtom ranks 75).ult (rankAtom ranks 76)))) = true)
    (h6458 : ((!((rankAtom ranks 40 == rankAtom ranks 75)) || ((rankAtom ranks 41).ult (rankAtom ranks 76)))) = true)
    (h6459 : ((!((rankAtom ranks 76 == rankAtom ranks 75)) || ((rankAtom ranks 41).ult (rankAtom ranks 40)))) = true)
    (h6460 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 57).ult (rankAtom ranks 51)))) = true)
    (h6461 : ((!((rankAtom ranks 43 == rankAtom ranks 57)) || ((rankAtom ranks 42).ult (rankAtom ranks 51)))) = true)
    (h6462 : ((!((rankAtom ranks 51 == rankAtom ranks 42)) || ((rankAtom ranks 57).ult (rankAtom ranks 43)))) = true)
    (h6463 : ((!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 42).ult (rankAtom ranks 43)))) = true) :
    ∀ item ∈ sourceChunk100Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk100Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6400
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6401
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6402
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6403
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6404
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6405
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6406
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6407
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6408
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6409
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6410
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6411
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6412
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6413
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6414
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6415
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6416
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6417
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6418
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6419
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6420
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6421
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6422
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6423
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6424
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6425
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6426
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6427
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6428
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6429
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6430
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6431
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6432
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6433
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6434
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6435
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6436
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6437
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6438
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6439
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6440
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6441
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6442
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6443
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6444
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6445
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6446
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6447
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6448
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6449
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6450
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6451
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6452
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6453
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6454
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6455
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6456
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6457
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6458
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6459
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6460
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6461
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6462
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6463

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
