/-
Generated packed-source bridge for verified middle chunk 039.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk039_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h2496 : ((!((rowBit rows 0 7 4 && rowBit rows 0 7 12)) || ((rankAtom ranks 44 == rankAtom ranks 67)))) = true)
    (h2497 : ((!((rowBit rows 0 7 5 && rowBit rows 0 7 6)) || ((rankAtom ranks 51 == rankAtom ranks 57)))) = true)
    (h2498 : ((!((rowBit rows 0 7 5 && rowBit rows 0 7 9)) || ((rankAtom ranks 51 == rankAtom ranks 64)))) = true)
    (h2499 : ((!((rowBit rows 0 7 6 && rowBit rows 0 7 8)) || ((rankAtom ranks 57 == rankAtom ranks 63)))) = true)
    (h2500 : ((!((rowBit rows 0 7 8 && rowBit rows 0 7 9)) || ((rankAtom ranks 63 == rankAtom ranks 64)))) = true)
    (h2501 : ((!((rowBit rows 0 7 8 && rowBit rows 0 7 10)) || ((rankAtom ranks 63 == rankAtom ranks 65)))) = true)
    (h2502 : ((!((rowBit rows 0 7 8 && rowBit rows 0 7 11)) || ((rankAtom ranks 63 == rankAtom ranks 66)))) = true)
    (h2503 : ((!((rowBit rows 0 7 9 && rowBit rows 0 7 10)) || ((rankAtom ranks 64 == rankAtom ranks 65)))) = true)
    (h2504 : ((!((rowBit rows 0 7 9 && rowBit rows 0 7 11)) || ((rankAtom ranks 64 == rankAtom ranks 66)))) = true)
    (h2505 : ((!((rowBit rows 0 7 10 && rowBit rows 0 7 11)) || ((rankAtom ranks 65 == rankAtom ranks 66)))) = true)
    (h2506 : ((!((rowBit rows 0 7 10 && rowBit rows 0 7 12)) || ((rankAtom ranks 65 == rankAtom ranks 67)))) = true)
    (h2507 : ((!((rowBit rows 0 7 11 && rowBit rows 0 7 12)) || ((rankAtom ranks 66 == rankAtom ranks 67)))) = true)
    (h2508 : ((!((rowBit rows 0 9 2 && rowBit rows 0 9 3)) || ((rankAtom ranks 29 == rankAtom ranks 38)))) = true)
    (h2509 : ((!((rowBit rows 0 10 0 && rowBit rows 0 10 1)) || ((rankAtom ranks 9 == rankAtom ranks 20)))) = true)
    (h2510 : ((!((rowBit rows 0 10 0 && rowBit rows 0 10 2)) || ((rankAtom ranks 9 == rankAtom ranks 30)))) = true)
    (h2511 : ((!((rowBit rows 0 10 0 && rowBit rows 0 10 3)) || ((rankAtom ranks 9 == rankAtom ranks 39)))) = true)
    (h2512 : ((!((rowBit rows 0 10 0 && rowBit rows 0 10 4)) || ((rankAtom ranks 9 == rankAtom ranks 47)))) = true)
    (h2513 : ((!((rowBit rows 0 10 0 && rowBit rows 0 10 5)) || ((rankAtom ranks 9 == rankAtom ranks 54)))) = true)
    (h2514 : ((!((rowBit rows 0 10 0 && rowBit rows 0 10 6)) || ((rankAtom ranks 9 == rankAtom ranks 60)))) = true)
    (h2515 : ((!((rowBit rows 0 10 0 && rowBit rows 0 10 7)) || ((rankAtom ranks 9 == rankAtom ranks 65)))) = true)
    (h2516 : ((!((rowBit rows 0 10 0 && rowBit rows 0 10 8)) || ((rankAtom ranks 9 == rankAtom ranks 69)))) = true)
    (h2517 : ((!((rowBit rows 0 10 0 && rowBit rows 0 10 9)) || ((rankAtom ranks 9 == rankAtom ranks 72)))) = true)
    (h2518 : ((!((rowBit rows 0 10 0 && rowBit rows 0 10 11)) || ((rankAtom ranks 9 == rankAtom ranks 75)))) = true)
    (h2519 : ((!((rowBit rows 0 10 0 && rowBit rows 0 10 12)) || ((rankAtom ranks 9 == rankAtom ranks 76)))) = true)
    (h2520 : ((!((rowBit rows 0 10 1 && rowBit rows 0 10 2)) || ((rankAtom ranks 20 == rankAtom ranks 30)))) = true)
    (h2521 : ((!((rowBit rows 0 10 1 && rowBit rows 0 10 3)) || ((rankAtom ranks 20 == rankAtom ranks 39)))) = true)
    (h2522 : ((!((rowBit rows 0 10 1 && rowBit rows 0 10 4)) || ((rankAtom ranks 20 == rankAtom ranks 47)))) = true)
    (h2523 : ((!((rowBit rows 0 10 1 && rowBit rows 0 10 5)) || ((rankAtom ranks 20 == rankAtom ranks 54)))) = true)
    (h2524 : ((!((rowBit rows 0 10 1 && rowBit rows 0 10 6)) || ((rankAtom ranks 20 == rankAtom ranks 60)))) = true)
    (h2525 : ((!((rowBit rows 0 10 1 && rowBit rows 0 10 7)) || ((rankAtom ranks 20 == rankAtom ranks 65)))) = true)
    (h2526 : ((!((rowBit rows 0 10 1 && rowBit rows 0 10 8)) || ((rankAtom ranks 20 == rankAtom ranks 69)))) = true)
    (h2527 : ((!((rowBit rows 0 10 1 && rowBit rows 0 10 9)) || ((rankAtom ranks 20 == rankAtom ranks 72)))) = true)
    (h2528 : ((!((rowBit rows 0 10 1 && rowBit rows 0 10 11)) || ((rankAtom ranks 20 == rankAtom ranks 75)))) = true)
    (h2529 : ((!((rowBit rows 0 10 1 && rowBit rows 0 10 12)) || ((rankAtom ranks 20 == rankAtom ranks 76)))) = true)
    (h2530 : ((!((rowBit rows 0 10 2 && rowBit rows 0 10 3)) || ((rankAtom ranks 30 == rankAtom ranks 39)))) = true)
    (h2531 : ((!((rowBit rows 0 10 2 && rowBit rows 0 10 4)) || ((rankAtom ranks 30 == rankAtom ranks 47)))) = true)
    (h2532 : ((!((rowBit rows 0 10 2 && rowBit rows 0 10 5)) || ((rankAtom ranks 30 == rankAtom ranks 54)))) = true)
    (h2533 : ((!((rowBit rows 0 10 2 && rowBit rows 0 10 6)) || ((rankAtom ranks 30 == rankAtom ranks 60)))) = true)
    (h2534 : ((!((rowBit rows 0 10 2 && rowBit rows 0 10 7)) || ((rankAtom ranks 30 == rankAtom ranks 65)))) = true)
    (h2535 : ((!((rowBit rows 0 10 2 && rowBit rows 0 10 8)) || ((rankAtom ranks 30 == rankAtom ranks 69)))) = true)
    (h2536 : ((!((rowBit rows 0 10 2 && rowBit rows 0 10 9)) || ((rankAtom ranks 30 == rankAtom ranks 72)))) = true)
    (h2537 : ((!((rowBit rows 0 10 2 && rowBit rows 0 10 11)) || ((rankAtom ranks 30 == rankAtom ranks 75)))) = true)
    (h2538 : ((!((rowBit rows 0 10 2 && rowBit rows 0 10 12)) || ((rankAtom ranks 30 == rankAtom ranks 76)))) = true)
    (h2539 : ((!((rowBit rows 0 10 3 && rowBit rows 0 10 4)) || ((rankAtom ranks 39 == rankAtom ranks 47)))) = true)
    (h2540 : ((!((rowBit rows 0 10 3 && rowBit rows 0 10 5)) || ((rankAtom ranks 39 == rankAtom ranks 54)))) = true)
    (h2541 : ((!((rowBit rows 0 10 3 && rowBit rows 0 10 6)) || ((rankAtom ranks 39 == rankAtom ranks 60)))) = true)
    (h2542 : ((!((rowBit rows 0 10 3 && rowBit rows 0 10 7)) || ((rankAtom ranks 39 == rankAtom ranks 65)))) = true)
    (h2543 : ((!((rowBit rows 0 10 3 && rowBit rows 0 10 8)) || ((rankAtom ranks 39 == rankAtom ranks 69)))) = true)
    (h2544 : ((!((rowBit rows 0 10 3 && rowBit rows 0 10 9)) || ((rankAtom ranks 39 == rankAtom ranks 72)))) = true)
    (h2545 : ((!((rowBit rows 0 10 3 && rowBit rows 0 10 11)) || ((rankAtom ranks 39 == rankAtom ranks 75)))) = true)
    (h2546 : ((!((rowBit rows 0 10 3 && rowBit rows 0 10 12)) || ((rankAtom ranks 39 == rankAtom ranks 76)))) = true)
    (h2547 : ((!((rowBit rows 0 10 4 && rowBit rows 0 10 5)) || ((rankAtom ranks 47 == rankAtom ranks 54)))) = true)
    (h2548 : ((!((rowBit rows 0 10 4 && rowBit rows 0 10 6)) || ((rankAtom ranks 47 == rankAtom ranks 60)))) = true)
    (h2549 : ((!((rowBit rows 0 10 4 && rowBit rows 0 10 7)) || ((rankAtom ranks 47 == rankAtom ranks 65)))) = true)
    (h2550 : ((!((rowBit rows 0 10 4 && rowBit rows 0 10 8)) || ((rankAtom ranks 47 == rankAtom ranks 69)))) = true)
    (h2551 : ((!((rowBit rows 0 10 4 && rowBit rows 0 10 9)) || ((rankAtom ranks 47 == rankAtom ranks 72)))) = true)
    (h2552 : ((!((rowBit rows 0 10 4 && rowBit rows 0 10 11)) || ((rankAtom ranks 47 == rankAtom ranks 75)))) = true)
    (h2553 : ((!((rowBit rows 0 10 4 && rowBit rows 0 10 12)) || ((rankAtom ranks 47 == rankAtom ranks 76)))) = true)
    (h2554 : ((!((rowBit rows 0 10 5 && rowBit rows 0 10 6)) || ((rankAtom ranks 54 == rankAtom ranks 60)))) = true)
    (h2555 : ((!((rowBit rows 0 10 5 && rowBit rows 0 10 7)) || ((rankAtom ranks 54 == rankAtom ranks 65)))) = true)
    (h2556 : ((!((rowBit rows 0 10 5 && rowBit rows 0 10 8)) || ((rankAtom ranks 54 == rankAtom ranks 69)))) = true)
    (h2557 : ((!((rowBit rows 0 10 5 && rowBit rows 0 10 9)) || ((rankAtom ranks 54 == rankAtom ranks 72)))) = true)
    (h2558 : ((!((rowBit rows 0 10 5 && rowBit rows 0 10 11)) || ((rankAtom ranks 54 == rankAtom ranks 75)))) = true)
    (h2559 : ((!((rowBit rows 0 10 5 && rowBit rows 0 10 12)) || ((rankAtom ranks 54 == rankAtom ranks 76)))) = true) :
    ∀ item ∈ sourceChunk039Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk039Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2496
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2497
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2498
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2499
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2500
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2501
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2502
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2503
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2504
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2505
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2506
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2507
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2508
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2509
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2510
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2511
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2512
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2513
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2514
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2515
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2516
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2517
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2518
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2519
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2520
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2521
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2522
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2523
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2524
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2525
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2526
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2527
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2528
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2529
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2530
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2531
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2532
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2533
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2534
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2535
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2536
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2537
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2538
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2539
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2540
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2541
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2542
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2543
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2544
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2545
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2546
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2547
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2548
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2549
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2550
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2551
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2552
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2553
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2554
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2555
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2556
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2557
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2558
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2559

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
