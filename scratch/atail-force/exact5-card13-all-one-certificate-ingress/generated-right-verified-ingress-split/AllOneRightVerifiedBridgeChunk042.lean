/-
Generated packed-source bridge for verified right chunk 042.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk042_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h2688 : ((!((rowBit rows 1 8 0 && rowBit rows 1 8 6)) || ((rankAtom ranks 7 == rankAtom ranks 58)))) = true)
    (h2689 : ((!((rowBit rows 1 8 0 && rowBit rows 1 8 7)) || ((rankAtom ranks 7 == rankAtom ranks 63)))) = true)
    (h2690 : ((!((rowBit rows 1 8 4 && rowBit rows 1 8 10)) || ((rankAtom ranks 45 == rankAtom ranks 69)))) = true)
    (h2691 : ((!((rowBit rows 1 8 4 && rowBit rows 1 8 12)) || ((rankAtom ranks 45 == rankAtom ranks 71)))) = true)
    (h2692 : ((!((rowBit rows 1 8 6 && rowBit rows 1 8 9)) || ((rankAtom ranks 58 == rankAtom ranks 68)))) = true)
    (h2693 : ((!((rowBit rows 1 8 6 && rowBit rows 1 8 10)) || ((rankAtom ranks 58 == rankAtom ranks 69)))) = true)
    (h2694 : ((!((rowBit rows 1 8 6 && rowBit rows 1 8 11)) || ((rankAtom ranks 58 == rankAtom ranks 70)))) = true)
    (h2695 : ((!((rowBit rows 1 8 6 && rowBit rows 1 8 12)) || ((rankAtom ranks 58 == rankAtom ranks 71)))) = true)
    (h2696 : ((!((rowBit rows 1 8 7 && rowBit rows 1 8 10)) || ((rankAtom ranks 63 == rankAtom ranks 69)))) = true)
    (h2697 : ((!((rowBit rows 1 8 7 && rowBit rows 1 8 11)) || ((rankAtom ranks 63 == rankAtom ranks 70)))) = true)
    (h2698 : ((!((rowBit rows 1 8 7 && rowBit rows 1 8 12)) || ((rankAtom ranks 63 == rankAtom ranks 71)))) = true)
    (h2699 : ((!((rowBit rows 2 1 10 && rowBit rows 2 1 11)) || ((rankAtom ranks 20 == rankAtom ranks 21)))) = true)
    (h2700 : ((!((rowBit rows 2 2 4 && rowBit rows 2 2 5)) || ((rankAtom ranks 24 == rankAtom ranks 25)))) = true)
    (h2701 : ((!((rowBit rows 2 2 10 && rowBit rows 2 2 11)) || ((rankAtom ranks 30 == rankAtom ranks 31)))) = true)
    (h2702 : ((!((rowBit rows 2 3 10 && rowBit rows 2 3 11)) || ((rankAtom ranks 39 == rankAtom ranks 40)))) = true)
    (h2703 : ((!((rowBit rows 2 3 10 && rowBit rows 2 3 12)) || ((rankAtom ranks 39 == rankAtom ranks 41)))) = true)
    (h2704 : ((!((rowBit rows 2 4 10 && rowBit rows 2 4 11)) || ((rankAtom ranks 47 == rankAtom ranks 48)))) = true)
    (h2705 : ((!((rowBit rows 2 5 7 && rowBit rows 2 5 8)) || ((rankAtom ranks 51 == rankAtom ranks 52)))) = true)
    (h2706 : ((!((rowBit rows 2 5 10 && rowBit rows 2 5 11)) || ((rankAtom ranks 54 == rankAtom ranks 55)))) = true)
    (h2707 : ((!((rowBit rows 2 5 10 && rowBit rows 2 5 12)) || ((rankAtom ranks 54 == rankAtom ranks 56)))) = true)
    (h2708 : ((!((rowBit rows 2 6 1 && rowBit rows 2 6 4)) || ((rankAtom ranks 16 == rankAtom ranks 43)))) = true)
    (h2709 : ((!((rowBit rows 2 6 3 && rowBit rows 2 6 4)) || ((rankAtom ranks 35 == rankAtom ranks 43)))) = true)
    (h2710 : ((!((rowBit rows 2 6 4 && rowBit rows 2 6 5)) || ((rankAtom ranks 43 == rankAtom ranks 50)))) = true)
    (h2711 : ((!((rowBit rows 2 7 1 && rowBit rows 2 7 4)) || ((rankAtom ranks 17 == rankAtom ranks 44)))) = true)
    (h2712 : ((!((rowBit rows 2 7 3 && rowBit rows 2 7 4)) || ((rankAtom ranks 36 == rankAtom ranks 44)))) = true)
    (h2713 : ((!((rowBit rows 2 7 4 && rowBit rows 2 7 5)) || ((rankAtom ranks 44 == rankAtom ranks 51)))) = true)
    (h2714 : ((!((rowBit rows 2 8 5 && rowBit rows 2 8 10)) || ((rankAtom ranks 52 == rankAtom ranks 69)))) = true)
    (h2715 : ((!((rowBit rows 2 8 7 && rowBit rows 2 8 9)) || ((rankAtom ranks 63 == rankAtom ranks 68)))) = true)
    (h2716 : ((!((rowBit rows 2 9 0 && rowBit rows 2 9 1)) || ((rankAtom ranks 8 == rankAtom ranks 19)))) = true)
    (h2717 : ((!((rowBit rows 2 9 0 && rowBit rows 2 9 2)) || ((rankAtom ranks 8 == rankAtom ranks 29)))) = true)
    (h2718 : ((!((rowBit rows 2 9 0 && rowBit rows 2 9 3)) || ((rankAtom ranks 8 == rankAtom ranks 38)))) = true)
    (h2719 : ((!((rowBit rows 2 9 0 && rowBit rows 2 9 4)) || ((rankAtom ranks 8 == rankAtom ranks 46)))) = true)
    (h2720 : ((!((rowBit rows 2 9 0 && rowBit rows 2 9 5)) || ((rankAtom ranks 8 == rankAtom ranks 53)))) = true)
    (h2721 : ((!((rowBit rows 2 9 0 && rowBit rows 2 9 6)) || ((rankAtom ranks 8 == rankAtom ranks 59)))) = true)
    (h2722 : ((!((rowBit rows 2 9 0 && rowBit rows 2 9 7)) || ((rankAtom ranks 8 == rankAtom ranks 64)))) = true)
    (h2723 : ((!((rowBit rows 2 9 0 && rowBit rows 2 9 8)) || ((rankAtom ranks 8 == rankAtom ranks 68)))) = true)
    (h2724 : ((!((rowBit rows 2 9 0 && rowBit rows 2 9 10)) || ((rankAtom ranks 8 == rankAtom ranks 72)))) = true)
    (h2725 : ((!((rowBit rows 2 9 0 && rowBit rows 2 9 11)) || ((rankAtom ranks 8 == rankAtom ranks 73)))) = true)
    (h2726 : ((!((rowBit rows 2 9 0 && rowBit rows 2 9 12)) || ((rankAtom ranks 8 == rankAtom ranks 74)))) = true)
    (h2727 : ((!((rowBit rows 2 9 1 && rowBit rows 2 9 2)) || ((rankAtom ranks 19 == rankAtom ranks 29)))) = true)
    (h2728 : ((!((rowBit rows 2 9 1 && rowBit rows 2 9 3)) || ((rankAtom ranks 19 == rankAtom ranks 38)))) = true)
    (h2729 : ((!((rowBit rows 2 9 1 && rowBit rows 2 9 4)) || ((rankAtom ranks 19 == rankAtom ranks 46)))) = true)
    (h2730 : ((!((rowBit rows 2 9 1 && rowBit rows 2 9 5)) || ((rankAtom ranks 19 == rankAtom ranks 53)))) = true)
    (h2731 : ((!((rowBit rows 2 9 1 && rowBit rows 2 9 6)) || ((rankAtom ranks 19 == rankAtom ranks 59)))) = true)
    (h2732 : ((!((rowBit rows 2 9 1 && rowBit rows 2 9 7)) || ((rankAtom ranks 19 == rankAtom ranks 64)))) = true)
    (h2733 : ((!((rowBit rows 2 9 1 && rowBit rows 2 9 8)) || ((rankAtom ranks 19 == rankAtom ranks 68)))) = true)
    (h2734 : ((!((rowBit rows 2 9 1 && rowBit rows 2 9 10)) || ((rankAtom ranks 19 == rankAtom ranks 72)))) = true)
    (h2735 : ((!((rowBit rows 2 9 1 && rowBit rows 2 9 11)) || ((rankAtom ranks 19 == rankAtom ranks 73)))) = true)
    (h2736 : ((!((rowBit rows 2 9 1 && rowBit rows 2 9 12)) || ((rankAtom ranks 19 == rankAtom ranks 74)))) = true)
    (h2737 : ((!((rowBit rows 2 9 2 && rowBit rows 2 9 4)) || ((rankAtom ranks 29 == rankAtom ranks 46)))) = true)
    (h2738 : ((!((rowBit rows 2 9 2 && rowBit rows 2 9 5)) || ((rankAtom ranks 29 == rankAtom ranks 53)))) = true)
    (h2739 : ((!((rowBit rows 2 9 2 && rowBit rows 2 9 6)) || ((rankAtom ranks 29 == rankAtom ranks 59)))) = true)
    (h2740 : ((!((rowBit rows 2 9 2 && rowBit rows 2 9 7)) || ((rankAtom ranks 29 == rankAtom ranks 64)))) = true)
    (h2741 : ((!((rowBit rows 2 9 2 && rowBit rows 2 9 8)) || ((rankAtom ranks 29 == rankAtom ranks 68)))) = true)
    (h2742 : ((!((rowBit rows 2 9 2 && rowBit rows 2 9 10)) || ((rankAtom ranks 29 == rankAtom ranks 72)))) = true)
    (h2743 : ((!((rowBit rows 2 9 2 && rowBit rows 2 9 11)) || ((rankAtom ranks 29 == rankAtom ranks 73)))) = true)
    (h2744 : ((!((rowBit rows 2 9 2 && rowBit rows 2 9 12)) || ((rankAtom ranks 29 == rankAtom ranks 74)))) = true)
    (h2745 : ((!((rowBit rows 2 9 3 && rowBit rows 2 9 4)) || ((rankAtom ranks 38 == rankAtom ranks 46)))) = true)
    (h2746 : ((!((rowBit rows 2 9 3 && rowBit rows 2 9 5)) || ((rankAtom ranks 38 == rankAtom ranks 53)))) = true)
    (h2747 : ((!((rowBit rows 2 9 3 && rowBit rows 2 9 6)) || ((rankAtom ranks 38 == rankAtom ranks 59)))) = true)
    (h2748 : ((!((rowBit rows 2 9 3 && rowBit rows 2 9 7)) || ((rankAtom ranks 38 == rankAtom ranks 64)))) = true)
    (h2749 : ((!((rowBit rows 2 9 3 && rowBit rows 2 9 8)) || ((rankAtom ranks 38 == rankAtom ranks 68)))) = true)
    (h2750 : ((!((rowBit rows 2 9 3 && rowBit rows 2 9 10)) || ((rankAtom ranks 38 == rankAtom ranks 72)))) = true)
    (h2751 : ((!((rowBit rows 2 9 3 && rowBit rows 2 9 11)) || ((rankAtom ranks 38 == rankAtom ranks 73)))) = true) :
    ∀ item ∈ sourceChunk042Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk042Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2688
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2689
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2690
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2691
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2692
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2693
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2694
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2695
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2696
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2697
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2698
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2699
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2700
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2701
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2702
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2703
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2704
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2705
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2706
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2707
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2708
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2709
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2710
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2711
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2712
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2713
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2714
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2715
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2716
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2717
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2718
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2719
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2720
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2721
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2722
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2723
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2724
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2725
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2726
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2727
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2728
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2729
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2730
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2731
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2732
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2733
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2734
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2735
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2736
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2737
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2738
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2739
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2740
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2741
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2742
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2743
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2744
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2745
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2746
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2747
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2748
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2749
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2750
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2751

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
