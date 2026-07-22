/-
Generated packed-source bridge for verified right chunk 045.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk045_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h2880 : ((!((rankAtom ranks 1 == rankAtom ranks 28)) || ((rankAtom ranks 0).ult (rankAtom ranks 18)))) = true)
    (h2881 : ((!((rankAtom ranks 18 == rankAtom ranks 0)) || ((rankAtom ranks 28).ult (rankAtom ranks 1)))) = true)
    (h2882 : ((!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 0).ult (rankAtom ranks 1)))) = true)
    (h2883 : ((!((rankAtom ranks 1 == rankAtom ranks 12)) || ((rankAtom ranks 7).ult (rankAtom ranks 18)))) = true)
    (h2884 : ((!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 12).ult (rankAtom ranks 1)))) = true)
    (h2885 : ((!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 7).ult (rankAtom ranks 1)))) = true)
    (h2886 : ((!((rankAtom ranks 1 == rankAtom ranks 29)) || ((rankAtom ranks 0).ult (rankAtom ranks 19)))) = true)
    (h2887 : ((!((rankAtom ranks 19 == rankAtom ranks 0)) || ((rankAtom ranks 29).ult (rankAtom ranks 1)))) = true)
    (h2888 : ((!((rankAtom ranks 1 == rankAtom ranks 8)) || ((rankAtom ranks 12).ult (rankAtom ranks 19)))) = true)
    (h2889 : ((!((rankAtom ranks 1 == rankAtom ranks 12)) || ((rankAtom ranks 8).ult (rankAtom ranks 19)))) = true)
    (h2890 : ((!((rankAtom ranks 19 == rankAtom ranks 8)) || ((rankAtom ranks 12).ult (rankAtom ranks 1)))) = true)
    (h2891 : ((!((rankAtom ranks 19 == rankAtom ranks 12)) || ((rankAtom ranks 8).ult (rankAtom ranks 1)))) = true)
    (h2892 : ((!((rankAtom ranks 1 == rankAtom ranks 30)) || ((rankAtom ranks 0).ult (rankAtom ranks 20)))) = true)
    (h2893 : ((!((rankAtom ranks 20 == rankAtom ranks 0)) || ((rankAtom ranks 30).ult (rankAtom ranks 1)))) = true)
    (h2894 : ((!((rankAtom ranks 1 == rankAtom ranks 9)) || ((rankAtom ranks 12).ult (rankAtom ranks 20)))) = true)
    (h2895 : ((!((rankAtom ranks 1 == rankAtom ranks 12)) || ((rankAtom ranks 9).ult (rankAtom ranks 20)))) = true)
    (h2896 : ((!((rankAtom ranks 20 == rankAtom ranks 9)) || ((rankAtom ranks 12).ult (rankAtom ranks 1)))) = true)
    (h2897 : ((!((rankAtom ranks 20 == rankAtom ranks 12)) || ((rankAtom ranks 9).ult (rankAtom ranks 1)))) = true)
    (h2898 : ((!((rankAtom ranks 1 == rankAtom ranks 31)) || ((rankAtom ranks 0).ult (rankAtom ranks 21)))) = true)
    (h2899 : ((!((rankAtom ranks 21 == rankAtom ranks 0)) || ((rankAtom ranks 31).ult (rankAtom ranks 1)))) = true)
    (h2900 : ((!((rankAtom ranks 1 == rankAtom ranks 12)) || ((rankAtom ranks 10).ult (rankAtom ranks 21)))) = true)
    (h2901 : ((!((rankAtom ranks 21 == rankAtom ranks 10)) || ((rankAtom ranks 12).ult (rankAtom ranks 1)))) = true)
    (h2902 : ((!((rankAtom ranks 21 == rankAtom ranks 12)) || ((rankAtom ranks 10).ult (rankAtom ranks 1)))) = true)
    (h2903 : ((!((rankAtom ranks 1 == rankAtom ranks 32)) || ((rankAtom ranks 0).ult (rankAtom ranks 22)))) = true)
    (h2904 : ((!((rankAtom ranks 22 == rankAtom ranks 0)) || ((rankAtom ranks 32).ult (rankAtom ranks 1)))) = true)
    (h2905 : ((!((rankAtom ranks 1 == rankAtom ranks 11)) || ((rankAtom ranks 12).ult (rankAtom ranks 22)))) = true)
    (h2906 : ((!((rankAtom ranks 1 == rankAtom ranks 12)) || ((rankAtom ranks 11).ult (rankAtom ranks 22)))) = true)
    (h2907 : ((!((rankAtom ranks 22 == rankAtom ranks 11)) || ((rankAtom ranks 12).ult (rankAtom ranks 1)))) = true)
    (h2908 : ((!((rankAtom ranks 22 == rankAtom ranks 12)) || ((rankAtom ranks 11).ult (rankAtom ranks 1)))) = true)
    (h2909 : ((!((rankAtom ranks 14 == rankAtom ranks 3)) || ((rankAtom ranks 13).ult (rankAtom ranks 2)))) = true)
    (h2910 : ((!((rankAtom ranks 14 == rankAtom ranks 13)) || ((rankAtom ranks 3).ult (rankAtom ranks 2)))) = true)
    (h2911 : ((!((rankAtom ranks 15 == rankAtom ranks 0)) || ((rankAtom ranks 34).ult (rankAtom ranks 2)))) = true)
    (h2912 : ((!((rankAtom ranks 2 == rankAtom ranks 4)) || ((rankAtom ranks 13).ult (rankAtom ranks 15)))) = true)
    (h2913 : ((!((rankAtom ranks 15 == rankAtom ranks 4)) || ((rankAtom ranks 13).ult (rankAtom ranks 2)))) = true)
    (h2914 : ((!((rankAtom ranks 15 == rankAtom ranks 13)) || ((rankAtom ranks 4).ult (rankAtom ranks 2)))) = true)
    (h2915 : ((!((rankAtom ranks 16 == rankAtom ranks 0)) || ((rankAtom ranks 35).ult (rankAtom ranks 2)))) = true)
    (h2916 : ((!((rankAtom ranks 2 == rankAtom ranks 5)) || ((rankAtom ranks 13).ult (rankAtom ranks 16)))) = true)
    (h2917 : ((!((rankAtom ranks 16 == rankAtom ranks 5)) || ((rankAtom ranks 13).ult (rankAtom ranks 2)))) = true)
    (h2918 : ((!((rankAtom ranks 16 == rankAtom ranks 13)) || ((rankAtom ranks 5).ult (rankAtom ranks 2)))) = true)
    (h2919 : ((!((rankAtom ranks 17 == rankAtom ranks 0)) || ((rankAtom ranks 36).ult (rankAtom ranks 2)))) = true)
    (h2920 : ((!((rankAtom ranks 2 == rankAtom ranks 6)) || ((rankAtom ranks 13).ult (rankAtom ranks 17)))) = true)
    (h2921 : ((!((rankAtom ranks 2 == rankAtom ranks 13)) || ((rankAtom ranks 6).ult (rankAtom ranks 17)))) = true)
    (h2922 : ((!((rankAtom ranks 17 == rankAtom ranks 6)) || ((rankAtom ranks 13).ult (rankAtom ranks 2)))) = true)
    (h2923 : ((!((rankAtom ranks 17 == rankAtom ranks 13)) || ((rankAtom ranks 6).ult (rankAtom ranks 2)))) = true)
    (h2924 : ((!((rankAtom ranks 18 == rankAtom ranks 0)) || ((rankAtom ranks 37).ult (rankAtom ranks 2)))) = true)
    (h2925 : ((!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 0).ult (rankAtom ranks 2)))) = true)
    (h2926 : ((!((rankAtom ranks 2 == rankAtom ranks 7)) || ((rankAtom ranks 13).ult (rankAtom ranks 18)))) = true)
    (h2927 : ((!((rankAtom ranks 2 == rankAtom ranks 13)) || ((rankAtom ranks 7).ult (rankAtom ranks 18)))) = true)
    (h2928 : ((!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 13).ult (rankAtom ranks 2)))) = true)
    (h2929 : ((!((rankAtom ranks 18 == rankAtom ranks 13)) || ((rankAtom ranks 7).ult (rankAtom ranks 2)))) = true)
    (h2930 : ((!((rankAtom ranks 2 == rankAtom ranks 38)) || ((rankAtom ranks 0).ult (rankAtom ranks 19)))) = true)
    (h2931 : ((!((rankAtom ranks 19 == rankAtom ranks 0)) || ((rankAtom ranks 38).ult (rankAtom ranks 2)))) = true)
    (h2932 : ((!((rankAtom ranks 2 == rankAtom ranks 8)) || ((rankAtom ranks 13).ult (rankAtom ranks 19)))) = true)
    (h2933 : ((!((rankAtom ranks 2 == rankAtom ranks 13)) || ((rankAtom ranks 8).ult (rankAtom ranks 19)))) = true)
    (h2934 : ((!((rankAtom ranks 19 == rankAtom ranks 8)) || ((rankAtom ranks 13).ult (rankAtom ranks 2)))) = true)
    (h2935 : ((!((rankAtom ranks 19 == rankAtom ranks 13)) || ((rankAtom ranks 8).ult (rankAtom ranks 2)))) = true)
    (h2936 : ((!((rankAtom ranks 20 == rankAtom ranks 0)) || ((rankAtom ranks 39).ult (rankAtom ranks 2)))) = true)
    (h2937 : ((!((rankAtom ranks 2 == rankAtom ranks 9)) || ((rankAtom ranks 13).ult (rankAtom ranks 20)))) = true)
    (h2938 : ((!((rankAtom ranks 2 == rankAtom ranks 13)) || ((rankAtom ranks 9).ult (rankAtom ranks 20)))) = true)
    (h2939 : ((!((rankAtom ranks 20 == rankAtom ranks 9)) || ((rankAtom ranks 13).ult (rankAtom ranks 2)))) = true)
    (h2940 : ((!((rankAtom ranks 20 == rankAtom ranks 13)) || ((rankAtom ranks 9).ult (rankAtom ranks 2)))) = true)
    (h2941 : ((!((rankAtom ranks 2 == rankAtom ranks 40)) || ((rankAtom ranks 0).ult (rankAtom ranks 21)))) = true)
    (h2942 : ((!((rankAtom ranks 21 == rankAtom ranks 0)) || ((rankAtom ranks 40).ult (rankAtom ranks 2)))) = true)
    (h2943 : ((!((rankAtom ranks 2 == rankAtom ranks 10)) || ((rankAtom ranks 13).ult (rankAtom ranks 21)))) = true) :
    ∀ item ∈ sourceChunk045Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk045Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2880
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2881
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2882
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2883
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2884
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2885
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2886
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2887
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2888
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2889
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2890
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2891
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2892
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2893
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2894
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2895
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2896
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2897
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2898
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2899
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2900
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2901
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2902
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2903
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2904
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2905
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2906
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2907
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2908
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2909
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2910
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2911
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2912
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2913
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2914
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2915
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2916
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2917
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2918
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2919
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2920
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2921
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2922
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2923
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2924
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2925
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2926
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2927
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2928
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2929
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2930
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2931
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2932
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2933
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2934
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2935
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2936
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2937
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2938
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2939
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2940
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2941
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2942
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2943

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
