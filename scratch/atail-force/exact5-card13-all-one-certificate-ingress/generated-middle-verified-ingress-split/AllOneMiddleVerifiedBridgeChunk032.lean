/-
Generated packed-source bridge for verified middle chunk 032.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk032_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h2048 : ((!((rowBit rows 0 0 3 && rowBit rows 0 0 9)) || ((rankAtom ranks 2 == rankAtom ranks 8)))) = true)
    (h2049 : ((!((rowBit rows 0 0 3 && rowBit rows 0 0 10)) || ((rankAtom ranks 2 == rankAtom ranks 9)))) = true)
    (h2050 : ((!((rowBit rows 0 0 3 && rowBit rows 0 0 11)) || ((rankAtom ranks 2 == rankAtom ranks 10)))) = true)
    (h2051 : ((!((rowBit rows 0 0 3 && rowBit rows 0 0 12)) || ((rankAtom ranks 2 == rankAtom ranks 11)))) = true)
    (h2052 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 5)) || ((rankAtom ranks 3 == rankAtom ranks 4)))) = true)
    (h2053 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 6)) || ((rankAtom ranks 3 == rankAtom ranks 5)))) = true)
    (h2054 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 7)) || ((rankAtom ranks 3 == rankAtom ranks 6)))) = true)
    (h2055 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 8)) || ((rankAtom ranks 3 == rankAtom ranks 7)))) = true)
    (h2056 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 9)) || ((rankAtom ranks 3 == rankAtom ranks 8)))) = true)
    (h2057 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 10)) || ((rankAtom ranks 3 == rankAtom ranks 9)))) = true)
    (h2058 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 11)) || ((rankAtom ranks 3 == rankAtom ranks 10)))) = true)
    (h2059 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 12)) || ((rankAtom ranks 3 == rankAtom ranks 11)))) = true)
    (h2060 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 6)) || ((rankAtom ranks 4 == rankAtom ranks 5)))) = true)
    (h2061 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 7)) || ((rankAtom ranks 4 == rankAtom ranks 6)))) = true)
    (h2062 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 8)) || ((rankAtom ranks 4 == rankAtom ranks 7)))) = true)
    (h2063 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 9)) || ((rankAtom ranks 4 == rankAtom ranks 8)))) = true)
    (h2064 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 10)) || ((rankAtom ranks 4 == rankAtom ranks 9)))) = true)
    (h2065 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 11)) || ((rankAtom ranks 4 == rankAtom ranks 10)))) = true)
    (h2066 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 12)) || ((rankAtom ranks 4 == rankAtom ranks 11)))) = true)
    (h2067 : ((!((rowBit rows 0 0 6 && rowBit rows 0 0 7)) || ((rankAtom ranks 5 == rankAtom ranks 6)))) = true)
    (h2068 : ((!((rowBit rows 0 0 6 && rowBit rows 0 0 8)) || ((rankAtom ranks 5 == rankAtom ranks 7)))) = true)
    (h2069 : ((!((rowBit rows 0 0 6 && rowBit rows 0 0 9)) || ((rankAtom ranks 5 == rankAtom ranks 8)))) = true)
    (h2070 : ((!((rowBit rows 0 0 6 && rowBit rows 0 0 10)) || ((rankAtom ranks 5 == rankAtom ranks 9)))) = true)
    (h2071 : ((!((rowBit rows 0 0 6 && rowBit rows 0 0 11)) || ((rankAtom ranks 5 == rankAtom ranks 10)))) = true)
    (h2072 : ((!((rowBit rows 0 0 6 && rowBit rows 0 0 12)) || ((rankAtom ranks 5 == rankAtom ranks 11)))) = true)
    (h2073 : ((!((rowBit rows 0 0 7 && rowBit rows 0 0 8)) || ((rankAtom ranks 6 == rankAtom ranks 7)))) = true)
    (h2074 : ((!((rowBit rows 0 0 7 && rowBit rows 0 0 9)) || ((rankAtom ranks 6 == rankAtom ranks 8)))) = true)
    (h2075 : ((!((rowBit rows 0 0 7 && rowBit rows 0 0 10)) || ((rankAtom ranks 6 == rankAtom ranks 9)))) = true)
    (h2076 : ((!((rowBit rows 0 0 7 && rowBit rows 0 0 11)) || ((rankAtom ranks 6 == rankAtom ranks 10)))) = true)
    (h2077 : ((!((rowBit rows 0 0 7 && rowBit rows 0 0 12)) || ((rankAtom ranks 6 == rankAtom ranks 11)))) = true)
    (h2078 : ((!((rowBit rows 0 1 0 && rowBit rows 0 1 2)) || ((rankAtom ranks 0 == rankAtom ranks 12)))) = true)
    (h2079 : ((!((rowBit rows 0 1 0 && rowBit rows 0 1 3)) || ((rankAtom ranks 0 == rankAtom ranks 13)))) = true)
    (h2080 : ((!((rowBit rows 0 1 0 && rowBit rows 0 1 4)) || ((rankAtom ranks 0 == rankAtom ranks 14)))) = true)
    (h2081 : ((!((rowBit rows 0 1 0 && rowBit rows 0 1 5)) || ((rankAtom ranks 0 == rankAtom ranks 15)))) = true)
    (h2082 : ((!((rowBit rows 0 1 0 && rowBit rows 0 1 6)) || ((rankAtom ranks 0 == rankAtom ranks 16)))) = true)
    (h2083 : ((!((rowBit rows 0 1 0 && rowBit rows 0 1 7)) || ((rankAtom ranks 0 == rankAtom ranks 17)))) = true)
    (h2084 : ((!((rowBit rows 0 1 0 && rowBit rows 0 1 8)) || ((rankAtom ranks 0 == rankAtom ranks 18)))) = true)
    (h2085 : ((!((rowBit rows 0 1 0 && rowBit rows 0 1 9)) || ((rankAtom ranks 0 == rankAtom ranks 19)))) = true)
    (h2086 : ((!((rowBit rows 0 1 0 && rowBit rows 0 1 10)) || ((rankAtom ranks 0 == rankAtom ranks 20)))) = true)
    (h2087 : ((!((rowBit rows 0 1 0 && rowBit rows 0 1 11)) || ((rankAtom ranks 0 == rankAtom ranks 21)))) = true)
    (h2088 : ((!((rowBit rows 0 1 0 && rowBit rows 0 1 12)) || ((rankAtom ranks 0 == rankAtom ranks 22)))) = true)
    (h2089 : ((!((rowBit rows 0 1 2 && rowBit rows 0 1 3)) || ((rankAtom ranks 12 == rankAtom ranks 13)))) = true)
    (h2090 : ((!((rowBit rows 0 1 2 && rowBit rows 0 1 4)) || ((rankAtom ranks 12 == rankAtom ranks 14)))) = true)
    (h2091 : ((!((rowBit rows 0 1 2 && rowBit rows 0 1 5)) || ((rankAtom ranks 12 == rankAtom ranks 15)))) = true)
    (h2092 : ((!((rowBit rows 0 1 2 && rowBit rows 0 1 6)) || ((rankAtom ranks 12 == rankAtom ranks 16)))) = true)
    (h2093 : ((!((rowBit rows 0 1 2 && rowBit rows 0 1 7)) || ((rankAtom ranks 12 == rankAtom ranks 17)))) = true)
    (h2094 : ((!((rowBit rows 0 1 2 && rowBit rows 0 1 8)) || ((rankAtom ranks 12 == rankAtom ranks 18)))) = true)
    (h2095 : ((!((rowBit rows 0 1 2 && rowBit rows 0 1 9)) || ((rankAtom ranks 12 == rankAtom ranks 19)))) = true)
    (h2096 : ((!((rowBit rows 0 1 2 && rowBit rows 0 1 10)) || ((rankAtom ranks 12 == rankAtom ranks 20)))) = true)
    (h2097 : ((!((rowBit rows 0 1 2 && rowBit rows 0 1 11)) || ((rankAtom ranks 12 == rankAtom ranks 21)))) = true)
    (h2098 : ((!((rowBit rows 0 1 2 && rowBit rows 0 1 12)) || ((rankAtom ranks 12 == rankAtom ranks 22)))) = true)
    (h2099 : ((!((rowBit rows 0 1 3 && rowBit rows 0 1 4)) || ((rankAtom ranks 13 == rankAtom ranks 14)))) = true)
    (h2100 : ((!((rowBit rows 0 1 3 && rowBit rows 0 1 5)) || ((rankAtom ranks 13 == rankAtom ranks 15)))) = true)
    (h2101 : ((!((rowBit rows 0 1 3 && rowBit rows 0 1 6)) || ((rankAtom ranks 13 == rankAtom ranks 16)))) = true)
    (h2102 : ((!((rowBit rows 0 1 3 && rowBit rows 0 1 7)) || ((rankAtom ranks 13 == rankAtom ranks 17)))) = true)
    (h2103 : ((!((rowBit rows 0 1 3 && rowBit rows 0 1 8)) || ((rankAtom ranks 13 == rankAtom ranks 18)))) = true)
    (h2104 : ((!((rowBit rows 0 1 3 && rowBit rows 0 1 9)) || ((rankAtom ranks 13 == rankAtom ranks 19)))) = true)
    (h2105 : ((!((rowBit rows 0 1 3 && rowBit rows 0 1 10)) || ((rankAtom ranks 13 == rankAtom ranks 20)))) = true)
    (h2106 : ((!((rowBit rows 0 1 3 && rowBit rows 0 1 11)) || ((rankAtom ranks 13 == rankAtom ranks 21)))) = true)
    (h2107 : ((!((rowBit rows 0 1 3 && rowBit rows 0 1 12)) || ((rankAtom ranks 13 == rankAtom ranks 22)))) = true)
    (h2108 : ((!((rowBit rows 0 1 4 && rowBit rows 0 1 5)) || ((rankAtom ranks 14 == rankAtom ranks 15)))) = true)
    (h2109 : ((!((rowBit rows 0 1 4 && rowBit rows 0 1 6)) || ((rankAtom ranks 14 == rankAtom ranks 16)))) = true)
    (h2110 : ((!((rowBit rows 0 1 4 && rowBit rows 0 1 7)) || ((rankAtom ranks 14 == rankAtom ranks 17)))) = true)
    (h2111 : ((!((rowBit rows 0 1 4 && rowBit rows 0 1 8)) || ((rankAtom ranks 14 == rankAtom ranks 18)))) = true) :
    ∀ item ∈ sourceChunk032Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk032Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2048
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2049
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2050
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2051
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2052
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2053
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2054
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2055
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2056
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2057
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2058
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2059
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2060
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2061
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2062
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2063
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2064
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2065
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2066
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2067
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2068
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2069
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2070
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2071
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2072
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2073
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2074
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2075
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2076
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2077
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2078
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2079
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2080
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2081
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2082
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2083
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2084
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2085
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2086
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2087
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2088
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2089
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2090
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2091
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2092
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2093
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2094
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2095
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2096
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2097
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2098
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2099
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2100
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2101
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2102
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2103
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2104
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2105
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2106
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2107
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2108
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2109
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2110
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2111

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
