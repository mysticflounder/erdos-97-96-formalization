/-
Generated packed-source bridge for verified left chunk 044.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk044_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h2816 : ((!((firstRowBit b1 5 && firstRowBit b1 9)) || ((rankAtom ranks 42 == rankAtom ranks 46)))) = true)
    (h2817 : ((!((firstRowBit b1 5 && firstRowBit b1 10)) || ((rankAtom ranks 42 == rankAtom ranks 47)))) = true)
    (h2818 : ((!((firstRowBit b1 5 && firstRowBit b1 11)) || ((rankAtom ranks 42 == rankAtom ranks 48)))) = true)
    (h2819 : ((!((firstRowBit b1 5 && firstRowBit b1 12)) || ((rankAtom ranks 42 == rankAtom ranks 49)))) = true)
    (h2820 : ((!((firstRowBit b1 6 && firstRowBit b1 9)) || ((rankAtom ranks 43 == rankAtom ranks 46)))) = true)
    (h2821 : ((!((firstRowBit b1 6 && firstRowBit b1 10)) || ((rankAtom ranks 43 == rankAtom ranks 47)))) = true)
    (h2822 : ((!((firstRowBit b1 6 && firstRowBit b1 11)) || ((rankAtom ranks 43 == rankAtom ranks 48)))) = true)
    (h2823 : ((!((firstRowBit b1 6 && firstRowBit b1 12)) || ((rankAtom ranks 43 == rankAtom ranks 49)))) = true)
    (h2824 : ((!((firstRowBit b1 7 && firstRowBit b1 9)) || ((rankAtom ranks 44 == rankAtom ranks 46)))) = true)
    (h2825 : ((!((firstRowBit b1 7 && firstRowBit b1 10)) || ((rankAtom ranks 44 == rankAtom ranks 47)))) = true)
    (h2826 : ((!((firstRowBit b1 7 && firstRowBit b1 11)) || ((rankAtom ranks 44 == rankAtom ranks 48)))) = true)
    (h2827 : ((!((firstRowBit b1 7 && firstRowBit b1 12)) || ((rankAtom ranks 44 == rankAtom ranks 49)))) = true)
    (h2828 : ((!((firstRowBit b1 8 && firstRowBit b1 9)) || ((rankAtom ranks 45 == rankAtom ranks 46)))) = true)
    (h2829 : ((!((firstRowBit b1 8 && firstRowBit b1 10)) || ((rankAtom ranks 45 == rankAtom ranks 47)))) = true)
    (h2830 : ((!((firstRowBit b1 8 && firstRowBit b1 11)) || ((rankAtom ranks 45 == rankAtom ranks 48)))) = true)
    (h2831 : ((!((firstRowBit b1 8 && firstRowBit b1 12)) || ((rankAtom ranks 45 == rankAtom ranks 49)))) = true)
    (h2832 : ((!((firstRowBit b1 9 && firstRowBit b1 10)) || ((rankAtom ranks 46 == rankAtom ranks 47)))) = true)
    (h2833 : ((!((firstRowBit b1 9 && firstRowBit b1 11)) || ((rankAtom ranks 46 == rankAtom ranks 48)))) = true)
    (h2834 : ((!((firstRowBit b1 9 && firstRowBit b1 12)) || ((rankAtom ranks 46 == rankAtom ranks 49)))) = true)
    (h2835 : ((!((firstRowBit b1 10 && firstRowBit b1 11)) || ((rankAtom ranks 47 == rankAtom ranks 48)))) = true)
    (h2836 : ((!((firstRowBit b1 10 && firstRowBit b1 12)) || ((rankAtom ranks 47 == rankAtom ranks 49)))) = true)
    (h2837 : ((!((firstRowBit b1 11 && firstRowBit b1 12)) || ((rankAtom ranks 48 == rankAtom ranks 49)))) = true)
    (h2838 : ((!((shellBit shell 0 && shellBit shell 1)) || ((rankAtom ranks 7 == rankAtom ranks 18)))) = true)
    (h2839 : ((!((shellBit shell 0 && shellBit shell 5)) || ((rankAtom ranks 7 == rankAtom ranks 52)))) = true)
    (h2840 : ((!((shellBit shell 1 && shellBit shell 2)) || ((rankAtom ranks 18 == rankAtom ranks 28)))) = true)
    (h2841 : ((!((shellBit shell 1 && shellBit shell 3)) || ((rankAtom ranks 18 == rankAtom ranks 37)))) = true)
    (h2842 : ((!((shellBit shell 1 && shellBit shell 4)) || ((rankAtom ranks 18 == rankAtom ranks 45)))) = true)
    (h2843 : ((!((shellBit shell 1 && shellBit shell 5)) || ((rankAtom ranks 18 == rankAtom ranks 52)))) = true)
    (h2844 : ((!((shellBit shell 1 && shellBit shell 6)) || ((rankAtom ranks 18 == rankAtom ranks 58)))) = true)
    (h2845 : ((!((shellBit shell 1 && shellBit shell 7)) || ((rankAtom ranks 18 == rankAtom ranks 63)))) = true)
    (h2846 : ((!((shellBit shell 1 && shellBit shell 9)) || ((rankAtom ranks 18 == rankAtom ranks 68)))) = true)
    (h2847 : ((!((shellBit shell 1 && shellBit shell 10)) || ((rankAtom ranks 18 == rankAtom ranks 69)))) = true)
    (h2848 : ((!((shellBit shell 1 && shellBit shell 11)) || ((rankAtom ranks 18 == rankAtom ranks 70)))) = true)
    (h2849 : ((!((shellBit shell 1 && shellBit shell 12)) || ((rankAtom ranks 18 == rankAtom ranks 71)))) = true)
    (h2850 : ((!((shellBit shell 2 && shellBit shell 3)) || ((rankAtom ranks 28 == rankAtom ranks 37)))) = true)
    (h2851 : ((!((shellBit shell 4 && shellBit shell 9)) || ((rankAtom ranks 45 == rankAtom ranks 68)))) = true)
    (h2852 : ((!((shellBit shell 4 && shellBit shell 11)) || ((rankAtom ranks 45 == rankAtom ranks 70)))) = true)
    (h2853 : ((!((shellBit shell 5 && shellBit shell 9)) || ((rankAtom ranks 52 == rankAtom ranks 68)))) = true)
    (h2854 : ((!((shellBit shell 5 && shellBit shell 11)) || ((rankAtom ranks 52 == rankAtom ranks 70)))) = true)
    (h2855 : ((!((shellBit shell 5 && shellBit shell 12)) || ((rankAtom ranks 52 == rankAtom ranks 71)))) = true)
    (h2856 : ((!((rankAtom ranks 1 == rankAtom ranks 12)) || ((rankAtom ranks 2).ult (rankAtom ranks 13)))) = true)
    (h2857 : ((!((rankAtom ranks 13 == rankAtom ranks 2)) || ((rankAtom ranks 12).ult (rankAtom ranks 1)))) = true)
    (h2858 : ((!((rankAtom ranks 14 == rankAtom ranks 0)) || ((rankAtom ranks 24).ult (rankAtom ranks 1)))) = true)
    (h2859 : ((!((rankAtom ranks 1 == rankAtom ranks 12)) || ((rankAtom ranks 3).ult (rankAtom ranks 14)))) = true)
    (h2860 : ((!((rankAtom ranks 14 == rankAtom ranks 3)) || ((rankAtom ranks 12).ult (rankAtom ranks 1)))) = true)
    (h2861 : ((!((rankAtom ranks 14 == rankAtom ranks 12)) || ((rankAtom ranks 3).ult (rankAtom ranks 1)))) = true)
    (h2862 : ((!((rankAtom ranks 1 == rankAtom ranks 25)) || ((rankAtom ranks 0).ult (rankAtom ranks 15)))) = true)
    (h2863 : ((!((rankAtom ranks 15 == rankAtom ranks 0)) || ((rankAtom ranks 25).ult (rankAtom ranks 1)))) = true)
    (h2864 : ((!((rankAtom ranks 1 == rankAtom ranks 4)) || ((rankAtom ranks 12).ult (rankAtom ranks 15)))) = true)
    (h2865 : ((!((rankAtom ranks 1 == rankAtom ranks 12)) || ((rankAtom ranks 4).ult (rankAtom ranks 15)))) = true)
    (h2866 : ((!((rankAtom ranks 15 == rankAtom ranks 4)) || ((rankAtom ranks 12).ult (rankAtom ranks 1)))) = true)
    (h2867 : ((!((rankAtom ranks 15 == rankAtom ranks 12)) || ((rankAtom ranks 4).ult (rankAtom ranks 1)))) = true)
    (h2868 : ((!((rankAtom ranks 1 == rankAtom ranks 26)) || ((rankAtom ranks 0).ult (rankAtom ranks 16)))) = true)
    (h2869 : ((!((rankAtom ranks 16 == rankAtom ranks 0)) || ((rankAtom ranks 26).ult (rankAtom ranks 1)))) = true)
    (h2870 : ((!((rankAtom ranks 1 == rankAtom ranks 5)) || ((rankAtom ranks 12).ult (rankAtom ranks 16)))) = true)
    (h2871 : ((!((rankAtom ranks 1 == rankAtom ranks 12)) || ((rankAtom ranks 5).ult (rankAtom ranks 16)))) = true)
    (h2872 : ((!((rankAtom ranks 16 == rankAtom ranks 5)) || ((rankAtom ranks 12).ult (rankAtom ranks 1)))) = true)
    (h2873 : ((!((rankAtom ranks 16 == rankAtom ranks 12)) || ((rankAtom ranks 5).ult (rankAtom ranks 1)))) = true)
    (h2874 : ((!((rankAtom ranks 1 == rankAtom ranks 27)) || ((rankAtom ranks 0).ult (rankAtom ranks 17)))) = true)
    (h2875 : ((!((rankAtom ranks 17 == rankAtom ranks 0)) || ((rankAtom ranks 27).ult (rankAtom ranks 1)))) = true)
    (h2876 : ((!((rankAtom ranks 1 == rankAtom ranks 6)) || ((rankAtom ranks 12).ult (rankAtom ranks 17)))) = true)
    (h2877 : ((!((rankAtom ranks 1 == rankAtom ranks 12)) || ((rankAtom ranks 6).ult (rankAtom ranks 17)))) = true)
    (h2878 : ((!((rankAtom ranks 17 == rankAtom ranks 6)) || ((rankAtom ranks 12).ult (rankAtom ranks 1)))) = true)
    (h2879 : ((!((rankAtom ranks 17 == rankAtom ranks 12)) || ((rankAtom ranks 6).ult (rankAtom ranks 1)))) = true) :
    ∀ item ∈ sourceChunk044Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk044Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2816
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2817
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2818
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2819
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2820
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2821
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2822
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2823
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2824
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2825
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2826
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2827
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2828
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2829
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2830
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2831
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2832
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2833
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2834
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2835
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2836
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2837
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2838
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2839
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2840
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2841
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2842
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2843
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2844
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2845
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2846
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2847
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2848
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2849
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2850
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2851
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2852
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2853
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2854
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2855
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2856
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2857
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2858
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2859
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2860
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2861
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2862
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2863
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2864
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2865
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2866
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2867
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2868
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2869
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2870
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2871
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2872
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2873
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2874
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2875
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2876
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2877
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2878
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2879

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
