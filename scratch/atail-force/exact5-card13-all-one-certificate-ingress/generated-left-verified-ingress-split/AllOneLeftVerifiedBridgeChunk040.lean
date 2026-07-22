/-
Generated packed-source bridge for verified left chunk 040.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk040_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h2560 : ((!((rowBit rows 0 10 6 && rowBit rows 0 10 7)) || ((rankAtom ranks 60 == rankAtom ranks 65)))) = true)
    (h2561 : ((!((rowBit rows 0 10 6 && rowBit rows 0 10 8)) || ((rankAtom ranks 60 == rankAtom ranks 69)))) = true)
    (h2562 : ((!((rowBit rows 0 10 6 && rowBit rows 0 10 9)) || ((rankAtom ranks 60 == rankAtom ranks 72)))) = true)
    (h2563 : ((!((rowBit rows 0 10 6 && rowBit rows 0 10 11)) || ((rankAtom ranks 60 == rankAtom ranks 75)))) = true)
    (h2564 : ((!((rowBit rows 0 10 6 && rowBit rows 0 10 12)) || ((rankAtom ranks 60 == rankAtom ranks 76)))) = true)
    (h2565 : ((!((rowBit rows 0 10 7 && rowBit rows 0 10 8)) || ((rankAtom ranks 65 == rankAtom ranks 69)))) = true)
    (h2566 : ((!((rowBit rows 0 10 7 && rowBit rows 0 10 9)) || ((rankAtom ranks 65 == rankAtom ranks 72)))) = true)
    (h2567 : ((!((rowBit rows 0 10 7 && rowBit rows 0 10 11)) || ((rankAtom ranks 65 == rankAtom ranks 75)))) = true)
    (h2568 : ((!((rowBit rows 0 10 7 && rowBit rows 0 10 12)) || ((rankAtom ranks 65 == rankAtom ranks 76)))) = true)
    (h2569 : ((!((rowBit rows 0 10 8 && rowBit rows 0 10 9)) || ((rankAtom ranks 69 == rankAtom ranks 72)))) = true)
    (h2570 : ((!((rowBit rows 0 10 8 && rowBit rows 0 10 11)) || ((rankAtom ranks 69 == rankAtom ranks 75)))) = true)
    (h2571 : ((!((rowBit rows 0 10 8 && rowBit rows 0 10 12)) || ((rankAtom ranks 69 == rankAtom ranks 76)))) = true)
    (h2572 : ((!((rowBit rows 0 10 9 && rowBit rows 0 10 11)) || ((rankAtom ranks 72 == rankAtom ranks 75)))) = true)
    (h2573 : ((!((rowBit rows 0 10 9 && rowBit rows 0 10 12)) || ((rankAtom ranks 72 == rankAtom ranks 76)))) = true)
    (h2574 : ((!((rowBit rows 0 10 11 && rowBit rows 0 10 12)) || ((rankAtom ranks 75 == rankAtom ranks 76)))) = true)
    (h2575 : ((!((rowBit rows 0 11 0 && rowBit rows 0 11 1)) || ((rankAtom ranks 10 == rankAtom ranks 21)))) = true)
    (h2576 : ((!((rowBit rows 0 11 0 && rowBit rows 0 11 2)) || ((rankAtom ranks 10 == rankAtom ranks 31)))) = true)
    (h2577 : ((!((rowBit rows 0 11 0 && rowBit rows 0 11 3)) || ((rankAtom ranks 10 == rankAtom ranks 40)))) = true)
    (h2578 : ((!((rowBit rows 0 11 0 && rowBit rows 0 11 4)) || ((rankAtom ranks 10 == rankAtom ranks 48)))) = true)
    (h2579 : ((!((rowBit rows 0 11 0 && rowBit rows 0 11 5)) || ((rankAtom ranks 10 == rankAtom ranks 55)))) = true)
    (h2580 : ((!((rowBit rows 0 11 0 && rowBit rows 0 11 6)) || ((rankAtom ranks 10 == rankAtom ranks 61)))) = true)
    (h2581 : ((!((rowBit rows 0 11 0 && rowBit rows 0 11 7)) || ((rankAtom ranks 10 == rankAtom ranks 66)))) = true)
    (h2582 : ((!((rowBit rows 0 11 0 && rowBit rows 0 11 8)) || ((rankAtom ranks 10 == rankAtom ranks 70)))) = true)
    (h2583 : ((!((rowBit rows 0 11 0 && rowBit rows 0 11 9)) || ((rankAtom ranks 10 == rankAtom ranks 73)))) = true)
    (h2584 : ((!((rowBit rows 0 11 0 && rowBit rows 0 11 10)) || ((rankAtom ranks 10 == rankAtom ranks 75)))) = true)
    (h2585 : ((!((rowBit rows 0 11 0 && rowBit rows 0 11 12)) || ((rankAtom ranks 10 == rankAtom ranks 77)))) = true)
    (h2586 : ((!((rowBit rows 0 11 1 && rowBit rows 0 11 2)) || ((rankAtom ranks 21 == rankAtom ranks 31)))) = true)
    (h2587 : ((!((rowBit rows 0 11 1 && rowBit rows 0 11 3)) || ((rankAtom ranks 21 == rankAtom ranks 40)))) = true)
    (h2588 : ((!((rowBit rows 0 11 1 && rowBit rows 0 11 4)) || ((rankAtom ranks 21 == rankAtom ranks 48)))) = true)
    (h2589 : ((!((rowBit rows 0 11 1 && rowBit rows 0 11 5)) || ((rankAtom ranks 21 == rankAtom ranks 55)))) = true)
    (h2590 : ((!((rowBit rows 0 11 1 && rowBit rows 0 11 6)) || ((rankAtom ranks 21 == rankAtom ranks 61)))) = true)
    (h2591 : ((!((rowBit rows 0 11 1 && rowBit rows 0 11 7)) || ((rankAtom ranks 21 == rankAtom ranks 66)))) = true)
    (h2592 : ((!((rowBit rows 0 11 1 && rowBit rows 0 11 8)) || ((rankAtom ranks 21 == rankAtom ranks 70)))) = true)
    (h2593 : ((!((rowBit rows 0 11 1 && rowBit rows 0 11 9)) || ((rankAtom ranks 21 == rankAtom ranks 73)))) = true)
    (h2594 : ((!((rowBit rows 0 11 1 && rowBit rows 0 11 10)) || ((rankAtom ranks 21 == rankAtom ranks 75)))) = true)
    (h2595 : ((!((rowBit rows 0 11 1 && rowBit rows 0 11 12)) || ((rankAtom ranks 21 == rankAtom ranks 77)))) = true)
    (h2596 : ((!((rowBit rows 0 11 2 && rowBit rows 0 11 3)) || ((rankAtom ranks 31 == rankAtom ranks 40)))) = true)
    (h2597 : ((!((rowBit rows 0 11 2 && rowBit rows 0 11 4)) || ((rankAtom ranks 31 == rankAtom ranks 48)))) = true)
    (h2598 : ((!((rowBit rows 0 11 2 && rowBit rows 0 11 5)) || ((rankAtom ranks 31 == rankAtom ranks 55)))) = true)
    (h2599 : ((!((rowBit rows 0 11 2 && rowBit rows 0 11 6)) || ((rankAtom ranks 31 == rankAtom ranks 61)))) = true)
    (h2600 : ((!((rowBit rows 0 11 2 && rowBit rows 0 11 7)) || ((rankAtom ranks 31 == rankAtom ranks 66)))) = true)
    (h2601 : ((!((rowBit rows 0 11 2 && rowBit rows 0 11 8)) || ((rankAtom ranks 31 == rankAtom ranks 70)))) = true)
    (h2602 : ((!((rowBit rows 0 11 2 && rowBit rows 0 11 9)) || ((rankAtom ranks 31 == rankAtom ranks 73)))) = true)
    (h2603 : ((!((rowBit rows 0 11 2 && rowBit rows 0 11 10)) || ((rankAtom ranks 31 == rankAtom ranks 75)))) = true)
    (h2604 : ((!((rowBit rows 0 11 2 && rowBit rows 0 11 12)) || ((rankAtom ranks 31 == rankAtom ranks 77)))) = true)
    (h2605 : ((!((rowBit rows 0 11 3 && rowBit rows 0 11 4)) || ((rankAtom ranks 40 == rankAtom ranks 48)))) = true)
    (h2606 : ((!((rowBit rows 0 11 3 && rowBit rows 0 11 5)) || ((rankAtom ranks 40 == rankAtom ranks 55)))) = true)
    (h2607 : ((!((rowBit rows 0 11 3 && rowBit rows 0 11 6)) || ((rankAtom ranks 40 == rankAtom ranks 61)))) = true)
    (h2608 : ((!((rowBit rows 0 11 3 && rowBit rows 0 11 7)) || ((rankAtom ranks 40 == rankAtom ranks 66)))) = true)
    (h2609 : ((!((rowBit rows 0 11 3 && rowBit rows 0 11 8)) || ((rankAtom ranks 40 == rankAtom ranks 70)))) = true)
    (h2610 : ((!((rowBit rows 0 11 3 && rowBit rows 0 11 9)) || ((rankAtom ranks 40 == rankAtom ranks 73)))) = true)
    (h2611 : ((!((rowBit rows 0 11 3 && rowBit rows 0 11 10)) || ((rankAtom ranks 40 == rankAtom ranks 75)))) = true)
    (h2612 : ((!((rowBit rows 0 11 3 && rowBit rows 0 11 12)) || ((rankAtom ranks 40 == rankAtom ranks 77)))) = true)
    (h2613 : ((!((rowBit rows 0 11 4 && rowBit rows 0 11 5)) || ((rankAtom ranks 48 == rankAtom ranks 55)))) = true)
    (h2614 : ((!((rowBit rows 0 11 4 && rowBit rows 0 11 6)) || ((rankAtom ranks 48 == rankAtom ranks 61)))) = true)
    (h2615 : ((!((rowBit rows 0 11 4 && rowBit rows 0 11 7)) || ((rankAtom ranks 48 == rankAtom ranks 66)))) = true)
    (h2616 : ((!((rowBit rows 0 11 4 && rowBit rows 0 11 8)) || ((rankAtom ranks 48 == rankAtom ranks 70)))) = true)
    (h2617 : ((!((rowBit rows 0 11 4 && rowBit rows 0 11 9)) || ((rankAtom ranks 48 == rankAtom ranks 73)))) = true)
    (h2618 : ((!((rowBit rows 0 11 4 && rowBit rows 0 11 10)) || ((rankAtom ranks 48 == rankAtom ranks 75)))) = true)
    (h2619 : ((!((rowBit rows 0 11 4 && rowBit rows 0 11 12)) || ((rankAtom ranks 48 == rankAtom ranks 77)))) = true)
    (h2620 : ((!((rowBit rows 0 11 5 && rowBit rows 0 11 6)) || ((rankAtom ranks 55 == rankAtom ranks 61)))) = true)
    (h2621 : ((!((rowBit rows 0 11 5 && rowBit rows 0 11 7)) || ((rankAtom ranks 55 == rankAtom ranks 66)))) = true)
    (h2622 : ((!((rowBit rows 0 11 5 && rowBit rows 0 11 8)) || ((rankAtom ranks 55 == rankAtom ranks 70)))) = true)
    (h2623 : ((!((rowBit rows 0 11 5 && rowBit rows 0 11 9)) || ((rankAtom ranks 55 == rankAtom ranks 73)))) = true) :
    ∀ item ∈ sourceChunk040Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk040Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2560
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2561
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2562
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2563
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2564
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2565
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2566
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2567
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2568
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2569
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2570
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2571
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2572
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2573
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2574
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2575
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2576
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2577
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2578
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2579
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2580
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2581
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2582
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2583
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2584
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2585
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2586
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2587
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2588
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2589
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2590
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2591
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2592
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2593
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2594
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2595
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2596
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2597
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2598
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2599
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2600
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2601
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2602
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2603
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2604
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2605
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2606
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2607
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2608
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2609
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2610
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2611
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2612
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2613
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2614
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2615
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2616
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2617
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2618
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2619
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2620
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2621
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2622
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2623

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
