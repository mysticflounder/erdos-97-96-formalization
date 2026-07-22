/-
Generated packed-source bridge for verified left chunk 101.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk101_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h6464 : ((!((rankAtom ranks 43 == rankAtom ranks 44)) || ((rankAtom ranks 50).ult (rankAtom ranks 51)))) = true)
    (h6465 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 44).ult (rankAtom ranks 51)))) = true)
    (h6466 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 44).ult (rankAtom ranks 43)))) = true)
    (h6467 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 58).ult (rankAtom ranks 52)))) = true)
    (h6468 : ((!((rankAtom ranks 43 == rankAtom ranks 58)) || ((rankAtom ranks 42).ult (rankAtom ranks 52)))) = true)
    (h6469 : ((!((rankAtom ranks 52 == rankAtom ranks 42)) || ((rankAtom ranks 58).ult (rankAtom ranks 43)))) = true)
    (h6470 : ((!((rankAtom ranks 43 == rankAtom ranks 45)) || ((rankAtom ranks 50).ult (rankAtom ranks 52)))) = true)
    (h6471 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 45).ult (rankAtom ranks 52)))) = true)
    (h6472 : ((!((rankAtom ranks 52 == rankAtom ranks 45)) || ((rankAtom ranks 50).ult (rankAtom ranks 43)))) = true)
    (h6473 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 45).ult (rankAtom ranks 43)))) = true)
    (h6474 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 59).ult (rankAtom ranks 53)))) = true)
    (h6475 : ((!((rankAtom ranks 43 == rankAtom ranks 59)) || ((rankAtom ranks 42).ult (rankAtom ranks 53)))) = true)
    (h6476 : ((!((rankAtom ranks 53 == rankAtom ranks 42)) || ((rankAtom ranks 59).ult (rankAtom ranks 43)))) = true)
    (h6477 : ((!((rankAtom ranks 53 == rankAtom ranks 59)) || ((rankAtom ranks 42).ult (rankAtom ranks 43)))) = true)
    (h6478 : ((!((rankAtom ranks 43 == rankAtom ranks 46)) || ((rankAtom ranks 50).ult (rankAtom ranks 53)))) = true)
    (h6479 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 46).ult (rankAtom ranks 53)))) = true)
    (h6480 : ((!((rankAtom ranks 53 == rankAtom ranks 46)) || ((rankAtom ranks 50).ult (rankAtom ranks 43)))) = true)
    (h6481 : ((!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 46).ult (rankAtom ranks 43)))) = true)
    (h6482 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 60).ult (rankAtom ranks 54)))) = true)
    (h6483 : ((!((rankAtom ranks 43 == rankAtom ranks 60)) || ((rankAtom ranks 42).ult (rankAtom ranks 54)))) = true)
    (h6484 : ((!((rankAtom ranks 54 == rankAtom ranks 42)) || ((rankAtom ranks 60).ult (rankAtom ranks 43)))) = true)
    (h6485 : ((!((rankAtom ranks 54 == rankAtom ranks 60)) || ((rankAtom ranks 42).ult (rankAtom ranks 43)))) = true)
    (h6486 : ((!((rankAtom ranks 43 == rankAtom ranks 47)) || ((rankAtom ranks 50).ult (rankAtom ranks 54)))) = true)
    (h6487 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 47).ult (rankAtom ranks 54)))) = true)
    (h6488 : ((!((rankAtom ranks 54 == rankAtom ranks 47)) || ((rankAtom ranks 50).ult (rankAtom ranks 43)))) = true)
    (h6489 : ((!((rankAtom ranks 54 == rankAtom ranks 50)) || ((rankAtom ranks 47).ult (rankAtom ranks 43)))) = true)
    (h6490 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 61).ult (rankAtom ranks 55)))) = true)
    (h6491 : ((!((rankAtom ranks 43 == rankAtom ranks 61)) || ((rankAtom ranks 42).ult (rankAtom ranks 55)))) = true)
    (h6492 : ((!((rankAtom ranks 55 == rankAtom ranks 42)) || ((rankAtom ranks 61).ult (rankAtom ranks 43)))) = true)
    (h6493 : ((!((rankAtom ranks 55 == rankAtom ranks 61)) || ((rankAtom ranks 42).ult (rankAtom ranks 43)))) = true)
    (h6494 : ((!((rankAtom ranks 43 == rankAtom ranks 48)) || ((rankAtom ranks 50).ult (rankAtom ranks 55)))) = true)
    (h6495 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 48).ult (rankAtom ranks 55)))) = true)
    (h6496 : ((!((rankAtom ranks 55 == rankAtom ranks 48)) || ((rankAtom ranks 50).ult (rankAtom ranks 43)))) = true)
    (h6497 : ((!((rankAtom ranks 55 == rankAtom ranks 50)) || ((rankAtom ranks 48).ult (rankAtom ranks 43)))) = true)
    (h6498 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 62).ult (rankAtom ranks 56)))) = true)
    (h6499 : ((!((rankAtom ranks 43 == rankAtom ranks 62)) || ((rankAtom ranks 42).ult (rankAtom ranks 56)))) = true)
    (h6500 : ((!((rankAtom ranks 56 == rankAtom ranks 42)) || ((rankAtom ranks 62).ult (rankAtom ranks 43)))) = true)
    (h6501 : ((!((rankAtom ranks 56 == rankAtom ranks 62)) || ((rankAtom ranks 42).ult (rankAtom ranks 43)))) = true)
    (h6502 : ((!((rankAtom ranks 43 == rankAtom ranks 49)) || ((rankAtom ranks 50).ult (rankAtom ranks 56)))) = true)
    (h6503 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 49).ult (rankAtom ranks 56)))) = true)
    (h6504 : ((!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 50).ult (rankAtom ranks 43)))) = true)
    (h6505 : ((!((rankAtom ranks 56 == rankAtom ranks 50)) || ((rankAtom ranks 49).ult (rankAtom ranks 43)))) = true)
    (h6506 : ((!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 63).ult (rankAtom ranks 52)))) = true)
    (h6507 : ((!((rankAtom ranks 52 == rankAtom ranks 42)) || ((rankAtom ranks 63).ult (rankAtom ranks 44)))) = true)
    (h6508 : ((!((rankAtom ranks 44 == rankAtom ranks 45)) || ((rankAtom ranks 51).ult (rankAtom ranks 52)))) = true)
    (h6509 : ((!((rankAtom ranks 44 == rankAtom ranks 51)) || ((rankAtom ranks 45).ult (rankAtom ranks 52)))) = true)
    (h6510 : ((!((rankAtom ranks 52 == rankAtom ranks 45)) || ((rankAtom ranks 51).ult (rankAtom ranks 44)))) = true)
    (h6511 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 45).ult (rankAtom ranks 44)))) = true)
    (h6512 : ((!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 64).ult (rankAtom ranks 53)))) = true)
    (h6513 : ((!((rankAtom ranks 44 == rankAtom ranks 64)) || ((rankAtom ranks 42).ult (rankAtom ranks 53)))) = true)
    (h6514 : ((!((rankAtom ranks 53 == rankAtom ranks 42)) || ((rankAtom ranks 64).ult (rankAtom ranks 44)))) = true)
    (h6515 : ((!((rankAtom ranks 53 == rankAtom ranks 64)) || ((rankAtom ranks 42).ult (rankAtom ranks 44)))) = true)
    (h6516 : ((!((rankAtom ranks 44 == rankAtom ranks 46)) || ((rankAtom ranks 51).ult (rankAtom ranks 53)))) = true)
    (h6517 : ((!((rankAtom ranks 44 == rankAtom ranks 51)) || ((rankAtom ranks 46).ult (rankAtom ranks 53)))) = true)
    (h6518 : ((!((rankAtom ranks 53 == rankAtom ranks 46)) || ((rankAtom ranks 51).ult (rankAtom ranks 44)))) = true)
    (h6519 : ((!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 46).ult (rankAtom ranks 44)))) = true)
    (h6520 : ((!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 65).ult (rankAtom ranks 54)))) = true)
    (h6521 : ((!((rankAtom ranks 54 == rankAtom ranks 42)) || ((rankAtom ranks 65).ult (rankAtom ranks 44)))) = true)
    (h6522 : ((!((rankAtom ranks 54 == rankAtom ranks 65)) || ((rankAtom ranks 42).ult (rankAtom ranks 44)))) = true)
    (h6523 : ((!((rankAtom ranks 44 == rankAtom ranks 47)) || ((rankAtom ranks 51).ult (rankAtom ranks 54)))) = true)
    (h6524 : ((!((rankAtom ranks 44 == rankAtom ranks 51)) || ((rankAtom ranks 47).ult (rankAtom ranks 54)))) = true)
    (h6525 : ((!((rankAtom ranks 54 == rankAtom ranks 47)) || ((rankAtom ranks 51).ult (rankAtom ranks 44)))) = true)
    (h6526 : ((!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 47).ult (rankAtom ranks 44)))) = true)
    (h6527 : ((!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 66).ult (rankAtom ranks 55)))) = true) :
    ∀ item ∈ sourceChunk101Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk101Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6464
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6465
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6466
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6467
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6468
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6469
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6470
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6471
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6472
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6473
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6474
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6475
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6476
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6477
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6478
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6479
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6480
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6481
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6482
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6483
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6484
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6485
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6486
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6487
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6488
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6489
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6490
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6491
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6492
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6493
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6494
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6495
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6496
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6497
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6498
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6499
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6500
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6501
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6502
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6503
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6504
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6505
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6506
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6507
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6508
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6509
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6510
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6511
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6512
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6513
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6514
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6515
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6516
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6517
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6518
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6519
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6520
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6521
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6522
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6523
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6524
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6525
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6526
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6527

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
