/-
Generated packed-source bridge for verified middle chunk 046.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk046_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h2944 : ((!((rankAtom ranks 2 == rankAtom ranks 13)) || ((rankAtom ranks 10).ult (rankAtom ranks 21)))) = true)
    (h2945 : ((!((rankAtom ranks 21 == rankAtom ranks 10)) || ((rankAtom ranks 13).ult (rankAtom ranks 2)))) = true)
    (h2946 : ((!((rankAtom ranks 21 == rankAtom ranks 13)) || ((rankAtom ranks 10).ult (rankAtom ranks 2)))) = true)
    (h2947 : ((!((rankAtom ranks 2 == rankAtom ranks 41)) || ((rankAtom ranks 0).ult (rankAtom ranks 22)))) = true)
    (h2948 : ((!((rankAtom ranks 22 == rankAtom ranks 0)) || ((rankAtom ranks 41).ult (rankAtom ranks 2)))) = true)
    (h2949 : ((!((rankAtom ranks 2 == rankAtom ranks 11)) || ((rankAtom ranks 13).ult (rankAtom ranks 22)))) = true)
    (h2950 : ((!((rankAtom ranks 2 == rankAtom ranks 13)) || ((rankAtom ranks 11).ult (rankAtom ranks 22)))) = true)
    (h2951 : ((!((rankAtom ranks 22 == rankAtom ranks 11)) || ((rankAtom ranks 13).ult (rankAtom ranks 2)))) = true)
    (h2952 : ((!((rankAtom ranks 22 == rankAtom ranks 13)) || ((rankAtom ranks 11).ult (rankAtom ranks 2)))) = true)
    (h2953 : ((!((rankAtom ranks 3 == rankAtom ranks 42)) || ((rankAtom ranks 0).ult (rankAtom ranks 15)))) = true)
    (h2954 : ((!((rankAtom ranks 15 == rankAtom ranks 0)) || ((rankAtom ranks 42).ult (rankAtom ranks 3)))) = true)
    (h2955 : ((!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 0).ult (rankAtom ranks 3)))) = true)
    (h2956 : ((!((rankAtom ranks 3 == rankAtom ranks 4)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h2957 : ((!((rankAtom ranks 3 == rankAtom ranks 14)) || ((rankAtom ranks 4).ult (rankAtom ranks 15)))) = true)
    (h2958 : ((!((rankAtom ranks 15 == rankAtom ranks 4)) || ((rankAtom ranks 14).ult (rankAtom ranks 3)))) = true)
    (h2959 : ((!((rankAtom ranks 15 == rankAtom ranks 14)) || ((rankAtom ranks 4).ult (rankAtom ranks 3)))) = true)
    (h2960 : ((!((rankAtom ranks 3 == rankAtom ranks 43)) || ((rankAtom ranks 0).ult (rankAtom ranks 16)))) = true)
    (h2961 : ((!((rankAtom ranks 16 == rankAtom ranks 0)) || ((rankAtom ranks 43).ult (rankAtom ranks 3)))) = true)
    (h2962 : ((!((rankAtom ranks 16 == rankAtom ranks 43)) || ((rankAtom ranks 0).ult (rankAtom ranks 3)))) = true)
    (h2963 : ((!((rankAtom ranks 3 == rankAtom ranks 5)) || ((rankAtom ranks 14).ult (rankAtom ranks 16)))) = true)
    (h2964 : ((!((rankAtom ranks 3 == rankAtom ranks 14)) || ((rankAtom ranks 5).ult (rankAtom ranks 16)))) = true)
    (h2965 : ((!((rankAtom ranks 16 == rankAtom ranks 5)) || ((rankAtom ranks 14).ult (rankAtom ranks 3)))) = true)
    (h2966 : ((!((rankAtom ranks 16 == rankAtom ranks 14)) || ((rankAtom ranks 5).ult (rankAtom ranks 3)))) = true)
    (h2967 : ((!((rankAtom ranks 3 == rankAtom ranks 44)) || ((rankAtom ranks 0).ult (rankAtom ranks 17)))) = true)
    (h2968 : ((!((rankAtom ranks 17 == rankAtom ranks 0)) || ((rankAtom ranks 44).ult (rankAtom ranks 3)))) = true)
    (h2969 : ((!((rankAtom ranks 17 == rankAtom ranks 44)) || ((rankAtom ranks 0).ult (rankAtom ranks 3)))) = true)
    (h2970 : ((!((rankAtom ranks 3 == rankAtom ranks 6)) || ((rankAtom ranks 14).ult (rankAtom ranks 17)))) = true)
    (h2971 : ((!((rankAtom ranks 3 == rankAtom ranks 14)) || ((rankAtom ranks 6).ult (rankAtom ranks 17)))) = true)
    (h2972 : ((!((rankAtom ranks 17 == rankAtom ranks 6)) || ((rankAtom ranks 14).ult (rankAtom ranks 3)))) = true)
    (h2973 : ((!((rankAtom ranks 17 == rankAtom ranks 14)) || ((rankAtom ranks 6).ult (rankAtom ranks 3)))) = true)
    (h2974 : ((!((rankAtom ranks 3 == rankAtom ranks 45)) || ((rankAtom ranks 0).ult (rankAtom ranks 18)))) = true)
    (h2975 : ((!((rankAtom ranks 18 == rankAtom ranks 0)) || ((rankAtom ranks 45).ult (rankAtom ranks 3)))) = true)
    (h2976 : ((!((rankAtom ranks 18 == rankAtom ranks 45)) || ((rankAtom ranks 0).ult (rankAtom ranks 3)))) = true)
    (h2977 : ((!((rankAtom ranks 3 == rankAtom ranks 7)) || ((rankAtom ranks 14).ult (rankAtom ranks 18)))) = true)
    (h2978 : ((!((rankAtom ranks 3 == rankAtom ranks 14)) || ((rankAtom ranks 7).ult (rankAtom ranks 18)))) = true)
    (h2979 : ((!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 14).ult (rankAtom ranks 3)))) = true)
    (h2980 : ((!((rankAtom ranks 18 == rankAtom ranks 14)) || ((rankAtom ranks 7).ult (rankAtom ranks 3)))) = true)
    (h2981 : ((!((rankAtom ranks 3 == rankAtom ranks 46)) || ((rankAtom ranks 0).ult (rankAtom ranks 19)))) = true)
    (h2982 : ((!((rankAtom ranks 19 == rankAtom ranks 0)) || ((rankAtom ranks 46).ult (rankAtom ranks 3)))) = true)
    (h2983 : ((!((rankAtom ranks 19 == rankAtom ranks 46)) || ((rankAtom ranks 0).ult (rankAtom ranks 3)))) = true)
    (h2984 : ((!((rankAtom ranks 3 == rankAtom ranks 8)) || ((rankAtom ranks 14).ult (rankAtom ranks 19)))) = true)
    (h2985 : ((!((rankAtom ranks 3 == rankAtom ranks 14)) || ((rankAtom ranks 8).ult (rankAtom ranks 19)))) = true)
    (h2986 : ((!((rankAtom ranks 19 == rankAtom ranks 8)) || ((rankAtom ranks 14).ult (rankAtom ranks 3)))) = true)
    (h2987 : ((!((rankAtom ranks 19 == rankAtom ranks 14)) || ((rankAtom ranks 8).ult (rankAtom ranks 3)))) = true)
    (h2988 : ((!((rankAtom ranks 3 == rankAtom ranks 47)) || ((rankAtom ranks 0).ult (rankAtom ranks 20)))) = true)
    (h2989 : ((!((rankAtom ranks 20 == rankAtom ranks 0)) || ((rankAtom ranks 47).ult (rankAtom ranks 3)))) = true)
    (h2990 : ((!((rankAtom ranks 20 == rankAtom ranks 47)) || ((rankAtom ranks 0).ult (rankAtom ranks 3)))) = true)
    (h2991 : ((!((rankAtom ranks 3 == rankAtom ranks 9)) || ((rankAtom ranks 14).ult (rankAtom ranks 20)))) = true)
    (h2992 : ((!((rankAtom ranks 3 == rankAtom ranks 14)) || ((rankAtom ranks 9).ult (rankAtom ranks 20)))) = true)
    (h2993 : ((!((rankAtom ranks 20 == rankAtom ranks 9)) || ((rankAtom ranks 14).ult (rankAtom ranks 3)))) = true)
    (h2994 : ((!((rankAtom ranks 20 == rankAtom ranks 14)) || ((rankAtom ranks 9).ult (rankAtom ranks 3)))) = true)
    (h2995 : ((!((rankAtom ranks 3 == rankAtom ranks 48)) || ((rankAtom ranks 0).ult (rankAtom ranks 21)))) = true)
    (h2996 : ((!((rankAtom ranks 21 == rankAtom ranks 0)) || ((rankAtom ranks 48).ult (rankAtom ranks 3)))) = true)
    (h2997 : ((!((rankAtom ranks 21 == rankAtom ranks 48)) || ((rankAtom ranks 0).ult (rankAtom ranks 3)))) = true)
    (h2998 : ((!((rankAtom ranks 3 == rankAtom ranks 10)) || ((rankAtom ranks 14).ult (rankAtom ranks 21)))) = true)
    (h2999 : ((!((rankAtom ranks 3 == rankAtom ranks 14)) || ((rankAtom ranks 10).ult (rankAtom ranks 21)))) = true)
    (h3000 : ((!((rankAtom ranks 21 == rankAtom ranks 10)) || ((rankAtom ranks 14).ult (rankAtom ranks 3)))) = true)
    (h3001 : ((!((rankAtom ranks 21 == rankAtom ranks 14)) || ((rankAtom ranks 10).ult (rankAtom ranks 3)))) = true)
    (h3002 : ((!((rankAtom ranks 3 == rankAtom ranks 49)) || ((rankAtom ranks 0).ult (rankAtom ranks 22)))) = true)
    (h3003 : ((!((rankAtom ranks 22 == rankAtom ranks 0)) || ((rankAtom ranks 49).ult (rankAtom ranks 3)))) = true)
    (h3004 : ((!((rankAtom ranks 3 == rankAtom ranks 11)) || ((rankAtom ranks 14).ult (rankAtom ranks 22)))) = true)
    (h3005 : ((!((rankAtom ranks 3 == rankAtom ranks 14)) || ((rankAtom ranks 11).ult (rankAtom ranks 22)))) = true)
    (h3006 : ((!((rankAtom ranks 22 == rankAtom ranks 11)) || ((rankAtom ranks 14).ult (rankAtom ranks 3)))) = true)
    (h3007 : ((!((rankAtom ranks 22 == rankAtom ranks 14)) || ((rankAtom ranks 11).ult (rankAtom ranks 3)))) = true) :
    ∀ item ∈ sourceChunk046Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk046Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2944
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2945
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2946
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2947
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2948
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2949
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2950
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2951
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2952
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2953
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2954
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2955
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2956
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2957
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2958
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2959
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2960
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2961
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2962
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2963
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2964
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2965
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2966
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2967
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2968
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2969
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2970
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2971
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2972
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2973
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2974
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2975
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2976
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2977
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2978
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2979
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2980
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2981
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2982
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2983
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2984
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2985
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2986
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2987
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2988
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2989
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2990
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2991
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2992
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2993
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2994
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2995
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2996
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2997
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2998
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2999
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3000
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3001
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3002
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3003
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3004
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3005
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3006
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3007

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
