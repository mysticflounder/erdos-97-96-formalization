/-
Generated packed-source bridge for verified middle chunk 041.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk041_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h2624 : ((!((rowBit rows 0 11 5 && rowBit rows 0 11 10)) || ((rankAtom ranks 55 == rankAtom ranks 75)))) = true)
    (h2625 : ((!((rowBit rows 0 11 5 && rowBit rows 0 11 12)) || ((rankAtom ranks 55 == rankAtom ranks 77)))) = true)
    (h2626 : ((!((rowBit rows 0 11 6 && rowBit rows 0 11 7)) || ((rankAtom ranks 61 == rankAtom ranks 66)))) = true)
    (h2627 : ((!((rowBit rows 0 11 6 && rowBit rows 0 11 8)) || ((rankAtom ranks 61 == rankAtom ranks 70)))) = true)
    (h2628 : ((!((rowBit rows 0 11 6 && rowBit rows 0 11 9)) || ((rankAtom ranks 61 == rankAtom ranks 73)))) = true)
    (h2629 : ((!((rowBit rows 0 11 6 && rowBit rows 0 11 10)) || ((rankAtom ranks 61 == rankAtom ranks 75)))) = true)
    (h2630 : ((!((rowBit rows 0 11 6 && rowBit rows 0 11 12)) || ((rankAtom ranks 61 == rankAtom ranks 77)))) = true)
    (h2631 : ((!((rowBit rows 0 11 7 && rowBit rows 0 11 8)) || ((rankAtom ranks 66 == rankAtom ranks 70)))) = true)
    (h2632 : ((!((rowBit rows 0 11 7 && rowBit rows 0 11 9)) || ((rankAtom ranks 66 == rankAtom ranks 73)))) = true)
    (h2633 : ((!((rowBit rows 0 11 7 && rowBit rows 0 11 10)) || ((rankAtom ranks 66 == rankAtom ranks 75)))) = true)
    (h2634 : ((!((rowBit rows 0 11 7 && rowBit rows 0 11 12)) || ((rankAtom ranks 66 == rankAtom ranks 77)))) = true)
    (h2635 : ((!((rowBit rows 0 11 8 && rowBit rows 0 11 9)) || ((rankAtom ranks 70 == rankAtom ranks 73)))) = true)
    (h2636 : ((!((rowBit rows 0 11 8 && rowBit rows 0 11 10)) || ((rankAtom ranks 70 == rankAtom ranks 75)))) = true)
    (h2637 : ((!((rowBit rows 0 11 8 && rowBit rows 0 11 12)) || ((rankAtom ranks 70 == rankAtom ranks 77)))) = true)
    (h2638 : ((!((rowBit rows 0 11 9 && rowBit rows 0 11 10)) || ((rankAtom ranks 73 == rankAtom ranks 75)))) = true)
    (h2639 : ((!((rowBit rows 0 11 9 && rowBit rows 0 11 12)) || ((rankAtom ranks 73 == rankAtom ranks 77)))) = true)
    (h2640 : ((!((rowBit rows 0 11 10 && rowBit rows 0 11 12)) || ((rankAtom ranks 75 == rankAtom ranks 77)))) = true)
    (h2641 : ((!((rowBit rows 0 12 0 && rowBit rows 0 12 1)) || ((rankAtom ranks 11 == rankAtom ranks 22)))) = true)
    (h2642 : ((!((rowBit rows 0 12 0 && rowBit rows 0 12 3)) || ((rankAtom ranks 11 == rankAtom ranks 41)))) = true)
    (h2643 : ((!((rowBit rows 0 12 0 && rowBit rows 0 12 4)) || ((rankAtom ranks 11 == rankAtom ranks 49)))) = true)
    (h2644 : ((!((rowBit rows 0 12 0 && rowBit rows 0 12 5)) || ((rankAtom ranks 11 == rankAtom ranks 56)))) = true)
    (h2645 : ((!((rowBit rows 0 12 0 && rowBit rows 0 12 7)) || ((rankAtom ranks 11 == rankAtom ranks 67)))) = true)
    (h2646 : ((!((rowBit rows 0 12 0 && rowBit rows 0 12 11)) || ((rankAtom ranks 11 == rankAtom ranks 77)))) = true)
    (h2647 : ((!((rowBit rows 0 12 1 && rowBit rows 0 12 2)) || ((rankAtom ranks 22 == rankAtom ranks 32)))) = true)
    (h2648 : ((!((rowBit rows 0 12 1 && rowBit rows 0 12 3)) || ((rankAtom ranks 22 == rankAtom ranks 41)))) = true)
    (h2649 : ((!((rowBit rows 0 12 1 && rowBit rows 0 12 4)) || ((rankAtom ranks 22 == rankAtom ranks 49)))) = true)
    (h2650 : ((!((rowBit rows 0 12 1 && rowBit rows 0 12 5)) || ((rankAtom ranks 22 == rankAtom ranks 56)))) = true)
    (h2651 : ((!((rowBit rows 0 12 1 && rowBit rows 0 12 6)) || ((rankAtom ranks 22 == rankAtom ranks 62)))) = true)
    (h2652 : ((!((rowBit rows 0 12 1 && rowBit rows 0 12 7)) || ((rankAtom ranks 22 == rankAtom ranks 67)))) = true)
    (h2653 : ((!((rowBit rows 0 12 2 && rowBit rows 0 12 3)) || ((rankAtom ranks 32 == rankAtom ranks 41)))) = true)
    (h2654 : ((!((rowBit rows 0 12 2 && rowBit rows 0 12 4)) || ((rankAtom ranks 32 == rankAtom ranks 49)))) = true)
    (h2655 : ((!((rowBit rows 0 12 2 && rowBit rows 0 12 5)) || ((rankAtom ranks 32 == rankAtom ranks 56)))) = true)
    (h2656 : ((!((rowBit rows 0 12 2 && rowBit rows 0 12 7)) || ((rankAtom ranks 32 == rankAtom ranks 67)))) = true)
    (h2657 : ((!((rowBit rows 0 12 3 && rowBit rows 0 12 4)) || ((rankAtom ranks 41 == rankAtom ranks 49)))) = true)
    (h2658 : ((!((rowBit rows 0 12 3 && rowBit rows 0 12 5)) || ((rankAtom ranks 41 == rankAtom ranks 56)))) = true)
    (h2659 : ((!((rowBit rows 0 12 3 && rowBit rows 0 12 11)) || ((rankAtom ranks 41 == rankAtom ranks 77)))) = true)
    (h2660 : ((!((rowBit rows 0 12 4 && rowBit rows 0 12 6)) || ((rankAtom ranks 49 == rankAtom ranks 62)))) = true)
    (h2661 : ((!((rowBit rows 0 12 4 && rowBit rows 0 12 10)) || ((rankAtom ranks 49 == rankAtom ranks 76)))) = true)
    (h2662 : ((!((rowBit rows 0 12 4 && rowBit rows 0 12 11)) || ((rankAtom ranks 49 == rankAtom ranks 77)))) = true)
    (h2663 : ((!((rowBit rows 0 12 5 && rowBit rows 0 12 6)) || ((rankAtom ranks 56 == rankAtom ranks 62)))) = true)
    (h2664 : ((!((rowBit rows 0 12 5 && rowBit rows 0 12 7)) || ((rankAtom ranks 56 == rankAtom ranks 67)))) = true)
    (h2665 : ((!((rowBit rows 0 12 5 && rowBit rows 0 12 8)) || ((rankAtom ranks 56 == rankAtom ranks 71)))) = true)
    (h2666 : ((!((rowBit rows 0 12 5 && rowBit rows 0 12 9)) || ((rankAtom ranks 56 == rankAtom ranks 74)))) = true)
    (h2667 : ((!((rowBit rows 0 12 5 && rowBit rows 0 12 10)) || ((rankAtom ranks 56 == rankAtom ranks 76)))) = true)
    (h2668 : ((!((rowBit rows 0 12 5 && rowBit rows 0 12 11)) || ((rankAtom ranks 56 == rankAtom ranks 77)))) = true)
    (h2669 : ((!((rowBit rows 0 12 6 && rowBit rows 0 12 9)) || ((rankAtom ranks 62 == rankAtom ranks 74)))) = true)
    (h2670 : ((!((rowBit rows 0 12 6 && rowBit rows 0 12 10)) || ((rankAtom ranks 62 == rankAtom ranks 76)))) = true)
    (h2671 : ((!((rowBit rows 0 12 6 && rowBit rows 0 12 11)) || ((rankAtom ranks 62 == rankAtom ranks 77)))) = true)
    (h2672 : ((!((rowBit rows 0 12 7 && rowBit rows 0 12 10)) || ((rankAtom ranks 67 == rankAtom ranks 76)))) = true)
    (h2673 : ((!((rowBit rows 0 12 7 && rowBit rows 0 12 11)) || ((rankAtom ranks 67 == rankAtom ranks 77)))) = true)
    (h2674 : ((!((rowBit rows 0 12 8 && rowBit rows 0 12 9)) || ((rankAtom ranks 71 == rankAtom ranks 74)))) = true)
    (h2675 : ((!((rowBit rows 1 1 10 && rowBit rows 1 1 11)) || ((rankAtom ranks 20 == rankAtom ranks 21)))) = true)
    (h2676 : ((!((rowBit rows 1 2 4 && rowBit rows 1 2 5)) || ((rankAtom ranks 24 == rankAtom ranks 25)))) = true)
    (h2677 : ((!((rowBit rows 1 2 10 && rowBit rows 1 2 11)) || ((rankAtom ranks 30 == rankAtom ranks 31)))) = true)
    (h2678 : ((!((rowBit rows 1 3 10 && rowBit rows 1 3 11)) || ((rankAtom ranks 39 == rankAtom ranks 40)))) = true)
    (h2679 : ((!((rowBit rows 1 3 10 && rowBit rows 1 3 12)) || ((rankAtom ranks 39 == rankAtom ranks 41)))) = true)
    (h2680 : ((!((rowBit rows 1 4 10 && rowBit rows 1 4 11)) || ((rankAtom ranks 47 == rankAtom ranks 48)))) = true)
    (h2681 : ((!((rowBit rows 1 4 10 && rowBit rows 1 4 12)) || ((rankAtom ranks 47 == rankAtom ranks 49)))) = true)
    (h2682 : ((!((rowBit rows 1 5 7 && rowBit rows 1 5 8)) || ((rankAtom ranks 51 == rankAtom ranks 52)))) = true)
    (h2683 : ((!((rowBit rows 1 5 10 && rowBit rows 1 5 11)) || ((rankAtom ranks 54 == rankAtom ranks 55)))) = true)
    (h2684 : ((!((rowBit rows 1 5 10 && rowBit rows 1 5 12)) || ((rankAtom ranks 54 == rankAtom ranks 56)))) = true)
    (h2685 : ((!((rowBit rows 1 6 3 && rowBit rows 1 6 4)) || ((rankAtom ranks 35 == rankAtom ranks 43)))) = true)
    (h2686 : ((!((rowBit rows 1 7 3 && rowBit rows 1 7 4)) || ((rankAtom ranks 36 == rankAtom ranks 44)))) = true)
    (h2687 : ((!((rowBit rows 1 8 0 && rowBit rows 1 8 4)) || ((rankAtom ranks 7 == rankAtom ranks 45)))) = true) :
    ∀ item ∈ sourceChunk041Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk041Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2624
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2625
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2626
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2627
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2628
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2629
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2630
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2631
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2632
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2633
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2634
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2635
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2636
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2637
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2638
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2639
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2640
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2641
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2642
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2643
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2644
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2645
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2646
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2647
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2648
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2649
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2650
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2651
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2652
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2653
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2654
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2655
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2656
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2657
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2658
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2659
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2660
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2661
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2662
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2663
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2664
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2665
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2666
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2667
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2668
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2669
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2670
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2671
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2672
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2673
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2674
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2675
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2676
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2677
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2678
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2679
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2680
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2681
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2682
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2683
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2684
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2685
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2686
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2687

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
