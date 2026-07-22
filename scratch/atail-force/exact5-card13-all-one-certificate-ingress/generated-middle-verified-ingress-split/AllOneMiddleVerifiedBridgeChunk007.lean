/-
Generated packed-source bridge for verified middle chunk 007.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk007_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0448 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 8 && rowBit rows 0 5 7 && rowBit rows 0 5 8))) = true)
    (h0449 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 9 && rowBit rows 0 5 7 && rowBit rows 0 5 9))) = true)
    (h0450 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 10 && rowBit rows 0 5 7 && rowBit rows 0 5 10))) = true)
    (h0451 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 11 && rowBit rows 0 5 7 && rowBit rows 0 5 11))) = true)
    (h0452 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 12 && rowBit rows 0 5 7 && rowBit rows 0 5 12))) = true)
    (h0453 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 9 && rowBit rows 0 5 8 && rowBit rows 0 5 9))) = true)
    (h0454 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 10 && rowBit rows 0 5 8 && rowBit rows 0 5 10))) = true)
    (h0455 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 11 && rowBit rows 0 5 8 && rowBit rows 0 5 11))) = true)
    (h0456 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 12 && rowBit rows 0 5 8 && rowBit rows 0 5 12))) = true)
    (h0457 : (!((rowBit rows 0 2 9 && rowBit rows 0 2 11 && rowBit rows 0 5 9 && rowBit rows 0 5 11))) = true)
    (h0458 : (!((rowBit rows 0 2 9 && rowBit rows 0 2 12 && rowBit rows 0 5 9 && rowBit rows 0 5 12))) = true)
    (h0459 : (!((rowBit rows 0 2 10 && rowBit rows 0 2 11 && rowBit rows 0 5 10 && rowBit rows 0 5 11))) = true)
    (h0460 : (!((rowBit rows 0 2 10 && rowBit rows 0 2 12 && rowBit rows 0 5 10 && rowBit rows 0 5 12))) = true)
    (h0461 : (!((rowBit rows 0 2 11 && rowBit rows 0 2 12 && rowBit rows 0 5 11 && rowBit rows 0 5 12))) = true)
    (h0462 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 0 6 0 && rowBit rows 0 6 1))) = true)
    (h0463 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 7 && rowBit rows 0 6 0 && rowBit rows 0 6 7))) = true)
    (h0464 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 8 && rowBit rows 0 6 0 && rowBit rows 0 6 8))) = true)
    (h0465 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 10 && rowBit rows 0 6 0 && rowBit rows 0 6 10))) = true)
    (h0466 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 11 && rowBit rows 0 6 0 && rowBit rows 0 6 11))) = true)
    (h0467 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 12 && rowBit rows 0 6 0 && rowBit rows 0 6 12))) = true)
    (h0468 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 7 && rowBit rows 0 6 1 && rowBit rows 0 6 7))) = true)
    (h0469 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 8 && rowBit rows 0 6 1 && rowBit rows 0 6 8))) = true)
    (h0470 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 9 && rowBit rows 0 6 1 && rowBit rows 0 6 9))) = true)
    (h0471 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 10 && rowBit rows 0 6 1 && rowBit rows 0 6 10))) = true)
    (h0472 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 11 && rowBit rows 0 6 1 && rowBit rows 0 6 11))) = true)
    (h0473 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 12 && rowBit rows 0 6 1 && rowBit rows 0 6 12))) = true)
    (h0474 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 5 && rowBit rows 0 6 4 && rowBit rows 0 6 5))) = true)
    (h0475 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 8 && rowBit rows 0 6 7 && rowBit rows 0 6 8))) = true)
    (h0476 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 9 && rowBit rows 0 6 7 && rowBit rows 0 6 9))) = true)
    (h0477 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 10 && rowBit rows 0 6 7 && rowBit rows 0 6 10))) = true)
    (h0478 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 11 && rowBit rows 0 6 7 && rowBit rows 0 6 11))) = true)
    (h0479 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 12 && rowBit rows 0 6 7 && rowBit rows 0 6 12))) = true)
    (h0480 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 9 && rowBit rows 0 6 8 && rowBit rows 0 6 9))) = true)
    (h0481 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 10 && rowBit rows 0 6 8 && rowBit rows 0 6 10))) = true)
    (h0482 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 11 && rowBit rows 0 6 8 && rowBit rows 0 6 11))) = true)
    (h0483 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 12 && rowBit rows 0 6 8 && rowBit rows 0 6 12))) = true)
    (h0484 : (!((rowBit rows 0 2 9 && rowBit rows 0 2 10 && rowBit rows 0 6 9 && rowBit rows 0 6 10))) = true)
    (h0485 : (!((rowBit rows 0 2 9 && rowBit rows 0 2 11 && rowBit rows 0 6 9 && rowBit rows 0 6 11))) = true)
    (h0486 : (!((rowBit rows 0 2 9 && rowBit rows 0 2 12 && rowBit rows 0 6 9 && rowBit rows 0 6 12))) = true)
    (h0487 : (!((rowBit rows 0 2 10 && rowBit rows 0 2 11 && rowBit rows 0 6 10 && rowBit rows 0 6 11))) = true)
    (h0488 : (!((rowBit rows 0 2 10 && rowBit rows 0 2 12 && rowBit rows 0 6 10 && rowBit rows 0 6 12))) = true)
    (h0489 : (!((rowBit rows 0 2 11 && rowBit rows 0 2 12 && rowBit rows 0 6 11 && rowBit rows 0 6 12))) = true)
    (h0490 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 0 7 0 && rowBit rows 0 7 1))) = true)
    (h0491 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 10 && rowBit rows 0 7 0 && rowBit rows 0 7 10))) = true)
    (h0492 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 11 && rowBit rows 0 7 0 && rowBit rows 0 7 11))) = true)
    (h0493 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 6 && rowBit rows 0 7 4 && rowBit rows 0 7 6))) = true)
    (h0494 : (!((rowBit rows 0 2 9 && rowBit rows 0 2 10 && rowBit rows 0 7 9 && rowBit rows 0 7 10))) = true)
    (h0495 : (!((rowBit rows 0 2 9 && rowBit rows 0 2 11 && rowBit rows 0 7 9 && rowBit rows 0 7 11))) = true)
    (h0496 : (!((rowBit rows 0 2 10 && rowBit rows 0 2 11 && rowBit rows 0 7 10 && rowBit rows 0 7 11))) = true)
    (h0497 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 0 8 0 && rowBit rows 0 8 1))) = true)
    (h0498 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 0 9 0 && rowBit rows 0 9 1))) = true)
    (h0499 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 0 10 0 && rowBit rows 0 10 1))) = true)
    (h0500 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 12 && rowBit rows 0 10 0 && rowBit rows 0 10 12))) = true)
    (h0501 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 11 && rowBit rows 0 10 1 && rowBit rows 0 10 11))) = true)
    (h0502 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 4 && rowBit rows 0 10 3 && rowBit rows 0 10 4))) = true)
    (h0503 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 5 && rowBit rows 0 10 3 && rowBit rows 0 10 5))) = true)
    (h0504 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 6 && rowBit rows 0 10 3 && rowBit rows 0 10 6))) = true)
    (h0505 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 7 && rowBit rows 0 10 3 && rowBit rows 0 10 7))) = true)
    (h0506 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 8 && rowBit rows 0 10 3 && rowBit rows 0 10 8))) = true)
    (h0507 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 9 && rowBit rows 0 10 3 && rowBit rows 0 10 9))) = true)
    (h0508 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 5 && rowBit rows 0 10 4 && rowBit rows 0 10 5))) = true)
    (h0509 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 6 && rowBit rows 0 10 4 && rowBit rows 0 10 6))) = true)
    (h0510 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 7 && rowBit rows 0 10 4 && rowBit rows 0 10 7))) = true)
    (h0511 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 8 && rowBit rows 0 10 4 && rowBit rows 0 10 8))) = true) :
    ∀ item ∈ sourceChunk007Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk007Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0448
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0449
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0450
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0451
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0452
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0453
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0454
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0455
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0456
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0457
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0458
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0459
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0460
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0461
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0462
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0463
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0464
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0465
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0466
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0467
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0468
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0469
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0470
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0471
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0472
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0473
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0474
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0475
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0476
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0477
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0478
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0479
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0480
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0481
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0482
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0483
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0484
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0485
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0486
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0487
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0488
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0489
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0490
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0491
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0492
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0493
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0494
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0495
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0496
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0497
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0498
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0499
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0500
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0501
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0502
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0503
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0504
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0505
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0506
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0507
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0508
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0509
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0510
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0511

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
