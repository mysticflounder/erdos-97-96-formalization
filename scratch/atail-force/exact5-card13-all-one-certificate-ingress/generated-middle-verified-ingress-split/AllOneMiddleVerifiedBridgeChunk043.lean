/-
Generated packed-source bridge for verified middle chunk 043.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk043_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h2752 : ((!((rowBit rows 2 9 3 && rowBit rows 2 9 12)) || ((rankAtom ranks 38 == rankAtom ranks 74)))) = true)
    (h2753 : ((!((rowBit rows 2 9 4 && rowBit rows 2 9 5)) || ((rankAtom ranks 46 == rankAtom ranks 53)))) = true)
    (h2754 : ((!((rowBit rows 2 9 4 && rowBit rows 2 9 6)) || ((rankAtom ranks 46 == rankAtom ranks 59)))) = true)
    (h2755 : ((!((rowBit rows 2 9 4 && rowBit rows 2 9 7)) || ((rankAtom ranks 46 == rankAtom ranks 64)))) = true)
    (h2756 : ((!((rowBit rows 2 9 4 && rowBit rows 2 9 8)) || ((rankAtom ranks 46 == rankAtom ranks 68)))) = true)
    (h2757 : ((!((rowBit rows 2 9 4 && rowBit rows 2 9 10)) || ((rankAtom ranks 46 == rankAtom ranks 72)))) = true)
    (h2758 : ((!((rowBit rows 2 9 4 && rowBit rows 2 9 11)) || ((rankAtom ranks 46 == rankAtom ranks 73)))) = true)
    (h2759 : ((!((rowBit rows 2 9 4 && rowBit rows 2 9 12)) || ((rankAtom ranks 46 == rankAtom ranks 74)))) = true)
    (h2760 : ((!((rowBit rows 2 9 5 && rowBit rows 2 9 6)) || ((rankAtom ranks 53 == rankAtom ranks 59)))) = true)
    (h2761 : ((!((rowBit rows 2 9 5 && rowBit rows 2 9 7)) || ((rankAtom ranks 53 == rankAtom ranks 64)))) = true)
    (h2762 : ((!((rowBit rows 2 9 5 && rowBit rows 2 9 8)) || ((rankAtom ranks 53 == rankAtom ranks 68)))) = true)
    (h2763 : ((!((rowBit rows 2 9 5 && rowBit rows 2 9 10)) || ((rankAtom ranks 53 == rankAtom ranks 72)))) = true)
    (h2764 : ((!((rowBit rows 2 9 5 && rowBit rows 2 9 11)) || ((rankAtom ranks 53 == rankAtom ranks 73)))) = true)
    (h2765 : ((!((rowBit rows 2 9 5 && rowBit rows 2 9 12)) || ((rankAtom ranks 53 == rankAtom ranks 74)))) = true)
    (h2766 : ((!((rowBit rows 2 9 6 && rowBit rows 2 9 7)) || ((rankAtom ranks 59 == rankAtom ranks 64)))) = true)
    (h2767 : ((!((rowBit rows 2 9 6 && rowBit rows 2 9 8)) || ((rankAtom ranks 59 == rankAtom ranks 68)))) = true)
    (h2768 : ((!((rowBit rows 2 9 6 && rowBit rows 2 9 10)) || ((rankAtom ranks 59 == rankAtom ranks 72)))) = true)
    (h2769 : ((!((rowBit rows 2 9 6 && rowBit rows 2 9 11)) || ((rankAtom ranks 59 == rankAtom ranks 73)))) = true)
    (h2770 : ((!((rowBit rows 2 9 6 && rowBit rows 2 9 12)) || ((rankAtom ranks 59 == rankAtom ranks 74)))) = true)
    (h2771 : ((!((rowBit rows 2 9 7 && rowBit rows 2 9 8)) || ((rankAtom ranks 64 == rankAtom ranks 68)))) = true)
    (h2772 : ((!((rowBit rows 2 9 7 && rowBit rows 2 9 10)) || ((rankAtom ranks 64 == rankAtom ranks 72)))) = true)
    (h2773 : ((!((rowBit rows 2 9 7 && rowBit rows 2 9 11)) || ((rankAtom ranks 64 == rankAtom ranks 73)))) = true)
    (h2774 : ((!((rowBit rows 2 9 7 && rowBit rows 2 9 12)) || ((rankAtom ranks 64 == rankAtom ranks 74)))) = true)
    (h2775 : ((!((rowBit rows 2 9 8 && rowBit rows 2 9 10)) || ((rankAtom ranks 68 == rankAtom ranks 72)))) = true)
    (h2776 : ((!((rowBit rows 2 9 8 && rowBit rows 2 9 11)) || ((rankAtom ranks 68 == rankAtom ranks 73)))) = true)
    (h2777 : ((!((rowBit rows 2 9 8 && rowBit rows 2 9 12)) || ((rankAtom ranks 68 == rankAtom ranks 74)))) = true)
    (h2778 : ((!((rowBit rows 2 9 10 && rowBit rows 2 9 11)) || ((rankAtom ranks 72 == rankAtom ranks 73)))) = true)
    (h2779 : ((!((rowBit rows 2 9 10 && rowBit rows 2 9 12)) || ((rankAtom ranks 72 == rankAtom ranks 74)))) = true)
    (h2780 : ((!((rowBit rows 2 9 11 && rowBit rows 2 9 12)) || ((rankAtom ranks 73 == rankAtom ranks 74)))) = true)
    (h2781 : ((!((rowBit rows 2 10 1 && rowBit rows 2 10 3)) || ((rankAtom ranks 20 == rankAtom ranks 39)))) = true)
    (h2782 : ((!((rowBit rows 2 11 1 && rowBit rows 2 11 3)) || ((rankAtom ranks 21 == rankAtom ranks 40)))) = true)
    (h2783 : ((!((rowBit rows 2 12 1 && rowBit rows 2 12 3)) || ((rankAtom ranks 22 == rankAtom ranks 41)))) = true)
    (h2784 : ((!((firstRowBit b1 0 && firstRowBit b1 5)) || ((rankAtom ranks 3 == rankAtom ranks 42)))) = true)
    (h2785 : ((!((firstRowBit b1 0 && firstRowBit b1 6)) || ((rankAtom ranks 3 == rankAtom ranks 43)))) = true)
    (h2786 : ((!((firstRowBit b1 0 && firstRowBit b1 7)) || ((rankAtom ranks 3 == rankAtom ranks 44)))) = true)
    (h2787 : ((!((firstRowBit b1 0 && firstRowBit b1 8)) || ((rankAtom ranks 3 == rankAtom ranks 45)))) = true)
    (h2788 : ((!((firstRowBit b1 0 && firstRowBit b1 9)) || ((rankAtom ranks 3 == rankAtom ranks 46)))) = true)
    (h2789 : ((!((firstRowBit b1 0 && firstRowBit b1 10)) || ((rankAtom ranks 3 == rankAtom ranks 47)))) = true)
    (h2790 : ((!((firstRowBit b1 0 && firstRowBit b1 11)) || ((rankAtom ranks 3 == rankAtom ranks 48)))) = true)
    (h2791 : ((!((firstRowBit b1 0 && firstRowBit b1 12)) || ((rankAtom ranks 3 == rankAtom ranks 49)))) = true)
    (h2792 : ((!((firstRowBit b1 1 && firstRowBit b1 5)) || ((rankAtom ranks 14 == rankAtom ranks 42)))) = true)
    (h2793 : ((!((firstRowBit b1 1 && firstRowBit b1 6)) || ((rankAtom ranks 14 == rankAtom ranks 43)))) = true)
    (h2794 : ((!((firstRowBit b1 1 && firstRowBit b1 7)) || ((rankAtom ranks 14 == rankAtom ranks 44)))) = true)
    (h2795 : ((!((firstRowBit b1 1 && firstRowBit b1 8)) || ((rankAtom ranks 14 == rankAtom ranks 45)))) = true)
    (h2796 : ((!((firstRowBit b1 1 && firstRowBit b1 9)) || ((rankAtom ranks 14 == rankAtom ranks 46)))) = true)
    (h2797 : ((!((firstRowBit b1 1 && firstRowBit b1 10)) || ((rankAtom ranks 14 == rankAtom ranks 47)))) = true)
    (h2798 : ((!((firstRowBit b1 1 && firstRowBit b1 11)) || ((rankAtom ranks 14 == rankAtom ranks 48)))) = true)
    (h2799 : ((!((firstRowBit b1 1 && firstRowBit b1 12)) || ((rankAtom ranks 14 == rankAtom ranks 49)))) = true)
    (h2800 : ((!((firstRowBit b1 2 && firstRowBit b1 5)) || ((rankAtom ranks 24 == rankAtom ranks 42)))) = true)
    (h2801 : ((!((firstRowBit b1 2 && firstRowBit b1 6)) || ((rankAtom ranks 24 == rankAtom ranks 43)))) = true)
    (h2802 : ((!((firstRowBit b1 2 && firstRowBit b1 7)) || ((rankAtom ranks 24 == rankAtom ranks 44)))) = true)
    (h2803 : ((!((firstRowBit b1 2 && firstRowBit b1 8)) || ((rankAtom ranks 24 == rankAtom ranks 45)))) = true)
    (h2804 : ((!((firstRowBit b1 2 && firstRowBit b1 9)) || ((rankAtom ranks 24 == rankAtom ranks 46)))) = true)
    (h2805 : ((!((firstRowBit b1 2 && firstRowBit b1 10)) || ((rankAtom ranks 24 == rankAtom ranks 47)))) = true)
    (h2806 : ((!((firstRowBit b1 2 && firstRowBit b1 11)) || ((rankAtom ranks 24 == rankAtom ranks 48)))) = true)
    (h2807 : ((!((firstRowBit b1 2 && firstRowBit b1 12)) || ((rankAtom ranks 24 == rankAtom ranks 49)))) = true)
    (h2808 : ((!((firstRowBit b1 3 && firstRowBit b1 5)) || ((rankAtom ranks 33 == rankAtom ranks 42)))) = true)
    (h2809 : ((!((firstRowBit b1 3 && firstRowBit b1 6)) || ((rankAtom ranks 33 == rankAtom ranks 43)))) = true)
    (h2810 : ((!((firstRowBit b1 3 && firstRowBit b1 7)) || ((rankAtom ranks 33 == rankAtom ranks 44)))) = true)
    (h2811 : ((!((firstRowBit b1 3 && firstRowBit b1 8)) || ((rankAtom ranks 33 == rankAtom ranks 45)))) = true)
    (h2812 : ((!((firstRowBit b1 3 && firstRowBit b1 9)) || ((rankAtom ranks 33 == rankAtom ranks 46)))) = true)
    (h2813 : ((!((firstRowBit b1 3 && firstRowBit b1 10)) || ((rankAtom ranks 33 == rankAtom ranks 47)))) = true)
    (h2814 : ((!((firstRowBit b1 3 && firstRowBit b1 11)) || ((rankAtom ranks 33 == rankAtom ranks 48)))) = true)
    (h2815 : ((!((firstRowBit b1 3 && firstRowBit b1 12)) || ((rankAtom ranks 33 == rankAtom ranks 49)))) = true) :
    ∀ item ∈ sourceChunk043Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk043Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2752
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2753
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2754
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2755
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2756
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2757
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2758
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2759
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2760
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2761
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2762
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2763
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2764
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2765
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2766
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2767
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2768
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2769
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2770
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2771
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2772
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2773
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2774
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2775
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2776
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2777
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2778
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2779
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2780
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2781
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2782
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2783
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2784
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2785
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2786
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2787
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2788
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2789
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2790
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2791
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2792
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2793
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2794
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2795
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2796
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2797
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2798
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2799
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2800
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2801
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2802
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2803
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2804
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2805
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2806
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2807
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2808
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2809
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2810
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2811
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2812
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2813
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2814
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2815

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
