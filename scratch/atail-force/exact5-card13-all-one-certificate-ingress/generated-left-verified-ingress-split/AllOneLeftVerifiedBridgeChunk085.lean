/-
Generated packed-source bridge for verified left chunk 085.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk085_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h5440 : ((!((rankAtom ranks 48 == rankAtom ranks 55)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h5441 : ((!((rankAtom ranks 25 == rankAtom ranks 31)) || ((rankAtom ranks 42).ult (rankAtom ranks 48)))) = true)
    (h5442 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 31).ult (rankAtom ranks 48)))) = true)
    (h5443 : ((!((rankAtom ranks 48 == rankAtom ranks 31)) || ((rankAtom ranks 42).ult (rankAtom ranks 25)))) = true)
    (h5444 : ((!((rankAtom ranks 48 == rankAtom ranks 42)) || ((rankAtom ranks 31).ult (rankAtom ranks 25)))) = true)
    (h5445 : ((!((rankAtom ranks 25 == rankAtom ranks 24)) || ((rankAtom ranks 56).ult (rankAtom ranks 49)))) = true)
    (h5446 : ((!((rankAtom ranks 25 == rankAtom ranks 56)) || ((rankAtom ranks 24).ult (rankAtom ranks 49)))) = true)
    (h5447 : ((!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 56).ult (rankAtom ranks 25)))) = true)
    (h5448 : ((!((rankAtom ranks 25 == rankAtom ranks 32)) || ((rankAtom ranks 42).ult (rankAtom ranks 49)))) = true)
    (h5449 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 32).ult (rankAtom ranks 49)))) = true)
    (h5450 : ((!((rankAtom ranks 49 == rankAtom ranks 42)) || ((rankAtom ranks 32).ult (rankAtom ranks 25)))) = true)
    (h5451 : ((!((rankAtom ranks 26 == rankAtom ranks 24)) || ((rankAtom ranks 57).ult (rankAtom ranks 44)))) = true)
    (h5452 : ((!((rankAtom ranks 26 == rankAtom ranks 27)) || ((rankAtom ranks 43).ult (rankAtom ranks 44)))) = true)
    (h5453 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 27).ult (rankAtom ranks 44)))) = true)
    (h5454 : ((!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 27).ult (rankAtom ranks 26)))) = true)
    (h5455 : ((!((rankAtom ranks 26 == rankAtom ranks 24)) || ((rankAtom ranks 58).ult (rankAtom ranks 45)))) = true)
    (h5456 : ((!((rankAtom ranks 26 == rankAtom ranks 58)) || ((rankAtom ranks 24).ult (rankAtom ranks 45)))) = true)
    (h5457 : ((!((rankAtom ranks 45 == rankAtom ranks 24)) || ((rankAtom ranks 58).ult (rankAtom ranks 26)))) = true)
    (h5458 : ((!((rankAtom ranks 26 == rankAtom ranks 28)) || ((rankAtom ranks 43).ult (rankAtom ranks 45)))) = true)
    (h5459 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 28).ult (rankAtom ranks 45)))) = true)
    (h5460 : ((!((rankAtom ranks 45 == rankAtom ranks 28)) || ((rankAtom ranks 43).ult (rankAtom ranks 26)))) = true)
    (h5461 : ((!((rankAtom ranks 45 == rankAtom ranks 43)) || ((rankAtom ranks 28).ult (rankAtom ranks 26)))) = true)
    (h5462 : ((!((rankAtom ranks 26 == rankAtom ranks 24)) || ((rankAtom ranks 59).ult (rankAtom ranks 46)))) = true)
    (h5463 : ((!((rankAtom ranks 26 == rankAtom ranks 59)) || ((rankAtom ranks 24).ult (rankAtom ranks 46)))) = true)
    (h5464 : ((!((rankAtom ranks 46 == rankAtom ranks 24)) || ((rankAtom ranks 59).ult (rankAtom ranks 26)))) = true)
    (h5465 : ((!((rankAtom ranks 46 == rankAtom ranks 59)) || ((rankAtom ranks 24).ult (rankAtom ranks 26)))) = true)
    (h5466 : ((!((rankAtom ranks 26 == rankAtom ranks 29)) || ((rankAtom ranks 43).ult (rankAtom ranks 46)))) = true)
    (h5467 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 29).ult (rankAtom ranks 46)))) = true)
    (h5468 : ((!((rankAtom ranks 46 == rankAtom ranks 29)) || ((rankAtom ranks 43).ult (rankAtom ranks 26)))) = true)
    (h5469 : ((!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 29).ult (rankAtom ranks 26)))) = true)
    (h5470 : ((!((rankAtom ranks 26 == rankAtom ranks 24)) || ((rankAtom ranks 60).ult (rankAtom ranks 47)))) = true)
    (h5471 : ((!((rankAtom ranks 26 == rankAtom ranks 60)) || ((rankAtom ranks 24).ult (rankAtom ranks 47)))) = true)
    (h5472 : ((!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 60).ult (rankAtom ranks 26)))) = true)
    (h5473 : ((!((rankAtom ranks 47 == rankAtom ranks 60)) || ((rankAtom ranks 24).ult (rankAtom ranks 26)))) = true)
    (h5474 : ((!((rankAtom ranks 26 == rankAtom ranks 30)) || ((rankAtom ranks 43).ult (rankAtom ranks 47)))) = true)
    (h5475 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 30).ult (rankAtom ranks 47)))) = true)
    (h5476 : ((!((rankAtom ranks 47 == rankAtom ranks 30)) || ((rankAtom ranks 43).ult (rankAtom ranks 26)))) = true)
    (h5477 : ((!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 30).ult (rankAtom ranks 26)))) = true)
    (h5478 : ((!((rankAtom ranks 26 == rankAtom ranks 24)) || ((rankAtom ranks 61).ult (rankAtom ranks 48)))) = true)
    (h5479 : ((!((rankAtom ranks 26 == rankAtom ranks 61)) || ((rankAtom ranks 24).ult (rankAtom ranks 48)))) = true)
    (h5480 : ((!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 61).ult (rankAtom ranks 26)))) = true)
    (h5481 : ((!((rankAtom ranks 48 == rankAtom ranks 61)) || ((rankAtom ranks 24).ult (rankAtom ranks 26)))) = true)
    (h5482 : ((!((rankAtom ranks 26 == rankAtom ranks 31)) || ((rankAtom ranks 43).ult (rankAtom ranks 48)))) = true)
    (h5483 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 31).ult (rankAtom ranks 48)))) = true)
    (h5484 : ((!((rankAtom ranks 48 == rankAtom ranks 31)) || ((rankAtom ranks 43).ult (rankAtom ranks 26)))) = true)
    (h5485 : ((!((rankAtom ranks 48 == rankAtom ranks 43)) || ((rankAtom ranks 31).ult (rankAtom ranks 26)))) = true)
    (h5486 : ((!((rankAtom ranks 26 == rankAtom ranks 24)) || ((rankAtom ranks 62).ult (rankAtom ranks 49)))) = true)
    (h5487 : ((!((rankAtom ranks 26 == rankAtom ranks 62)) || ((rankAtom ranks 24).ult (rankAtom ranks 49)))) = true)
    (h5488 : ((!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 62).ult (rankAtom ranks 26)))) = true)
    (h5489 : ((!((rankAtom ranks 49 == rankAtom ranks 62)) || ((rankAtom ranks 24).ult (rankAtom ranks 26)))) = true)
    (h5490 : ((!((rankAtom ranks 26 == rankAtom ranks 32)) || ((rankAtom ranks 43).ult (rankAtom ranks 49)))) = true)
    (h5491 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 32).ult (rankAtom ranks 49)))) = true)
    (h5492 : ((!((rankAtom ranks 49 == rankAtom ranks 43)) || ((rankAtom ranks 32).ult (rankAtom ranks 26)))) = true)
    (h5493 : ((!((rankAtom ranks 27 == rankAtom ranks 24)) || ((rankAtom ranks 63).ult (rankAtom ranks 45)))) = true)
    (h5494 : ((!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 44).ult (rankAtom ranks 45)))) = true)
    (h5495 : ((!((rankAtom ranks 27 == rankAtom ranks 44)) || ((rankAtom ranks 28).ult (rankAtom ranks 45)))) = true)
    (h5496 : ((!((rankAtom ranks 45 == rankAtom ranks 28)) || ((rankAtom ranks 44).ult (rankAtom ranks 27)))) = true)
    (h5497 : ((!((rankAtom ranks 45 == rankAtom ranks 44)) || ((rankAtom ranks 28).ult (rankAtom ranks 27)))) = true)
    (h5498 : ((!((rankAtom ranks 27 == rankAtom ranks 24)) || ((rankAtom ranks 64).ult (rankAtom ranks 46)))) = true)
    (h5499 : ((!((rankAtom ranks 46 == rankAtom ranks 24)) || ((rankAtom ranks 64).ult (rankAtom ranks 27)))) = true)
    (h5500 : ((!((rankAtom ranks 46 == rankAtom ranks 64)) || ((rankAtom ranks 24).ult (rankAtom ranks 27)))) = true)
    (h5501 : ((!((rankAtom ranks 27 == rankAtom ranks 29)) || ((rankAtom ranks 44).ult (rankAtom ranks 46)))) = true)
    (h5502 : ((!((rankAtom ranks 46 == rankAtom ranks 29)) || ((rankAtom ranks 44).ult (rankAtom ranks 27)))) = true)
    (h5503 : ((!((rankAtom ranks 46 == rankAtom ranks 44)) || ((rankAtom ranks 29).ult (rankAtom ranks 27)))) = true) :
    ∀ item ∈ sourceChunk085Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk085Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5440
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5441
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5442
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5443
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5444
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5445
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5446
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5447
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5448
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5449
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5450
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5451
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5452
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5453
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5454
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5455
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5456
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5457
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5458
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5459
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5460
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5461
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5462
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5463
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5464
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5465
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5466
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5467
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5468
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5469
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5470
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5471
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5472
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5473
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5474
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5475
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5476
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5477
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5478
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5479
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5480
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5481
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5482
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5483
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5484
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5485
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5486
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5487
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5488
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5489
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5490
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5491
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5492
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5493
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5494
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5495
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5496
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5497
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5498
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5499
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5500
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5501
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5502
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5503

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
